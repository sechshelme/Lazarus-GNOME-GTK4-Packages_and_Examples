unit gskcomponenttransfer;

interface

uses
  fp_glib2, fp_gtk4, gsktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_component_transfer_get_type: TGType; cdecl; external libgtk4;
function gsk_component_transfer_new_identity: PGskComponentTransfer; cdecl; external libgtk4;
function gsk_component_transfer_new_levels(n: single): PGskComponentTransfer; cdecl; external libgtk4;
function gsk_component_transfer_new_linear(m: single; b: single): PGskComponentTransfer; cdecl; external libgtk4;
function gsk_component_transfer_new_gamma(amp: single; exp: single; ofs: single): PGskComponentTransfer; cdecl; external libgtk4;
function gsk_component_transfer_new_discrete(n: Tguint; values: Psingle): PGskComponentTransfer; cdecl; external libgtk4;
function gsk_component_transfer_new_table(n: Tguint; values: Psingle): PGskComponentTransfer; cdecl; external libgtk4;
function gsk_component_transfer_copy(other: PGskComponentTransfer): PGskComponentTransfer; cdecl; external libgtk4;
procedure gsk_component_transfer_free(self: PGskComponentTransfer); cdecl; external libgtk4;
function gsk_component_transfer_equal(self: Tgconstpointer; other: Tgconstpointer): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 4-7-26 20:08:12 ===

function GSK_TYPE_COMPONENT_TRANSFER: TGType;

implementation

function GSK_TYPE_COMPONENT_TRANSFER: TGType;
begin
  GSK_TYPE_COMPONENT_TRANSFER := gsk_component_transfer_get_type;
end;



end.
