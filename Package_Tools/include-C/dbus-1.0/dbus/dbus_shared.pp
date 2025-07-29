
unit dbus_shared;
interface

{
  Automatically converted by H2Pas 1.0.0 from dbus_shared.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dbus_shared.h
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
PDBusBusType  = ^DBusBusType;
PDBusHandlerResult  = ^DBusHandlerResult;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-  }
{ dbus-shared.h  Stuff used by both dbus/dbus.h low-level and C/C++ binding APIs
 *
 * Copyright (C) 2004 Red Hat, Inc.
 *
 * Licensed under the Academic Free License version 2.1
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 *
  }
{$ifndef DBUS_SHARED_H}
{$define DBUS_SHARED_H}
{ Don't include anything in here from anywhere else. It's
 * intended for use by any random library.
  }
{ Normally docs are in .c files, but there isn't a .c file for this.  }
{*
 * @defgroup DBusShared Shared constants 
 * @ingroup  DBus
 *
 * @brief Shared header included by both libdbus and C/C++ bindings such as the GLib bindings.
 *
 * Usually a C/C++ binding such as the GLib or Qt binding won't want to include dbus.h in its
 * public headers. However, a few constants and macros may be useful to include; those are
 * found here and in dbus-protocol.h
 *
 * @
  }
{*
 * Well-known bus types. See dbus_bus_get().
  }
{*< The login session bus  }
{*< The systemwide bus  }
{*< The bus that started us, if any  }
type
  PDBusBusType = ^TDBusBusType;
  TDBusBusType =  Longint;
  Const
    DBUS_BUS_SESSION = 0;
    DBUS_BUS_SYSTEM = 1;
    DBUS_BUS_STARTER = 2;
;
{*
 * Results that a message handler can return.
  }
{*< Message has had its effect - no need to run more handlers.  }{*< Message has not had any effect - see if other handlers want it.  }
{*< Need more memory in order to return #DBUS_HANDLER_RESULT_HANDLED or #DBUS_HANDLER_RESULT_NOT_YET_HANDLED. Please try again later with more memory.  }
type
  PDBusHandlerResult = ^TDBusHandlerResult;
  TDBusHandlerResult =  Longint;
  Const
    DBUS_HANDLER_RESULT_HANDLED = 0;
    DBUS_HANDLER_RESULT_NOT_YET_HANDLED = 1;
    DBUS_HANDLER_RESULT_NEED_MEMORY = 2;
;
{ Bus names  }
{* The bus name used to talk to the bus itself.  }
  DBUS_SERVICE_DBUS = 'org.freedesktop.DBus';  
{ Paths  }
{* The object path used to talk to the bus itself.  }
  DBUS_PATH_DBUS = '/org/freedesktop/DBus';  
{* The object path used in local/in-process-generated messages.  }
  DBUS_PATH_LOCAL = '/org/freedesktop/DBus/Local';  
{ Interfaces, these #define don't do much other than
 * catch typos at compile time
  }
{* The interface exported by the object with #DBUS_SERVICE_DBUS and #DBUS_PATH_DBUS  }
  DBUS_INTERFACE_DBUS = 'org.freedesktop.DBus';  
{* The monitoring interface exported by the dbus-daemon  }
  DBUS_INTERFACE_MONITORING = 'org.freedesktop.DBus.Monitoring';  
{* The verbose interface exported by the dbus-daemon  }
  DBUS_INTERFACE_VERBOSE = 'org.freedesktop.DBus.Verbose';  
{* The interface supported by introspectable objects  }
  DBUS_INTERFACE_INTROSPECTABLE = 'org.freedesktop.DBus.Introspectable';  
{* The interface supported by objects with properties  }
  DBUS_INTERFACE_PROPERTIES = 'org.freedesktop.DBus.Properties';  
{* The interface supported by most dbus peers  }
  DBUS_INTERFACE_PEER = 'org.freedesktop.DBus.Peer';  
{* This is a special interface whose methods can only be invoked
 * by the local implementation (messages from remote apps aren't
 * allowed to specify this interface).
  }
  DBUS_INTERFACE_LOCAL = 'org.freedesktop.DBus.Local';  
{ Owner flags  }
{*< Allow another service to become the primary owner if requested  }
  DBUS_NAME_FLAG_ALLOW_REPLACEMENT = $1;  
{*< Request to replace the current primary owner  }
  DBUS_NAME_FLAG_REPLACE_EXISTING = $2;  
{*< If we can not become the primary owner do not place us in the queue  }
  DBUS_NAME_FLAG_DO_NOT_QUEUE = $4;  
{ Replies to request for a name  }
{*< Service has become the primary owner of the requested name  }
  DBUS_REQUEST_NAME_REPLY_PRIMARY_OWNER = 1;  
{*< Service could not become the primary owner and has been placed in the queue  }
  DBUS_REQUEST_NAME_REPLY_IN_QUEUE = 2;  
{*< Service is already in the queue  }
  DBUS_REQUEST_NAME_REPLY_EXISTS = 3;  
{*< Service is already the primary owner  }
  DBUS_REQUEST_NAME_REPLY_ALREADY_OWNER = 4;  
{ Replies to releasing a name  }
{*< Service was released from the given name  }
  DBUS_RELEASE_NAME_REPLY_RELEASED = 1;  
{*< The given name does not exist on the bus  }
  DBUS_RELEASE_NAME_REPLY_NON_EXISTENT = 2;  
{*< Service is not an owner of the given name  }
  DBUS_RELEASE_NAME_REPLY_NOT_OWNER = 3;  
{ Replies to service starts  }
{*< Service was auto started  }
  DBUS_START_REPLY_SUCCESS = 1;  
{*< Service was already running  }
  DBUS_START_REPLY_ALREADY_RUNNING = 2;  
{* @  }
{$endif}
{ DBUS_SHARED_H  }

implementation


end.
