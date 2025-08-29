unit screenshot;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXdpScreenshotFlags = ^TXdpScreenshotFlags;
  TXdpScreenshotFlags = longint;

const
  XDP_SCREENSHOT_FLAG_NONE = 0;
  XDP_SCREENSHOT_FLAG_INTERACTIVE = 1 shl 0;

procedure xdp_portal_take_screenshot(portal: PXdpPortal; parent: PXdpParent; flags: TXdpScreenshotFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  data: Tgpointer); cdecl; external libportal;
function xdp_portal_take_screenshot_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): pchar; cdecl; external libportal;
procedure xdp_portal_pick_color(portal: PXdpPortal; parent: PXdpParent; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_pick_color_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:37:00 ===


implementation



end.
