{$IFDEF read_interface}


type
  PXdpPrintFlags = ^TXdpPrintFlags;
  TXdpPrintFlags = longint;

const
  XDP_PRINT_FLAG_NONE = 0;

procedure xdp_portal_prepare_print(portal: PXdpPortal; parent: PXdpParent; title: pchar; settings: PGVariant; page_setup: PGVariant;
  flags: TXdpPrintFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_prepare_print_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): PGVariant; cdecl; external libportal;
procedure xdp_portal_print_file(portal: PXdpPortal; parent: PXdpParent; title: pchar; token: Tguint; file_: pchar;
  flags: TXdpPrintFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_print_file_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:36:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
