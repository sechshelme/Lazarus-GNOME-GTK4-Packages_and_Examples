unit remote;

interface

uses
  fp_glib2, fp_portal, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PXdpOutputType = ^TXdpOutputType;
  TXdpOutputType = longint;

const
  XDP_OUTPUT_NONE = 0;
  XDP_OUTPUT_MONITOR = 1 shl 0;
  XDP_OUTPUT_WINDOW = 1 shl 1;
  XDP_OUTPUT_VIRTUAL = 1 shl 2;

type
  PXdpDeviceType = ^TXdpDeviceType;
  TXdpDeviceType = longint;

const
  XDP_DEVICE_NONE = 0;
  XDP_DEVICE_KEYBOARD = 1 shl 0;
  XDP_DEVICE_POINTER = 1 shl 1;
  XDP_DEVICE_TOUCHSCREEN = 1 shl 2;

type
  PXdpSessionType = ^TXdpSessionType;
  TXdpSessionType = longint;

const
  XDP_SESSION_SCREENCAST = 0;
  XDP_SESSION_REMOTE_DESKTOP = 1;

type
  PXdpSessionState = ^TXdpSessionState;
  TXdpSessionState = longint;

const
  XDP_SESSION_INITIAL = 0;
  XDP_SESSION_ACTIVE = 1;
  XDP_SESSION_CLOSED = 2;

type
  PXdpScreencastFlags = ^TXdpScreencastFlags;
  TXdpScreencastFlags = longint;

const
  XDP_SCREENCAST_FLAG_NONE = 0;
  XDP_SCREENCAST_FLAG_MULTIPLE = 1 shl 0;

type
  PXdpCursorMode = ^TXdpCursorMode;
  TXdpCursorMode = longint;

const
  XDP_CURSOR_MODE_HIDDEN = 1 shl 0;
  XDP_CURSOR_MODE_EMBEDDED = 1 shl 1;
  XDP_CURSOR_MODE_METADATA = 1 shl 2;

type
  PXdpPersistMode = ^TXdpPersistMode;
  TXdpPersistMode = longint;

const
  XDP_PERSIST_MODE_NONE = 0;
  XDP_PERSIST_MODE_TRANSIENT = 1;
  XDP_PERSIST_MODE_PERSISTENT = 2;

type
  TXdpSession = record
  end;
  PXdpSession = ^TXdpSession;

  TXdpSessionClass = record
    parent_class: TGObjectClass;
  end;
  PXdpSessionClass = ^TXdpSessionClass;

function xdp_session_get_type: TGType; cdecl; external libportal;
procedure xdp_portal_create_screencast_session(portal: PXdpPortal; outputs: TXdpOutputType; flags: TXdpScreencastFlags; cursor_mode: TXdpCursorMode; persist_mode: TXdpPersistMode;
  restore_token: pchar; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_create_screencast_session_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): PXdpSession; cdecl; external libportal;

type
  PXdpRemoteDesktopFlags = ^TXdpRemoteDesktopFlags;
  TXdpRemoteDesktopFlags = longint;

const
  XDP_REMOTE_DESKTOP_FLAG_NONE = 0;
  XDP_REMOTE_DESKTOP_FLAG_MULTIPLE = 1 shl 0;

procedure xdp_portal_create_remote_desktop_session(portal: PXdpPortal; devices: TXdpDeviceType; outputs: TXdpOutputType; flags: TXdpRemoteDesktopFlags; cursor_mode: TXdpCursorMode;
  cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_portal_create_remote_desktop_session_finish(portal: PXdpPortal; result: PGAsyncResult; error: PPGError): PXdpSession; cdecl; external libportal;
procedure xdp_session_start(session: PXdpSession; parent: PXdpParent; cancellable: PGCancellable; callback: TGAsyncReadyCallback; data: Tgpointer); cdecl; external libportal;
function xdp_session_start_finish(session: PXdpSession; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libportal;
procedure xdp_session_close(session: PXdpSession); cdecl; external libportal;
function xdp_session_open_pipewire_remote(session: PXdpSession): longint; cdecl; external libportal;
function xdp_session_get_session_type(session: PXdpSession): TXdpSessionType; cdecl; external libportal;
function xdp_session_get_session_state(session: PXdpSession): TXdpSessionState; cdecl; external libportal;
function xdp_session_get_devices(session: PXdpSession): TXdpDeviceType; cdecl; external libportal;
function xdp_session_get_streams(session: PXdpSession): PGVariant; cdecl; external libportal;
function xdp_session_connect_to_eis(session: PXdpSession; error: PPGError): longint; cdecl; external libportal;
procedure xdp_session_pointer_motion(session: PXdpSession; dx: Tdouble; dy: Tdouble); cdecl; external libportal;
procedure xdp_session_pointer_position(session: PXdpSession; stream: Tguint; x: Tdouble; y: Tdouble); cdecl; external libportal;

type
  PXdpButtonState = ^TXdpButtonState;
  TXdpButtonState = longint;

const
  XDP_BUTTON_RELEASED = 0;
  XDP_BUTTON_PRESSED = 1;

procedure xdp_session_pointer_button(session: PXdpSession; button: longint; state: TXdpButtonState); cdecl; external libportal;
procedure xdp_session_pointer_axis(session: PXdpSession; finish: Tgboolean; dx: Tdouble; dy: Tdouble); cdecl; external libportal;

type
  PXdpDiscreteAxis = ^TXdpDiscreteAxis;
  TXdpDiscreteAxis = longint;

const
  XDP_AXIS_HORIZONTAL_SCROLL = 0;
  XDP_AXIS_VERTICAL_SCROLL = 1;

procedure xdp_session_pointer_axis_discrete(session: PXdpSession; axis: TXdpDiscreteAxis; steps: longint); cdecl; external libportal;

type
  PXdpKeyState = ^TXdpKeyState;
  TXdpKeyState = longint;

const
  XDP_KEY_RELEASED = 0;
  XDP_KEY_PRESSED = 1;

procedure xdp_session_keyboard_key(session: PXdpSession; keysym: Tgboolean; key: longint; state: TXdpKeyState); cdecl; external libportal;
procedure xdp_session_touch_down(session: PXdpSession; stream: Tguint; slot: Tguint; x: Tdouble; y: Tdouble); cdecl; external libportal;
procedure xdp_session_touch_position(session: PXdpSession; stream: Tguint; slot: Tguint; x: Tdouble; y: Tdouble); cdecl; external libportal;
procedure xdp_session_touch_up(session: PXdpSession; slot: Tguint); cdecl; external libportal;
function xdp_session_get_persist_mode(session: PXdpSession): TXdpPersistMode; cdecl; external libportal;
function xdp_session_get_restore_token(session: PXdpSession): pchar; cdecl; external libportal;

// === Konventiert am: 29-8-25 15:36:42 ===

function XDP_TYPE_SESSION: TGType;
function XDP_SESSION(obj: Pointer): PXdpSession;
function XDP_IS_SESSION(obj: Pointer): Tgboolean;

implementation

function XDP_TYPE_SESSION: TGType;
begin
  Result := xdp_session_get_type;
end;

function XDP_SESSION(obj: Pointer): PXdpSession;
begin
  Result := PXdpSession(g_type_check_instance_cast(obj, XDP_TYPE_SESSION));
end;

function XDP_IS_SESSION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, XDP_TYPE_SESSION);
end;


end.
