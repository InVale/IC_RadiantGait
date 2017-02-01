using UnityEngine;
using System.Collections;

[RequireComponent(typeof(Camera))]
public class SetRenderSourceAsMaterialTexture : MonoBehaviour
{
    public Material TargetMaterial;
    public string TextureName;

    private RenderTexture tempTexture;
    private Camera m_camera;

    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (tempTexture != null &&  ( tempTexture.width != source.width || tempTexture.height != source.height ) )
        {
            Object.Destroy(tempTexture);
        }

        if ( tempTexture == null )
        {
            Debug.Log("create new texture");
            tempTexture = new RenderTexture(source.width, source.height, source.depth, RenderTextureFormat.ARGB32);
            tempTexture.name = this.name;

            tempTexture.Create();

            if( m_camera == null )
            {
                m_camera = GetComponent<Camera>();
            }

            m_camera.targetTexture = tempTexture;

            TargetMaterial.SetTexture(TextureName, tempTexture);
        }

        Graphics.Blit(source, destination);
    }
}
