
unit gdkdmabufformats;
interface

{
  Automatically converted by H2Pas 1.0.0 from gdkdmabufformats.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gdkdmabufformats.h
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
PGdkDmabufFormats  = ^GdkDmabufFormats;
Pguint32  = ^guint32;
Pguint64  = ^guint64;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gdkdmabufformats.h
 *
 * Copyright 2023 Red Hat, Inc.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GDK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gdk/gdk.h> can be included directly."}
{$endif}
{$include <gdk/gdktypes.h>}

{ was #define dname def_expr }
function GDK_TYPE_DMABUF_FORMATS : longint; { return type might be wrong }

function gdk_dmabuf_formats_get_type:TGType;cdecl;external;
function gdk_dmabuf_formats_ref(formats:PGdkDmabufFormats):PGdkDmabufFormats;cdecl;external;
procedure gdk_dmabuf_formats_unref(formats:PGdkDmabufFormats);cdecl;external;
function gdk_dmabuf_formats_get_n_formats(formats:PGdkDmabufFormats):Tgsize;cdecl;external;
procedure gdk_dmabuf_formats_get_format(formats:PGdkDmabufFormats; idx:Tgsize; fourcc:Pguint32; modifier:Pguint64);cdecl;external;
function gdk_dmabuf_formats_contains(formats:PGdkDmabufFormats; fourcc:Tguint32; modifier:Tguint64):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gdk_dmabuf_formats_equal(formats1:PGdkDmabufFormats; formats2:PGdkDmabufFormats):Tgboolean;cdecl;external;
{//G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GdkDmabufFormats, gdk_dmabuf_formats_unref) }

implementation

{ was #define dname def_expr }
function GDK_TYPE_DMABUF_FORMATS : longint; { return type might be wrong }
  begin
    GDK_TYPE_DMABUF_FORMATS:=gdk_dmabuf_formats_get_type;
  end;


end.
