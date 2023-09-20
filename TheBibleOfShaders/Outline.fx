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

float4 edge(float2 coords : TEXCOORD0) : COLOR0
{
    //this shader will create an outline by sampling the same texture 4 times and checking all positions (up,down,left and right) for empty pixels 
    
    float offset = 0.00001; // this is how thick the outline should be,you can mess around with this and see what suits you 
    float4 col = tex2D(uImage0, coords);
    if (col.a > 0.5) //this checks if the current pixel is valid (basically if it has more than 0.5 transparency) if the pixel is valid,return the normal texture
        return col;
    else
    {
        //this long hot mess samples the sprite 4 times with your offset
        float a = tex2D(uImage0, float2 
        (coords.x + offset, coords.y)).a + 

        tex2D(uImage0, float2
        (coords.x, coords.y - offset)).a +

        tex2D(uImage0, float2
        (coords.x - offset, coords.y)).a +

        tex2D(uImage0, float2
        (coords.x, coords.y + offset)).a;
        
        if (col.a < 1.0 && a > 0.0) //here we check if the current pixel is valid AND if its inside our 4 sampler mess,it returns the color of the outline
        {
            col.r = 1;
            col.b = 1;
            col.g = 0;
            col.a = 1;
        }
        else
            return col.rgba = 0, 0, 0, 0; //you could delete this if you want but this essentially just returns an empty pixel

    }
    return col;
}

technique Technique1
{
    pass Edge
    {
        PixelShader = compile ps_2_0 edge();
    }
}