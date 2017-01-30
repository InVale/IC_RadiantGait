// Shader created with Shader Forge v1.32 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.32;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False;n:type:ShaderForge.SFN_Final,id:3138,x:33926,y:33165,varname:node_3138,prsc:2|emission-4133-OUT;n:type:ShaderForge.SFN_Vector1,id:3257,x:32306,y:33007,varname:node_3257,prsc:2,v1:1;n:type:ShaderForge.SFN_ValueProperty,id:5922,x:32306,y:33100,ptovrint:False,ptlb:LinesDensity,ptin:_LinesDensity,varname:_LinesDensity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Append,id:2515,x:32478,y:33007,varname:node_2515,prsc:2|A-3257-OUT,B-5922-OUT;n:type:ShaderForge.SFN_Append,id:8053,x:32497,y:32805,varname:node_8053,prsc:2|A-3954-U,B-8682-OUT;n:type:ShaderForge.SFN_Multiply,id:1729,x:32661,y:32914,varname:node_1729,prsc:2|A-8053-OUT,B-2515-OUT;n:type:ShaderForge.SFN_ValueProperty,id:2638,x:32303,y:33279,ptovrint:False,ptlb:LinesSpeed,ptin:_LinesSpeed,varname:_LinesSpeed,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:5;n:type:ShaderForge.SFN_Append,id:4755,x:32478,y:33200,varname:node_4755,prsc:2|A-1356-OUT,B-2638-OUT;n:type:ShaderForge.SFN_Time,id:7526,x:32478,y:33350,varname:node_7526,prsc:2;n:type:ShaderForge.SFN_Multiply,id:6702,x:32646,y:33267,varname:node_6702,prsc:2|A-4755-OUT,B-7526-TSL;n:type:ShaderForge.SFN_Add,id:5253,x:32833,y:33071,varname:node_5253,prsc:2|A-1729-OUT,B-6702-OUT;n:type:ShaderForge.SFN_OneMinus,id:3101,x:33002,y:33071,varname:node_3101,prsc:2|IN-5253-OUT;n:type:ShaderForge.SFN_ComponentMask,id:7323,x:33176,y:33071,varname:node_7323,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-3101-OUT;n:type:ShaderForge.SFN_Frac,id:1301,x:33347,y:33071,varname:node_1301,prsc:2|IN-7323-OUT;n:type:ShaderForge.SFN_Power,id:1540,x:33528,y:33140,varname:node_1540,prsc:2|VAL-1301-OUT,EXP-6405-OUT;n:type:ShaderForge.SFN_ValueProperty,id:6405,x:33361,y:33269,ptovrint:False,ptlb:LinesExposure,ptin:_LinesExposure,varname:_LinesExposure,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;n:type:ShaderForge.SFN_Multiply,id:4133,x:33711,y:33264,varname:node_4133,prsc:2|A-1540-OUT,B-1642-OUT;n:type:ShaderForge.SFN_Slider,id:1642,x:33361,y:33363,ptovrint:False,ptlb:LinesOpacity,ptin:_LinesOpacity,varname:_LinesOpacity,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Vector1,id:1356,x:32303,y:33200,varname:node_1356,prsc:2,v1:0;n:type:ShaderForge.SFN_TexCoord,id:3830,x:29966,y:32951,varname:node_3830,prsc:2,uv:0;n:type:ShaderForge.SFN_Multiply,id:8405,x:30143,y:33038,varname:node_8405,prsc:2|A-3830-UVOUT,B-1797-OUT;n:type:ShaderForge.SFN_Frac,id:8885,x:30322,y:33132,varname:node_8885,prsc:2|IN-8405-OUT;n:type:ShaderForge.SFN_Multiply,id:388,x:30512,y:33262,varname:node_388,prsc:2|A-8885-OUT,B-1246-OUT;n:type:ShaderForge.SFN_Vector1,id:1246,x:30322,y:33262,varname:node_1246,prsc:2,v1:1.5;n:type:ShaderForge.SFN_Subtract,id:4295,x:30699,y:33211,varname:node_4295,prsc:2|A-9042-OUT,B-388-OUT;n:type:ShaderForge.SFN_Vector1,id:9042,x:30512,y:33191,varname:node_9042,prsc:2,v1:1.8;n:type:ShaderForge.SFN_Multiply,id:2968,x:30883,y:33081,varname:node_2968,prsc:2|A-8885-OUT,B-8885-OUT,C-4295-OUT;n:type:ShaderForge.SFN_ComponentMask,id:665,x:31043,y:33081,varname:node_665,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2968-OUT;n:type:ShaderForge.SFN_Floor,id:1279,x:30322,y:32940,varname:node_1279,prsc:2|IN-8405-OUT;n:type:ShaderForge.SFN_ComponentMask,id:8259,x:30512,y:32940,varname:node_8259,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-1279-OUT;n:type:ShaderForge.SFN_Multiply,id:964,x:30699,y:33004,varname:node_964,prsc:2|A-8259-G,B-6593-OUT;n:type:ShaderForge.SFN_Vector1,id:6593,x:30512,y:33086,varname:node_6593,prsc:2,v1:57;n:type:ShaderForge.SFN_Add,id:4424,x:30883,y:32872,varname:node_4424,prsc:2|A-8259-R,B-964-OUT;n:type:ShaderForge.SFN_Vector1,id:2006,x:31048,y:32745,varname:node_2006,prsc:2,v1:58;n:type:ShaderForge.SFN_Vector1,id:2316,x:31048,y:32872,varname:node_2316,prsc:2,v1:57;n:type:ShaderForge.SFN_Vector1,id:5381,x:31048,y:32971,varname:node_5381,prsc:2,v1:1;n:type:ShaderForge.SFN_Add,id:7818,x:31217,y:32675,varname:node_7818,prsc:2|A-4424-OUT,B-2006-OUT;n:type:ShaderForge.SFN_Add,id:4188,x:31217,y:32815,varname:node_4188,prsc:2|A-4424-OUT,B-2316-OUT;n:type:ShaderForge.SFN_Add,id:5731,x:31217,y:32956,varname:node_5731,prsc:2|A-4424-OUT,B-5381-OUT;n:type:ShaderForge.SFN_Sin,id:8351,x:31400,y:32675,varname:node_8351,prsc:2|IN-7818-OUT;n:type:ShaderForge.SFN_Sin,id:9610,x:31400,y:32815,varname:node_9610,prsc:2|IN-4188-OUT;n:type:ShaderForge.SFN_Sin,id:6747,x:31400,y:32956,varname:node_6747,prsc:2|IN-5731-OUT;n:type:ShaderForge.SFN_Sin,id:9641,x:31400,y:33097,varname:node_9641,prsc:2|IN-4424-OUT;n:type:ShaderForge.SFN_Multiply,id:762,x:31574,y:32675,varname:node_762,prsc:2|A-8351-OUT,B-6332-OUT;n:type:ShaderForge.SFN_Vector1,id:6332,x:31400,y:33233,varname:node_6332,prsc:2,v1:473.5;n:type:ShaderForge.SFN_Multiply,id:7470,x:31574,y:32815,varname:node_7470,prsc:2|A-9610-OUT,B-6332-OUT;n:type:ShaderForge.SFN_Multiply,id:3494,x:31574,y:32956,varname:node_3494,prsc:2|A-6747-OUT,B-6332-OUT;n:type:ShaderForge.SFN_Multiply,id:4364,x:31574,y:33097,varname:node_4364,prsc:2|A-9641-OUT,B-6332-OUT;n:type:ShaderForge.SFN_Frac,id:4828,x:31749,y:32675,varname:node_4828,prsc:2|IN-762-OUT;n:type:ShaderForge.SFN_Frac,id:9176,x:31749,y:32815,varname:node_9176,prsc:2|IN-7470-OUT;n:type:ShaderForge.SFN_Frac,id:9899,x:31749,y:32956,varname:node_9899,prsc:2|IN-3494-OUT;n:type:ShaderForge.SFN_Frac,id:9794,x:31749,y:33097,varname:node_9794,prsc:2|IN-4364-OUT;n:type:ShaderForge.SFN_Lerp,id:6854,x:31957,y:32800,varname:node_6854,prsc:2|A-4828-OUT,B-9176-OUT,T-665-R;n:type:ShaderForge.SFN_Lerp,id:2805,x:31957,y:32956,varname:node_2805,prsc:2|A-9899-OUT,B-9794-OUT,T-665-G;n:type:ShaderForge.SFN_Multiply,id:5663,x:32141,y:32872,varname:node_5663,prsc:2|A-6854-OUT,B-2805-OUT;n:type:ShaderForge.SFN_Frac,id:8682,x:32307,y:32872,varname:node_8682,prsc:2|IN-5663-OUT;n:type:ShaderForge.SFN_TexCoord,id:3954,x:32306,y:32709,varname:node_3954,prsc:2,uv:0;n:type:ShaderForge.SFN_ValueProperty,id:1797,x:29966,y:33113,ptovrint:False,ptlb:Tiles,ptin:_Tiles,varname:node_1797,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:10;proporder:5922-2638-6405-1642-1797;pass:END;sub:END;*/

