unit updates;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXdpUpdateStatus = ^TXdpUpdateStatus;
  TXdpUpdateStatus = longint;

const
  XDP_UPDATE_STATUS_RUNNING = 0;
  XDP_UPDATE_STATUS_EMPTY = 1;
  XDP_UPDATE_STATUS_DONE = 2;
  XDP_UPDATE_STATUS_FAILED = 3;

type
  PXdpUpdateMonitorFlags = ^TXdpUpdateMonitorFlags;
  TXdpUpdateMonitorFlags = longint;

const
  XDP_UPDATE_MONITOR_FLAG_NONE = 0;

procedure xdp_portal_update_monitor_start(portal: PXdpPortal; flags: TXdpUpdateMonitorFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_update_monitor_start_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;
procedure xdp_portal_update_monitor_stop(portal: PXdpPortal); cdecl; external libportal;

type
  PXdpUpdateInstallFlags = ^TXdpUpdateInstallFlags;
  TXdpUpdateInstallFlags = longint;

const
  XDP_UPDATE_INSTALL_FLAG_NONE = 0;

procedure xdp_portal_update_install(portal: PXdpPortal; parent: PXdpParent; flags: TXdpUpdateInstallFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  data: Tgpointer); cdecl; external libportal;
function xdp_portal_update_install_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:37:21 ===


implementation



end.
