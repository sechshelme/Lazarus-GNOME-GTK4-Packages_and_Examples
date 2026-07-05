{$IFDEF read_interface}


function gsk_color_matrix_node_get_type: TGType; cdecl; external libgtk4;
function gsk_color_matrix_node_new(child: PGskRenderNode; color_matrix: Pgraphene_matrix_t; color_offset: Pgraphene_vec4_t): PGskRenderNode; cdecl; external libgtk4;
function gsk_color_matrix_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_color_matrix_node_get_color_matrix(node: PGskRenderNode): Pgraphene_matrix_t; cdecl; external libgtk4;
function gsk_color_matrix_node_get_color_offset(node: PGskRenderNode): Pgraphene_vec4_t; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:08:22 ===

function GSK_TYPE_COLOR_MATRIX_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_COLOR_MATRIX_NODE: TGType;
begin
  GSK_TYPE_COLOR_MATRIX_NODE := gsk_color_matrix_node_get_type;
end;



{$ENDIF read_implementation}
