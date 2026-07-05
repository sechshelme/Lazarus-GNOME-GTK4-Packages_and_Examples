{$IFDEF read_interface}


function gsk_isolation_node_get_type: TGType; cdecl; external libgtk4;
function gsk_isolation_node_new(child: PGskRenderNode; isolations: TGskIsolation): PGskRenderNode; cdecl; external libgtk4;
function gsk_isolation_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_isolation_node_get_isolations(node: PGskRenderNode): TGskIsolation; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:31:58 ===

function GSK_TYPE_ISOLATION_NODE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_ISOLATION_NODE: TGType;
begin
  GSK_TYPE_ISOLATION_NODE := gsk_isolation_node_get_type;
end;



{$ENDIF read_implementation}
