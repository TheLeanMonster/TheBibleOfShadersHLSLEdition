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
float2 uImageSize1;
float2 uImageSize2;
float2 uImageSize3;
float2 uImageOffset;
float uSaturation;
float4 uSourceRect;
float2 uZoom;
// ^this has all you need for a shader (intended for Terraria modders ONLY)

float4 PixelShaderFunction(float4 samplecolor : COLOR0, float2 coords : TEXCOORD0) : COLOR0
{
    //inside this function is all you need,this can be used by both terraria modders and game devs,just copy paste the current code and adapt it for what you need
    
    //you might want to change both uImage0 and coords with watever your engine uses normally for textures and coordinates if you arent a terraria modder
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