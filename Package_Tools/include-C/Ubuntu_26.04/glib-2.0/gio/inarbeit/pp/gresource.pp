
unit gresource;
interface

{
  Automatically converted by H2Pas 1.0.0 from gresource.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gresource.h
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
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PGResource  = ^GResource;
Pgsize  = ^gsize;
PGStaticResource  = ^GStaticResource;
Pguint32  = ^guint32;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2006-2007 Red Hat, Inc.
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
 * Author: Alexander Larsson <alexl@redhat.com>
  }
{$ifndef __G_RESOURCE_H__}
{$define __G_RESOURCE_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}
{*
 * G_TYPE_RESOURCE:
 *
 * The #GType for #GResource.
  }

{ was #define dname def_expr }
function G_TYPE_RESOURCE : longint; { return type might be wrong }

{*
 * G_RESOURCE_ERROR:
 *
 * Error domain for #GResource. Errors in this domain will be from the
 * #GResourceError enumeration. See #GError for more information on
 * error domains.
  }
{ was #define dname def_expr }
function G_RESOURCE_ERROR : longint; { return type might be wrong }

function g_resource_error_quark:TGQuark;cdecl;external;
type
{< private > }
(* Const before type ignored *)
  PGStaticResource = ^TGStaticResource;
  TGStaticResource = record
      data : Pguint8;
      data_len : Tgsize;
      resource : PGResource;
      next : PGStaticResource;
      padding : Tgpointer;
    end;


function g_resource_get_type:TGType;cdecl;external;
function g_resource_new_from_data(data:PGBytes; error:PPGError):PGResource;cdecl;external;
function g_resource_ref(resource:PGResource):PGResource;cdecl;external;
procedure g_resource_unref(resource:PGResource);cdecl;external;
(* Const before type ignored *)
function g_resource_load(filename:Pgchar; error:PPGError):PGResource;cdecl;external;
(* Const before type ignored *)
function g_resource_open_stream(resource:PGResource; path:Pchar; lookup_flags:TGResourceLookupFlags; error:PPGError):PGInputStream;cdecl;external;
(* Const before type ignored *)
function g_resource_lookup_data(resource:PGResource; path:Pchar; lookup_flags:TGResourceLookupFlags; error:PPGError):PGBytes;cdecl;external;
(* Const before type ignored *)
function g_resource_enumerate_children(resource:PGResource; path:Pchar; lookup_flags:TGResourceLookupFlags; error:PPGError):^Pchar;cdecl;external;
(* Const before type ignored *)
function g_resource_get_info(resource:PGResource; path:Pchar; lookup_flags:TGResourceLookupFlags; size:Pgsize; flags:Pguint32; 
           error:PPGError):Tgboolean;cdecl;external;
procedure g_resources_register(resource:PGResource);cdecl;external;
procedure g_resources_unregister(resource:PGResource);cdecl;external;
(* Const before type ignored *)
function g_resources_open_stream(path:Pchar; lookup_flags:TGResourceLookupFlags; error:PPGError):PGInputStream;cdecl;external;
(* Const before type ignored *)
function g_resources_lookup_data(path:Pchar; lookup_flags:TGResourceLookupFlags; error:PPGError):PGBytes;cdecl;external;
(* Const before type ignored *)
function g_resources_enumerate_children(path:Pchar; lookup_flags:TGResourceLookupFlags; error:PPGError):^Pchar;cdecl;external;
(* Const before type ignored *)
function g_resources_get_info(path:Pchar; lookup_flags:TGResourceLookupFlags; size:Pgsize; flags:Pguint32; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_resource_has_children(resource:PGResource; path:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_resources_has_children(path:Pchar):Tgboolean;cdecl;external;
procedure g_static_resource_init(static_resource:PGStaticResource);cdecl;external;
procedure g_static_resource_fini(static_resource:PGStaticResource);cdecl;external;
function g_static_resource_get_resource(static_resource:PGStaticResource):PGResource;cdecl;external;
{$endif}
{ __G_RESOURCE_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_RESOURCE : longint; { return type might be wrong }
  begin
    G_TYPE_RESOURCE:=g_resource_get_type;
  end;

{ was #define dname def_expr }
function G_RESOURCE_ERROR : longint; { return type might be wrong }
  begin
    G_RESOURCE_ERROR:=g_resource_error_quark;
  end;


end.
