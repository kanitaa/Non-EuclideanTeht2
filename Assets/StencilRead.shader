Shader "Custom/StencilRead"
{
	Properties{
		 _Color("Tint", Color) = (0, 0, 0, 1)
		 _MainTex("Texture", 2D) = "white" {}
		 _Smoothness("Smoothness", Range(0, 1)) = 0
		 _Metallic("Metalness", Range(0, 1)) = 0
		 [HDR] _Emission("Emission", color) = (0,0,0)

		 [IntRange] _StencilRef("Stencil Reference Value", Range(0,255)) = 0
		 _Speed("Speed", Vector) = (0.1, 0, 0)
	}
		SubShader{
			Tags{ "RenderType" = "Transparent" "Queue" = "Transparent"}

			//stencil operation
			Stencil{
				Ref[_StencilRef]
				Comp Equal
			}

			CGPROGRAM

			#pragma surface surf Standard fullforwardshadows
			#pragma target 3.0

			sampler2D _MainTex;
			float4 _Speed;
			fixed4 _Color;

			half _Smoothness;
			half _Metallic;
			half3 _Emission;

			struct Input {
				float2 uv_MainTex;
			};
			struct appdata {
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
			};

			struct v2f {
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
			};
			void surf(Input i, inout SurfaceOutputStandard o) {
				fixed4 col = tex2D(_MainTex, i.uv_MainTex);
				col *= _Color;
				o.Albedo = col.rgb;
				o.Metallic = _Metallic;
				o.Smoothness = _Smoothness;
				o.Emission = _Emission;
			}

			ENDCG
		 }
			 FallBack "Standard"
}