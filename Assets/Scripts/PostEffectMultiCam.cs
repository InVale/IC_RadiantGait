using UnityEngine;
using System.Collections;

//[ExecuteInEditMode]
[RequireComponent(typeof(Camera))]
public class PostEffectMultiCam : MonoBehaviour
{
    [System.Serializable]
    public class CameraToMaterialTexture
    {
        public Camera otherCamera;
        public string textureName;

        [HideInInspector]
        public SetRenderSourceAsMaterialTexture srcmt;
    }

    public CameraToMaterialTexture[] otherCameras;

    public Material MaterialEffect;
    public int pass = -1;

    private Camera m_camera;

    void Awake()
    {
        m_camera = GetComponent<Camera>();

        foreach( CameraToMaterialTexture cmt in otherCameras )
        {
            if( cmt.otherCamera == null )
            {
                Debug.LogError("No Camera setup !");
                continue;
            }

            cmt.srcmt = cmt.otherCamera.gameObject.AddComponent<SetRenderSourceAsMaterialTexture>();
            cmt.srcmt.TargetMaterial = MaterialEffect;
            cmt.srcmt.TextureName = cmt.textureName;
        }
    }
    
    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        Graphics.Blit(source, destination, MaterialEffect, pass);
    }
}