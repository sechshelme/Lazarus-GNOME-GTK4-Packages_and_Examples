
unit ibusshare;
interface

{
  Automatically converted by H2Pas 1.0.0 from ibusshare.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ibusshare.h
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
Pgchar  = ^gchar;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-basic-offset: 4; indent-tabs-mode: nil; -*-  }
{ vim:set et sts=4:  }
{ ibus - The Input Bus
 * Copyright (C) 2008-2013 Peng Huang <shawn.p.huang@gmail.com>
 * Copyright (C) 2015-2022 Takao Fujiwara <takao.fujiwara1@gmail.com>
 * Copyright (C) 2008-2022 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301
 * USA
  }
{$if !defined (__IBUS_H_INSIDE__) && !defined (IBUS_COMPILATION)}
{$error "Only <ibus.h> can be included directly"}
{$endif}
{$ifndef __IBUS_SHARE_H_}
{$define __IBUS_SHARE_H_}
{*
 * SECTION: ibusshare
 * @short_description: Shared utility functions and definition.
 * @stability: Stable
 *
 * This file defines some utility functions and definition
 * which are shared among ibus component and services.
  }
{$include <glib.h>}
{$ifdef IBUS_DISABLE_DEPRECATION_WARNINGS}
{$define IBUS_DEPRECATED}
{$else}

const
  IBUS_DEPRECATED = G_DEPRECATED;  
{$endif}
{*
 * IBUS_SERVICE_IBUS:
 *
 * Address of IBus service.
  }

const
  IBUS_SERVICE_IBUS = 'org.freedesktop.IBus';  
{*
 * IBUS_SERVICE_PORTAL:
 *
 * Address of IBus portalservice.
  }
  IBUS_SERVICE_PORTAL = 'org.freedesktop.portal.IBus';  
{*
 * IBUS_SERVICE_PANEL:
 *
 * Address of IBus panel service.
  }
  IBUS_SERVICE_PANEL = 'org.freedesktop.IBus.Panel';  
{*
 * IBUS_SERVICE_PANEL_EXTENSION:
 *
 * Address of IBus panel extension service.
  }
  IBUS_SERVICE_PANEL_EXTENSION = 'org.freedesktop.IBus.Panel.Extension';  
{*
 * IBUS_SERVICE_PANEL_EXTENSION_EMOJI:
 *
 * Address of IBus panel extension service for emoji.
 * This service provides emoji, Unicode code point, Unicode name features.
  }
  IBUS_SERVICE_PANEL_EXTENSION_EMOJI = 'org.freedesktop.IBus.Panel.Extension.Emoji';  
{*
 * IBUS_SERVICE_CONFIG:
 *
 * Address of IBus config service.
  }
  IBUS_SERVICE_CONFIG = 'org.freedesktop.IBus.Config';  
{*
 * IBUS_SERVICE_NOTIFICATIONS:
 *
 * Address of IBus notification service.
  }
  IBUS_SERVICE_NOTIFICATIONS = 'org.freedesktop.IBus.Notifications';  
{*
 * IBUS_PATH_IBUS:
 *
 * D-Bus path for IBus
  }
  IBUS_PATH_IBUS = '/org/freedesktop/IBus';  
{*
 * IBUS_PATH_FACTORY:
 *
 * D-Bus path for IBus factory.
  }
  IBUS_PATH_FACTORY = '/org/freedesktop/IBus/Factory';  
{*
 * IBUS_PATH_PANEL:
 *
 * D-Bus path for IBus panel.
  }
  IBUS_PATH_PANEL = '/org/freedesktop/IBus/Panel';  
{*
 * IBUS_PATH_PANEL_EXTENSION_EMOJI:
 *
 * D-Bus path for IBus extension panel for emoji.
 * This service provides emoji, Unicode code point, Unicode name features.
  }
  IBUS_PATH_PANEL_EXTENSION_EMOJI = '/org/freedesktop/IBus/Panel/Extension/Emoji';  
{*
 * IBUS_PATH_CONFIG:
 *
 * D-Bus path for IBus config.
  }
  IBUS_PATH_CONFIG = '/org/freedesktop/IBus/Config';  
{*
 * IBUS_PATH_NOTIFICATIONS:
 *
 * D-Bus path for IBus notifications.
  }
  IBUS_PATH_NOTIFICATIONS = '/org/freedesktop/IBus/Notifications';  
{*
 * IBUS_PATH_INPUT_CONTEXT:
 *
 * Template of D-Bus path for IBus input context.
  }
  IBUS_PATH_INPUT_CONTEXT = '/org/freedesktop/IBus/InputContext_%d';  
{*
 * IBUS_INTERFACE_IBUS:
 *
 * D-Bus interface for IBus.
  }
  IBUS_INTERFACE_IBUS = 'org.freedesktop.IBus';  
{*
 * IBUS_INTERFACE_PORTAL:
 *
 * D-Bus interface for IBus portal.
  }
  IBUS_INTERFACE_PORTAL = 'org.freedesktop.IBus.Portal';  
{*
 * IBUS_INTERFACE_INPUT_CONTEXT:
 *
 * D-Bus interface for IBus input context.
  }
  IBUS_INTERFACE_INPUT_CONTEXT = 'org.freedesktop.IBus.InputContext';  
{*
 * IBUS_INTERFACE_FACTORY:
 *
 * D-Bus interface for IBus factory.
  }
  IBUS_INTERFACE_FACTORY = 'org.freedesktop.IBus.Factory';  
{*
 * IBUS_INTERFACE_ENGINE:
 *
 * D-Bus interface for IBus engine.
  }
  IBUS_INTERFACE_ENGINE = 'org.freedesktop.IBus.Engine';  
{*
 * IBUS_INTERFACE_PANEL:
 *
 * D-Bus interface for IBus panel.
  }
  IBUS_INTERFACE_PANEL = 'org.freedesktop.IBus.Panel';  
{*
 * IBUS_INTERFACE_CONFIG:
 *
 * D-Bus interface for IBus config.
  }
  IBUS_INTERFACE_CONFIG = 'org.freedesktop.IBus.Config';  
{*
 * IBUS_INTERFACE_NOTIFICATIONS:
 *
 * D-Bus interface for IBus notifications.
  }
  IBUS_INTERFACE_NOTIFICATIONS = 'org.freedesktop.IBus.Notifications';  
{*
 * ibus_get_local_machine_id:
 *
 * Obtains the machine UUID of the machine this process is running on.
 *
 * Returns: A newly allocated string that shows the UUID of the machine.
  }
