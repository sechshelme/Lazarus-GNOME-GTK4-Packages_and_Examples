unit background;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PXdpBackgroundFlags = ^TXdpBackgroundFlags;
  TXdpBackgroundFlags = longint;

const
  XDP_BACKGROUND_FLAG_NONE = 0;
  XDP_BACKGROUND_FLAG_AUTOSTART = 1 shl 0;
  XDP_BACKGROUND_FLAG_ACTIVATABLE = 1 shl 1;

procedure xdp_portal_request_background(portal: PXdpPortal; parent: PXdpParent; reason: pchar; commandline: PGPtrArray; flags: TXdpBackgroundFlags;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libportal;
function xdp_portal_request_background_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;
procedure xdp_portal_set_background_status(portal: PXdpPortal; status_message: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_set_background_status_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:34:22 ===


implementation



end.
