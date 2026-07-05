{$IFDEF read_interface}


function gsk_fill_node_get_type: TGType; cdecl; external libgtk4;
function gsk_fill_node_new(child: PGskRenderNode; path: PGskPath; fill_rule: TGskFillRule): PGskRenderNode; cdecl; external libgtk4;
function gsk_fill_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_fill_node_get_path(node: PGskRenderNode): PGskPath; cdecl; external libgtk4;
function gsk_fill_node_get_fill_rule(node: PGskRenderNode): TGskFillRule; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:28:28 ===

function GSK_TYPE_FILL_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_FILL_NODE: TGType;
begin
  GSK_TYPE_FILL_NODE := gsk_fill_node_get_type;
end;



{$ENDIF read_implementation}
