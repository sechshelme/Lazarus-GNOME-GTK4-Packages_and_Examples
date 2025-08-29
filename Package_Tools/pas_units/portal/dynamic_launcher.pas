unit dynamic_launcher;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXdpLauncherType = ^TXdpLauncherType;
  TXdpLauncherType = longint;

const
  XDP_LAUNCHER_APPLICATION = 1 shl 0;
  XDP_LAUNCHER_WEBAPP = 1 shl 1;

procedure xdp_portal_dynamic_launcher_prepare_install(portal: PXdpPortal; parent: PXdpParent; name: pchar; icon_v: PGVariant; launcher_type: TXdpLauncherType;
  target: pchar; editable_name: Tgboolean; editable_icon: Tgboolean; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  data: Tgpointer); cdecl; external libportal;
function xdp_portal_dynamic_launcher_prepare_install_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libportal;
function xdp_portal_dynamic_launcher_request_install_token(portal: PXdpPortal; name: pchar; icon_v: PGVariant; error: PPGError): pchar; cdecl; external libportal;
function xdp_portal_dynamic_launcher_install(portal: PXdpPortal; token: pchar; desktop_file_id: pchar; desktop_entry: pchar; error: PPGError): Tgboolean; cdecl; external libportal;
function xdp_portal_dynamic_launcher_uninstall(portal: PXdpPortal; desktop_file_id: pchar; error: PPGError): Tgboolean; cdecl; external libportal;
function xdp_portal_dynamic_launcher_get_desktop_entry(portal: PXdpPortal; desktop_file_id: pchar; error: PPGError): pchar; cdecl; external libportal;
function xdp_portal_dynamic_launcher_get_icon(portal: PXdpPortal; desktop_file_id: pchar; out_icon_format: PPchar; out_icon_size: Pguint; error: PPGError): PGVariant; cdecl; external libportal;
function xdp_portal_dynamic_launcher_launch(portal: PXdpPortal; desktop_file_id: pchar; activation_token: pchar; error: PPGError): Tgboolean; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:34:35 ===


implementation



end.
