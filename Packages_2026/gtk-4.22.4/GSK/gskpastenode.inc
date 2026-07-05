{$IFDEF read_interface}


function gsk_paste_node_get_type: TGType; cdecl; external libgtk4;
function gsk_paste_node_new(bounds: Pgraphene_rect_t; depth: Tgsize): PGskRenderNode; cdecl; external libgtk4;
function gsk_paste_node_get_depth(node: PGskRenderNode): Tgsize; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:31:33 ===

function GSK_TYPE_PASTE_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_PASTE_NODE: TGType;
begin
  GSK_TYPE_PASTE_NODE := gsk_paste_node_get_type;
end;



{$ENDIF read_implementation}
