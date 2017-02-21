using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Accelerator : MonoBehaviour {

	[Tooltip("Valeur d'accélération par unité de la dalle parcourus. En gros quelque soit la vitesse," +
		"le joueur obtiendra toujours la même accélération (à quelques unités près) pour une même distance parcourus de la dalle.\n" +
		"Mais il faut hardtest pour savoir quel sera cette accélération total, désolé.")]
	public float AcceleratingValue = 10;

}
