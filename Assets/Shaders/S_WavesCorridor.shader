// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:1,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33889,y:32550,varname:node_3138,prsc:2|spec-9803-OUT,gloss-1683-OUT,emission-5608-OUT,voffset-7385-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4816,x:32926,y:32655,varname:node_4816,prsc:2;n:type:ShaderForge.SFN_If,id:4224,x:33120,y:32803,varname:node_4224,prsc:2|A-4816-Y,B-3526-OUT,GT-4759-OUT,EQ-4759-OUT,LT-8137-OUT;n:type:ShaderForge.SFN_Tex2d,id:3885,x:33120,y:32950,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_3885,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:347ee00dd6ef79c48a9ec218664dc458,ntxv:0,isnm:False|UVIN-421-UVOUT;n:type:ShaderForge.SFN_Panner,id:421,x:32926,y:32950,varname:node_421,prsc:2,spu:1,spv:1|UVIN-26-OUT,DIST-2003-OUT;n:type:ShaderForge.SFN_Multiply,id:1111,x:33333,y:32950,varname:node_1111,prsc:2|A-4224-OUT,B-3885-R;n:type:ShaderForge.SFN_Vector1,id:4759,x:32926,y:32851,varname:node_4759,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:7385,x:33534,y:33054,varname:node_7385,prsc:2|A-1111-OUT,B-7408-OUT,C-8554-OUT;n:type:ShaderForge.SFN_Vector3,id:7408,x:33333,y:33072,varname:node_7408,prsc:2,v1:0,v2:1,v3:0;n:type:ShaderForge.SFN_Vector1,id:8137,x:32926,y:32900,varname:node_8137,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:8554,x:33176,y:33180,ptovrint:False,ptlb:Amplitude,ptin:_Amplitude,varname:node_8554,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.24817,max:1;n:type:ShaderForge.SFN_Time,id:5438,x:32530,y:33056,varname:node_5438,prsc:2;n:type:ShaderForge.SFN_Slider,id:520,x:32373,y:33198,ptovrint:False,ptlb:PannerSpeed,ptin:_PannerSpeed,varname:node_520,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5229794,max:1;n:type:ShaderForge.SFN_Multiply,id:2003,x:32735,y:33024,varname:node_2003,prsc:2|A-5438-T,B-520-OUT;n:type:ShaderForge.SFN_Slider,id:9971,x:32373,y:32978,ptovrint:False,ptlb:Scale,ptin:_Scale,varname:node_9971,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.001;n:type:ShaderForge.SFN_ObjectPosition,id:5847,x:32358,y:32813,varname:node_5847,prsc:2;n:type:ShaderForge.SFN_Append,id:4738,x:32530,y:32835,varname:node_4738,prsc:2|A-5847-X,B-5847-Z;n:type:ShaderForge.SFN_Multiply,id:26,x:32735,y:32900,varname:node_26,prsc:2|A-4738-OUT,B-9971-OUT;n:type:ShaderForge.SFN_ValueProperty,id:3526,x:32926,y:32803,ptovrint:False,ptlb:BottomHeight,ptin:_BottomHeight,varname:node_3526,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:-95;n:type:ShaderForge.SFN_ValueProperty,id:5151,x:33378,y:32747,ptovrint:False,ptlb:Emissive,ptin:_Emissive,varname:node_5151,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:1;n:type:ShaderForge.SFN_Fresnel,id:8057,x:33210,y:32607,varname:node_8057,prsc:2|EXP-3734-OUT;n:type:ShaderForge.SFN_Slider,id:3734,x:32847,y:32586,ptovrint:False,ptlb:FresnelIntensity,ptin:_FresnelIntensity,varname:node_3734,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.05982907,max:1;n:type:ShaderForge.SFN_OneMinus,id:8492,x:33378,y:32607,varname:node_8492,prsc:2|IN-8057-OUT;n:type:ShaderForge.SFN_Multiply,id:5608,x:33554,y:32694,varname:node_5608,prsc:2|A-8492-OUT,B-5151-OUT;n:type:ShaderForge.SFN_Vector1,id:9803,x:33378,y:32494,varname:node_9803,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:1683,x:33378,y:32549,varname:node_1683,prsc:2,v1:0;proporder:3885-8554-520-9971-3526-5151-3734;pass:END;sub:END;*/

