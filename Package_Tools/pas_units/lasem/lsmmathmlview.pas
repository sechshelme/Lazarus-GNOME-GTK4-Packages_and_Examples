unit lsmmathmlview;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2012 Emmanuel Pacaud
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_MATHML_VIEW_H}
{$define LSM_MATHML_VIEW_H}
{$include <lsmdomview.h>}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlutils.h>}
{$include <lsmmathmlelement.h>}
{$include <lsmmathmlpresentationtoken.h>}
type
  PLsmMathmlGlyphFlags = ^TLsmMathmlGlyphFlags;
  TLsmMathmlGlyphFlags =  Longint;
  Const
    LSM_MATHML_GLYPH_FLAG_STRETCH_VERTICAL = 1 shl 0;
    LSM_MATHML_GLYPH_FLAG_STRETCH_HORIZONTAL = 1 shl 1;
    LSM_MATHML_GLYPH_FLAG_TYPE_SIZED = 1 shl 2;
    LSM_MATHML_GLYPH_FLAG_ALIGN_AXIS = 1 shl 3;
    LSM_MATHML_GLYPH_FLAG_HAS_LARGE_VERSION = 1 shl 4;
    LSM_MATHML_GLYPH_FLAG_INTEGRAL_SLANT = 1 shl 5;
;
type
  PLsmMathmlFont = ^TLsmMathmlFont;
  TLsmMathmlFont =  Longint;
  Const
    LSM_MATHML_FONT_ERROR = 0;
    LSM_MATHML_FONT_DEFAULT = 1;
    LSM_MATHML_FONT_CMR10 = 2;
    LSM_MATHML_FONT_CMMI10 = 3;
    LSM_MATHML_FONT_CMEX10 = 4;
    LSM_MATHML_FONT_CMSY10 = 5;
    LSM_MATHML_FONT_SYMBOL = 6;
;
type
  PLsmMathmlGlyph = ^TLsmMathmlGlyph;
  TLsmMathmlGlyph = record
      font : TLsmMathmlFont;
      utf8 : array[0..5] of char;
    end;

  PLsmMathmlOperatorGlyph = ^TLsmMathmlOperatorGlyph;
  TLsmMathmlOperatorGlyph = record
      utf8 : array[0..5] of char;
      flags : TLsmMathmlGlyphFlags;
      start_glyph : TLsmMathmlGlyph;
      middle_glyph : TLsmMathmlGlyph;
      stop_glyph : TLsmMathmlGlyph;
      glue_glyph : TLsmMathmlGlyph;
      n_sized_glyphs : dword;
      sized_glyphs : array[0..4] of TLsmMathmlGlyph;
    end;

type
  PLsmMathmlView = ^TLsmMathmlView;
  TLsmMathmlView = record
      dom_view : TLsmDomView;
    end;

  PLsmMathmlViewClass = ^TLsmMathmlViewClass;
  TLsmMathmlViewClass = record
      dom_view_class : TLsmDomViewClass;
    end;


function lsm_mathml_view_get_type:TGType;cdecl;external liblasem;
function lsm_mathml_view_new(document:PLsmMathmlDocument):PLsmMathmlView;cdecl;external liblasem;
{ Internal API  }
function lsm_mathml_view_measure_axis_offset(view:PLsmMathmlView; math_size:Tdouble):Tdouble;cdecl;external liblasem;
procedure lsm_mathml_view_get_font_metrics(view:PLsmMathmlView; style:PLsmMathmlElementStyle; ascent:Pdouble; descent:Pdouble);cdecl;external liblasem;
procedure lsm_mathml_view_measure_text(view:PLsmMathmlView; style:PLsmMathmlElementStyle; text:Pchar; bbox:PLsmMathmlBbox);cdecl;external liblasem;
procedure lsm_mathml_view_show_text(view:PLsmMathmlView; style:PLsmMathmlElementStyle; x:Tdouble; y:Tdouble; text:Pchar);cdecl;external liblasem;
procedure lsm_mathml_view_measure_operator(view:PLsmMathmlView; style:PLsmMathmlElementStyle; text:Pchar; large:Tgboolean; symmetric:Tgboolean; 
            axis_offset:Tdouble; min_size:Tdouble; max_size:Tdouble; stretch_bbox:PLsmMathmlBbox; bbox:PLsmMathmlBbox);cdecl;external liblasem;
procedure lsm_mathml_view_show_operator(view:PLsmMathmlView; style:PLsmMathmlElementStyle; x:Tdouble; y:Tdouble; text:Pchar; 
            large:Tgboolean; stretch_bbox:PLsmMathmlBbox);cdecl;external liblasem;
