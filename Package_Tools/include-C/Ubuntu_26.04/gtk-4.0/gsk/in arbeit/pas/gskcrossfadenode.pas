unit gskcrossfadenode;

interface

uses
  fp_glib2, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_cross_fade_node_get_type: TGType; cdecl; external libgtk4;
function gsk_cross_fade_node_new(start: PGskRenderNode; end_: PGskRenderNode; progress: single): PGskRenderNode; cdecl; external libgtk4;
function gsk_cross_fade_node_get_start_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_cross_fade_node_get_end_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_cross_fade_node_get_progress(node: PGskRenderNode): single; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:28:50 ===

function GSK_TYPE_CROSS_FADE_NODE: TGType;

implementation

function GSK_TYPE_CROSS_FADE_NODE: TGType;
begin
  GSK_TYPE_CROSS_FADE_NODE := gsk_cross_fade_node_get_type;
end;



end.
