
unit ges_title_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_title_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_title_source.h
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
PGESTitleSource  = ^GESTitleSource;
PGESTitleSourceClass  = ^GESTitleSourceClass;
PGESTitleSourcePrivate  = ^GESTitleSourcePrivate;
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

{ was #define dname def_expr }
function GES_TYPE_TITLE_SOURCE : longint; { return type might be wrong }

{GES_DECLARE_TYPE (TitleSource, title_source, TITLE_SOURCE); }
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

(* Const before type ignored *)

procedure ges_title_source_set_text(self:PGESTitleSource; text:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure ges_title_source_set_font_desc(self:PGESTitleSource; font_desc:Pgchar);cdecl;external;
procedure ges_title_source_set_halignment(self:PGESTitleSource; halign:TGESTextHAlign);cdecl;external;
procedure ges_title_source_set_valignment(self:PGESTitleSource; valign:TGESTextVAlign);cdecl;external;
procedure ges_title_source_set_text_color(self:PGESTitleSource; color:Tguint32);cdecl;external;
procedure ges_title_source_set_background_color(self:PGESTitleSource; color:Tguint32);cdecl;external;
procedure ges_title_source_set_xpos(self:PGESTitleSource; position:Tgdouble);cdecl;external;
procedure ges_title_source_set_ypos(self:PGESTitleSource; position:Tgdouble);cdecl;external;
(* Const before type ignored *)
function ges_title_source_get_text(source:PGESTitleSource):Pgchar;cdecl;external;
(* Const before type ignored *)
function ges_title_source_get_font_desc(source:PGESTitleSource):Pgchar;cdecl;external;
function ges_title_source_get_halignment(source:PGESTitleSource):TGESTextHAlign;cdecl;external;
function ges_title_source_get_valignment(source:PGESTitleSource):TGESTextVAlign;cdecl;external;
(* Const before type ignored *)
function ges_title_source_get_text_color(source:PGESTitleSource):Tguint32;cdecl;external;
(* Const before type ignored *)
function ges_title_source_get_background_color(source:PGESTitleSource):Tguint32;cdecl;external;
(* Const before type ignored *)
function ges_title_source_get_xpos(source:PGESTitleSource):Tgdouble;cdecl;external;
(* Const before type ignored *)
function ges_title_source_get_ypos(source:PGESTitleSource):Tgdouble;cdecl;external;

implementation

{ was #define dname def_expr }
function GES_TYPE_TITLE_SOURCE : longint; { return type might be wrong }
  begin
    GES_TYPE_TITLE_SOURCE:=ges_title_source_get_type;
  end;


end.
