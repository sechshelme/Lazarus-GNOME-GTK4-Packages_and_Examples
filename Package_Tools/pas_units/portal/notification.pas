unit notification;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXdpNotificationFlags = ^TXdpNotificationFlags;
  TXdpNotificationFlags = longint;

const
  XDP_NOTIFICATION_FLAG_NONE = 0;

procedure xdp_portal_add_notification(portal: PXdpPortal; id: pchar; notification: PGVariant; flags: TXdpNotificationFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_add_notification_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;
procedure xdp_portal_remove_notification(portal: PXdpPortal; id: pchar); cdecl; external libportal;

// === Konventiert am: 29-8-25 15:35:00 ===


implementation



end.
