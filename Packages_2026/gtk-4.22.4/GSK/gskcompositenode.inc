{$IFDEF read_interface}


function gsk_composite_node_get_type: TGType; cdecl; external libgtk4;
function gsk_composite_node_new(child: PGskRenderNode; mask: PGskRenderNode; op: TGskPorterDuff): PGskRenderNode; cdecl; external libgtk4;
function gsk_composite_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_composite_node_get_mask(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_composite_node_get_operator(node: PGskRenderNode): TGskPorterDuff; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:08:03 ===

function GSK_TYPE_COMPOSITE_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_COMPOSITE_NODE: TGType;
begin
  GSK_TYPE_COMPOSITE_NODE := gsk_composite_node_get_type;
end;



{$ENDIF read_implementation}
