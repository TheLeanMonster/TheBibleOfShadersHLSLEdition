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


float4 PixelShaderFunction(float4 sampleColor : COLOR0, float2 coords : TEXCOORD0) : COLOR0
{
    //this shader needs some work,its basically making fire using a perlin noise (this would have been way easier in GLSL) 
    float2 uv = coords;
    uv.y = uv.y + uTime; //this makes the perlin noise move
    
    //here you will probably wonder "why am i sampling 3 different sprites" where i would respond simply "i have no idea" jk this fire is transparent
    //when i made this shader i wanted to also see the sprite behind the fire   -_-
    float4 bg = tex2D(uImage0, coords);
    float4 colors = tex2D(uImage1, coords); //add your sprite here too
    float4 Fire = tex2D(uImage2, uv); //add a pelin noise to this you can find it inside the noise folder
    
    //yay colors...
    colors.r = 0;
    colors.b = 0;
    colors.g = 1;

    //stupid math...
    bg.rgb = (Fire - colors) * bg;
    return bg;

}


technique Technique1
{
    pass CursedFlamesPass
    {

        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}