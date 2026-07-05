unit gskclipnode;

interface

uses
  fp_glib2, fp_graphene, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_clip_node_get_type: TGType; cdecl; external libgtk4;
function gsk_clip_node_new(child: PGskRenderNode; clip: Pgraphene_rect_t): PGskRenderNode; cdecl; external libgtk4;
function gsk_clip_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_clip_node_get_clip(node: PGskRenderNode): Pgraphene_rect_t; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:08:26 ===

function GSK_TYPE_CLIP_NODE: TGType;

implementation

function GSK_TYPE_CLIP_NODE: TGType;
begin
  GSK_TYPE_CLIP_NODE := gsk_clip_node_get_type;
end;



end.
