
unit convolution;
interface

{
  Automatically converted by H2Pas 1.0.0 from convolution.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    convolution.h
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
PVipsCombine  = ^VipsCombine;
PVipsImage  = ^VipsImage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ convolution.h
 *
 * 20/9/09
 * 	- from proto.h
  }
{

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef VIPS_CONVOLUTION_H}
{$define VIPS_CONVOLUTION_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
type
  PVipsCombine = ^TVipsCombine;
  TVipsCombine =  Longint;
  Const
    VIPS_COMBINE_MAX = 0;
    VIPS_COMBINE_SUM = 1;
    VIPS_COMBINE_MIN = 2;
    VIPS_COMBINE_LAST = 3;
;

function vips_conv(in:PVipsImage; out:PPVipsImage; mask:PVipsImage; args:array of const):longint;cdecl;external;
function vips_conv(in:PVipsImage; out:PPVipsImage; mask:PVipsImage):longint;cdecl;external;
function vips_convf(in:PVipsImage; out:PPVipsImage; mask:PVipsImage; args:array of const):longint;cdecl;external;
function vips_convf(in:PVipsImage; out:PPVipsImage; mask:PVipsImage):longint;cdecl;external;
function vips_convi(in:PVipsImage; out:PPVipsImage; mask:PVipsImage; args:array of const):longint;cdecl;external;
function vips_convi(in:PVipsImage; out:PPVipsImage; mask:PVipsImage):longint;cdecl;external;
function vips_conva(in:PVipsImage; out:PPVipsImage; mask:PVipsImage; args:array of const):longint;cdecl;external;
function vips_conva(in:PVipsImage; out:PPVipsImage; mask:PVipsImage):longint;cdecl;external;
function vips_convsep(in:PVipsImage; out:PPVipsImage; mask:PVipsImage; args:array of const):longint;cdecl;external;
function vips_convsep(in:PVipsImage; out:PPVipsImage; mask:PVipsImage):longint;cdecl;external;
function vips_convasep(in:PVipsImage; out:PPVipsImage; mask:PVipsImage; args:array of const):longint;cdecl;external;
function vips_convasep(in:PVipsImage; out:PPVipsImage; mask:PVipsImage):longint;cdecl;external;
function vips_compass(in:PVipsImage; out:PPVipsImage; mask:PVipsImage; args:array of const):longint;cdecl;external;
function vips_compass(in:PVipsImage; out:PPVipsImage; mask:PVipsImage):longint;cdecl;external;
function vips_gaussblur(in:PVipsImage; out:PPVipsImage; sigma:Tdouble; args:array of const):longint;cdecl;external;
function vips_gaussblur(in:PVipsImage; out:PPVipsImage; sigma:Tdouble):longint;cdecl;external;
function vips_sharpen(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_sharpen(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_spcor(in:PVipsImage; ref:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_spcor(in:PVipsImage; ref:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_fastcor(in:PVipsImage; ref:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_fastcor(in:PVipsImage; ref:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_sobel(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_sobel(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_scharr(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_scharr(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_prewitt(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_prewitt(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_canny(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_canny(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_CONVOLUTION_H }

implementation


end.
