﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using Rewired;
using DG.Tweening;

public class CCC : MonoBehaviour
{
	[Header("Camera Settings")]
	[Tooltip("True permet de contrôler la Caméra, False pour une caméra fixe (Runner).")]
	public bool CanRotate = true;
	[Tooltip("Sensibilité de la caméra (lorsqu'on la contrôle).")]
	public float CameraSpeed = 1f;

	[Header("Mouvement")]
	[Tooltip("Vitesse frontal au lancement du jeu. Aussi seuil minimal de vitesse si le joueur freine.")]
	public float InitialSpeed = 5f;
	[Tooltip("Accélération par seconde de la vitesse frontale.")]
	public float AccelerationPerSec = 1f;
	[Tooltip("Déccélération par seconde de la vitesse frontale lorsque le joueur freine au sol.")]
	public float BrakeSpeed = 3f;
	[Tooltip("Vitesse latéral du joueur.")]
	public float SideSpeed = 3f;

	[Header("Jump")]
	[Tooltip("Force du saut minimum (input le plus court).")]
	public float JumpMinimumForce = 6f;
	[Tooltip("Force supplémentaire maximal en plus de la force minimal (force du saut minimum + input le plus long).")]
	public float JumpAddedForce = 11f;
	[Tooltip("Durée de l'input de Jump le plus long (il faut maintenir le bouton Jump pendant cette durée pour avoir la hauteur de saut maximal).")]
	public float JumpButtonPressDuration = 0.5f;
	[Tooltip("Durée de la Fenêtre de buffer du saut (au cas où le joueur réappuie sur saut juste avant d'atterir).")]
	public float JumpBuffer = 0.05f;
	[Tooltip("Euh... Bah la Gravité quoi.")]
	public float Gravity = 19.81f;

	[Header("Air Control")]
	[Tooltip("Force du Air Control, vitesse à laquelle on agis sur sa trajectoire en l'air. Si trop élévé," +
		"on peut immédiatement dépassé la limite et ainsi n'avoir pas d'effet. Si trop basse, bah ya juste pas d'effet.")]
	public float AirControlPower = 0.25f;
	[Tooltip("Limite de combien on peut agir sur sa trajectoire en l'air (sans faire les abus avec la Caméra). Plus elle est élévée et plus le air contrôle est permissif et inversement.")]
	public float AirControlLimit = 1f;

	[Header("Dash")]
	[Tooltip("Durée du Dash. Influence sur la distance couverte vu qu'il fonctionne par vélocité.")]
	public float DashDuration = 0.25f;
	[Tooltip("Multiplicateur de la vitesse actuelle pour le Dash avant. Plus le joueur vas vite et plus le Dash avant ira vite et loin.")]
	public float DashForwardMultiplier = 7f;
	[Tooltip("Force du Dash sur le côté. Contrairement au Dash avant, ce n'est pas un multiplicateur (pas besoin car la vitesse latérale ne varie pas).")]
	public float DashSideForce = 7f;

	[Header("Stuff")]
	[Tooltip("Durée que met le Player à effectuer une rotation nécessaire pour suivre le chemin (dalle).")]
	public float RotationSpeed = 0.5f;
	[Tooltip("Radius de la sphère qui check si le Player est au sol.")]
	public float GroundCheckRadius = 0.1f;
	[Tooltip("Limite de l'angle Y minimale de la caméra lorsque le joueur la contrôle.")]
	[Range(0f, 90f)]
	public float BottomAngleLimit = 70f;
	[Tooltip("Limite de l'angle Y maximale de la caméra lorsque le joueur la contrôle.")]
	[Range(0f, 90f)]
	public float TopAngleLimit = 90f;

	[Header("Prog Stuff")]
	public LayerMask Ground;
	public Transform PlayerRot;
	public Transform Cam;
	public Transform GroundCheck;

	[Header("Status")]
	[Tooltip("Le Player est-il au sol ?")]
	public bool _isGrounded = false;
	[Tooltip("Le Player est-il en train de Dash ?")]
	public bool _isDashing = false;
	[Tooltip("Le Player est-il en train de Jump (maximum jusqu'à la Durée de Button Press) ?")]
	public bool _isJumping = false;

	bool _canJump = true;
	bool _canDash = true;

	bool _pause = false;
	Vector3 _pausedVelocity = Vector3.zero;

	[HideInInspector]
	public float CurrentSpeed = 0;

	Rigidbody _body;
	Player _player;

	Vector3 _speed;
	Vector3 _instantRotation;
	Vector3 _velocity2D = Vector3.zero;
	float _velocityGravity = 0;
	Vector3 _dashVelocity2D = Vector3.zero;

	float _jumpBuffer = -1;
	float _jumpTime;
	float _yRotation = 0f;
	float _xRotation = 0f;

	Vector3 _lastCheckpoint = Vector3.zero;

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
			if (_player.GetButtonDown ("Jump") && !_isJumping) {
					
				if (_canJump) {
					_jumpBuffer = -1;
					_isJumping = true;
					_velocityGravity = JumpMinimumForce;
					_canJump = false;
					_jumpTime = JumpButtonPressDuration;
				}
				else {
					_jumpBuffer = JumpBuffer;
				}
			}
			else if (_jumpBuffer >= 0) {

				if (!_isJumping && _canJump) {
					_jumpBuffer = -1;
					_isJumping = true;
					_velocityGravity = JumpMinimumForce;
					_canJump = false;
					_jumpTime = JumpButtonPressDuration;
				}
				else {
					_jumpBuffer -= Time.deltaTime;
				}
			}
			else if (_player.GetButton ("Jump") && _isJumping)
			{
				if (_jumpTime <= Time.deltaTime) {
					_isJumping = false;
					_velocityGravity += _jumpTime * JumpAddedForce;
				}
				else {
					_jumpTime -= Time.deltaTime;
					_velocityGravity += Time.deltaTime * JumpAddedForce;
				}
			}
			else {
				_isJumping = false;
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
					_dashVelocity2D = Vector3.right * _player.GetAxisRaw("Move Horizontal") * DashSideForce;
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
