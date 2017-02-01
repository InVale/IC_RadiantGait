using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MaterialSwitch : MonoBehaviour {

    Material _lit;
    public Material Unlit;
    bool _isLit = true;

    void Start()
    {
        _lit = gameObject.GetComponent<MeshRenderer>().material;
    }

    private void Update()
    {
        if (Input.GetKeyDown(KeyCode.T))
        {
            Swap();
        }
    } 

    public void Swap ()
    {
        if (_isLit)
        {
            gameObject.GetComponent<MeshRenderer>().material = Unlit;
            _isLit = false;
        }
        else
        {
            gameObject.GetComponent<MeshRenderer>().material = _lit;
            _isLit = true;
        }
    }
}
