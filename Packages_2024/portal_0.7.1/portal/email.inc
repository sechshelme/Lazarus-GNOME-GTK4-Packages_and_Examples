{$IFDEF read_interface}


type
  PXdpEmailFlags = ^TXdpEmailFlags;
  TXdpEmailFlags = longint;

const
  XDP_EMAIL_FLAG_NONE = 0;

procedure xdp_portal_compose_email(portal: PXdpPortal; parent: PXdpParent; addresses: PPchar; cc: PPchar; bcc: PPchar;
  subject: pchar; body: pchar; attachments: PPchar; flags: TXdpEmailFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_compose_email_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:34:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
