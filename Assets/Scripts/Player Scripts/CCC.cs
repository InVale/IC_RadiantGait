using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using Rewired;
using DG.Tweening;

public class CCC : MonoBehaviour
{
	public bool CanMove = true;
	public bool CanRotate = true;
	public float CameraSpeed = 1f;
	public float SideSpeed = 3f;
	public float InitialSpeed = 3f;
	[HideInInspector]
	public float CurrentSpeed = 0;
	public float AccelerationPerSec = 0.5f;
	public float BrakeSpeed = 1f;
	public float JumpForce = 9f;
	public float Gravity = 19.81f;
	public float AirControlLimit = 1f;
	public float AirControlPower = 0.25f;
	public float DashDuration = 0.25f;
	public float DashForwardMultiplier = 7f;
	public float DashSideMultiplier = 7f;
	public float RotationSpeed = 0.5f;
	public float GroundCheckRadius = 0.1f;
	[Range(0f, 90f)]
	public float BottomAngleLimit = 70f;
	[Range(0f, 90f)]
	public float TopAngleLimit = 90f;
	public LayerMask Ground;

	Player _player;
	public Transform PlayerRot;
	public Transform Cam;
	public Transform GroundCheck;
	Rigidbody _body;

	Vector3 _instantRotation;
	Vector3 _velocity2D = Vector3.zero;
	float _velocityGravity = 0;
	Vector3 _dashVelocity2D = Vector3.zero;

	float _yRotation = 0f;
	float _xRotation = 0f;
	Vector3 _speed;
	public bool _isGrounded = false;
	public bool _isDashing = false;
	bool _canJump = true;
	bool _canDash = true;
	Vector3 _lastCheckpoint = Vector3.zero;

	bool _pause = false;
	Vector3 _pausedVelocity = Vector3.zero;

	// Use this for initialization
	void Start()
	{
		_player = ReInput.players.GetPlayer(0);
		_body = GetComponent<Rigidbody>();

		Cursor.lockState = CursorLockMode.None;
		Cursor.lockState = CursorLockMode.Locked;
		_yRotation = _body.rotation.eulerAngles.y;

		CurrentSpeed = InitialSpeed;
		_instantRotation = transform.eulerAngles;
	}

