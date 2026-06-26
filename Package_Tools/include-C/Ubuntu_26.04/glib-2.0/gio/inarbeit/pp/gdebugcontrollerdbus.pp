
unit gdebugcontrollerdbus;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdebugcontrollerdbus.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdebugcontrollerdbus.h
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
PGCancellable  = ^GCancellable;
PGDBusConnection  = ^GDBusConnection;
PGDBusMethodInvocation  = ^GDBusMethodInvocation;
PGDebugControllerDBus  = ^GDebugControllerDBus;
PGDebugControllerDBusClass  = ^GDebugControllerDBusClass;
PGError  = ^GError;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright © 2021 Endless OS Foundation, LLC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
{$ifndef __G_DEBUG_CONTROLLER_DBUS_H__}
{$define __G_DEBUG_CONTROLLER_DBUS_H__}
{$include <glib.h>}
{$include <glib-object.h>}

{ was #define dname def_expr }
function G_TYPE_DEBUG_CONTROLLER_DBUS : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GDebugControllerDBus, g_debug_controller_dbus, G, DEBUG_CONTROLLER_DBUS, GObject) }
{*
 * GDebugControllerDBusClass:
 * @parent_class: The parent class.
 * @authorize: Default handler for the #GDebugControllerDBus::authorize signal.
 *
 * The virtual function table for #GDebugControllerDBus.
 *
 * Since: 2.72
  }
type
  PGDebugControllerDBusClass = ^TGDebugControllerDBusClass;
  TGDebugControllerDBusClass = record
      parent_class : TGObjectClass;
      authorize : function (controller:PGDebugControllerDBus; invocation:PGDBusMethodInvocation):Tgboolean;cdecl;
      padding : array[0..11] of Tgpointer;
    end;


function g_debug_controller_dbus_new(connection:PGDBusConnection; cancellable:PGCancellable; error:PPGError):PGDebugControllerDBus;cdecl;external;
procedure g_debug_controller_dbus_stop(self:PGDebugControllerDBus);cdecl;external;
{$endif}
{ __G_DEBUG_CONTROLLER_DBUS_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DEBUG_CONTROLLER_DBUS : longint; { return type might be wrong }
  begin
    G_TYPE_DEBUG_CONTROLLER_DBUS:=g_debug_controller_dbus_get_type;
  end;


end.
