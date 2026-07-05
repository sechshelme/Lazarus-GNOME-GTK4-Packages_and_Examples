unit gskopacitynode;

interface

uses
  fp_glib2, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_opacity_node_get_type: TGType; cdecl; external libgtk4;
function gsk_opacity_node_new(child: PGskRenderNode; opacity: single): PGskRenderNode; cdecl; external libgtk4;
function gsk_opacity_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_opacity_node_get_opacity(node: PGskRenderNode): single; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:31:40 ===

function GSK_TYPE_OPACITY_NODE: TGType;

implementation

function GSK_TYPE_OPACITY_NODE: TGType;
begin
  GSK_TYPE_OPACITY_NODE := gsk_opacity_node_get_type;
end;



end.
