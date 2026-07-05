{$IFDEF read_interface}


function gsk_repeat_node_get_type: TGType; cdecl; external libgtk4;
function gsk_repeat_node_new(bounds: Pgraphene_rect_t; child: PGskRenderNode; child_bounds: Pgraphene_rect_t): PGskRenderNode; cdecl; external libgtk4;
function gsk_repeat_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_repeat_node_get_child_bounds(node: PGskRenderNode): Pgraphene_rect_t; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:35:55 ===

function GSK_TYPE_REPEAT_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_REPEAT_NODE: TGType;
begin
  GSK_TYPE_REPEAT_NODE := gsk_repeat_node_get_type;
end;



{$ENDIF read_implementation}
