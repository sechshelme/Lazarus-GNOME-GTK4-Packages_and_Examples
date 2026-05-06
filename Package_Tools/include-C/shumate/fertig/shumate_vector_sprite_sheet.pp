
unit shumate_vector_sprite_sheet;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_vector_sprite_sheet.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_vector_sprite_sheet.h
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
PGdkTexture  = ^GdkTexture;
PGError  = ^GError;
PShumateVectorSprite  = ^ShumateVectorSprite;
PShumateVectorSpriteFallbackFunc  = ^ShumateVectorSpriteFallbackFunc;
PShumateVectorSpriteSheet  = ^ShumateVectorSpriteSheet;
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
{$include <gdk/gdk.h>}
{$include <shumate/shumate-vector-sprite.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_SPRITE_SHEET : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateVectorSpriteSheet, shumate_vector_sprite_sheet, SHUMATE, VECTOR_SPRITE_SHEET, GObject) }
function shumate_vector_sprite_sheet_new:PShumateVectorSpriteSheet;cdecl;external;
(* Const before type ignored *)
procedure shumate_vector_sprite_sheet_add_sprite(self:PShumateVectorSpriteSheet; name:Pchar; sprite:PShumateVectorSprite);cdecl;external;
(* Const before type ignored *)
function shumate_vector_sprite_sheet_add_page(self:PShumateVectorSpriteSheet; texture:PGdkTexture; json:Pchar; default_scale:Tdouble; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function shumate_vector_sprite_sheet_get_sprite(self:PShumateVectorSpriteSheet; name:Pchar; scale:Tdouble):PShumateVectorSprite;cdecl;external;
{ xxxxxxxxxxxxxxxxxxx }
(* Const before type ignored *)
type
  PShumateVectorSpriteFallbackFunc = ^TShumateVectorSpriteFallbackFunc;
  TShumateVectorSpriteFallbackFunc = function (sprite_sheet:PShumateVectorSpriteSheet; name:Pchar; scale:Tdouble; user_data:Tgpointer):PShumateVectorSprite;cdecl;

procedure shumate_vector_sprite_sheet_set_fallback(self:PShumateVectorSpriteSheet; fallback:TShumateVectorSpriteFallbackFunc; user_data:Tgpointer; notify:TGDestroyNotify);cdecl;external;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_SPRITE_SHEET : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_VECTOR_SPRITE_SHEET:=shumate_vector_sprite_sheet_get_type;
  end;


end.
