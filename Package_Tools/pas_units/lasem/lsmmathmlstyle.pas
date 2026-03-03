unit lsmmathmlstyle;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2009 Emmanuel Pacaud
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
{$ifndef LSM_MATHML_STYLE_H}
{$define LSM_MATHML_STYLE_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlattributes.h>}

function lsm_mathml_style_get_type:TGType;cdecl;external liblasem;
{ mstyle  }
{ tokens  }
{ mfrac  }
{ msubsup  }
{ mfrac  }
type
  PLsmMathmlStyle = ^TLsmMathmlStyle;
  TLsmMathmlStyle = record
      display : TLsmMathmlDisplay;
      script_level : longint;
      script_size_multiplier : Tdouble;
      script_min_size : Tdouble;
      negative_very_very_thin_math_space : Tdouble;
      negative_very_thin_math_space : Tdouble;
      negative_thin_math_space : Tdouble;
      negative_medium_math_space : Tdouble;
      negative_thick_math_space : Tdouble;
      negative_very_thick_math_space : Tdouble;
      negative_very_very_thick_math_space : Tdouble;
      very_very_thin_math_space : Tdouble;
      very_thin_math_space : Tdouble;
      thin_math_space : Tdouble;
      medium_math_space : Tdouble;
      thick_math_space : Tdouble;
      very_thick_math_space : Tdouble;
      very_very_thick_math_space : Tdouble;
      math_family : Pchar;
      math_variant : TLsmMathmlVariant;
      math_size : Tdouble;
      math_color : TLsmMathmlColor;
      math_background : TLsmMathmlColor;
      bevelled : Tgboolean;
      subscript_shift : Tdouble;
      superscript_shift : Tdouble;
      line_thickness : Tdouble;
    end;


function lsm_mathml_style_new:PLsmMathmlStyle;cdecl;external liblasem;
procedure lsm_mathml_style_free(style:PLsmMathmlStyle);cdecl;external liblasem;
function lsm_mathml_style_duplicate(from:PLsmMathmlStyle):PLsmMathmlStyle;cdecl;external liblasem;
procedure lsm_mathml_style_change_script_level(style:PLsmMathmlStyle; increment:longint);cdecl;external liblasem;
procedure lsm_mathml_style_set_math_size_pt(style:PLsmMathmlStyle; math_size:Tdouble);cdecl;external liblasem;
procedure lsm_mathml_style_set_script_min_size_pt(style:PLsmMathmlStyle; script_min_size:Tdouble);cdecl;external liblasem;
procedure lsm_mathml_style_set_math_family(style:PLsmMathmlStyle; math_family:Pchar);cdecl;external liblasem;
procedure lsm_mathml_style_set_math_variant(style:PLsmMathmlStyle; math_variant:TLsmMathmlVariant);cdecl;external liblasem;
procedure lsm_mathml_style_set_math_color(style:PLsmMathmlStyle; red:Tdouble; green:Tdouble; blue:Tdouble; alpha:Tdouble);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:49:38 ===

function LSM_TYPE_MATHML_STYLE : TGType;

implementation

function LSM_TYPE_MATHML_STYLE : TGType;
  begin
    LSM_TYPE_MATHML_STYLE:=lsm_mathml_style_get_type;
  end;



end.
