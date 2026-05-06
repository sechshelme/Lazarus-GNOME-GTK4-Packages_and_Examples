
unit shumate_vector_renderer;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_vector_renderer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_vector_renderer.h
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
PGdkPixbuf  = ^GdkPixbuf;
PGError  = ^GError;
PShumateDataSource  = ^ShumateDataSource;
PShumateStyleError  = ^ShumateStyleError;
PShumateVectorRenderer  = ^ShumateVectorRenderer;
PShumateVectorSpriteSheet  = ^ShumateVectorSpriteSheet;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 James Westman <james@jwestman.net>
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
{$include <shumate/shumate-data-source.h>}
{$include <shumate/shumate-map-source.h>}
{$include <shumate/shumate-vector-sprite-sheet.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_RENDERER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (ShumateVectorRenderer, shumate_vector_renderer, SHUMATE, VECTOR_RENDERER, ShumateMapSource) }
function shumate_vector_renderer_is_supported:Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function shumate_vector_renderer_new(id:Pchar; style_json:Pchar; error:PPGError):PShumateVectorRenderer;cdecl;external;
(* Const before type ignored *)
function shumate_vector_renderer_set_sprite_sheet_data(self:PShumateVectorRenderer; sprites_pixbuf:PGdkPixbuf; sprites_json:Pchar; error:PPGError):Tgboolean;cdecl;external;
function shumate_vector_renderer_get_sprite_sheet(self:PShumateVectorRenderer):PShumateVectorSpriteSheet;cdecl;external;
procedure shumate_vector_renderer_set_sprite_sheet(self:PShumateVectorRenderer; sprites:PShumateVectorSpriteSheet);cdecl;external;
(* Const before type ignored *)
procedure shumate_vector_renderer_set_data_source(self:PShumateVectorRenderer; name:Pchar; data_source:PShumateDataSource);cdecl;external;
{*
 * SHUMATE_STYLE_ERROR:
 *
 * Error domain for errors that may occur when parsing a map style. Errors in
 * this domain will be from the [error@StyleError] enum.
  }
{ was #define dname def_expr }
function SHUMATE_STYLE_ERROR : longint; { return type might be wrong }

function shumate_style_error_quark:TGQuark;cdecl;external;
{*
 * ShumateStyleError:
 * @SHUMATE_STYLE_ERROR_FAILED: An unspecified error occurred during the operation.
 * @SHUMATE_STYLE_ERROR_MALFORMED_STYLE: A JSON node in the style has the wrong type (e.g. an object where there should be an array).
 * @SHUMATE_STYLE_ERROR_UNSUPPORTED_LAYER: An unsupported layer type was encountered.
 * @SHUMATE_STYLE_ERROR_INVALID_EXPRESSION: An invalid or unrecognized expression was encountered.
 * @SHUMATE_STYLE_ERROR_SUPPORT_OMITTED: Libshumate was compiled without vector tile support.
 * @SHUMATE_STYLE_ERROR_UNSUPPORTED: An unsupported style spec feature was encountered.
 *
 * Error codes that occurs while parsing the style in [class@VectorRenderer].
  }
type
  PShumateStyleError = ^TShumateStyleError;
  TShumateStyleError =  Longint;
  Const
    SHUMATE_STYLE_ERROR_FAILED = 0;
    SHUMATE_STYLE_ERROR_MALFORMED_STYLE = 1;
    SHUMATE_STYLE_ERROR_UNSUPPORTED_LAYER = 2;
    SHUMATE_STYLE_ERROR_INVALID_EXPRESSION = 3;
    SHUMATE_STYLE_ERROR_SUPPORT_OMITTED = 4;
    SHUMATE_STYLE_ERROR_UNSUPPORTED = 5;
;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_VECTOR_RENDERER : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_VECTOR_RENDERER:=shumate_vector_renderer_get_type;
  end;

{ was #define dname def_expr }
function SHUMATE_STYLE_ERROR : longint; { return type might be wrong }
  begin
    SHUMATE_STYLE_ERROR:=shumate_style_error_quark;
  end;


end.
