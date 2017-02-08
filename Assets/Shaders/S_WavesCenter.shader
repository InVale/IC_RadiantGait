// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'

// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33721,y:32593,varname:node_3138,prsc:2|emission-1382-OUT,alpha-1634-OUT,voffset-7385-OUT;n:type:ShaderForge.SFN_FragmentPosition,id:4816,x:32936,y:32583,varname:node_4816,prsc:2;n:type:ShaderForge.SFN_If,id:4224,x:33130,y:32701,varname:node_4224,prsc:2|A-4816-Y,B-6435-OUT,GT-4759-OUT,EQ-4759-OUT,LT-8137-OUT;n:type:ShaderForge.SFN_Tex2d,id:3885,x:33130,y:32848,ptovrint:False,ptlb:Texture,ptin:_Texture,varname:node_3885,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:17da6d53ec93a0444bd0f751b1d02477,ntxv:0,isnm:False|UVIN-421-UVOUT;n:type:ShaderForge.SFN_Panner,id:421,x:32936,y:32848,varname:node_421,prsc:2,spu:1,spv:1|UVIN-26-OUT,DIST-2003-OUT;n:type:ShaderForge.SFN_Multiply,id:1111,x:33343,y:32848,varname:node_1111,prsc:2|A-4224-OUT,B-3885-R;n:type:ShaderForge.SFN_Vector1,id:4759,x:32936,y:32749,varname:node_4759,prsc:2,v1:1;n:type:ShaderForge.SFN_Multiply,id:7385,x:33544,y:32952,varname:node_7385,prsc:2|A-1111-OUT,B-7408-OUT,C-8554-OUT;n:type:ShaderForge.SFN_Vector3,id:7408,x:33343,y:32970,varname:node_7408,prsc:2,v1:0,v2:1,v3:0;n:type:ShaderForge.SFN_Vector1,id:8137,x:32936,y:32798,varname:node_8137,prsc:2,v1:0;n:type:ShaderForge.SFN_Slider,id:8554,x:33186,y:33078,ptovrint:False,ptlb:Amplitude,ptin:_Amplitude,varname:node_8554,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.3675224,max:1;n:type:ShaderForge.SFN_Time,id:5438,x:32540,y:32954,varname:node_5438,prsc:2;n:type:ShaderForge.SFN_Slider,id:520,x:32383,y:33096,ptovrint:False,ptlb:PannerSpeed,ptin:_PannerSpeed,varname:node_520,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5229794,max:1;n:type:ShaderForge.SFN_Multiply,id:2003,x:32745,y:32922,varname:node_2003,prsc:2|A-5438-TSL,B-520-OUT;n:type:ShaderForge.SFN_Slider,id:9971,x:32383,y:32876,ptovrint:False,ptlb:Scale,ptin:_Scale,varname:node_9971,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.0001538462,max:0.001;n:type:ShaderForge.SFN_ObjectPosition,id:5847,x:32368,y:32711,varname:node_5847,prsc:2;n:type:ShaderForge.SFN_Append,id:4738,x:32540,y:32733,varname:node_4738,prsc:2|A-5847-X,B-5847-Z;n:type:ShaderForge.SFN_Multiply,id:26,x:32745,y:32798,varname:node_26,prsc:2|A-4738-OUT,B-9971-OUT;n:type:ShaderForge.SFN_Vector1,id:9715,x:33343,y:32701,varname:node_9715,prsc:2,v1:1;n:type:ShaderForge.SFN_Vector1,id:6435,x:32936,y:32701,varname:node_6435,prsc:2,v1:-95;n:type:ShaderForge.SFN_LightColor,id:8711,x:32767,y:32355,varname:node_8711,prsc:2;n:type:ShaderForge.SFN_RgbToHsv,id:2480,x:32924,y:32355,varname:node_2480,prsc:2|IN-8711-RGB;n:type:ShaderForge.SFN_HsvToRgb,id:648,x:33295,y:32428,varname:node_648,prsc:2|H-2480-HOUT,S-832-OUT,V-2480-VOUT;n:type:ShaderForge.SFN_Add,id:832,x:33105,y:32428,varname:node_832,prsc:2|A-2480-SOUT,B-6413-OUT;n:type:ShaderForge.SFN_Slider,id:6413,x:32767,y:32504,ptovrint:False,ptlb:Saturation,ptin:_Saturation,varname:node_6413,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.5657396,max:1;n:type:ShaderForge.SFN_SwitchProperty,id:1382,x:33514,y:32567,ptovrint:False,ptlb:Lit/Unlit,ptin:_LitUnlit,varname:node_1382,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:False|A-648-OUT,B-9715-OUT;n:type:ShaderForge.SFN_Slider,id:1634,x:33343,y:32775,ptovrint:False,ptlb:Opacity,ptin:_Opacity,varname:node_1634,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;proporder:3885-8554-520-9971-6413-1382-1634;pass:END;sub:END;*/

Shader "Shader Forge/S_Waves" {
    Properties {
        _Texture ("Texture", 2D) = "white" {}
        _Amplitude ("Amplitude", Range(0, 1)) = 0.3675224
        _PannerSpeed ("PannerSpeed", Range(0, 1)) = 0.5229794
        _Scale ("Scale", Range(0, 0.001)) = 0.0001538462
        _Saturation ("Saturation", Range(0, 1)) = 0.5657396
        [MaterialToggle] _LitUnlit ("Lit/Unlit", Float ) = 0
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
            uniform float4 _TimeEditor;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Amplitude;
            uniform float _PannerSpeed;
            uniform float _Scale;
            uniform float _Saturation;
            uniform fixed _LitUnlit;
            uniform float _Opacity;
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
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
////// Emissive:
                float4 node_2480_k = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
                float4 node_2480_p = lerp(float4(float4(_LightColor0.rgb,0.0).zy, node_2480_k.wz), float4(float4(_LightColor0.rgb,0.0).yz, node_2480_k.xy), step(float4(_LightColor0.rgb,0.0).z, float4(_LightColor0.rgb,0.0).y));
                float4 node_2480_q = lerp(float4(node_2480_p.xyw, float4(_LightColor0.rgb,0.0).x), float4(float4(_LightColor0.rgb,0.0).x, node_2480_p.yzx), step(node_2480_p.x, float4(_LightColor0.rgb,0.0).x));
                float node_2480_d = node_2480_q.x - min(node_2480_q.w, node_2480_q.y);
                float node_2480_e = 1.0e-10;
                float3 node_2480 = float3(abs(node_2480_q.z + (node_2480_q.w - node_2480_q.y) / (6.0 * node_2480_d + node_2480_e)), node_2480_d / (node_2480_q.x + node_2480_e), node_2480_q.x);;
                float3 emissive = lerp( (lerp(float3(1,1,1),saturate(3.0*abs(1.0-2.0*frac(node_2480.r+float3(0.0,-1.0/3.0,1.0/3.0)))-1),(node_2480.g+_Saturation))*node_2480.b), 1.0, _LitUnlit );
                float3 finalColor = emissive;
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
            uniform float4 _TimeEditor;
            uniform sampler2D _Texture; uniform float4 _Texture_ST;
            uniform float _Amplitude;
            uniform float _PannerSpeed;
            uniform float _Scale;
            uniform float _Saturation;
            uniform fixed _LitUnlit;
            uniform float _Opacity;
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                LIGHTING_COORDS(1,2)
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
                float3 lightColor = _LightColor0.rgb;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                float4 objPos = mul ( unity_ObjectToWorld, float4(0,0,0,1) );
                float3 lightColor = _LightColor0.rgb;
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor * _Opacity,0);
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