Shader "Shader Forge/S_Waves" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _Amplitude ("Amplitude", Range(0, 1)) = 0.24817
        _PannerSpeed ("PannerSpeed", Range(0, 1)) = 0.5229794
        _Scale ("Scale", Range(0, 0.001)) = 0
        _BottomHeight ("BottomHeight", Float ) = -95
        _Emissive ("Emissive", Float ) = 1
        _FresnelIntensity ("FresnelIntensity", Range(0, 1)) = 0.05982907
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Amplitude;
            uniform float _PannerSpeed;
            uniform float _Scale;
            uniform float _BottomHeight;
            uniform float _Emissive;
            uniform float _FresnelIntensity;
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
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float node_4224_if_leA = step(mul(unity_ObjectToWorld, v.vertex).g,_BottomHeight);
                float node_4224_if_leB = step(_BottomHeight,mul(unity_ObjectToWorld, v.vertex).g);
                float node_4759 = 1.0;
                float4 node_5438 = _Time + _TimeEditor;
                float2 node_421 = ((float2(objPos.r,objPos.b)*_Scale)+(node_5438.g*_PannerSpeed)*float2(1,1));
                float4 _Texture_var = tex2Dlod(_Texture,float4(TRANSFORM_TEX(node_421, _Texture),0.0,0));
                v.vertex.xyz += ((lerp((node_4224_if_leA*0.0)+(node_4224_if_leB*node_4759),node_4759,node_4224_if_leA*node_4224_if_leB)*_Texture_var.r)*float3(0,1,0)*_Amplitude);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 lightColor = _LightColor0.rgb;
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 attenColor = attenuation * _LightColor0.xyz;
///////// Gloss:
                float gloss = 1.0 - 0.0; // Convert roughness to gloss
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_9803 = 1.0;
                float3 specularColor = float3(node_9803,node_9803,node_9803);
                float3 directSpecular = (floor(attenuation) * _LightColor0.xyz) * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
////// Emissive:
                float node_5608 = ((1.0 - pow(1.0-max(0,dot(normalDirection, viewDirection)),_FresnelIntensity))*_Emissive);
                float3 emissive = float3(node_5608,node_5608,node_5608);
/// Final Color:
                float3 finalColor = specular + emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _LightColor0;
            uniform float4 _TimeEditor;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Amplitude;
            uniform float _PannerSpeed;
            uniform float _Scale;
            uniform float _BottomHeight;
            uniform float _Emissive;
            uniform float _FresnelIntensity;
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
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float node_4224_if_leA = step(mul(unity_ObjectToWorld, v.vertex).g,_BottomHeight);
                float node_4224_if_leB = step(_BottomHeight,mul(unity_ObjectToWorld, v.vertex).g);
                float node_4759 = 1.0;
                float4 node_5438 = _Time + _TimeEditor;
                float2 node_421 = ((float2(objPos.r,objPos.b)*_Scale)+(node_5438.g*_PannerSpeed)*float2(1,1));
                float4 _Texture_var = tex2Dlod(_Texture,float4(TRANSFORM_TEX(node_421, _Texture),0.0,0));
                v.vertex.xyz += ((lerp((node_4224_if_leA*0.0)+(node_4224_if_leB*node_4759),node_4759,node_4224_if_leA*node_4224_if_leB)*_Texture_var.r)*float3(0,1,0)*_Amplitude);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
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
                float gloss = 1.0 - 0.0; // Convert roughness to gloss
                float specPow = exp2( gloss * 10.0+1.0);
////// Specular:
                float NdotL = max(0, dot( normalDirection, lightDirection ));
                float node_9803 = 1.0;
                float3 specularColor = float3(node_9803,node_9803,node_9803);
                float3 directSpecular = attenColor * pow(max(0,dot(halfDirection,normalDirection)),specPow)*specularColor;
                float3 specular = directSpecular;
/// Final Color:
                float3 finalColor = specular;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Amplitude;
            uniform float _PannerSpeed;
            uniform float _Scale;
            uniform float _BottomHeight;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float4 posWorld : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float node_4224_if_leA = step(mul(unity_ObjectToWorld, v.vertex).g,_BottomHeight);
                float node_4224_if_leB = step(_BottomHeight,mul(unity_ObjectToWorld, v.vertex).g);
                float node_4759 = 1.0;
                float4 node_5438 = _Time + _TimeEditor;
                float2 node_421 = ((float2(objPos.r,objPos.b)*_Scale)+(node_5438.g*_PannerSpeed)*float2(1,1));
                float4 _Texture_var = tex2Dlod(_Texture,float4(TRANSFORM_TEX(node_421, _Texture),0.0,0));
                v.vertex.xyz += ((lerp((node_4224_if_leA*0.0)+(node_4224_if_leB*node_4759),node_4759,node_4224_if_leA*node_4224_if_leB)*_Texture_var.r)*float3(0,1,0)*_Amplitude);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
