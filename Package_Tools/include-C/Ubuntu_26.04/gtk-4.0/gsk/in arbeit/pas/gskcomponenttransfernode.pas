unit gskcomponenttransfernode;

interface

uses
  fp_glib2, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_component_transfer_node_get_type: TGType; cdecl; external libgtk4;
function gsk_component_transfer_node_new(child: PGskRenderNode; r: PGskComponentTransfer; g: PGskComponentTransfer; b: PGskComponentTransfer; a: PGskComponentTransfer): PGskRenderNode; cdecl; external libgtk4;
function gsk_component_transfer_node_get_child(node: PGskRenderNode): PGskRenderNode; cdecl; external libgtk4;
function gsk_component_transfer_node_get_transfer(node: PGskRenderNode; component: TGdkColorChannel): PGskComponentTransfer; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:08:07 ===

function GSK_TYPE_COMPONENT_TRANSFER_NODE: TGType;

implementation

function GSK_TYPE_COMPONENT_TRANSFER_NODE: TGType;
begin
  GSK_TYPE_COMPONENT_TRANSFER_NODE := gsk_component_transfer_node_get_type;
end;



end.
