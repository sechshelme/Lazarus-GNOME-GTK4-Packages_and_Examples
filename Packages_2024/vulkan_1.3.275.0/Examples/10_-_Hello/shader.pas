unit shader;

interface

uses
  fp_shaderc;


const
  VertexShaderSource =
    '#version 450' + #10 +
    '' + #10 +
    'layout(location = 0) out vec3 fragColor;' + #10 +
    '' + #10 +
    '// Idiotensicheres Layout: vec4 ist immer exakt 16 Byte groß' + #10 +
    'layout(push_constant) uniform PushConstants {' + #10 +
    '    vec4 pos[3];' + #10 +
    '    vec4 col[3];' + #10 +
    '    float scale;' + #10 +
    '} pc;' + #10 +
    '' + #10 +
    'void main() {' + #10 +
    '    // Wir greifen nur auf .xy (Position) und .rgb (Farbe) zu' + #10 +
    '    vec2 position = pc.pos[gl_VertexIndex].xy;' + #10 +
    '    vec3 color = pc.col[gl_VertexIndex].rgb;' + #10 +
    '' + #10 +
    '    // Animieren' + #10 +
    '    vec2 scaledPos = position * pc.scale;' + #10 +
    '    ' + #10 +
    '    gl_Position = vec4(scaledPos, 0.0, 1.0);' + #10 +
    '    fragColor = color;' + #10 +
    '}';

const
  FragmentShaderSource =
    '#version 450' + #10 +
    '' + #10 +
    'layout(location = 0) in vec3 fragColor;' + #10 +
    'layout(location = 0) out vec4 outColor;' + #10 +
    '' + #10 +
    'void main() {' + #10 +
    '    outColor = vec4(fragColor, 1.0);' + #10 +
    '}';

function PCharToSpriV(kind: Tshaderc_shader_kind; src: pchar): RawByteString;


implementation

function PCharToSpriV(kind: Tshaderc_shader_kind; src: pchar): RawByteString;
var
  compiler: Pshaderc_compiler;
  res: Pshaderc_compilation_result;
  spirv_size: Tsize_t;
  spirv_data: pansichar;
begin
  compiler := shaderc_compiler_initialize;
  res := shaderc_compile_into_spv(compiler, src, Length(src), kind, 'shader.glsl', 'main', nil);
  if shaderc_result_get_compilation_status(res) <> shaderc_compilation_status_success then begin
    WriteLn('Shaderc error: %s'#10, shaderc_result_get_error_message(res));
    shaderc_result_release(res);
    shaderc_compiler_release(compiler);
    exit('');
  end;

  spirv_size := shaderc_result_get_length(res);
  spirv_data := shaderc_result_get_bytes(res);

  SetLength(Result, spirv_size);
  Move(spirv_data[0], Result[1], spirv_size);

  shaderc_result_release(res);
  shaderc_compiler_release(compiler);
end;


end.