(* Const before type ignored *)

function ibus_get_local_machine_id:Pgchar;cdecl;external;
{*
 * ibus_set_display:
 * @display: Display address, as in DISPLAY environment for X.
 *
 * Set the display address.
  }
(* Const before type ignored *)
procedure ibus_set_display(display:Pgchar);cdecl;external;
{*
 * ibus_get_address:
 *
 * Return the D-Bus address of IBus.
 * It will find the address from following source:
 * <orderedlist>
 *    <listitem><para>Environment variable IBUS_ADDRESS</para></listitem>
 *    <listitem><para>Socket file under ~/.config/ibus/bus/</para></listitem>
 * </orderedlist>
 *
 * Returns: D-Bus address of IBus. %NULL for not found.
 *
 * See also: ibus_write_address().
  }
(* Const before type ignored *)
function ibus_get_address:Pgchar;cdecl;external;
{*
 * ibus_write_address:
 * @address: D-Bus address of IBus.
 *
 * Write D-Bus address to socket file.
 *
 * See also: ibus_get_address().
  }
(* Const before type ignored *)
procedure ibus_write_address(address:Pgchar);cdecl;external;
{*
 * ibus_get_user_name:
 *
 * Get the current user name.
 * It is determined by:
 * <orderedlist>
 *    <listitem><para>getlogin()</para></listitem>
 *    <listitem><para>Environment variable SUDO_USER</para></listitem>
 *    <listitem><para>Environment variable USERHELPER_UID</para></listitem>
 *    <listitem><para>Environment variable USERNAME</para></listitem>
 *    <listitem><para>Environment variable LOGNAME</para></listitem>
 *    <listitem><para>Environment variable USER</para></listitem>
 *    <listitem><para>Environment variable LNAME</para></listitem>
 * </orderedlist>
 *
 * Returns: A newly allocated string that stores current user name.
  }
