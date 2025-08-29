unit account;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXdpUserInformationFlags = ^TXdpUserInformationFlags;
  TXdpUserInformationFlags = longint;

const
  XDP_USER_INFORMATION_FLAG_NONE = 0;

procedure xdp_portal_get_user_information(portal: PXdpPortal; parent: PXdpParent; reason: pchar; flags: TXdpUserInformationFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_get_user_information_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:34:16 ===


implementation



end.
