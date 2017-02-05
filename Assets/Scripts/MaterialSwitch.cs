using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MaterialSwitch : MonoBehaviour {

    Material _lit;
    public Material Unlit;

    void Start()
    {
        _lit = gameObject.GetComponent<MeshRenderer>().material;
		Interaction.OnOpen += LitUp;
		Interaction.OnClose += LitOff;
    }
		
    public void LitUp ()
    {
		gameObject.GetComponent<MeshRenderer>().material = _lit;
    }

	public void LitOff () {
    	gameObject.GetComponent<MeshRenderer>().material = Unlit;
    }
}