(* Const before type ignored *)
function ibus_get_user_name:Pgchar;cdecl;external;
{*
 * ibus_get_daemon_uid:
 *
 * Get UID of ibus-daemon.
 *
 * Returns: UID of ibus-daemon; or 0 if UID is not available.
 *
 * Deprecated: This function has been deprecated and should
 * not be used in newly written code.
  }
{G_GNUC_DEPRECATED }function ibus_get_daemon_uid:Tglong;cdecl;external;
{*
 * ibus_get_socket_path:
 *
 * Get the path of socket file.
 *
 * Returns: A newly allocated string that stores the path of socket file.
  }
(* Const before type ignored *)
function ibus_get_socket_path:Pgchar;cdecl;external;
{*
 * ibus_get_timeout:
 *
 * Get the GDBus timeout in milliseconds. The timeout is for clients (e.g.
 * im-ibus.so), not for ibus-daemon.
 * Note that the timeout for ibus-daemon could be set by --timeout command
 * line option of the daemon.
 *
 * Returns: A GDBus timeout in milliseconds. -1 when default timeout for
 *     GDBus should be used.
  }
function ibus_get_timeout:Tgint;cdecl;external;
{*
 * ibus_free_strv:
 * @strv: List of strings.
 *
 * Free a list of strings.
 * Deprecated: This function has been deprecated and should
 * not be used in newly written code.
  }
{G_GNUC_DEPRECATED }procedure ibus_free_strv(strv:PPgchar);cdecl;external;
{*
 * ibus_key_event_to_string:
 * @keyval: Key symbol.
 * @modifiers: Modifiers such as Ctrl or Shift.
 *
 * Return the name of a key symbol and modifiers.
 *
 * For example, if press ctrl, shift, and enter, then this function returns:
 * Shift+Control+enter.
 *
 * Returns: The name of a key symbol and modifier.
  }
function ibus_key_event_to_string(keyval:Tguint; modifiers:Tguint):Pgchar;cdecl;external;
{*
 * ibus_key_event_from_string:
 * @string: Key event string.
 * @keyval: (out): Variable that hold key symbol result.
 * @modifiers: (out): Variable that hold modifiers result.
 *
 * Parse key event string and return key symbol and modifiers.
 *
 * Returns: %TRUE for succeed; %FALSE if failed.
  }
(* Const before type ignored *)
function ibus_key_event_from_string(_string:Pgchar; keyval:Pguint; modifiers:Pguint):Tgboolean;cdecl;external;
{*
 * ibus_init:
 *
 * Initialize the ibus types.
  }
procedure ibus_init;cdecl;external;
{*
 * ibus_main:
 *
 * Runs an IBus main loop until ibus_quit() is called in the loop.
 *
 * See also: ibus_quit().
  }
procedure ibus_main;cdecl;external;
{*
 * ibus_quit:
 *
 * Stops an IBus from running.
 *
 * Any calls to ibus_quit() for the loop will return.
 * See also: ibus_main().
  }
procedure ibus_quit;cdecl;external;
{*
 * ibus_set_log_handler:
 * @verbose: TRUE for verbose logging.
 *
 * Sets GLIB's log handler to ours. Our log handler adds time info
 * including hour, minute, second, and microsecond, like:
 *
 * (ibus-daemon:7088): IBUS-DEBUG: 18:06:45.822819: ibus-daemon started
 *
 * If @verbose is %TRUE, all levels of messages will be logged. Otherwise,
 * DEBUG and WARNING messages will be ignored.  The function is used in
 * ibus-daemon, but can be useful for IBus client programs as well for
 * debugging. It's totally fine for not calling this function. If you
 * don't set a custom GLIB log handler, the default GLIB log handler will
 * be used.
  }
procedure ibus_set_log_handler(verbose:Tgboolean);cdecl;external;
{*
 * ibus_unset_log_handler:
 *
 * Remove the log handler which is set by ibus_set_log_handler.
  }
procedure ibus_unset_log_handler;cdecl;external;
{$endif}

implementation


end.
