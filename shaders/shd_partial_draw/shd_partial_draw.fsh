varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_percent;        // Percentage to show (0.0 to 1.0)
uniform vec2 u_direction;       // Normalized direction vector
uniform vec4 u_sprite_rect;     // [x,y,width,height] in texture coordinates (0-1)
uniform vec2 u_sprite_size;     // [width,height] in pixels

void main() {
    // Get texture color from atlas
    vec4 tex_color = texture2D(gm_BaseTexture, v_vTexcoord);
    
    // Check if we're inside the sprite rectangle
    if (v_vTexcoord.x < u_sprite_rect.x || v_vTexcoord.x > u_sprite_rect.x + u_sprite_rect.z ||
        v_vTexcoord.y < u_sprite_rect.y || v_vTexcoord.y > u_sprite_rect.y + u_sprite_rect.w) {
        discard;
    }
    
    // Calculate normalized position within the sprite (0 to 1)
    vec2 sprite_pos = vec2(
        (v_vTexcoord.x - u_sprite_rect.x) / u_sprite_rect.z,
        (v_vTexcoord.y - u_sprite_rect.y) / u_sprite_rect.w
    );
    
    // Project position onto direction vector
    float proj = dot(sprite_pos - 0.5, u_direction) + 0.5;
    
    // Only draw if projection is less than the percentage
    if (proj <= u_percent) {
        gl_FragColor = tex_color * v_vColour;
    } else {
        discard;
    }
}