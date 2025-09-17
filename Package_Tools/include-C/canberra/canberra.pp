
unit canberra;
interface

{
  Automatically converted by H2Pas 1.0.0 from canberra.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    canberra.h
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
Pca_context  = ^ca_context;
Pca_proplist  = ^ca_proplist;
Pchar  = ^char;
Plongint  = ^longint;
Pxxxxxxxxxxxx  = ^xxxxxxxxxxxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{-*- Mode: C; c-basic-offset: 8 -*- }
{$ifndef foocanberrahfoo}
{$define foocanberrahfoo}
{**
  This file is part of libcanberra.

  Copyright 2008 Lennart Poettering

  libcanberra is free software; you can redistribute it and/or modify
  it under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation, either version 2.1 of the
  License, or (at your option) any later version.

  libcanberra is distributed in the hope that it will be useful, but
  WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with libcanberra. If not, see
  <http://www.gnu.org/licenses/>.
** }
{$include <sys/types.h>}
{$include <sys/param.h>}
{$include <inttypes.h>}
{ C++ extern C conditionnal removed }
{*
 * CA_MAJOR:
 *
 * Evaluates to the major version number of libcanberra.
  }

const
  CA_MAJOR = 0;  
{*
 * CA_MINOR:
 *
 * Evaluates to the minor version number of libcanberra.
  }
  CA_MINOR = 30;  
{*
 * CA_CHECK_VERSION:
 *
 * Evaluates to TRUE when the library version is newer than the
 * specified parameters.
  }
{ xxxxxxxxx }
{#define CA_CHECK_VERSION(major,minor)                   \ }
{        ((CA_MAJOR > (major)) ||                        \ }
{         (CA_MAJOR == (major) && CA_MINOR >= (minor))) }
{*
 * CA_PROP_MEDIA_NAME:
 *
 * A name describing the media being played. Localized if possible and applicable.
  }
  CA_PROP_MEDIA_NAME = 'media.name';  
{*
 * CA_PROP_MEDIA_TITLE:
 *
 * A (song) title describing the media being played. Localized if possible and applicable.
  }
  CA_PROP_MEDIA_TITLE = 'media.title';  
{*
 * CA_PROP_MEDIA_ARTIST:
 *
 * The artist of this media. Localized if possible and applicable.
  }
  CA_PROP_MEDIA_ARTIST = 'media.artist';  
{*
 * CA_PROP_MEDIA_LANGUAGE:
 *
 * The language this media is in, in some standard POSIX locale string, such as "de_DE".
  }
  CA_PROP_MEDIA_LANGUAGE = 'media.language';  
{*
 * CA_PROP_MEDIA_FILENAME:
 *
 * The file name this media was or can be loaded from.
  }
  CA_PROP_MEDIA_FILENAME = 'media.filename';  
{*
 * CA_PROP_MEDIA_ICON:
 *
 * An icon for this media in binary PNG format.
  }
  CA_PROP_MEDIA_ICON = 'media.icon';  
{*
 * CA_PROP_MEDIA_ICON_NAME:
 *
 * An icon name as defined in the XDG icon naming specifcation.
  }
  CA_PROP_MEDIA_ICON_NAME = 'media.icon_name';  
{*
 * CA_PROP_MEDIA_ROLE:
 *
 * The "role" this media is played in. For event sounds the string
 * "event". For other cases strings like "music", "video", "game", ...
  }
  CA_PROP_MEDIA_ROLE = 'media.role';  
{*
 * CA_PROP_EVENT_ID:
 *
 * A textual id for an event sound, as mandated by the XDG sound naming specification.
  }
  CA_PROP_EVENT_ID = 'event.id';  
{*
 * CA_PROP_EVENT_DESCRIPTION:
 *
 * A descriptive string for the sound event. Localized if possible and applicable.
  }
  CA_PROP_EVENT_DESCRIPTION = 'event.description';  
{*
 * CA_PROP_EVENT_MOUSE_X:
 *
 * If this sound event was triggered by a mouse input event, the X
 * position of the mouse cursor on the screen, formatted as string.
  }
  CA_PROP_EVENT_MOUSE_X = 'event.mouse.x';  
{*
 * CA_PROP_EVENT_MOUSE_Y:
 *
 * If this sound event was triggered by a mouse input event, the Y
 * position of the mouse cursor on the screen, formatted as string.
  }
  CA_PROP_EVENT_MOUSE_Y = 'event.mouse.y';  
{*
 * CA_PROP_EVENT_MOUSE_HPOS:
 *
 * If this sound event was triggered by a mouse input event, the X
 * position of the mouse cursor as fractional value between 0 and 1,
 * formatted as string, 0 reflecting the left side of the screen, 1
 * the right side.
  }
  CA_PROP_EVENT_MOUSE_HPOS = 'event.mouse.hpos';  
{*
 * CA_PROP_EVENT_MOUSE_VPOS:
 *
 * If this sound event was triggered by a mouse input event, the Y
 * position of the mouse cursor as fractional value between 0 and 1,
 * formatted as string, 0 reflecting the top end of the screen, 1
 * the bottom end.
  }
  CA_PROP_EVENT_MOUSE_VPOS = 'event.mouse.vpos';  
{*
 * CA_PROP_EVENT_MOUSE_BUTTON:
 *
 * If this sound event was triggered by a mouse input event, the
 * number of the mouse button that triggered it, formatted as string. 1
 * for left mouse button, 3 for right, 2 for middle.
  }
  CA_PROP_EVENT_MOUSE_BUTTON = 'event.mouse.button';  
{*
 * CA_PROP_WINDOW_NAME:
 *
 * If this sound event was triggered by a window on the screen, the
 * name of this window as human readable string.
  }
  CA_PROP_WINDOW_NAME = 'window.name';  
{*
 * CA_PROP_WINDOW_ID:
 *
 * If this sound event was triggered by a window on the screen, some
 * identification string for this window, so that the sound system can
 * recognize specific windows.
  }
  CA_PROP_WINDOW_ID = 'window.id';  
{*
 * CA_PROP_WINDOW_ICON:
 *
 * If this sound event was triggered by a window on the screen, binary
 * icon data in PNG format for this window.
  }
  CA_PROP_WINDOW_ICON = 'window.icon';  
{*
 * CA_PROP_WINDOW_ICON_NAME:
 *
 * If this sound event was triggered by a window on the screen, an
 * icon name for this window, as defined in the XDG icon naming
 * specification.
  }
  CA_PROP_WINDOW_ICON_NAME = 'window.icon_name';  
{*
 * CA_PROP_WINDOW_X:
 *
 * If this sound event was triggered by a window on the screen, the X
 * position of the window measured from the top left corner of the
 * screen to the top left corner of the window.
 *
 * Since: 0.17
  }
  CA_PROP_WINDOW_X = 'window.x';  
{*
 * CA_PROP_WINDOW_Y:
 *
 * If this sound event was triggered by a window on the screen, the y
 * position of the window measured from the top left corner of the
 * screen to the top left corner of the window.
 *
 * Since: 0.17
  }
  CA_PROP_WINDOW_Y = 'window.y';  
{*
 * CA_PROP_WINDOW_WIDTH:
 *
 * If this sound event was triggered by a window on the screen, the
 * pixel width of the window.
 *
 * Since: 0.17
  }
  CA_PROP_WINDOW_WIDTH = 'window.width';  
{*
 * CA_PROP_WINDOW_HEIGHT:
 *
 * If this sound event was triggered by a window on the screen, the
 * pixel height of the window.
 *
 * Since: 0.17
  }
  CA_PROP_WINDOW_HEIGHT = 'window.height';  
{*
 * CA_PROP_WINDOW_HPOS:
 *
 * If this sound event was triggered by a window on the screen, the X
 * position of the center of the window as fractional value between 0
 * and 1, formatted as string, 0 reflecting the left side of the
 * screen, 1 the right side.
 *
 * Since: 0.17
  }
  CA_PROP_WINDOW_HPOS = 'window.hpos';  
{*
 * CA_PROP_WINDOW_VPOS:
 *
 * If this sound event was triggered by a window on the screen, the Y
 * position of the center of the window as fractional value between 0
 * and 1, formatted as string, 0 reflecting the top side of the
 * screen, 1 the bottom side.
 *
 * Since: 0.17
  }
  CA_PROP_WINDOW_VPOS = 'window.vpos';  
{*
 * CA_PROP_WINDOW_DESKTOP:
 *
 * If this sound event was triggered by a window on the screen and the
 * windowing system supports multiple desktops, a comma seperated list
 * of indexes of the desktops this window is visible on. If this
 * property is an empty string, it is visible on all desktops
 * (i.e. 'sticky'). The first desktop is 0. (e.g. "0,2,3")
 *
 * Since: 0.18
  }
  CA_PROP_WINDOW_DESKTOP = 'window.desktop';  
{*
 * CA_PROP_WINDOW_X11_DISPLAY:
 *
 * If this sound event was triggered by a window on the screen and the
 * windowing system is X11, the X display name of the window (e.g. ":0").
  }
  CA_PROP_WINDOW_X11_DISPLAY = 'window.x11.display';  
{*
 * CA_PROP_WINDOW_X11_SCREEN:
 *
 * If this sound event was triggered by a window on the screen and the
 * windowing system is X11, the X screen id of the window formatted as
 * string (e.g. "0").
  }
  CA_PROP_WINDOW_X11_SCREEN = 'window.x11.screen';  
{*
 * CA_PROP_WINDOW_X11_MONITOR:
 *
 * If this sound event was triggered by a window on the screen and the
 * windowing system is X11, the X monitor id of the window formatted as
 * string (e.g. "0").
  }
  CA_PROP_WINDOW_X11_MONITOR = 'window.x11.monitor';  
{*
 * CA_PROP_WINDOW_X11_XID:
 *
 * If this sound event was triggered by a window on the screen and the
 * windowing system is X11, the XID of the window formatted as string.
  }
  CA_PROP_WINDOW_X11_XID = 'window.x11.xid';  
{*
 * CA_PROP_APPLICATION_NAME:
 *
 * The name of the application this sound event was triggered by as
 * human readable string. (e.g. "GNU Emacs") Localized if possible and
 * applicable.
  }
  CA_PROP_APPLICATION_NAME = 'application.name';  
{*
 * CA_PROP_APPLICATION_ID:
 *
 * An identifier for the program this sound event was triggered
 * by. (e.g. "org.gnu.emacs").
  }
  CA_PROP_APPLICATION_ID = 'application.id';  
{*
 * CA_PROP_APPLICATION_VERSION:
 *
 * A version number for the program this sound event was triggered
 * by. (e.g. "22.2")
  }
  CA_PROP_APPLICATION_VERSION = 'application.version';  
{*
 * CA_PROP_APPLICATION_ICON:
 *
 * Binary icon data in PNG format for the application this sound event
 * is triggered by.
  }
  CA_PROP_APPLICATION_ICON = 'application.icon';  
{*
 * CA_PROP_APPLICATION_ICON_NAME:
 *
 * An icon name for the application this sound event is triggered by,
 * as defined in the XDG icon naming specification.
  }
  CA_PROP_APPLICATION_ICON_NAME = 'application.icon_name';  
{*
 * CA_PROP_APPLICATION_LANGUAGE:
 *
 * The locale string the application that is triggering this sound
 * event is running in. A POSIX locale string such as de_DE@euro.
  }
  CA_PROP_APPLICATION_LANGUAGE = 'application.language';  
{*
 * CA_PROP_APPLICATION_PROCESS_ID:
 *
 * The unix PID of the process that is triggering this sound event, formatted as string.
  }
  CA_PROP_APPLICATION_PROCESS_ID = 'application.process.id';  
{*
 * CA_PROP_APPLICATION_PROCESS_BINARY:
 *
 * The path to the process binary of the process that is triggering this sound event.
  }
  CA_PROP_APPLICATION_PROCESS_BINARY = 'application.process.binary';  
{*
 * CA_PROP_APPLICATION_PROCESS_USER:
 *
 * The user that owns the process that is triggering this sound event.
  }
  CA_PROP_APPLICATION_PROCESS_USER = 'application.process.user';  
{*
 * CA_PROP_APPLICATION_PROCESS_HOST:
 *
 * The host name of the host the process that is triggering this sound event runs on.
  }
  CA_PROP_APPLICATION_PROCESS_HOST = 'application.process.host';  
{*
 * CA_PROP_CANBERRA_CACHE_CONTROL:
 *
 * A special property that can be used to control the automatic sound
 * caching of sounds in the sound server. One of "permanent",
 * "volatile", "never". "permanent" will cause this sample to be
 * cached in the server permanently. This is useful for very
 * frequently used sound events such as those used for input
 * feedback. "volatile" may be used for cacheing sounds in the sound
 * server temporarily. They will expire after some time or on cache
 * pressure. Finally, "never" may be used for sounds that should never
 * be cached, because they are only generated very seldomly or even
 * only once at most (such as desktop login sounds).
 *
 * If this property is not explicitly passed to ca_context_play() it
 * will default to "never". If it is not explicitly passed to
 * ca_context_cache() it will default to "permanent".
 *
 * If the list of properties is handed on to the sound server this
 * property is stripped from it.
  }
  CA_PROP_CANBERRA_CACHE_CONTROL = 'canberra.cache-control';  
{*
 * CA_PROP_CANBERRA_VOLUME:
 *
 * A special property that can be used to control the volume this
 * sound event is played in if the backend supports it. A floating
 * point value for the decibel multiplier for the sound. 0 dB relates
 * to zero gain, and is the default volume these sounds are played in.
 *
 * If the list of properties is handed on to the sound server this
 * property is stripped from it.
  }
  CA_PROP_CANBERRA_VOLUME = 'canberra.volume';  
{*
 * CA_PROP_CANBERRA_XDG_THEME_NAME:
 *
 * A special property that can be used to control the XDG sound theme that
 * is used for this sample.
 *
 * If the list of properties is handed on to the sound server this
 * property is stripped from it.
  }
  CA_PROP_CANBERRA_XDG_THEME_NAME = 'canberra.xdg-theme.name';  
{*
 * CA_PROP_CANBERRA_XDG_THEME_OUTPUT_PROFILE:
 *
 * A special property that can be used to control the XDG sound theme
 * output profile that is used for this sample.
 *
 * If the list of properties is handed on to the sound server this
 * property is stripped from it.
  }
  CA_PROP_CANBERRA_XDG_THEME_OUTPUT_PROFILE = 'canberra.xdg-theme.output-profile';  
{*
 * CA_PROP_CANBERRA_ENABLE:
 *
 * A special property that can be used to control whether any sounds
 * are played at all. If this property is "1" or unset sounds are
 * played as normal. However, if it is "0" all calls to
 * ca_context_play() will fail with CA_ERROR_DISABLED.
 *
 * If the list of properties is handed on to the sound server this
 * property is stripped from it.
  }
  CA_PROP_CANBERRA_ENABLE = 'canberra.enable';  
{*
 * CA_PROP_CANBERRA_FORCE_CHANNEL:
 *
 * A special property that can be used to control on which channel a
 * sound is played. The value should be one of mono, front-left,
 * front-right, front-center, rear-left, rear-right, rear-center, lfe,
 * front-left-of-center, front-right-of-center, side-left, side-right,
 * top-center, top-front-left, top-front-right, top-front-center,
 * top-rear-left, top-rear-right, top-rear-center. This property is
 * only honoured by some backends, other backends may choose to ignore
 * it completely.
 *
 * If the list of properties is handed on to the sound server this
 * property is stripped from it.
 *
 * Since: 0.13
  }
  CA_PROP_CANBERRA_FORCE_CHANNEL = 'canberra.force_channel';  
{*
 * ca_context:
 *
 * A libcanberra context object.
  }
type
{*
 * ca_finish_callback_t:
 * @c: The libcanberra context this callback is called for
 * @id: The numerical id passed to the ca_context_play_full() when starting the event sound playback.
 * @error_code: A numerical error code describing the reason this callback is called. If CA_SUCCESS is passed in the playback of the event sound was successfully completed.
 * @userdata: Some arbitrary user data the caller of ca_context_play_full() passed in.
 *
 * Playback completion event callback. The context this callback is
 * called in is undefined, it might or might not be called from a
 * background thread, and from any stack frame. The code implementing
 * this function may not call any libcanberra API call from this
 * callback -- this might result in a deadlock. Instead it may only be
 * used to asynchronously signal some kind of notification object
 * (semaphore, message queue, ...).
  }

  Tca_finish_callback_t = procedure (c:Pca_context; id:Tuint32_t; error_code:longint; userdata:pointer);cdecl;
{*
 * Error codes:
 * @CA_SUCCESS: Success
 *
 * Error codes
  }
  Txxxxxxxxxxxx =  Longint;
  Const
    CA_SUCCESS = 0;
    CA_ERROR_NOTSUPPORTED = -(1);
    CA_ERROR_INVALID = -(2);
    CA_ERROR_STATE = -(3);
    CA_ERROR_OOM = -(4);
    CA_ERROR_NODRIVER = -(5);
    CA_ERROR_SYSTEM = -(6);
    CA_ERROR_CORRUPT = -(7);
    CA_ERROR_TOOBIG = -(8);
    CA_ERROR_NOTFOUND = -(9);
    CA_ERROR_DESTROYED = -(10);
    CA_ERROR_CANCELED = -(11);
    CA_ERROR_NOTAVAILABLE = -(12);
    CA_ERROR_ACCESS = -(13);
    CA_ERROR_IO = -(14);
    CA_ERROR_INTERNAL = -(15);
    CA_ERROR_DISABLED = -(16);
    CA_ERROR_FORKED = -(17);
    CA_ERROR_DISCONNECTED = -(18);
    _CA_ERROR_MAX = -(19);

{*
 * ca_proplist:
 *
 * A canberra property list object. Basically a hashtable.
  }
type

function ca_proplist_create(p:PPca_proplist):longint;cdecl;external;
function ca_proplist_destroy(p:Pca_proplist):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ca_proplist_sets(p:Pca_proplist; key:Pchar; value:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ca_proplist_setf(p:Pca_proplist; key:Pchar; format:Pchar; args:array of const):longint;cdecl;external;
function ca_proplist_setf(p:Pca_proplist; key:Pchar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function ca_proplist_set(p:Pca_proplist; key:Pchar; data:pointer; nbytes:Tsize_t):longint;cdecl;external;
function ca_context_create(c:PPca_context):longint;cdecl;external;
(* Const before type ignored *)
function ca_context_set_driver(c:Pca_context; driver:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function ca_context_change_device(c:Pca_context; device:Pchar):longint;cdecl;external;
function ca_context_open(c:Pca_context):longint;cdecl;external;
function ca_context_destroy(c:Pca_context):longint;cdecl;external;
function ca_context_change_props(c:Pca_context; args:array of const):longint;cdecl;external;
function ca_context_change_props(c:Pca_context):longint;cdecl;external;
function ca_context_change_props_full(c:Pca_context; p:Pca_proplist):longint;cdecl;external;
function ca_context_play_full(c:Pca_context; id:Tuint32_t; p:Pca_proplist; cb:Tca_finish_callback_t; userdata:pointer):longint;cdecl;external;
function ca_context_play(c:Pca_context; id:Tuint32_t; args:array of const):longint;cdecl;external;
function ca_context_play(c:Pca_context; id:Tuint32_t):longint;cdecl;external;
function ca_context_cache_full(c:Pca_context; p:Pca_proplist):longint;cdecl;external;
function ca_context_cache(c:Pca_context; args:array of const):longint;cdecl;external;
function ca_context_cache(c:Pca_context):longint;cdecl;external;
function ca_context_cancel(c:Pca_context; id:Tuint32_t):longint;cdecl;external;
function ca_context_playing(c:Pca_context; id:Tuint32_t; playing:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function ca_strerror(code:longint):Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
