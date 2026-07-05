unit gskcontainernode;

interface

uses
  fp_glib2, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_container_node_get_type: TGType; cdecl; external libgtk4;
function gsk_container_node_new(children: PPGskRenderNode; n_children: Tguint): PGskRenderNode; cdecl; external libgtk4;
function gsk_container_node_get_n_children(node: PGskRenderNode): Tguint; cdecl; external libgtk4;
function gsk_container_node_get_child(node: PGskRenderNode; idx: Tguint): PGskRenderNode; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:28:59 ===

function GSK_TYPE_CONTAINER_NODE: TGType;

implementation

function GSK_TYPE_CONTAINER_NODE: TGType;
begin
  GSK_TYPE_CONTAINER_NODE := gsk_container_node_get_type;
end;



end.
