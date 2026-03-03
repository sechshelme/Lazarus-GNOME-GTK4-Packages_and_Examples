unit lsmmathmllayoututils;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2008 Emmanuel Pacaud
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
{$ifndef LSM_MATHML_LAYOUT_UTILS_H}
{$define LSM_MATHML_LAYOUT_UTILS_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlview.h>}

procedure lsm_mathml_measure_sub_sup(parent:PLsmMathmlElement; view:PLsmMathmlView; base:PLsmMathmlElement; subscript:PLsmMathmlElement; superscript:PLsmMathmlElement; 
            subscript_offset_min:Tdouble; superscript_offset_min:Tdouble; display:TLsmMathmlDisplay; stretch_bbox:PLsmMathmlBbox; bbox:PLsmMathmlBbox; 
            subscript_offset:Pdouble; superscript_offset:Pdouble);cdecl;external liblasem;
procedure lsm_mathml_layout_sub_sup(parent:PLsmMathmlElement; view:PLsmMathmlView; x:Tdouble; y:Tdouble; base:PLsmMathmlElement; 
            subscript:PLsmMathmlElement; superscript:PLsmMathmlElement; subscript_offset:Tdouble; superscript_offset:Tdouble);cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:45:39 ===


implementation



end.
