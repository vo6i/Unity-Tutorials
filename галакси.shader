// dclxviclan🧞‍♀️🤬. production & ￼B￼￼Ba￼￼B￼￼Ban￼￼B￼￼Ba￼￼B￼￼Ban￼￼B￼￼Ba￼￼B￼￼Ban￼￼B￼￼Ba￼￼B￼￼BanZAI

Shader "Custom/StarField" {
    Properties {
        _MainTex ("Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _StarSize ("Star Size", Range(0.1, 10)) = 1.0
    }
    SubShader {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            fixed4 _Color;
            float _StarSize;

            v2f vert (appdata v) {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            fixed4 frag (v2f i) : SV_Target {
                float2 uv = i.uv * _MainTex_ST.xy + _MainTex_ST.zw;
                fixed4 col = tex2D(_MainTex, uv);
                col *= _Color;

                // Add star effect based on UV position
                if (rand(uv) < 0.01) {
                    col = lerp(col, fixed4(1, 1, 1, 1), smoothstep(0.0, 0.01, rand(uv)));
                }

                return col;
            }
            ENDCG
        }
    }
}
