using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Rewired;
using System.Xml;

public class Interaction : MonoBehaviour {

	public delegate void ClosingEyes ();
	public static event ClosingEyes OnClose;

	public delegate void OpeningEyes ();
	public static event OpeningEyes OnOpen;

	public delegate void Pausing ();
	public static event Pausing OnPause;

	public delegate void Unpausing ();
	public static event Unpausing OnUnpause;

	public bool EyesClosed = false;

	Player _player;
	CCC _ccc;

	bool _pause = false;

	// Use this for initialization
	void Start () {
		_ccc = gameObject.GetComponent <CCC> ();
		_player = ReInput.players.GetPlayer(0);

	}
	
	// Update is called once per frame
	void Update () {

		if (_player.GetButtonDown ("Pause")) {
			if (_pause) {
				_pause = false;
				_ccc.UnPause();
				if (OnUnpause != null)
					OnUnpause ();
			}
			else {
				_pause = true;
				_ccc.Pause();
				if (OnPause != null)
					OnPause ();
			}
		}

		if (!_pause) {

			if (_player.GetButtonUp ("Close Eye")) {
				if (OnOpen != null)
					OnOpen ();
			} else if ((_player.GetButtonDown ("Close Eye")) && (!EyesClosed)) {
				if (OnClose != null)
					OnClose ();
			}
		}
	}
}
