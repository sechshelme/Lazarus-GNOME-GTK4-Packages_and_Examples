unit camera;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function xdp_portal_is_camera_present(portal: PXdpPortal): Tgboolean; cdecl; external libportal;

type
  PXdpCameraFlags = ^TXdpCameraFlags;
  TXdpCameraFlags = longint;

const
  XDP_CAMERA_FLAG_NONE = 0;

procedure xdp_portal_access_camera(portal: PXdpPortal; parent: PXdpParent; flags: TXdpCameraFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  data: Tgpointer); cdecl; external libportal;
function xdp_portal_access_camera_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;
function xdp_portal_open_pipewire_remote_for_camera(portal: PXdpPortal): longint; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:34:27 ===


implementation



end.
