{$IFDEF read_interface}


type
  PXdpOpenUriFlags = ^TXdpOpenUriFlags;
  TXdpOpenUriFlags = longint;

const
  XDP_OPEN_URI_FLAG_NONE = 0;
  XDP_OPEN_URI_FLAG_ASK = 1 shl 0;
  XDP_OPEN_URI_FLAG_WRITABLE = 1 shl 1;

procedure xdp_portal_open_uri(portal: PXdpPortal; parent: PXdpParent; uri: pchar; flags: TXdpOpenUriFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_open_uri_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;
procedure xdp_portal_open_directory(portal: PXdpPortal; parent: PXdpParent; uri: pchar; flags: TXdpOpenUriFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_open_directory_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:35:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
