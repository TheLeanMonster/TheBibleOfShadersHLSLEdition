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

float4 PixelShaderFunction(float4 sampleColor : COLOR0, float2 coords : TEXCOORD0) : COLOR0
{
    //im sampling 2 textures,one for the background and the other for the color
    //i could have used the alpha channel but for some reason it just dosent work most probably cause HLSL is just a bad language   -_-
    float4 col = tex2D(uImage0, coords);
    float4 d = tex2D(uImage0, coords);
    d = d - uTime;
    
    //this shader makes the entire screen change color,in this example it makes the screen green
    d.g = 1;
    d.r = 0.5;
    d.b = 0.5;
    
    
    col *= d.rgba;
    return col;
}

technique Technique1
{
    pass GreenScreen
    {
        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}