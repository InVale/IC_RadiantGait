using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SpeedMeter : MonoBehaviour {

	public GameObject Player;

	Text _text;
	CCC _playerScript;

	// Use this for initialization
	void Start () {
		_text = gameObject.GetComponent<Text>();
		_playerScript = Player.GetComponent<CCC>();
	}
	
	// Update is called once per frame
	void Update () {
		_text.text = Mathf.Floor(_playerScript.CurrentSpeed * 10) + " U/s";
	}
}
