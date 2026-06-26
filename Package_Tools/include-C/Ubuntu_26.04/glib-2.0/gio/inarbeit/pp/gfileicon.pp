
unit gfileicon;
interface

{
  Automatically converted by H2Pas 1.0.0 from gfileicon.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gfileicon.h
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
PGFile  = ^GFile;
PGFileIcon  = ^GFileIcon;
PGIcon  = ^GIcon;
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
{$ifndef __G_FILE_ICON_H__}
{$define __G_FILE_ICON_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_FILE_ICON : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ICON(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ICON_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_ICON(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_ICON_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ICON_GET_CLASS(o : longint) : longint;

type

function g_file_icon_get_type:TGType;cdecl;external;
function g_file_icon_new(file:PGFile):PGIcon;cdecl;external;
function g_file_icon_get_file(icon:PGFileIcon):PGFile;cdecl;external;
{$endif}
{ __G_FILE_ICON_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_FILE_ICON : longint; { return type might be wrong }
  begin
    G_TYPE_FILE_ICON:=g_file_icon_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ICON(o : longint) : longint;
begin
  G_FILE_ICON:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_FILE_ICON,GFileIcon);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ICON_CLASS(k : longint) : longint;
begin
  G_FILE_ICON_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_FILE_ICON,GFileIconClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_ICON(o : longint) : longint;
begin
  G_IS_FILE_ICON:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_FILE_ICON);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_FILE_ICON_CLASS(k : longint) : longint;
begin
  G_IS_FILE_ICON_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_FILE_ICON);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_FILE_ICON_GET_CLASS(o : longint) : longint;
begin
  G_FILE_ICON_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_FILE_ICON,GFileIconClass);
end;


end.
