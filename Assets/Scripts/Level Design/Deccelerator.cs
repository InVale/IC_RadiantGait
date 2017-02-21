using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Deccelerator : MonoBehaviour {

	[Tooltip("Mode de Deccélération :\n" +
		"Si Brute, la valeur indiqué correspond à la valeur net qui sera enlevé à la vitesse." +
		"Si Relative, la valeur indiqué correspond au % de la vitesse qui sera enlevé à la vitesse." +
		"Dans les deux cas, la vitesse est cappé à la valeur minimal.")]
	public DecceleratingBehaviour Behaviour = DecceleratingBehaviour.Brute;

	[Tooltip("Net ou % en fonction de Brute ou Relative.")]
	public float DecceleratingValue = 1;

}
