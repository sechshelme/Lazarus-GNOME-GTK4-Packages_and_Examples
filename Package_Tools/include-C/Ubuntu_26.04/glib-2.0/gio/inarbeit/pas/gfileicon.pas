unit gfileicon;

interface

uses
  fp_glib2;

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

type

function g_file_icon_get_type:TGType;cdecl;external libgio2;
function g_file_icon_new(file:PGFile):PGIcon;cdecl;external libgio2;
function g_file_icon_get_file(icon:PGFileIcon):PGFile;cdecl;external libgio2;
{$endif}
{ __G_FILE_ICON_H__  }

// === Konventiert am: 26-6-26 19:22:07 ===

function G_TYPE_FILE_ICON : TGType;
function G_FILE_ICON(obj : Pointer) : PGFileIcon;
function G_FILE_ICON_CLASS(klass : Pointer) : PGFileIconClass;
function G_IS_FILE_ICON(obj : Pointer) : Tgboolean;
function G_IS_FILE_ICON_CLASS(klass : Pointer) : Tgboolean;
function G_FILE_ICON_GET_CLASS(obj : Pointer) : PGFileIconClass;

implementation

function G_TYPE_FILE_ICON : TGType;
  begin
    G_TYPE_FILE_ICON:=g_file_icon_get_type;
  end;

function G_FILE_ICON(obj : Pointer) : PGFileIcon;
begin
  Result := PGFileIcon(g_type_check_instance_cast(obj, G_TYPE_FILE_ICON));
end;

function G_FILE_ICON_CLASS(klass : Pointer) : PGFileIconClass;
begin
  Result := PGFileIconClass(g_type_check_class_cast(klass, G_TYPE_FILE_ICON));
end;

function G_IS_FILE_ICON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_FILE_ICON);
end;

function G_IS_FILE_ICON_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_FILE_ICON);
end;

function G_FILE_ICON_GET_CLASS(obj : Pointer) : PGFileIconClass;
begin
  Result := PGFileIconClass(PGTypeInstance(obj)^.g_class);
end;



end.
