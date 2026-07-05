{$IFDEF read_interface}


function gsk_rounded_clip_node_get_type: TGType; cdecl; external libgtk4;
function gsk_rounded_clip_node_new(child: PGskRenderNode; clip: PGskRoundedRect): PGskRenderNode; cdecl; external libgtk4;
function gsk_rounded_clip_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_rounded_clip_node_get_clip(node: PGskRenderNode): PGskRoundedRect; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:36:00 ===

function GSK_TYPE_ROUNDED_CLIP_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_ROUNDED_CLIP_NODE: TGType;
begin
  GSK_TYPE_ROUNDED_CLIP_NODE := gsk_rounded_clip_node_get_type;
end;



{$ENDIF read_implementation}
