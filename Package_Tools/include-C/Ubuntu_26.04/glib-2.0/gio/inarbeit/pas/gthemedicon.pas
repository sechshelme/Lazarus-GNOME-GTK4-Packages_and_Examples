unit gthemedicon;

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
{$ifndef __G_THEMED_ICON_H__}
{$define __G_THEMED_ICON_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

type

function g_themed_icon_get_type:TGType;cdecl;external libgio2;
function g_themed_icon_new(iconname:Pchar):PGIcon;cdecl;external libgio2;
function g_themed_icon_new_with_default_fallbacks(iconname:Pchar):PGIcon;cdecl;external libgio2;
function g_themed_icon_new_from_names(iconnames:PPchar; len:longint):PGIcon;cdecl;external libgio2;
procedure g_themed_icon_prepend_name(icon:PGThemedIcon; iconname:Pchar);cdecl;external libgio2;
procedure g_themed_icon_append_name(icon:PGThemedIcon; iconname:Pchar);cdecl;external libgio2;
function g_themed_icon_get_names(icon:PGThemedIcon):^Pgchar;cdecl;external libgio2;
{$endif}
{ __G_THEMED_ICON_H__  }

// === Konventiert am: 26-6-26 19:59:23 ===

function G_TYPE_THEMED_ICON : TGType;
function G_THEMED_ICON(obj : Pointer) : PGThemedIcon;
function G_THEMED_ICON_CLASS(klass : Pointer) : PGThemedIconClass;
function G_IS_THEMED_ICON(obj : Pointer) : Tgboolean;
function G_IS_THEMED_ICON_CLASS(klass : Pointer) : Tgboolean;
function G_THEMED_ICON_GET_CLASS(obj : Pointer) : PGThemedIconClass;

implementation

function G_TYPE_THEMED_ICON : TGType;
  begin
    G_TYPE_THEMED_ICON:=g_themed_icon_get_type;
  end;

function G_THEMED_ICON(obj : Pointer) : PGThemedIcon;
begin
  Result := PGThemedIcon(g_type_check_instance_cast(obj, G_TYPE_THEMED_ICON));
end;

function G_THEMED_ICON_CLASS(klass : Pointer) : PGThemedIconClass;
begin
  Result := PGThemedIconClass(g_type_check_class_cast(klass, G_TYPE_THEMED_ICON));
end;

function G_IS_THEMED_ICON(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_THEMED_ICON);
end;

function G_IS_THEMED_ICON_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_THEMED_ICON);
end;

function G_THEMED_ICON_GET_CLASS(obj : Pointer) : PGThemedIconClass;
begin
  Result := PGThemedIconClass(PGTypeInstance(obj)^.g_class);
end;



end.
