unit ges_title_source;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon.lewis@collabora.co.uk>
 *               2010 Nokia Corporation
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-video-source.h>}

{GES_DECLARE_TYPE(TitleSource, title_source, TITLE_SOURCE); }
{*
 * GESTitleSource:
 *
 * ## Children Properties
 *
 *   libs/GESTitleSource-children-props.md 
  }
{< private > }
{ Padding for API extension  }
type
  PGESTitleSource = ^TGESTitleSource;
  TGESTitleSource = record
      parent : TGESVideoSource;
      priv : PGESTitleSourcePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{*
 * GESTitleSourceClass:
 * @parent_class: parent class
  }
{< private > }
{ Padding for API extension  }
  PGESTitleSourceClass = ^TGESTitleSourceClass;
  TGESTitleSourceClass = record
      parent_class : TGESVideoSourceClass;
      _ges_reserved : array[0..(GES_PADDING-1)-1] of Tgpointer;
    end;


procedure ges_title_source_set_text(self:PGESTitleSource; text:Pgchar);cdecl;external libges;
procedure ges_title_source_set_font_desc(self:PGESTitleSource; font_desc:Pgchar);cdecl;external libges;
procedure ges_title_source_set_halignment(self:PGESTitleSource; halign:TGESTextHAlign);cdecl;external libges;
procedure ges_title_source_set_valignment(self:PGESTitleSource; valign:TGESTextVAlign);cdecl;external libges;
procedure ges_title_source_set_text_color(self:PGESTitleSource; color:Tguint32);cdecl;external libges;
procedure ges_title_source_set_background_color(self:PGESTitleSource; color:Tguint32);cdecl;external libges;
procedure ges_title_source_set_xpos(self:PGESTitleSource; position:Tgdouble);cdecl;external libges;
procedure ges_title_source_set_ypos(self:PGESTitleSource; position:Tgdouble);cdecl;external libges;
function ges_title_source_get_text(source:PGESTitleSource):Pgchar;cdecl;external libges;
function ges_title_source_get_font_desc(source:PGESTitleSource):Pgchar;cdecl;external libges;
function ges_title_source_get_halignment(source:PGESTitleSource):TGESTextHAlign;cdecl;external libges;
function ges_title_source_get_valignment(source:PGESTitleSource):TGESTextVAlign;cdecl;external libges;
function ges_title_source_get_text_color(source:PGESTitleSource):Tguint32;cdecl;external libges;
function ges_title_source_get_background_color(source:PGESTitleSource):Tguint32;cdecl;external libges;
function ges_title_source_get_xpos(source:PGESTitleSource):Tgdouble;cdecl;external libges;
function ges_title_source_get_ypos(source:PGESTitleSource):Tgdouble;cdecl;external libges;

// === Konventiert am: 28-7-26 13:13:20 ===

function GES_TYPE_TITLE_SOURCE: TGType;
function GES_TITLE_SOURCE(obj: Pointer): PGESTitleSource;
function GES_IS_TITLE_SOURCE(obj: Pointer): Tgboolean;
function GES_TITLE_SOURCE_CLASS(klass: Pointer): PGESTitleSourceClass;
function GES_IS_TITLE_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_TITLE_SOURCE_GET_CLASS(obj: Pointer): PGESTitleSourceClass;

implementation

function GES_TYPE_TITLE_SOURCE: TGType;
begin
  Result := ges_title_source_get_type;
end;

function GES_TITLE_SOURCE(obj: Pointer): PGESTitleSource;
begin
  Result := PGESTitleSource(g_type_check_instance_cast(obj, GES_TYPE_TITLE_SOURCE));
end;

function GES_IS_TITLE_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TITLE_SOURCE);
end;

function GES_TITLE_SOURCE_CLASS(klass: Pointer): PGESTitleSourceClass;
begin
  Result := PGESTitleSourceClass(g_type_check_class_cast(klass, GES_TYPE_TITLE_SOURCE));
end;

function GES_IS_TITLE_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TITLE_SOURCE);
end;

function GES_TITLE_SOURCE_GET_CLASS(obj: Pointer): PGESTitleSourceClass;
begin
  Result := PGESTitleSourceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESTitleSourcePrivate = type Pointer

function ges_title_source_get_type: TGType; cdecl; external libgxxxxxxx;



end.
