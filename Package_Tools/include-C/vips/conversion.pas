unit conversion;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ conversion.h
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
{$ifndef VIPS_CONVERSION_H}
{$define VIPS_CONVERSION_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
type
  PVipsExtend = ^TVipsExtend;
  TVipsExtend =  Longint;
  Const
    VIPS_EXTEND_BLACK = 0;
    VIPS_EXTEND_COPY = 1;
    VIPS_EXTEND_REPEAT = 2;
    VIPS_EXTEND_MIRROR = 3;
    VIPS_EXTEND_WHITE = 4;
    VIPS_EXTEND_BACKGROUND = 5;
    VIPS_EXTEND_LAST = 6;
;
type
  PVipsCompassDirection = ^TVipsCompassDirection;
  TVipsCompassDirection =  Longint;
  Const
    VIPS_COMPASS_DIRECTION_CENTRE = 0;
    VIPS_COMPASS_DIRECTION_NORTH = 1;
    VIPS_COMPASS_DIRECTION_EAST = 2;
    VIPS_COMPASS_DIRECTION_SOUTH = 3;
    VIPS_COMPASS_DIRECTION_WEST = 4;
    VIPS_COMPASS_DIRECTION_NORTH_EAST = 5;
    VIPS_COMPASS_DIRECTION_SOUTH_EAST = 6;
    VIPS_COMPASS_DIRECTION_SOUTH_WEST = 7;
    VIPS_COMPASS_DIRECTION_NORTH_WEST = 8;
    VIPS_COMPASS_DIRECTION_LAST = 9;
;
type
  PVipsDirection = ^TVipsDirection;
  TVipsDirection =  Longint;
  Const
    VIPS_DIRECTION_HORIZONTAL = 0;
    VIPS_DIRECTION_VERTICAL = 1;
    VIPS_DIRECTION_LAST = 2;
;
type
  PVipsAlign = ^TVipsAlign;
  TVipsAlign =  Longint;
  Const
    VIPS_ALIGN_LOW = 0;
    VIPS_ALIGN_CENTRE = 1;
    VIPS_ALIGN_HIGH = 2;
    VIPS_ALIGN_LAST = 3;
;
type
  PVipsAngle = ^TVipsAngle;
  TVipsAngle =  Longint;
  Const
    VIPS_ANGLE_D0 = 0;
    VIPS_ANGLE_D90 = 1;
    VIPS_ANGLE_D180 = 2;
    VIPS_ANGLE_D270 = 3;
    VIPS_ANGLE_LAST = 4;
;
type
  PVipsAngle45 = ^TVipsAngle45;
  TVipsAngle45 =  Longint;
  Const
    VIPS_ANGLE45_D0 = 0;
    VIPS_ANGLE45_D45 = 1;
    VIPS_ANGLE45_D90 = 2;
    VIPS_ANGLE45_D135 = 3;
    VIPS_ANGLE45_D180 = 4;
    VIPS_ANGLE45_D225 = 5;
    VIPS_ANGLE45_D270 = 6;
    VIPS_ANGLE45_D315 = 7;
    VIPS_ANGLE45_LAST = 8;
;
type
  PVipsInteresting = ^TVipsInteresting;
  TVipsInteresting =  Longint;
  Const
    VIPS_INTERESTING_NONE = 0;
    VIPS_INTERESTING_CENTRE = 1;
    VIPS_INTERESTING_ENTROPY = 2;
    VIPS_INTERESTING_ATTENTION = 3;
    VIPS_INTERESTING_LOW = 4;
    VIPS_INTERESTING_HIGH = 5;
    VIPS_INTERESTING_ALL = 6;
    VIPS_INTERESTING_LAST = 7;
;
type
  PVipsBlendMode = ^TVipsBlendMode;
  TVipsBlendMode =  Longint;
  Const
    VIPS_BLEND_MODE_CLEAR = 0;
    VIPS_BLEND_MODE_SOURCE = 1;
    VIPS_BLEND_MODE_OVER = 2;
    VIPS_BLEND_MODE_IN = 3;
    VIPS_BLEND_MODE_OUT = 4;
    VIPS_BLEND_MODE_ATOP = 5;
    VIPS_BLEND_MODE_DEST = 6;
    VIPS_BLEND_MODE_DEST_OVER = 7;
    VIPS_BLEND_MODE_DEST_IN = 8;
    VIPS_BLEND_MODE_DEST_OUT = 9;
    VIPS_BLEND_MODE_DEST_ATOP = 10;
    VIPS_BLEND_MODE_XOR = 11;
    VIPS_BLEND_MODE_ADD = 12;
    VIPS_BLEND_MODE_SATURATE = 13;
    VIPS_BLEND_MODE_MULTIPLY = 14;
    VIPS_BLEND_MODE_SCREEN = 15;
    VIPS_BLEND_MODE_OVERLAY = 16;
    VIPS_BLEND_MODE_DARKEN = 17;
    VIPS_BLEND_MODE_LIGHTEN = 18;
    VIPS_BLEND_MODE_COLOUR_DODGE = 19;
    VIPS_BLEND_MODE_COLOUR_BURN = 20;
    VIPS_BLEND_MODE_HARD_LIGHT = 21;
    VIPS_BLEND_MODE_SOFT_LIGHT = 22;
    VIPS_BLEND_MODE_DIFFERENCE = 23;
    VIPS_BLEND_MODE_EXCLUSION = 24;
    VIPS_BLEND_MODE_LAST = 25;
;

function vips_copy(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_copy(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_tilecache(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_tilecache(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_linecache(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_linecache(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_sequential(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_sequential(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cache(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cache(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_copy_file(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_copy_file(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_embed(in:PVipsImage; out:PPVipsImage; x:longint; y:longint; width:longint; 
           height:longint; args:array of const):longint;cdecl;external libvips;
function vips_embed(in:PVipsImage; out:PPVipsImage; x:longint; y:longint; width:longint; 
           height:longint):longint;cdecl;external libvips;
function vips_gravity(in:PVipsImage; out:PPVipsImage; direction:TVipsCompassDirection; width:longint; height:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_gravity(in:PVipsImage; out:PPVipsImage; direction:TVipsCompassDirection; width:longint; height:longint):longint;cdecl;external libvips;
function vips_flip(in:PVipsImage; out:PPVipsImage; direction:TVipsDirection; args:array of const):longint;cdecl;external libvips;
function vips_flip(in:PVipsImage; out:PPVipsImage; direction:TVipsDirection):longint;cdecl;external libvips;
function vips_insert(main:PVipsImage; sub:PVipsImage; out:PPVipsImage; x:longint; y:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_insert(main:PVipsImage; sub:PVipsImage; out:PPVipsImage; x:longint; y:longint):longint;cdecl;external libvips;
function vips_join(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage; direction:TVipsDirection; args:array of const):longint;cdecl;external libvips;
function vips_join(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage; direction:TVipsDirection):longint;cdecl;external libvips;
function vips_arrayjoin(in:PPVipsImage; out:PPVipsImage; n:longint; args:array of const):longint;cdecl;external libvips;
function vips_arrayjoin(in:PPVipsImage; out:PPVipsImage; n:longint):longint;cdecl;external libvips;
function vips_extract_area(in:PVipsImage; out:PPVipsImage; left:longint; top:longint; width:longint; 
           height:longint; args:array of const):longint;cdecl;external libvips;
function vips_extract_area(in:PVipsImage; out:PPVipsImage; left:longint; top:longint; width:longint; 
           height:longint):longint;cdecl;external libvips;
function vips_crop(in:PVipsImage; out:PPVipsImage; left:longint; top:longint; width:longint; 
           height:longint; args:array of const):longint;cdecl;external libvips;
function vips_crop(in:PVipsImage; out:PPVipsImage; left:longint; top:longint; width:longint; 
           height:longint):longint;cdecl;external libvips;
function vips_smartcrop(in:PVipsImage; out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_smartcrop(in:PVipsImage; out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_extract_band(in:PVipsImage; out:PPVipsImage; band:longint; args:array of const):longint;cdecl;external libvips;
function vips_extract_band(in:PVipsImage; out:PPVipsImage; band:longint):longint;cdecl;external libvips;
function vips_replicate(in:PVipsImage; out:PPVipsImage; across:longint; down:longint; args:array of const):longint;cdecl;external libvips;
function vips_replicate(in:PVipsImage; out:PPVipsImage; across:longint; down:longint):longint;cdecl;external libvips;
function vips_grid(in:PVipsImage; out:PPVipsImage; tile_height:longint; across:longint; down:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_grid(in:PVipsImage; out:PPVipsImage; tile_height:longint; across:longint; down:longint):longint;cdecl;external libvips;
function vips_transpose3d(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_transpose3d(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_wrap(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_wrap(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_rot(in:PVipsImage; out:PPVipsImage; angle:TVipsAngle; args:array of const):longint;cdecl;external libvips;
function vips_rot(in:PVipsImage; out:PPVipsImage; angle:TVipsAngle):longint;cdecl;external libvips;
function vips_rot90(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_rot90(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_rot180(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_rot180(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_rot270(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_rot270(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_rot45(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_rot45(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
procedure vips_autorot_remove_angle(image:PVipsImage);cdecl;external libvips;
function vips_autorot(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_autorot(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_zoom(in:PVipsImage; out:PPVipsImage; xfac:longint; yfac:longint; args:array of const):longint;cdecl;external libvips;
function vips_zoom(in:PVipsImage; out:PPVipsImage; xfac:longint; yfac:longint):longint;cdecl;external libvips;
function vips_subsample(in:PVipsImage; out:PPVipsImage; xfac:longint; yfac:longint; args:array of const):longint;cdecl;external libvips;
function vips_subsample(in:PVipsImage; out:PPVipsImage; xfac:longint; yfac:longint):longint;cdecl;external libvips;
function vips_cast(in:PVipsImage; out:PPVipsImage; format:TVipsBandFormat; args:array of const):longint;cdecl;external libvips;
function vips_cast(in:PVipsImage; out:PPVipsImage; format:TVipsBandFormat):longint;cdecl;external libvips;
function vips_cast_uchar(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_uchar(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cast_char(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_char(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cast_ushort(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_ushort(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cast_short(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_short(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cast_uint(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_uint(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cast_int(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_int(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cast_float(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_float(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cast_double(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_double(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cast_complex(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_complex(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_cast_dpcomplex(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_cast_dpcomplex(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_scale(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_scale(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_msb(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_msb(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_byteswap(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_byteswap(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_bandjoin(in:PPVipsImage; out:PPVipsImage; n:longint; args:array of const):longint;cdecl;external libvips;
function vips_bandjoin(in:PPVipsImage; out:PPVipsImage; n:longint):longint;cdecl;external libvips;
function vips_bandjoin2(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_bandjoin2(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_bandjoin_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint; args:array of const):longint;cdecl;external libvips;
function vips_bandjoin_const(in:PVipsImage; out:PPVipsImage; c:Pdouble; n:longint):longint;cdecl;external libvips;
function vips_bandjoin_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_bandjoin_const1(in:PVipsImage; out:PPVipsImage; c:Tdouble):longint;cdecl;external libvips;
function vips_bandrank(in:PPVipsImage; out:PPVipsImage; n:longint; args:array of const):longint;cdecl;external libvips;
function vips_bandrank(in:PPVipsImage; out:PPVipsImage; n:longint):longint;cdecl;external libvips;
function vips_bandfold(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_bandfold(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_bandunfold(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_bandunfold(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_bandbool(in:PVipsImage; out:PPVipsImage; boolean:TVipsOperationBoolean; args:array of const):longint;cdecl;external libvips;
function vips_bandbool(in:PVipsImage; out:PPVipsImage; boolean:TVipsOperationBoolean):longint;cdecl;external libvips;
function vips_bandand(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_bandand(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_bandor(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_bandor(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_bandeor(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_bandeor(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_bandmean(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_bandmean(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_recomb(in:PVipsImage; out:PPVipsImage; m:PVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_recomb(in:PVipsImage; out:PPVipsImage; m:PVipsImage):longint;cdecl;external libvips;
function vips_ifthenelse(cond:PVipsImage; in1:PVipsImage; in2:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_ifthenelse(cond:PVipsImage; in1:PVipsImage; in2:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_switch(tests:PPVipsImage; out:PPVipsImage; n:longint; args:array of const):longint;cdecl;external libvips;
function vips_switch(tests:PPVipsImage; out:PPVipsImage; n:longint):longint;cdecl;external libvips;
function vips_flatten(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_flatten(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_addalpha(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_addalpha(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_premultiply(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_premultiply(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_unpremultiply(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_unpremultiply(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_composite(in:PPVipsImage; out:PPVipsImage; n:longint; mode:Plongint; args:array of const):longint;cdecl;external libvips;
function vips_composite(in:PPVipsImage; out:PPVipsImage; n:longint; mode:Plongint):longint;cdecl;external libvips;
function vips_composite2(base:PVipsImage; overlay:PVipsImage; out:PPVipsImage; mode:TVipsBlendMode; args:array of const):longint;cdecl;external libvips;
function vips_composite2(base:PVipsImage; overlay:PVipsImage; out:PPVipsImage; mode:TVipsBlendMode):longint;cdecl;external libvips;
function vips_falsecolour(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_falsecolour(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_gamma(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_gamma(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_CONVERSION_H }

// === Konventiert am: 26-4-26 16:14:48 ===


implementation



end.
