unit gskmasknode;

interface

uses
  fp_glib2, fp_gtk4, gsktypes, gskenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_mask_node_get_type: TGType; cdecl; external libgtk4;
function gsk_mask_node_new(source: PGskRenderNode; mask: PGskRenderNode; mask_mode: TGskMaskMode): PGskRenderNode; cdecl; external libgtk4;
function gsk_mask_node_get_source(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_mask_node_get_mask(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_mask_node_get_mask_mode(node: PGskRenderNode): TGskMaskMode; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:31:45 ===

function GSK_TYPE_MASK_NODE: TGType;

implementation

function GSK_TYPE_MASK_NODE: TGType;
begin
  GSK_TYPE_MASK_NODE := gsk_mask_node_get_type;
end;



end.
