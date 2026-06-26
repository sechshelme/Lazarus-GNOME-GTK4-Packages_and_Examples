
unit gdebugcontroller;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdebugcontroller.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdebugcontroller.h
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
PGDebugController  = ^GDebugController;
PGDebugControllerInterface  = ^GDebugControllerInterface;
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

{ was #define dname def_expr }
function G_TYPE_DEBUG_CONTROLLER : longint; { return type might be wrong }

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


function g_debug_controller_get_debug_enabled(self:PGDebugController):Tgboolean;cdecl;external;
procedure g_debug_controller_set_debug_enabled(self:PGDebugController; debug_enabled:Tgboolean);cdecl;external;
{$endif}
{ __G_DEBUG_CONTROLLER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_DEBUG_CONTROLLER : longint; { return type might be wrong }
  begin
    G_TYPE_DEBUG_CONTROLLER:=g_debug_controller_get_type;
  end;


end.
