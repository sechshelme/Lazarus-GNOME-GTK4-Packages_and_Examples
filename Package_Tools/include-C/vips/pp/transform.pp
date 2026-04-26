
unit transform;
interface

{
  Automatically converted by H2Pas 1.0.0 from transform.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    transform.h
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
Pdouble  = ^double;
PVipsImage  = ^VipsImage;
PVipsRect  = ^VipsRect;
PVipsTransformation  = ^VipsTransformation;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Affine transforms.
  }
{

	Copyright (C) 1991-2003 The National Gallery

	This program is free software; you can redistribute it and/or modify
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
{$ifndef VIPS_TRANSFORM_H}
{$define VIPS_TRANSFORM_H}
{$include <glib.h>}
{$include <vips/image.h>}
{$include <vips/rect.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ Params for an affine transformation.
  }
{ Area of input we can use. This can be smaller than the real input
	 * image: we expand the input to add extra pixels for interpolation.
	  }
{ The area of the output we've been asked to generate. left/top can
	 * be negative.
	  }
{ The transform.
	  }
{ Inverse of matrix abcd  }
type
  PVipsTransformation = ^TVipsTransformation;
  TVipsTransformation = record
      iarea : TVipsRect;
      oarea : TVipsRect;
      a : Tdouble;
      b : Tdouble;
      c : Tdouble;
      d : Tdouble;
      idx : Tdouble;
      idy : Tdouble;
      odx : Tdouble;
      ody : Tdouble;
      ia : Tdouble;
      ib : Tdouble;
      ic : Tdouble;
      id : Tdouble;
    end;

procedure vips__transform_init(trn:PVipsTransformation);cdecl;external;
function vips__transform_calc_inverse(trn:PVipsTransformation):longint;cdecl;external;
(* Const before type ignored *)
function vips__transform_isidentity(trn:PVipsTransformation):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips__transform_add(in1:PVipsTransformation; in2:PVipsTransformation; out:PVipsTransformation):longint;cdecl;external;
(* Const before type ignored *)
procedure vips__transform_print(trn:PVipsTransformation);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips__transform_forward_point(trn:PVipsTransformation; x:Tdouble; y:Tdouble; ox:Pdouble; oy:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips__transform_invert_point(trn:PVipsTransformation; x:Tdouble; y:Tdouble; ox:Pdouble; oy:Pdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips__transform_forward_rect(trn:PVipsTransformation; in:PVipsRect; out:PVipsRect);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips__transform_invert_rect(trn:PVipsTransformation; in:PVipsRect; out:PVipsRect);cdecl;external;
procedure vips__transform_set_area(para1:PVipsTransformation);cdecl;external;
function vips__affine(in:PVipsImage; out:PVipsImage; trn:PVipsTransformation):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_TRANSFORM_H }

implementation


end.
