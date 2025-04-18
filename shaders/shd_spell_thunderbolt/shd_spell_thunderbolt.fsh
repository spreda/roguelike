// Fragment Shader
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;         // GameMaker's built-in time uniform
uniform vec2 u_texelSize;     // 1/texture_size
uniform float u_speed;        // Effect speed (try 2.0)
uniform float u_distortion;   // Distortion amount (try 0.05)
uniform vec3 u_coreColor;     // Main bolt color (e.g., vec3(0.2, 0.5, 1.0))
uniform vec3 u_edgeColor;     // Glow color (e.g., vec3(0.8, 0.9, 1.0))

// Random noise texture (should be a seamless noise texture)
uniform sampler2D u_noiseTex;

void main() {
    // Scroll the noise texture vertically
    vec2 scrollUV = v_vTexcoord + vec2(0.0, u_time * u_speed);
    
    // Get noise values for distortion
    vec4 noise = texture2D(u_noiseTex, scrollUV);
    
    // Create UV distortion
    vec2 distortedUV = v_vTexcoord + (noise.rg - 0.5) * u_distortion;
    
    // Original alpha from sprite
    float baseAlpha = texture2D(gm_BaseTexture, distortedUV).a;
    
    // Edge detection for glow
    float edge = 0.0;
    for (int x = -1; x <= 1; x++) {
        for (int y = -1; y <= 1; y++) {
            vec2 offset = vec2(x, y) * u_texelSize;
            edge += texture2D(gm_BaseTexture, distortedUV + offset).a;
        }
    }
    edge = abs(edge / 9.0 - baseAlpha);
    
    // Core intensity with pulse
    float pulse = sin(u_time * 10.0) * 0.1 + 0.9;
    float coreIntensity = baseAlpha * pulse;
    
    // Combine colors
    vec3 core = u_coreColor * coreIntensity;
    vec3 glow = u_edgeColor * edge * 2.0;
    
    // Final color with additive blending
    gl_FragColor = vec4(core + glow, max(baseAlpha, edge));
}