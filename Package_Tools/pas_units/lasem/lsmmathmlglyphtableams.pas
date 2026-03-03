unit lsmmathmlglyphtableams;

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
{$ifndef LSM_MATHML_GLYPH_TABLE_AMS_H}
{$define LSM_MATHML_GLYPH_TABLE_AMS_H}
{$include <lsmmathmltypes.h>}
{$include <lsmmathmlview.h>}

const
  LSM_MATHML_RADICAL_UTF8 = '\xe2\x88\x9a';  
  LSM_MATHML_RADICAL_ORDER_X_OFFSET = 0.5;  
  LSM_MATHML_RADICAL_ORDER_Y_OFFSET = 0.5;  
  LSM_MATHML_RADICAL_TOP_LINE_WIDTH = 0.05;  
  var
    AMS_table : PLsmMathmlOperatorGlyph;cvar;external liblasem;

function lsm_mathml_glyph_table_find_operator_glyph(text:Pchar):PLsmMathmlOperatorGlyph;cdecl;external liblasem;
function lsm_mathml_glyph_table_get_operator_slant(text:Pchar):Tdouble;cdecl;external liblasem;
{$endif}

// === Konventiert am: 3-3-26 15:45:25 ===


implementation



end.