	// Update is called once per frame
	void Update()
	{
		//Seulement si le jeu n'est pas en pause
		if (!_pause) {

			//Handling Direction---------------------------------
			RaycastHit hit;
			if (Physics.Raycast(transform.position, -transform.up, out hit, 20, Ground)) {
				Vector3 newRot = hit.transform.eulerAngles;

				transform.DOKill ();
				transform.DORotate (newRot, RotationSpeed);
			}

			//Checking Air/Ground State & GRAVITY---------------
			if (!_isGrounded) {
				_isGrounded = Physics.CheckSphere(GroundCheck.position, GroundCheckRadius, Ground);
				_canJump = false;

				if (_isGrounded) {
					_velocityGravity = -Gravity * 0.1f;
					_canJump = true;
					_canDash = true;
				}
				else if (!_isDashing) {
					_velocityGravity -= Gravity * Time.deltaTime;
				}
			}
			else {
				_isGrounded = Physics.CheckSphere(GroundCheck.position, GroundCheckRadius, Ground);
			}

			//ROTATION-------------------------------------------

			//we store the input used for rotation
			if (CanRotate) {
				float rotx;
				float roty;

				rotx = _player.GetAxis("Look Horizontal") * CameraSpeed * 0.1f;
				roty = -_player.GetAxis("Look Vertical") * CameraSpeed * 0.1f;

				//we store the rotation along Y axis
				//because physics functions have to be called in FixedUpdate
				//but inputs have to be processed in Update
				_yRotation += rotx * Mathf.Rad2Deg * Time.deltaTime;
				Vector3 rot = PlayerRot.localEulerAngles;
				rot.y = _yRotation;
				PlayerRot.localEulerAngles = rot;

				//since we don't use the rigidbody to rotate the camera along the local X axis
				//we can directly modify the transform
				//note also that the camera has no collider attached to it that could interfere with the rigidbody
				_xRotation += roty * Time.deltaTime * Mathf.Rad2Deg;
				_xRotation = Mathf.Clamp(_xRotation, -TopAngleLimit, BottomAngleLimit);
				rot = Cam.localEulerAngles;
				rot.x = _xRotation;
				Cam.localEulerAngles = rot;
			}

			//MOVEMENT-----------------------------------------------
			CurrentSpeed += AccelerationPerSec * Time.deltaTime;

			if (_isGrounded) {

				Vector3 vertical = PlayerRot.localRotation * Vector3.forward * _player.GetAxisRaw ("Move Vertical");
				Vector3 horizontal = PlayerRot.localRotation * Vector3.right * _player.GetAxisRaw ("Move Horizontal");

				bool movingForward = false;

				if (vertical != Vector3.zero) {
					float angle = Vector3.Angle(Vector3.forward, vertical);
					if (angle <= 45) {
						vertical = vertical * CurrentSpeed;
						movingForward = true;
					}
					else if (angle <= 135) {
						vertical = vertical * SideSpeed;
					}
					else {
						vertical = Vector3.zero;
						CurrentSpeed -= BrakeSpeed * Time.deltaTime;
						if (CurrentSpeed < InitialSpeed) {
							CurrentSpeed = InitialSpeed;
						}
					}
				}

				if (horizontal != Vector3.zero) {
					float angle = Vector3.Angle(Vector3.forward, horizontal);
					if (angle <= 45) {
						horizontal = horizontal * CurrentSpeed;
						movingForward = true;
					}
					else if (angle <= 135) {
						horizontal = horizontal * SideSpeed;
					}
					else {
						horizontal = Vector3.zero;
						CurrentSpeed -= BrakeSpeed * Time.deltaTime;
						if (CurrentSpeed < InitialSpeed) {
							CurrentSpeed = InitialSpeed;
						}
					}
				}

				if (movingForward) {
					_speed = vertical + horizontal;
				}
				else {
					_speed = vertical + horizontal + (Vector3.forward * CurrentSpeed);
				}

				_velocity2D = _speed.normalized * CurrentSpeed;
			}
			//AirControl
			else if (!_isDashing) {
				_speed = PlayerRot.localRotation * Vector3.forward * _player.GetAxisRaw ("Move Vertical") +
					PlayerRot.localRotation * Vector3.right * _player.GetAxisRaw ("Move Horizontal");
				if (_speed.magnitude > 1) {
					_speed.Normalize ();
				}
				_speed *= AirControlPower * Time.deltaTime * 60;

				Vector3 oldVelocity = _velocity2D;

				if (Vector3.Angle (_velocity2D, _speed) <= 90) {
					float _proj = ((_velocity2D.x * _speed.x) + (_velocity2D.z * _speed.z)) / ((_speed.x * _speed.x) + (_speed.z * _speed.z));
					_proj *= new Vector2 (_speed.x, _speed.z).magnitude;
					if (_proj < AirControlLimit) {
						_velocity2D += _speed;
					}
				}
				else {
					_velocity2D += _speed;
				}

				Vector3 newVelocity = _velocity2D;

				if (newVelocity.magnitude >= oldVelocity.magnitude) {
					newVelocity = newVelocity.normalized * CurrentSpeed;
				}
				else {
					if (newVelocity.magnitude < InitialSpeed) {
						newVelocity = newVelocity.normalized * InitialSpeed;
					}
					else {
						CurrentSpeed = newVelocity.magnitude;
					}
				}

				_velocity2D = newVelocity;
			}

			//JUMP--------------------------------------------------
			if (_player.GetButton ("Jump") && _canJump)
			{
				_velocityGravity = JumpForce;
				_canJump = false;
			}

			//DASH--------------------------------------------------
			if (_player.GetButton ("Dash") && _canDash && !_isGrounded) {
				_canDash = false;
				_isDashing = true;
				_velocityGravity = 0;

				DOVirtual.DelayedCall(DashDuration, () =>
					{
						_isDashing = false;
					});

				if (_player.GetAxisRaw("Move Horizontal") != 0) {
					_dashVelocity2D = Vector3.right * _player.GetAxisRaw("Move Horizontal") * DashSideMultiplier;
				}
				else {
					_dashVelocity2D = Vector3.forward * DashForwardMultiplier * CurrentSpeed;
				}
			}
		}

		//TESTING STUFF-----------------------------------------
		if (Input.GetKey(KeyCode.T)) {

		}
	}

	void FixedUpdate()
	{
		//Seulement si le jeu n'est pas en pause
		if (!_pause) {

			if (CanMove) {
				//MOUVEMENT & JUMP & GRAVITY-----------------------------
				Vector3 newSpeed = Vector3.zero;

				if (!_isDashing) {
					newSpeed = transform.right * _velocity2D.x + transform.up * _velocityGravity + transform.forward * _velocity2D.z;
				}
				else {
					newSpeed = transform.right * _dashVelocity2D.x + transform.forward * _dashVelocity2D.z;
				}

				_body.velocity = newSpeed;
			}

		}
	}

	public void Pause () {
		if (!_pause) {
			_pause = true;
			_pausedVelocity = _body.velocity;
			_body.velocity = Vector3.zero;
		}
	}

	public void UnPause () {
		if (_pause) {
			_pause = false;
			_body.velocity = _pausedVelocity;
		}
	}

	void OnCollisionEnter (Collision collision) {

		if (collision.collider.tag == "Death") {
			GoToCheckpoint ();
		}
	}

	void OnCollisionStay (Collision collision) {
		if (collision.collider.tag == "Platform") 
		{
			Collider[] _sphereHit = Physics.OverlapSphere (GroundCheck.position, GroundCheckRadius);
			if (_sphereHit.Length > 0) 
			{
				for (int i = 0; i < _sphereHit.Length; i++)
				{
					if (_sphereHit[i].transform != transform.parent && _sphereHit[i].tag == "Platform") 
					{
						transform.parent = _sphereHit[i].transform.parent.parent.transform;
						i = _sphereHit.Length;
					}
				}
			}
		}
	}

	void OnCollisionExit (Collision collision) {
		if (collision.collider.tag == "Platform") {
			transform.parent = null;
		}
	}

	void OnTriggerEnter (Collider collider) {
		if (collider.tag == "Checkpoint") {
			_lastCheckpoint = collider.transform.position;
		}
	}

	public void GoToCheckpoint () {
		gameObject.transform.position = _lastCheckpoint;
		_body.velocity = Vector3.zero;
	}
}
