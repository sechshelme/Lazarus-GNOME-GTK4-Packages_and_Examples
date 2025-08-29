
unit remote;
interface

{
  Automatically converted by H2Pas 1.0.0 from remote.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    remote.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGVariant  = ^GVariant;
PXdpButtonState  = ^XdpButtonState;
PXdpCursorMode  = ^XdpCursorMode;
PXdpDeviceType  = ^XdpDeviceType;
PXdpDiscreteAxis  = ^XdpDiscreteAxis;
PXdpKeyState  = ^XdpKeyState;
PXdpOutputType  = ^XdpOutputType;
PXdpParent  = ^XdpParent;
PXdpPersistMode  = ^XdpPersistMode;
PXdpPortal  = ^XdpPortal;
PXdpRemoteDesktopFlags  = ^XdpRemoteDesktopFlags;
PXdpScreencastFlags  = ^XdpScreencastFlags;
PXdpSession  = ^XdpSession;
PXdpSessionState  = ^XdpSessionState;
PXdpSessionType  = ^XdpSessionType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018, Matthias Clasen
 *
 * This file is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, version 3.0 of the
 * License.
 *
 * This file is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-3.0-only
  }
(** unsupported pragma#pragma once*)
{$include <libportal/types.h>}

{ was #define dname def_expr }
function XDP_TYPE_SESSION : longint; { return type might be wrong }

{ xxxxxxxxxxx  }
{ G_DECLARE_FINAL_TYPE (XdpSession, xdp_session, XDP, SESSION, GObject) }
{*
 * XdpOutputType:
 * @XDP_OUTPUT_NONE: do not select any output
 * @XDP_OUTPUT_MONITOR: allow selecting monitors
 * @XDP_OUTPUT_WINDOW: allow selecting individual application windows
 * @XDP_OUTPUT_VIRTUAL: allow creating new virtual displays
 *
 * Flags to specify what kind of sources to offer for a screencast session.
  }
type
  PXdpOutputType = ^TXdpOutputType;
  TXdpOutputType =  Longint;
  Const
    XDP_OUTPUT_NONE = 0;
    XDP_OUTPUT_MONITOR = 1 shl 0;
    XDP_OUTPUT_WINDOW = 1 shl 1;
    XDP_OUTPUT_VIRTUAL = 1 shl 2;
;
{*
 * XdpDeviceType:
 * @XDP_DEVICE_NONE: no device
 * @XDP_DEVICE_KEYBOARD: control the keyboard.
 * @XDP_DEVICE_POINTER: control the pointer.
 * @XDP_DEVICE_TOUCHSCREEN: control the touchscreen.
 *
 * Flags to specify what input devices to control for a remote desktop session.
  }
type
  PXdpDeviceType = ^TXdpDeviceType;
  TXdpDeviceType =  Longint;
  Const
    XDP_DEVICE_NONE = 0;
    XDP_DEVICE_KEYBOARD = 1 shl 0;
    XDP_DEVICE_POINTER = 1 shl 1;
    XDP_DEVICE_TOUCHSCREEN = 1 shl 2;
;
{*
 * XdpSessionType:
 * @XDP_SESSION_SCREENCAST: a screencast session.
 * @XDP_SESSION_REMOTE_DESKTOP: a remote desktop session.
 *
 * The type of a session.
  }
type
  PXdpSessionType = ^TXdpSessionType;
  TXdpSessionType =  Longint;
  Const
    XDP_SESSION_SCREENCAST = 0;
    XDP_SESSION_REMOTE_DESKTOP = 1;
;
{*
 * XdpSessionState:
 * @XDP_SESSION_INITIAL: the session has not been started.
 * @XDP_SESSION_ACTIVE: the session is active.
 * @XDP_SESSION_CLOSED: the session is no longer active.
 *
 * The state of a session.
  }
type
  PXdpSessionState = ^TXdpSessionState;
  TXdpSessionState =  Longint;
  Const
    XDP_SESSION_INITIAL = 0;
    XDP_SESSION_ACTIVE = 1;
    XDP_SESSION_CLOSED = 2;
;
{*
 * XdpScreencastFlags:
 * @XDP_SCREENCAST_FLAG_NONE: No options
 * @XDP_SCREENCAST_FLAG_MULTIPLE: allow opening multiple streams
 *
 * Options for starting screen casts.
  }
type
  PXdpScreencastFlags = ^TXdpScreencastFlags;
  TXdpScreencastFlags =  Longint;
  Const
    XDP_SCREENCAST_FLAG_NONE = 0;
    XDP_SCREENCAST_FLAG_MULTIPLE = 1 shl 0;
;
{*
 * XdpCursorMode:
 * @XDP_CURSOR_MODE_HIDDEN: no cursor
 * @XDP_CURSOR_MODE_EMBEDDED: cursor is embedded on the stream
 * @XDP_CURSOR_MODE_METADATA: cursor is sent as metadata of the stream
 *
 * Options for how the cursor is handled.
  }
type
  PXdpCursorMode = ^TXdpCursorMode;
  TXdpCursorMode =  Longint;
  Const
    XDP_CURSOR_MODE_HIDDEN = 1 shl 0;
    XDP_CURSOR_MODE_EMBEDDED = 1 shl 1;
    XDP_CURSOR_MODE_METADATA = 1 shl 2;
;
{*
 * XdpPersistMode:
 * @XDP_PERSIST_MODE_NONE: do not persist
 * @XDP_PERSIST_MODE_TRANSIENT: persist as long as the application is alive
 * @XDP_PERSIST_MODE_PERSISTENT: persist until the user revokes this permission
 *
 * Options for how the screencast session should persist.
  }
type
  PXdpPersistMode = ^TXdpPersistMode;
  TXdpPersistMode =  Longint;
  Const
    XDP_PERSIST_MODE_NONE = 0;
    XDP_PERSIST_MODE_TRANSIENT = 1;
    XDP_PERSIST_MODE_PERSISTENT = 2;
;
(* Const before type ignored *)

procedure xdp_portal_create_screencast_session(portal:PXdpPortal; outputs:TXdpOutputType; flags:TXdpScreencastFlags; cursor_mode:TXdpCursorMode; persist_mode:TXdpPersistMode; 
            restore_token:Pchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_create_screencast_session_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):PXdpSession;cdecl;external;
{*
 * XdpRemoteDesktopFlags:
 * @XDP_REMOTE_DESKTOP_FLAG_NONE: No options
 * @XDP_REMOTE_DESKTOP_FLAG_MULTIPLE: allow opening multiple streams
 *
 * Options for starting remote desktop sessions.
  }
type
  PXdpRemoteDesktopFlags = ^TXdpRemoteDesktopFlags;
  TXdpRemoteDesktopFlags =  Longint;
  Const
    XDP_REMOTE_DESKTOP_FLAG_NONE = 0;
    XDP_REMOTE_DESKTOP_FLAG_MULTIPLE = 1 shl 0;
;

procedure xdp_portal_create_remote_desktop_session(portal:PXdpPortal; devices:TXdpDeviceType; outputs:TXdpOutputType; flags:TXdpRemoteDesktopFlags; cursor_mode:TXdpCursorMode; 
            cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_portal_create_remote_desktop_session_finish(portal:PXdpPortal; result:PGAsyncResult; error:PPGError):PXdpSession;cdecl;external;
procedure xdp_session_start(session:PXdpSession; parent:PXdpParent; cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function xdp_session_start_finish(session:PXdpSession; result:PGAsyncResult; error:PPGError):Tgboolean;cdecl;external;
procedure xdp_session_close(session:PXdpSession);cdecl;external;
function xdp_session_open_pipewire_remote(session:PXdpSession):longint;cdecl;external;
function xdp_session_get_session_type(session:PXdpSession):TXdpSessionType;cdecl;external;
function xdp_session_get_session_state(session:PXdpSession):TXdpSessionState;cdecl;external;
function xdp_session_get_devices(session:PXdpSession):TXdpDeviceType;cdecl;external;
function xdp_session_get_streams(session:PXdpSession):PGVariant;cdecl;external;
function xdp_session_connect_to_eis(session:PXdpSession; error:PPGError):longint;cdecl;external;
procedure xdp_session_pointer_motion(session:PXdpSession; dx:Tdouble; dy:Tdouble);cdecl;external;
procedure xdp_session_pointer_position(session:PXdpSession; stream:Tguint; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * XdpButtonState:
 * @XDP_BUTTON_RELEASED: the button is down
 * @XDP_BUTTON_PRESSED: the button is up
 *
 * The XdpButtonState enumeration is used to describe
 * the state of buttons.
  }
type
  PXdpButtonState = ^TXdpButtonState;
  TXdpButtonState =  Longint;
  Const
    XDP_BUTTON_RELEASED = 0;
    XDP_BUTTON_PRESSED = 1;
;

procedure xdp_session_pointer_button(session:PXdpSession; button:longint; state:TXdpButtonState);cdecl;external;
procedure xdp_session_pointer_axis(session:PXdpSession; finish:Tgboolean; dx:Tdouble; dy:Tdouble);cdecl;external;
{*
 * XdpDiscreteAxis:
 * @XDP_AXIS_HORIZONTAL_SCROLL: the horizontal scroll axis
 * @XDP_AXIS_VERTICAL_SCROLL: the horizontal scroll axis
 *
 * The `XdpDiscreteAxis` enumeration is used to describe
 * the discrete scroll axes.
  }
type
  PXdpDiscreteAxis = ^TXdpDiscreteAxis;
  TXdpDiscreteAxis =  Longint;
  Const
    XDP_AXIS_HORIZONTAL_SCROLL = 0;
    XDP_AXIS_VERTICAL_SCROLL = 1;
;

procedure xdp_session_pointer_axis_discrete(session:PXdpSession; axis:TXdpDiscreteAxis; steps:longint);cdecl;external;
{*
 * XdpKeyState:
 * @XDP_KEY_RELEASED: the key is down
 * @XDP_KEY_PRESSED: the key is up
 *
 * The `XdpKeyState` enumeration is used to describe
 * the state of keys.
  }
type
  PXdpKeyState = ^TXdpKeyState;
  TXdpKeyState =  Longint;
  Const
    XDP_KEY_RELEASED = 0;
    XDP_KEY_PRESSED = 1;
;

procedure xdp_session_keyboard_key(session:PXdpSession; keysym:Tgboolean; key:longint; state:TXdpKeyState);cdecl;external;
procedure xdp_session_touch_down(session:PXdpSession; stream:Tguint; slot:Tguint; x:Tdouble; y:Tdouble);cdecl;external;
procedure xdp_session_touch_position(session:PXdpSession; stream:Tguint; slot:Tguint; x:Tdouble; y:Tdouble);cdecl;external;
procedure xdp_session_touch_up(session:PXdpSession; slot:Tguint);cdecl;external;
function xdp_session_get_persist_mode(session:PXdpSession):TXdpPersistMode;cdecl;external;
function xdp_session_get_restore_token(session:PXdpSession):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function XDP_TYPE_SESSION : longint; { return type might be wrong }
  begin
    XDP_TYPE_SESSION:=xdp_session_get_type;
  end;


end.
