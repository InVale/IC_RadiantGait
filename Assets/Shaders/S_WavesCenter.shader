// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33721,y:32593,varname:node_3138,prsc:2|emission-9715-OUT,voffset-7385-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4816,x:32926,y:32685,varname:node_4816,prsc:2;n:type:ShaderForge.SFN_If,id:4224,x:33120,y:32803,varname:node_4224,prsc:2|A-4816-Y,B-6435-OUT,GT-4759-OUT,EQ-4759-OUT,LT-8137-OUT;n:type:ShaderForge.SFN_Tex2d,id:3885,x:33120,y:32950,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_3885,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:347ee00dd6ef79c48a9ec218664dc458,ntxv:0,isnm:False|UVIN-421-UVOUT;n:type:ShaderForge.SFN_Panner,id:421,x:32926,y:32950,varname:node_421,prsc:2,spu:1,spv:1|UVIN-26-OUT,DIST-2003-OUT;n:type:ShaderForge.SFN_Multiply,id:1111,x:33333,y:32950,varname:node_1111,prsc:2|A-4224-OUT,B-3885-R;n:type:ShaderForge.SFN_Vector1,id:4759,x:32926,y:32851,varname:node_4759,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:7385,x:33534,y:33054,varname:node_7385,prsc:2|A-1111-OUT,B-7408-OUT,C-8554-OUT;n:type:ShaderForge.SFN_Vector3,id:7408,x:33333,y:33072,varname:node_7408,prsc:2,v1:0,v2:1,v3:0;n:type:ShaderForge.SFN_Vector1,id:8137,x:32926,y:32900,varname:node_8137,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:8554,x:33176,y:33180,ptovrint:False,ptlb:Amplitude,ptin:_Amplitude,varname:node_8554,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3675224,max:1;n:type:ShaderForge.SFN_Time,id:5438,x:32530,y:33056,varname:node_5438,prsc:2;n:type:ShaderForge.SFN_Slider,id:520,x:32373,y:33198,ptovrint:False,ptlb:PannerSpeed,ptin:_PannerSpeed,varname:node_520,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5229794,max:1;n:type:ShaderForge.SFN_Multiply,id:2003,x:32735,y:33024,varname:node_2003,prsc:2|A-5438-TSL,B-520-OUT;n:type:ShaderForge.SFN_Slider,id:9971,x:32373,y:32978,ptovrint:False,ptlb:Scale,ptin:_Scale,varname:node_9971,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.0001538462,max:0.001;n:type:ShaderForge.SFN_ObjectPosition,id:5847,x:32358,y:32813,varname:node_5847,prsc:2;n:type:ShaderForge.SFN_Append,id:4738,x:32530,y:32835,varname:node_4738,prsc:2|A-5847-X,B-5847-Z;n:type:ShaderForge.SFN_Multiply,id:26,x:32735,y:32900,varname:node_26,prsc:2|A-4738-OUT,B-9971-OUT;n:type:ShaderForge.SFN_Vector1,id:9715,x:33453,y:32700,varname:node_9715,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6435,x:32926,y:32803,varname:node_6435,prsc:2,v1:-95;proporder:3885-8554-520-9971;pass:END;sub:END;*/

Shader "Shader Forge/S_Waves" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _Amplitude ("Amplitude", Range(0, 1)) = 0.3675224
        _PannerSpeed ("PannerSpeed", Range(0, 1)) = 0.5229794
        _Scale ("Scale", Range(0, 0.001)) = 0.0001538462
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Amplitude;
            uniform float _PannerSpeed;
            uniform float _Scale;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float node_4224_if_leA = step(mul(unity_ObjectToWorld, v.vertex).g,(-95.0));
                float node_4224_if_leB = step((-95.0),mul(unity_ObjectToWorld, v.vertex).g);
                float node_4759 = 1.0;
                float4 node_5438 = _Time + _TimeEditor;
                float2 node_421 = ((float2(objPos.r,objPos.b)*_Scale)+(node_5438.r*_PannerSpeed)*float2(1,1));
                float4 _Texture_var = tex2Dlod(_Texture,float4(TRANSFORM_TEX(node_421, _Texture),0.0,0));
                v.vertex.xyz += ((lerp((node_4224_if_leA*0.0)+(node_4224_if_leB*node_4759),node_4759,node_4224_if_leA*node_4224_if_leB)*_Texture_var.r)*float3(0,1,0)*_Amplitude);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
////// Lighting:
////// Emissive:
                float node_9715 = 1.0;
                float3 emissive = float3(node_9715,node_9715,node_9715);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
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
                float node_4224_if_leA = step(mul(unity_ObjectToWorld, v.vertex).g,(-95.0));
                float node_4224_if_leB = step((-95.0),mul(unity_ObjectToWorld, v.vertex).g);
                float node_4759 = 1.0;
                float4 node_5438 = _Time + _TimeEditor;
                float2 node_421 = ((float2(objPos.r,objPos.b)*_Scale)+(node_5438.r*_PannerSpeed)*float2(1,1));
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