function lsm_mathml_view_get_operator_slant(view:PLsmMathmlView; style:PLsmMathmlElementStyle; text:Pchar):Tdouble;cdecl;external liblasem;
procedure lsm_mathml_view_measure_radical(view:PLsmMathmlView; style:PLsmMathmlElementStyle; stretch_bbox:PLsmMathmlBbox; bbox:PLsmMathmlBbox; x_offset:Pdouble; 
            y_offset:Pdouble);cdecl;external liblasem;
procedure lsm_mathml_view_show_radical(view:PLsmMathmlView; style:PLsmMathmlElementStyle; x:Tdouble; y:Tdouble; width:Tdouble; 
            stretch_bbox:PLsmMathmlBbox);cdecl;external liblasem;
procedure lsm_mathml_view_measure_notation(view:PLsmMathmlView; style:PLsmMathmlElementStyle; notation:TLsmMathmlNotation; stretch_bbox:PLsmMathmlBbox; bbox:PLsmMathmlBbox; 
            x_child_offset:Pdouble);cdecl;external liblasem;
procedure lsm_mathml_view_show_notation(view:PLsmMathmlView; style:PLsmMathmlElementStyle; notation:TLsmMathmlNotation; x:Tdouble; y:Tdouble; 
            bbox:PLsmMathmlBbox; x_child_offset:Tdouble);cdecl;external liblasem;
procedure lsm_mathml_view_show_background(view:PLsmMathmlView; style:PLsmMathmlElementStyle; x:Tdouble; y:Tdouble; bbox:PLsmMathmlBbox);cdecl;external liblasem;
procedure lsm_mathml_view_show_rectangle(view:PLsmMathmlView; style:PLsmMathmlElementStyle; x:Tdouble; y:Tdouble; width:Tdouble; 
            height:Tdouble; line:TLsmMathmlLine; line_width:Tdouble);cdecl;external liblasem;
procedure lsm_mathml_view_show_line(view:PLsmMathmlView; style:PLsmMathmlElementStyle; x0:Tdouble; y0:Tdouble; x1:Tdouble; 
            y1:Tdouble; line:TLsmMathmlLine; line_width:Tdouble);cdecl;external liblasem;
procedure lsm_mathml_view_show_fraction_line(view:PLsmMathmlView; style:PLsmMathmlElementStyle; x:Tdouble; y:Tdouble; width:Tdouble; 
            thickness:Tdouble);cdecl;external liblasem;
procedure lsm_mathml_view_show_bbox(view:PLsmMathmlView; x:Tdouble; y:Tdouble; bbox:PLsmMathmlBbox);cdecl;external liblasem;
procedure lsm_mathml_view_draw_root(view:PLsmMathmlView; x:Tdouble; y:Tdouble; width:Tdouble; height:Tdouble; 
            top_width:Tdouble; thickness:Tdouble; color:PLsmMathmlColor);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:53:52 ===

function LSM_TYPE_MATHML_VIEW : TGType;
function LSM_MATHML_VIEW(obj : Pointer) : PLsmMathmlView;
function LSM_MATHML_VIEW_CLASS(klass : Pointer) : PLsmMathmlViewClass;
function LSM_IS_MATHML_VIEW(obj : Pointer) : Tgboolean;
function LSM_IS_MATHML_VIEW_CLASS(klass : Pointer) : Tgboolean;
function LSM_MATHML_VIEW_GET_CLASS(obj : Pointer) : PLsmMathmlViewClass;

implementation

function LSM_TYPE_MATHML_VIEW : TGType;
  begin
    LSM_TYPE_MATHML_VIEW:=lsm_mathml_view_get_type;
  end;

function LSM_MATHML_VIEW(obj : Pointer) : PLsmMathmlView;
begin
  Result := PLsmMathmlView(g_type_check_instance_cast(obj, LSM_TYPE_MATHML_VIEW));
end;

function LSM_MATHML_VIEW_CLASS(klass : Pointer) : PLsmMathmlViewClass;
begin
  Result := PLsmMathmlViewClass(g_type_check_class_cast(klass, LSM_TYPE_MATHML_VIEW));
end;

function LSM_IS_MATHML_VIEW(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  LSM_TYPE_MATHML_VIEW);
end;

function LSM_IS_MATHML_VIEW_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  LSM_TYPE_MATHML_VIEW);
end;

function LSM_MATHML_VIEW_GET_CLASS(obj : Pointer) : PLsmMathmlViewClass;
begin
  Result := PLsmMathmlViewClass(PGTypeInstance(obj)^.g_class);
end;



end.
