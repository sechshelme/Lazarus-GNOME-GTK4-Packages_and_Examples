unit gdebugcontrollerdbus;

interface

uses
  fp_glib2;

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


function g_debug_controller_dbus_new(connection:PGDBusConnection; cancellable:PGCancellable; error:PPGError):PGDebugControllerDBus;cdecl;external libgio2;
procedure g_debug_controller_dbus_stop(self:PGDebugControllerDBus);cdecl;external libgio2;
{$endif}
{ __G_DEBUG_CONTROLLER_DBUS_H__  }

// === Konventiert am: 26-6-26 19:17:49 ===

function G_TYPE_DEBUG_CONTROLLER_DBUS: TGType;
function G_DEBUG_CONTROLLER_DBUS(obj: Pointer): PGDebugControllerDBus;
function G_IS_DEBUG_CONTROLLER_DBUS(obj: Pointer): Tgboolean;
function G_DEBUG_CONTROLLER_DBUS_CLASS(klass: Pointer): PGDebugControllerDBusClass;
function G_IS_DEBUG_CONTROLLER_DBUS_CLASS(klass: Pointer): Tgboolean;
function G_DEBUG_CONTROLLER_DBUS_GET_CLASS(obj: Pointer): PGDebugControllerDBusClass;

implementation

function G_TYPE_DEBUG_CONTROLLER_DBUS: TGType;
begin
  Result := g_debug_controller_dbus_get_type;
end;

function G_DEBUG_CONTROLLER_DBUS(obj: Pointer): PGDebugControllerDBus;
begin
  Result := PGDebugControllerDBus(g_type_check_instance_cast(obj, G_TYPE_DEBUG_CONTROLLER_DBUS));
end;

function G_IS_DEBUG_CONTROLLER_DBUS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_DEBUG_CONTROLLER_DBUS);
end;

function G_DEBUG_CONTROLLER_DBUS_CLASS(klass: Pointer): PGDebugControllerDBusClass;
begin
  Result := PGDebugControllerDBusClass(g_type_check_class_cast(klass, G_TYPE_DEBUG_CONTROLLER_DBUS));
end;

function G_IS_DEBUG_CONTROLLER_DBUS_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_DEBUG_CONTROLLER_DBUS);
end;

function G_DEBUG_CONTROLLER_DBUS_GET_CLASS(obj: Pointer): PGDebugControllerDBusClass;
begin
  Result := PGDebugControllerDBusClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGDebugControllerDBus = record
    parent_instance: TGObject;
  end;
  PGDebugControllerDBus = ^TGDebugControllerDBus;

  TGDebugControllerDBusClass = record
  end;
  PGDebugControllerDBusClass = ^TGDebugControllerDBusClass;

function g_debug_controller_dbus_get_type: TGType; cdecl; external libgxxxxxxx;



end.
