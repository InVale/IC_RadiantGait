using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using DG.Tweening;

public class Circle : MonoBehaviour {

    public float speed;

	// Use this for initialization
	void Start () {
        transform.DORotate(new Vector3(0, 0, 180), speed, RotateMode.LocalAxisAdd).SetLoops(-1).SetEase(Ease.Linear).SetSpeedBased();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
