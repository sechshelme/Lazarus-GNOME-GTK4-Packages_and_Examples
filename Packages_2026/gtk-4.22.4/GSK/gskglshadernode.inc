{$IFDEF read_interface}


function gsk_gl_shader_node_get_type: TGType; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_node_new(shader: PGskGLShader; bounds: Pgraphene_rect_t; args: PGBytes; children: PPGskRenderNode; n_children: Tguint): PGskRenderNode; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_node_get_n_children(node: PGskRenderNode): Tguint; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_node_get_child(node: PGskRenderNode; idx: Tguint): PGskRenderNode; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_node_get_args(node: PGskRenderNode): PGBytes; cdecl; external libgtk4; deprecated;
function gsk_gl_shader_node_get_shader(node: PGskRenderNode): PGskGLShader; cdecl; external libgtk4; deprecated;

// === Konventiert am: 5-7-26 13:24:29 ===

function GSK_TYPE_GL_SHADER_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_GL_SHADER_NODE: TGType;
begin
  GSK_TYPE_GL_SHADER_NODE := gsk_gl_shader_node_get_type;
end;



{$ENDIF read_implementation}
