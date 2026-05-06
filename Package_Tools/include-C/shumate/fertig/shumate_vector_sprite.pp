
unit shumate_vector_sprite;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_vector_sprite.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_vector_sprite
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
PGdkPaintable  = ^GdkPaintable;
PGdkRectangle  = ^GdkRectangle;
PShumateVectorSprite  = ^ShumateVectorSprite;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022 James Westman <james@jwestman.net>
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
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_SPRITE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE(ShumateVectorSprite, shumate_vector_sprite, SHUMATE, VECTOR_SPRITE, GObject) }
function shumate_vector_sprite_new(source_paintable:PGdkPaintable):PShumateVectorSprite;cdecl;external;
function shumate_vector_sprite_new_full(source_paintable:PGdkPaintable; width:longint; height:longint; scale_factor:Tdouble; source_rect:PGdkRectangle):PShumateVectorSprite;cdecl;external;
function shumate_vector_sprite_get_source_paintable(self:PShumateVectorSprite):PGdkPaintable;cdecl;external;
function shumate_vector_sprite_get_width(self:PShumateVectorSprite):longint;cdecl;external;
function shumate_vector_sprite_get_height(self:PShumateVectorSprite):longint;cdecl;external;
function shumate_vector_sprite_get_scale_factor(self:PShumateVectorSprite):Tdouble;cdecl;external;
function shumate_vector_sprite_get_source_rect(self:PShumateVectorSprite):PGdkRectangle;cdecl;external;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_SPRITE : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_VECTOR_SPRITE:=shumate_vector_sprite_get_type;
  end;


end.
