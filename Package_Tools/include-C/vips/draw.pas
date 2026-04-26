unit draw;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ draw.h
 *
 * 3/11/09
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
{$ifndef VIPS_DRAW_H}
{$define VIPS_DRAW_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/object.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
type
  PVipsCombineMode = ^TVipsCombineMode;
  TVipsCombineMode =  Longint;
  Const
    VIPS_COMBINE_MODE_SET = 0;
    VIPS_COMBINE_MODE_ADD = 1;
    VIPS_COMBINE_MODE_LAST = 2;
;

function vips_draw_rect(image:PVipsImage; ink:Pdouble; n:longint; left:longint; top:longint; 
           width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_draw_rect(image:PVipsImage; ink:Pdouble; n:longint; left:longint; top:longint; 
           width:longint; height:longint):longint;cdecl;external libvips;
function vips_draw_rect1(image:PVipsImage; ink:Tdouble; left:longint; top:longint; width:longint; 
           height:longint; args:array of const):longint;cdecl;external libvips;
function vips_draw_rect1(image:PVipsImage; ink:Tdouble; left:longint; top:longint; width:longint; 
           height:longint):longint;cdecl;external libvips;
function vips_draw_point(image:PVipsImage; ink:Pdouble; n:longint; x:longint; y:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_draw_point(image:PVipsImage; ink:Pdouble; n:longint; x:longint; y:longint):longint;cdecl;external libvips;
function vips_draw_point1(image:PVipsImage; ink:Tdouble; x:longint; y:longint; args:array of const):longint;cdecl;external libvips;
function vips_draw_point1(image:PVipsImage; ink:Tdouble; x:longint; y:longint):longint;cdecl;external libvips;
function vips_draw_image(image:PVipsImage; sub:PVipsImage; x:longint; y:longint; args:array of const):longint;cdecl;external libvips;
function vips_draw_image(image:PVipsImage; sub:PVipsImage; x:longint; y:longint):longint;cdecl;external libvips;
function vips_draw_mask(image:PVipsImage; ink:Pdouble; n:longint; mask:PVipsImage; x:longint; 
           y:longint; args:array of const):longint;cdecl;external libvips;
function vips_draw_mask(image:PVipsImage; ink:Pdouble; n:longint; mask:PVipsImage; x:longint; 
           y:longint):longint;cdecl;external libvips;
function vips_draw_mask1(image:PVipsImage; ink:Tdouble; mask:PVipsImage; x:longint; y:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_draw_mask1(image:PVipsImage; ink:Tdouble; mask:PVipsImage; x:longint; y:longint):longint;cdecl;external libvips;
function vips_draw_line(image:PVipsImage; ink:Pdouble; n:longint; x1:longint; y1:longint; 
           x2:longint; y2:longint; args:array of const):longint;cdecl;external libvips;
function vips_draw_line(image:PVipsImage; ink:Pdouble; n:longint; x1:longint; y1:longint; 
           x2:longint; y2:longint):longint;cdecl;external libvips;
function vips_draw_line1(image:PVipsImage; ink:Tdouble; x1:longint; y1:longint; x2:longint; 
           y2:longint; args:array of const):longint;cdecl;external libvips;
function vips_draw_line1(image:PVipsImage; ink:Tdouble; x1:longint; y1:longint; x2:longint; 
           y2:longint):longint;cdecl;external libvips;
function vips_draw_circle(image:PVipsImage; ink:Pdouble; n:longint; cx:longint; cy:longint; 
           radius:longint; args:array of const):longint;cdecl;external libvips;
function vips_draw_circle(image:PVipsImage; ink:Pdouble; n:longint; cx:longint; cy:longint; 
           radius:longint):longint;cdecl;external libvips;
function vips_draw_circle1(image:PVipsImage; ink:Tdouble; cx:longint; cy:longint; radius:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_draw_circle1(image:PVipsImage; ink:Tdouble; cx:longint; cy:longint; radius:longint):longint;cdecl;external libvips;
function vips_draw_flood(image:PVipsImage; ink:Pdouble; n:longint; x:longint; y:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_draw_flood(image:PVipsImage; ink:Pdouble; n:longint; x:longint; y:longint):longint;cdecl;external libvips;
function vips_draw_flood1(image:PVipsImage; ink:Tdouble; x:longint; y:longint; args:array of const):longint;cdecl;external libvips;
function vips_draw_flood1(image:PVipsImage; ink:Tdouble; x:longint; y:longint):longint;cdecl;external libvips;
function vips_draw_smudge(image:PVipsImage; left:longint; top:longint; width:longint; height:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_draw_smudge(image:PVipsImage; left:longint; top:longint; width:longint; height:longint):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_DRAW_H }

// === Konventiert am: 26-4-26 16:14:11 ===


implementation



end.
