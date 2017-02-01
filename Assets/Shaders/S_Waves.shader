// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33707,y:32636,varname:node_3138,prsc:2|emission-8336-OUT,voffset-7385-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4816,x:32683,y:32595,varname:node_4816,prsc:2;n:type:ShaderForge.SFN_Vector1,id:1241,x:32534,y:32728,varname:node_1241,prsc:2,v1:-95;n:type:ShaderForge.SFN_If,id:4224,x:33007,y:32683,varname:node_4224,prsc:2|A-4816-Y,B-1241-OUT,GT-4759-OUT,EQ-4759-OUT,LT-8137-OUT;n:type:ShaderForge.SFN_Tex2d,id:3885,x:32491,y:32960,ptovrint:False,ptlb:node_3885,ptin:_node_3885,varname:node_3885,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:347ee00dd6ef79c48a9ec218664dc458,ntxv:0,isnm:False|UVIN-421-UVOUT;n:type:ShaderForge.SFN_Panner,id:421,x:32265,y:32948,varname:node_421,prsc:2,spu:1,spv:1|UVIN-26-OUT,DIST-2003-OUT;n:type:ShaderForge.SFN_Multiply,id:1111,x:33193,y:32998,varname:node_1111,prsc:2|A-4224-OUT,B-3885-R;n:type:ShaderForge.SFN_Vector1,id:4759,x:32720,y:32873,varname:node_4759,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:7385,x:33439,y:33033,varname:node_7385,prsc:2|A-1111-OUT,B-7408-OUT,C-8554-OUT;n:type:ShaderForge.SFN_Vector3,id:7408,x:33193,y:33231,varname:node_7408,prsc:2,v1:0,v2:1,v3:0;n:type:ShaderForge.SFN_Vector1,id:8336,x:33400,y:32684,varname:node_8336,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:8137,x:32637,y:32841,varname:node_8137,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:8554,x:33135,y:33380,ptovrint:False,ptlb:amplitude,ptin:_amplitude,varname:node_8554,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.24817,max:1;n:type:ShaderForge.SFN_Time,id:5438,x:31689,y:33133,varname:node_5438,prsc:2;n:type:ShaderForge.SFN_Slider,id:520,x:31466,y:33321,ptovrint:False,ptlb:panner speed,ptin:_pannerspeed,varname:node_520,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5229794,max:1;n:type:ShaderForge.SFN_Multiply,id:2003,x:31908,y:33133,varname:node_2003,prsc:2|A-5438-T,B-520-OUT;n:type:ShaderForge.SFN_Slider,id:9971,x:31498,y:32930,ptovrint:False,ptlb:scale,ptin:_scale,varname:node_9971,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0,max:0.001;n:type:ShaderForge.SFN_ObjectPosition,id:5847,x:31518,y:32615,varname:node_5847,prsc:2;n:type:ShaderForge.SFN_Append,id:4738,x:31871,y:32636,varname:node_4738,prsc:2|A-5847-X,B-5847-Z;n:type:ShaderForge.SFN_Multiply,id:26,x:32254,y:32632,varname:node_26,prsc:2|A-4738-OUT,B-9971-OUT;proporder:3885-8554-520-9971;pass:END;sub:END;*/

Shader "Shader Forge/S_Waves" {
    Properties {
        _node_3885 ("node_3885", 2D) = "white" {}
        _amplitude ("amplitude", Range(0, 1)) = 0.24817
        _pannerspeed ("panner speed", Range(0, 1)) = 0.5229794
        _scale ("scale", Range(0, 0.001)) = 0
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
            uniform sampler2D _node_3885; uniform float4 _node_3885_ST;
            uniform float _amplitude;
            uniform float _pannerspeed;
            uniform float _scale;
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
                float2 node_421 = ((float2(objPos.r,objPos.b)*_scale)+(node_5438.g*_pannerspeed)*float2(1,1));
                float4 _node_3885_var = tex2Dlod(_node_3885,float4(TRANSFORM_TEX(node_421, _node_3885),0.0,0));
                v.vertex.xyz += ((lerp((node_4224_if_leA*0.0)+(node_4224_if_leB*node_4759),node_4759,node_4224_if_leA*node_4224_if_leB)*_node_3885_var.r)*float3(0,1,0)*_amplitude);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
////// Lighting:
////// Emissive:
                float node_8336 = 1.0;
                float3 emissive = float3(node_8336,node_8336,node_8336);
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
            uniform sampler2D _node_3885; uniform float4 _node_3885_ST;
            uniform float _amplitude;
            uniform float _pannerspeed;
            uniform float _scale;
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
                float2 node_421 = ((float2(objPos.r,objPos.b)*_scale)+(node_5438.g*_pannerspeed)*float2(1,1));
                float4 _node_3885_var = tex2Dlod(_node_3885,float4(TRANSFORM_TEX(node_421, _node_3885),0.0,0));
                v.vertex.xyz += ((lerp((node_4224_if_leA*0.0)+(node_4224_if_leB*node_4759),node_4759,node_4224_if_leA*node_4224_if_leB)*_node_3885_var.r)*float3(0,1,0)*_amplitude);
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
