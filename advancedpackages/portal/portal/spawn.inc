{$IFDEF read_interface}


type
  PXdpSpawnFlags = ^TXdpSpawnFlags;
  TXdpSpawnFlags = longint;

const
  XDP_SPAWN_FLAG_NONE = 0;
  XDP_SPAWN_FLAG_CLEARENV = 1 shl 0;
  XDP_SPAWN_FLAG_LATEST = 1 shl 1;
  XDP_SPAWN_FLAG_SANDBOX = 1 shl 2;
  XDP_SPAWN_FLAG_NO_NETWORK = 1 shl 3;
  XDP_SPAWN_FLAG_WATCH = 1 shl 4;

procedure xdp_portal_spawn(portal: PXdpPortal; cwd: pchar; argv: PPchar; fds: Plongint; map_to: Plongint;
  n_fds: longint; env: PPchar; flags: TXdpSpawnFlags; sandbox_expose: PPchar; sandbox_expose_ro: PPchar;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_spawn_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tpid_t; cdecl; external libportal;
procedure xdp_portal_spawn_signal(portal: PXdpPortal; pid: Tpid_t; signal: longint; to_process_group: Tgboolean); cdecl; external libportal;

// === Konventiert am: 29-8-25 15:37:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
