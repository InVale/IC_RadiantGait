// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:32703,y:32571,varname:node_3138,prsc:2|spec-9177-OUT,emission-1851-OUT,alpha-3778-OUT;n:type:ShaderForge.SFN_LightColor,id:3457,x:31933,y:32678,varname:node_3457,prsc:2;n:type:ShaderForge.SFN_RgbToHsv,id:9125,x:32105,y:32678,varname:node_9125,prsc:2|IN-3457-RGB;n:type:ShaderForge.SFN_HsvToRgb,id:1851,x:32502,y:32674,varname:node_1851,prsc:2|H-9125-HOUT,S-6073-OUT,V-9125-VOUT;n:type:ShaderForge.SFN_Slider,id:6589,x:31948,y:32828,ptovrint:False,ptlb:Saturation,ptin:_Saturation,varname:node_6589,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:-1,cur:0.3180119,max:1;n:type:ShaderForge.SFN_Add,id:6073,x:32312,y:32763,varname:node_6073,prsc:2|A-9125-SOUT,B-6589-OUT;n:type:ShaderForge.SFN_Vector1,id:9177,x:32502,y:32610,varname:node_9177,prsc:2,v1:1;n:type:ShaderForge.SFN_Slider,id:3778,x:32233,y:32929,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:node_3778,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:6589-3778;pass:END;sub:END;*/

Shader "Shader Forge/S_Unlit" {
    Properties {
        _Saturation ("Saturation", Range(-1, 1)) = 0.3180119
        _Opacity ("Opacity", Range(0, 1)) = 1
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float _Saturation;
            uniform float _Opacity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = 1;
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_9177 = 1.0;
                float3 specularColor = float3(node_9177,node_9177,node_9177);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
////// Emissive:
                float4 node_9125_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_9125_p = lerp(float4(float4(_LightColor0.rgb,0.0).zy, node_9125_k.wz), float4(float4(_LightColor0.rgb,0.0).yz, node_9125_k.xy), step(float4(_LightColor0.rgb,0.0).z, float4(_LightColor0.rgb,0.0).y));
                float4 node_9125_q = lerp(float4(node_9125_p.xyw, float4(_LightColor0.rgb,0.0).x), float4(float4(_LightColor0.rgb,0.0).x, node_9125_p.yzx), step(node_9125_p.x, float4(_LightColor0.rgb,0.0).x));
                float node_9125_d = node_9125_q.x - min(node_9125_q.w, node_9125_q.y);
                float node_9125_e = 1.0e-10;
                float3 node_9125 = float3(abs(node_9125_q.z + (node_9125_q.w - node_9125_q.y) / (6.0 * node_9125_d + node_9125_e)), node_9125_d / (node_9125_q.x + node_9125_e), node_9125_q.x);;
                float3 emissive = (lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac(node_9125.r+float3(0.0,-1.0/3.0,1.0/3.0)))-1),(node_9125.g+_Saturation))*node_9125.b);
/// Final Color:
                float3 finalColor = specular + emissive;
                return fixed4(finalColor,_Opacity);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float _Saturation;
            uniform float _Opacity;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 0.5;
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_9177 = 1.0;
                float3 specularColor = float3(node_9177,node_9177,node_9177);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/// Final Color:
                float3 finalColor = specular;
                return fixed4(finalColor * _Opacity,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
