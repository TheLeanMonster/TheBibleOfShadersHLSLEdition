sampler uImage0 : register(s0);
sampler uImage1 : register(s1);
sampler uImage2 : register(s2);
sampler uImage3 : register(s3);
float3 uColor;
float3 uSecondaryColor;
float2 uScreenResolution;
float2 uScreenPosition;
float2 uTargetPosition;
float2 uDirection;
float uOpacity;
float uTime;
float uIntensity;
float uProgress;
float2 uImageSize0;
float2 uImageSize1;
float2 uImageSize2;
float2 uImageSize3;
float2 uImageOffset;
float uSaturation;
float4 uSourceRect;
float2 uZoom;
float2 uShaderSpecificData;
float2 uWorldPosition;
//same for a screen shader but with some extra stuff that terraria requires,if you are a game dev you can just ignore this 
float4 PixelShaderFunction(float4 samplecolor : COLOR0, float2 coords : TEXCOORD0) : COLOR0
{
    //same as screen shader,if you are a game dev only copy the code below if you are a terraria modder you can copy everything
    float4 Texture = tex2D(uImage0, coords);

    return Texture;
}

technique Technique1
{
    pass wave
    {
        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}