Shader "Shader Forge/S_Glitch" {
    Properties {
        _LinesDensity ("LinesDensity", Float ) = 10
        _LinesSpeed ("LinesSpeed", Float ) = 5
        _LinesExposure ("LinesExposure", Float ) = 10
        _LinesOpacity ("LinesOpacity", Range(0, 1)) = 1
        _Tiles ("Tiles", Float ) = 10
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
            uniform float _LinesDensity;
            uniform float _LinesSpeed;
            uniform float _LinesExposure;
            uniform float _LinesOpacity;
            uniform float _Tiles;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
////// Emissive:
                float2 node_8405 = (i.uv0*_Tiles);
                float2 node_8259 = floor(node_8405).rg;
                float node_4424 = (node_8259.r+(node_8259.g*57.0));
                float node_6332 = 473.5;
                float2 node_8885 = frac(node_8405);
                float2 node_665 = (node_8885*node_8885*(1.8-(node_8885*1.5))).rg;
                float4 node_7526 = _Time + _TimeEditor;
                float node_4133 = (pow(frac((1.0 - ((float2(i.uv0.r,frac((lerp(frac((sin((node_4424+58.0))*node_6332)),frac((sin((node_4424+57.0))*node_6332)),node_665.r)*lerp(frac((sin((node_4424+1.0))*node_6332)),frac((sin(node_4424)*node_6332)),node_665.g))))*float2(1.0,_LinesDensity))+(float2(0.0,_LinesSpeed)*node_7526.r))).g),_LinesExposure)*_LinesOpacity);
                float3 emissive = float3(node_4133,node_4133,node_4133);
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
