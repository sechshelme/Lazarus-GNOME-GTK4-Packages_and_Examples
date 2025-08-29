{$IFDEF read_interface}


type
  PXdpInhibitFlags = ^TXdpInhibitFlags;
  TXdpInhibitFlags = longint;

const
  XDP_INHIBIT_FLAG_LOGOUT = 1 shl 0;
  XDP_INHIBIT_FLAG_USER_SWITCH = 1 shl 1;
  XDP_INHIBIT_FLAG_SUSPEND = 1 shl 2;
  XDP_INHIBIT_FLAG_IDLE = 1 shl 3;

procedure xdp_portal_session_inhibit(portal: PXdpPortal; parent: PXdpParent; reason: pchar; flags: TXdpInhibitFlags; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_session_inhibit_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): longint; cdecl; external libportal;
procedure xdp_portal_session_uninhibit(portal: PXdpPortal; id: longint); cdecl; external libportal;

type
  PXdpLoginSessionState = ^TXdpLoginSessionState;
  TXdpLoginSessionState = longint;

const
  XDP_LOGIN_SESSION_RUNNING = 1;
  XDP_LOGIN_SESSION_QUERY_END = 2;
  XDP_LOGIN_SESSION_ENDING = 3;

type
  PXdpSessionMonitorFlags = ^TXdpSessionMonitorFlags;
  TXdpSessionMonitorFlags = longint;

const
  XDP_SESSION_MONITOR_FLAG_NONE = 0;

procedure xdp_portal_session_monitor_start(portal: PXdpPortal; parent: PXdpParent; flags: TXdpSessionMonitorFlags; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  data: Tgpointer); cdecl; external libportal;
function xdp_portal_session_monitor_start_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;
procedure xdp_portal_session_monitor_stop(portal: PXdpPortal); cdecl; external libportal;
procedure xdp_portal_session_monitor_query_end_response(portal: PXdpPortal); cdecl; external libportal;

// === Konventiert am: 29-8-25 15:34:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
