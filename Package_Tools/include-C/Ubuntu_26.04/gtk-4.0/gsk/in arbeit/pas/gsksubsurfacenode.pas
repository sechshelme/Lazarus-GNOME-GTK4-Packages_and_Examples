unit gsksubsurfacenode;

interface

uses
  fp_glib2, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_subsurface_node_get_type: TGType; cdecl; external libgtk4;
function gsk_subsurface_node_new(child: PGskRenderNode; subsurface: Tgpointer): PGskRenderNode; cdecl; external libgtk4;
function gsk_subsurface_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_subsurface_node_get_subsurface(node: PGskRenderNode): Tgpointer; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:39:07 ===

function GSK_TYPE_SUBSURFACE_NODE: TGType;

implementation

function GSK_TYPE_SUBSURFACE_NODE: TGType;
begin
  GSK_TYPE_SUBSURFACE_NODE := gsk_subsurface_node_get_type;
end;



end.
