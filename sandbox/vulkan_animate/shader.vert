#version 450

layout(location = 0) out vec3 fragColor;

// Idiotensicheres Layout: vec4 ist immer exakt 16 Byte groß
layout(push_constant) uniform PushConstants {
    vec4 pos[3];
    vec4 col[3];
    float scale;
} pc;

void main() {
    // Wir greifen nur auf .xy (Position) und .rgb (Farbe) zu
    vec2 position = pc.pos[gl_VertexIndex].xy;
    vec3 color = pc.col[gl_VertexIndex].rgb;

    // Animieren
    vec2 scaledPos = position * pc.scale;
    
    gl_Position = vec4(scaledPos, 0.0, 1.0);
    fragColor = color;
}
