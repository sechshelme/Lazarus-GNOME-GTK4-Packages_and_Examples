unit gskdebugnode;

interface

uses
  fp_glib2, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_debug_node_get_type: TGType; cdecl; external libgtk4;
function gsk_debug_node_new(child: PGskRenderNode; message: pchar): PGskRenderNode; cdecl; external libgtk4;
function gsk_debug_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_debug_node_get_message(node: PGskRenderNode): pchar; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:28:45 ===

function GSK_TYPE_DEBUG_NODE: TGType;

implementation

function GSK_TYPE_DEBUG_NODE: TGType;
begin
  GSK_TYPE_DEBUG_NODE := gsk_debug_node_get_type;
end;



end.
