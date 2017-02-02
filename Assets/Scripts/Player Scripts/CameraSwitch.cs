using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraSwitch : MonoBehaviour {

	public Behaviour[] Lit;
	public Behaviour[] Unlit;

	void Start () {
		Interaction.OnOpen += LitUp;
		Interaction.OnClose += LitOff;
	}

	void LitUp () {
		for (int i = 0; i < Unlit.Length; i++) {
			Unlit[i].enabled = false;
		}
		for (int i = 0; i < Lit.Length; i++) {
			Lit[i].enabled = true;
		}
	}

	void LitOff () {
		for (int i = 0; i < Lit.Length; i++) {
			Lit[i].enabled = false;
		}
		for (int i = 0; i < Unlit.Length; i++) {
			Unlit[i].enabled = true;
		}
	}
}
