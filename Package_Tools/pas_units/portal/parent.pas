unit parent;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function xdp_parent_get_type: TGType; cdecl; external libportal;
function xdp_parent_copy(source: PXdpParent): PXdpParent; cdecl; external libportal;
procedure xdp_parent_free(parent: PXdpParent); cdecl; external libportal;

// === Konventiert am: 29-8-25 15:35:12 ===

function XDP_TYPE_PARENT: TGType;

implementation

function XDP_TYPE_PARENT: TGType;
begin
  XDP_TYPE_PARENT := xdp_parent_get_type;
end;



end.
