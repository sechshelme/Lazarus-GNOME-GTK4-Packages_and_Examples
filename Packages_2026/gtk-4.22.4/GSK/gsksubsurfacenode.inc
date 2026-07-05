{$IFDEF read_interface}


function gsk_subsurface_node_get_type: TGType; cdecl; external libgtk4;
function gsk_subsurface_node_new(child: PGskRenderNode; subsurface: Tgpointer): PGskRenderNode; cdecl; external libgtk4;
function gsk_subsurface_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_subsurface_node_get_subsurface(node: PGskRenderNode): Tgpointer; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:39:07 ===

function GSK_TYPE_SUBSURFACE_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_SUBSURFACE_NODE: TGType;
begin
  GSK_TYPE_SUBSURFACE_NODE := gsk_subsurface_node_get_type;
end;



{$ENDIF read_implementation}
