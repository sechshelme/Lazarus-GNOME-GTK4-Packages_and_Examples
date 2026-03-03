unit lsmsvglength;

interface

uses
  fp_glib2, fp_lasem;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2009 Emmanuel Pacaud
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
{$ifndef LSM_SVG_LENGTH}
{$define LSM_SVG_LENGTH}
{$include <lsmdom.h>}
{$include <lsmsvgtypes.h>}
{$include <lsmsvgenums.h>}
type
  PLsmSvgViewbox = ^TLsmSvgViewbox;
  TLsmSvgViewbox = record
      resolution_ppi : Tdouble;
      viewbox : TLsmBox;
      diagonal : Tdouble;
    end;

function lsm_svg_viewbox_new(resolution_ppi:Tdouble; viewbox:PLsmBox):PLsmSvgViewbox;cdecl;external liblasem;
procedure lsm_svg_viewbox_free(viewbox:PLsmSvgViewbox);cdecl;external liblasem;
type
  PLsmSvgLength = ^TLsmSvgLength;
  TLsmSvgLength = record
      value_unit : Tdouble;
      _type : TLsmSvgLengthType;
    end;

  PLsmSvgAnimatedLength = ^TLsmSvgAnimatedLength;
  TLsmSvgAnimatedLength = record
      base : TLsmSvgLength;
      animated : TLsmSvgLength;
    end;

function lsm_svg_length_normalize(length:PLsmSvgLength; viewbox:PLsmSvgViewbox; font_size:Tdouble; direction:TLsmSvgLengthDirection):Tdouble;cdecl;external liblasem;
function lsm_svg_parse_length(str:PPchar; length:PLsmSvgLength):Tgboolean;cdecl;external liblasem;
type
  PLsmSvgLengthList = ^TLsmSvgLengthList;
  TLsmSvgLengthList = record
      n_lengths : dword;
      lengths : PLsmSvgLength;
    end;
{$endif}

// === Konventiert am: 3-3-26 17:05:05 ===


implementation



end.
