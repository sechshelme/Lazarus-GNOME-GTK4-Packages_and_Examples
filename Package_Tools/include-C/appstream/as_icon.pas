unit as_icon;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2015-2024 Matthias Klumpp <matthias@tenstral.net>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 2.1 of the license, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
  }
{$if !defined(__APPSTREAM_H) && !defined(AS_COMPILATION)}
{$error "Only <appstream.h> can be included directly."}
{$endif}
{$ifndef __AS_ICON_H}
{$define __AS_ICON_H}
{$include <glib-object.h>}

{G_DECLARE_DERIVABLE_TYPE (AsIcon, as_icon, AS, ICON, GObject) }
{< private > }
type
  PAsIconClass = ^TAsIconClass;
  TAsIconClass = record
      parent_class : TGObjectClass;
      _as_reserved1 : procedure ;cdecl;
      _as_reserved2 : procedure ;cdecl;
      _as_reserved3 : procedure ;cdecl;
      _as_reserved4 : procedure ;cdecl;
      _as_reserved5 : procedure ;cdecl;
      _as_reserved6 : procedure ;cdecl;
    end;

{*
 * AsIconKind:
 * @AS_ICON_KIND_UNKNOWN:	Unknown icon kind
 * @AS_ICON_KIND_STOCK:		Stock icon name
 * @AS_ICON_KIND_CACHED:	Icon in the internal caches
 * @AS_ICON_KIND_LOCAL:		Local icon name
 * @AS_ICON_KIND_REMOTE:	Remote icon URL
 *
 * The icon type.
 * }
{< private > }

  PAsIconKind = ^TAsIconKind;
  TAsIconKind =  Longint;
  Const
    AS_ICON_KIND_UNKNOWN = 0;
    AS_ICON_KIND_STOCK = 1;
    AS_ICON_KIND_CACHED = 2;
    AS_ICON_KIND_LOCAL = 3;
    AS_ICON_KIND_REMOTE = 4;
    AS_ICON_KIND_LAST = 5;
;

function as_icon_kind_from_string(kind_str:Pgchar):TAsIconKind;cdecl;external libappstream;
function as_icon_kind_to_string(kind:TAsIconKind):Pgchar;cdecl;external libappstream;
function as_icon_new:PAsIcon;cdecl;external libappstream;
function as_icon_get_kind(icon:PAsIcon):TAsIconKind;cdecl;external libappstream;
procedure as_icon_set_kind(icon:PAsIcon; kind:TAsIconKind);cdecl;external libappstream;
function as_icon_get_name(icon:PAsIcon):Pgchar;cdecl;external libappstream;
procedure as_icon_set_name(icon:PAsIcon; name:Pgchar);cdecl;external libappstream;
function as_icon_get_url(icon:PAsIcon):Pgchar;cdecl;external libappstream;
procedure as_icon_set_url(icon:PAsIcon; url:Pgchar);cdecl;external libappstream;
function as_icon_get_filename(icon:PAsIcon):Pgchar;cdecl;external libappstream;
procedure as_icon_set_filename(icon:PAsIcon; filename:Pgchar);cdecl;external libappstream;
function as_icon_get_width(icon:PAsIcon):Tguint;cdecl;external libappstream;
procedure as_icon_set_width(icon:PAsIcon; width:Tguint);cdecl;external libappstream;
function as_icon_get_height(icon:PAsIcon):Tguint;cdecl;external libappstream;
procedure as_icon_set_height(icon:PAsIcon; height:Tguint);cdecl;external libappstream;
function as_icon_get_scale(icon:PAsIcon):Tguint;cdecl;external libappstream;
procedure as_icon_set_scale(icon:PAsIcon; scale:Tguint);cdecl;external libappstream;
{$endif}
{ __AS_ICON_H  }

// === Konventiert am: 30-7-26 19:36:00 ===

function AS_TYPE_ICON: TGType;
function AS_ICON(obj: Pointer): PAsIcon;
function AS_IS_ICON(obj: Pointer): Tgboolean;
function AS_ICON_CLASS(klass: Pointer): PAsIconClass;
function AS_IS_ICON_CLASS(klass: Pointer): Tgboolean;
function AS_ICON_GET_CLASS(obj: Pointer): PAsIconClass;

implementation

function AS_TYPE_ICON: TGType;
begin
  Result := as_icon_get_type;
end;

function AS_ICON(obj: Pointer): PAsIcon;
begin
  Result := PAsIcon(g_type_check_instance_cast(obj, AS_TYPE_ICON));
end;

function AS_IS_ICON(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_ICON);
end;

function AS_ICON_CLASS(klass: Pointer): PAsIconClass;
begin
  Result := PAsIconClass(g_type_check_class_cast(klass, AS_TYPE_ICON));
end;

function AS_IS_ICON_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_ICON);
end;

function AS_ICON_GET_CLASS(obj: Pointer): PAsIconClass;
begin
  Result := PAsIconClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAsIcon = record
    parent_instance: TGObject;
  end;
  PAsIcon = ^TAsIcon;

  PAsIconClass = type Pointer;

function as_icon_get_type: TGType; cdecl; external libgxxxxxxx;



end.
