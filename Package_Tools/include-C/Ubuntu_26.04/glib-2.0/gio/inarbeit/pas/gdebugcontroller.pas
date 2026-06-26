unit gdebugcontroller;

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
{$ifndef __G_DEBUG_CONTROLLER_H__}
{$define __G_DEBUG_CONTROLLER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * G_DEBUG_CONTROLLER_EXTENSION_POINT_NAME:
 *
 * Extension point for debug control functionality.
 * See [Extending GIO](overview.html#extending-gio).
 *
 * Since: 2.72
  }

const
  G_DEBUG_CONTROLLER_EXTENSION_POINT_NAME = 'gio-debug-controller';  

{G_DECLARE_INTERFACE(GDebugController, g_debug_controller, g, debug_controller, GObject) }
{#define G_DEBUG_CONTROLLER(o)               (G_TYPE_CHECK_INSTANCE_CAST ((o), G_TYPE_DEBUG_CONTROLLER, GDebugController)) }
{#define G_IS_DEBUG_CONTROLLER(o)            (G_TYPE_CHECK_INSTANCE_TYPE ((o), G_TYPE_DEBUG_CONTROLLER)) }
{#define G_DEBUG_CONTROLLER_GET_INTERFACE(o) (G_TYPE_INSTANCE_GET_INTERFACE ((o), G_TYPE_DEBUG_CONTROLLER, GDebugControllerInterface)) }
{*
 * GDebugControllerInterface:
 * @g_iface: The parent interface.
 *
 * The virtual function table for #GDebugController.
 *
 * Since: 2.72
  }
{< private > }
type
  PGDebugControllerInterface = ^TGDebugControllerInterface;
  TGDebugControllerInterface = record
      g_iface : TGTypeInterface;
    end;


function g_debug_controller_get_debug_enabled(self:PGDebugController):Tgboolean;cdecl;external libgio2;
procedure g_debug_controller_set_debug_enabled(self:PGDebugController; debug_enabled:Tgboolean);cdecl;external libgio2;
{$endif}
{ __G_DEBUG_CONTROLLER_H__  }

// === Konventiert am: 26-6-26 19:17:58 ===

function g_TYPE_debug_controller: TGType;
function g_debug_controller(obj: Pointer): PGDebugController;
function g_IS_debug_controller(obj: Pointer): Tgboolean;
function g_debug_controller_GET_IFACE(obj: Pointer): PGDebugControllerInterface;

implementation

function g_TYPE_debug_controller: TGType;
begin
  Result := g_debug_controller_get_type;
end;

function g_debug_controller(obj: Pointer): PGDebugController;
begin
  Result := PGDebugController(g_type_check_instance_cast(obj, g_TYPE_debug_controller));
end;

function g_IS_debug_controller(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, g_TYPE_debug_controller);
end;

function g_debug_controller_GET_IFACE(obj: Pointer): PGDebugControllerInterface;
begin
  Result := g_type_interface_peek(obj, g_TYPE_debug_controller);
end;

type 
  TGDebugController = record
  end;
  PGDebugController = ^TGDebugController;

  TGDebugControllerInterface = record
  end;
  PGDebugControllerInterface = ^TGDebugControllerInterface;

function g_debug_controller_get_type: TGType; cdecl; external libgxxxxxxx;



end.
