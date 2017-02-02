using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using Rewired;

public class CCC : MonoBehaviour
{
	public bool IsMoving = true;
	public float CameraSpeed = 1f;
	public float RunSpeed = 3f;
	public float AccelerationPerSec = 0.5f;
	public float JumpForce = 9f;
	public float Gravity = 19.81f;
	public float AirControl = 1f;
	public float GroundCheckRadius = 0.1f;
	[Range(0f, 90f)]
	public float BottomAngleLimit = 70f;
	[Range(0f, 90f)]
	public float TopAngleLimit = 90f;
	public LayerMask Ground;

	Player _player;
	public Transform Cam;
	public Transform GroundCheck;
	Rigidbody _body;

	float _yRotation = 0f;
	float _xRotation = 0f;
	Vector3 _speed;
	public bool _isGrounded = false;
	bool _canJump = true;
	int _jumpCounter = 0;
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
	}

	// Update is called once per frame
	void Update()
	{
		//Seulement si le jeu n'est pas en pause
		if (!_pause) {
			
			//Checking Air/Ground State--------------------------
			if (!_isGrounded) {
				_isGrounded = Physics.CheckSphere(GroundCheck.position, GroundCheckRadius, Ground);
				if (_isGrounded) {
					//Landing
				}
			}
			else {
				_isGrounded = Physics.CheckSphere(GroundCheck.position, GroundCheckRadius, Ground);
			}

			//Setting Jump State
			if ((_jumpCounter <= 0) && (_body.velocity.y <= 0)) {
				_canJump = Physics.CheckSphere(GroundCheck.position, GroundCheckRadius, Ground);
			}

			//ROTATION-------------------------------------------

			//we store the input used for rotation
			float rotx;
			float roty;

			rotx = _player.GetAxis("Look Horizontal") * CameraSpeed * 0.1f;
			roty = -_player.GetAxis("Look Vertical") * CameraSpeed * 0.1f;

			//we store the rotation along Y axis
			//because physics functions have to be called in FixedUpdate
			//but inputs have to be processed in Update
			_yRotation += rotx * Mathf.Rad2Deg * Time.deltaTime;

			//since we don't use the rigidbody to rotate the camera along the local X axis
			//we can directly modify the transform
			//note also that the camera has no collider attached to it that could interfere with the rigidbody
			_xRotation += roty * Time.deltaTime * Mathf.Rad2Deg;
			_xRotation = Mathf.Clamp(_xRotation, -TopAngleLimit, BottomAngleLimit);
			var rot = Cam.localEulerAngles;
			rot.x = _xRotation;
			Cam.localEulerAngles = rot;

			//MOVEMENT-----------------------------------------------
			if (_isGrounded) {
				_speed = transform.forward + transform.right * _player.GetAxisRaw ("Move Horizontal");
				_speed.Normalize ();
				RunSpeed += AccelerationPerSec * Time.deltaTime;
				_speed *= RunSpeed;
			}
			else {
				_speed = transform.forward * _player.GetAxisRaw ("Move Vertical") + transform.right * _player.GetAxisRaw ("Move Horizontal");
				_speed.Normalize ();
			}

			//JUMP--------------------------------------------------
			if (_player.GetButton ("Jump") && _canJump)
			{
				_body.AddForce(Vector3.up * JumpForce, ForceMode.VelocityChange);
				_canJump = false;
				_jumpCounter = 1;
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

			//ROTATION-----------------------------
			var rot = _body.rotation.eulerAngles;
			//if the rotation of the rigibody and the desired rotation are approximately the same
				//we don't need to update the rigidbody
				//it can happend in 2 cases :
				//	-	the player doesn't move the mouse along the X axis
				//	-	the fixedUpdate has been called twice during the same Update
				//		so no new input has been process so _yRotation didn't change
			if (!Mathf.Approximately(rot.y, _yRotation))
			{
				rot.y = _yRotation;
				_body.MoveRotation(Quaternion.Euler(rot));
			}
				
			//MOUVEMENT-----------------------------
			var velocity = _body.velocity;
			//Deplacement au sol
			if (IsMoving) {
				if (_isGrounded) {
					Vector3 velocityChange = (_speed - velocity);
					velocityChange.y = 0;
					_body.AddForce(velocityChange, ForceMode.VelocityChange);
				}
				//AirControl
				else {
					_speed *= 0.25f;
					if (Vector2.Angle (new Vector2 (velocity.x, velocity.z), new Vector2 (_speed.x, _speed.z)) <= 90) {
						float _proj = ((velocity.x * _speed.x) + (velocity.z * _speed.z)) / ((_speed.x * _speed.x) + (_speed.z * _speed.z));
						_proj *= new Vector2 (_speed.x, _speed.z).magnitude;
						if (_proj < AirControl) {
							_body.velocity += _speed;
						}
					}
					else {
						_body.velocity += _speed;
					}
				}
			}

			//JUMP & GRAVITY-----------------------------------------------
			_jumpCounter--;

			if (IsMoving) {
				_body.AddForce(Vector3.down * Gravity, ForceMode.Acceleration);
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
			RaycastHit hit;
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
