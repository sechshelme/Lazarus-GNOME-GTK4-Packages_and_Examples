
unit gsrvtarget;
interface

{
  Automatically converted by H2Pas 1.0.0 from gsrvtarget.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gsrvtarget.h
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
PGList  = ^GList;
PGSrvTarget  = ^GSrvTarget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Red Hat, Inc.
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
  }
{$ifndef __G_SRV_TARGET_H__}
{$define __G_SRV_TARGET_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

function g_srv_target_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function G_TYPE_SRV_TARGET : longint; { return type might be wrong }

(* Const before type ignored *)
function g_srv_target_new(hostname:Pgchar; port:Tguint16; priority:Tguint16; weight:Tguint16):PGSrvTarget;cdecl;external;
function g_srv_target_copy(target:PGSrvTarget):PGSrvTarget;cdecl;external;
procedure g_srv_target_free(target:PGSrvTarget);cdecl;external;
(* Const before type ignored *)
function g_srv_target_get_hostname(target:PGSrvTarget):Pgchar;cdecl;external;
function g_srv_target_get_port(target:PGSrvTarget):Tguint16;cdecl;external;
function g_srv_target_get_priority(target:PGSrvTarget):Tguint16;cdecl;external;
function g_srv_target_get_weight(target:PGSrvTarget):Tguint16;cdecl;external;
function g_srv_target_list_sort(targets:PGList):PGList;cdecl;external;
{$endif}
{ __G_SRV_TARGET_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_SRV_TARGET : longint; { return type might be wrong }
  begin
    G_TYPE_SRV_TARGET:=g_srv_target_get_type;
  end;


end.
