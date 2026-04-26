unit resample;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ resample.h
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
{$ifndef VIPS_RESAMPLE_H}
{$define VIPS_RESAMPLE_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
type
  PVipsKernel = ^TVipsKernel;
  TVipsKernel =  Longint;
  Const
    VIPS_KERNEL_NEAREST = 0;
    VIPS_KERNEL_LINEAR = 1;
    VIPS_KERNEL_CUBIC = 2;
    VIPS_KERNEL_MITCHELL = 3;
    VIPS_KERNEL_LANCZOS2 = 4;
    VIPS_KERNEL_LANCZOS3 = 5;
    VIPS_KERNEL_LAST = 6;
;
type
  PVipsSize = ^TVipsSize;
  TVipsSize =  Longint;
  Const
    VIPS_SIZE_BOTH = 0;
    VIPS_SIZE_UP = 1;
    VIPS_SIZE_DOWN = 2;
    VIPS_SIZE_FORCE = 3;
    VIPS_SIZE_LAST = 4;
;

function vips_shrink(in:PVipsImage; out:PPVipsImage; hshrink:Tdouble; vshrink:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_shrink(in:PVipsImage; out:PPVipsImage; hshrink:Tdouble; vshrink:Tdouble):longint;cdecl;external libvips;
function vips_shrinkh(in:PVipsImage; out:PPVipsImage; hshrink:longint; args:array of const):longint;cdecl;external libvips;
function vips_shrinkh(in:PVipsImage; out:PPVipsImage; hshrink:longint):longint;cdecl;external libvips;
function vips_shrinkv(in:PVipsImage; out:PPVipsImage; vshrink:longint; args:array of const):longint;cdecl;external libvips;
function vips_shrinkv(in:PVipsImage; out:PPVipsImage; vshrink:longint):longint;cdecl;external libvips;
function vips_reduce(in:PVipsImage; out:PPVipsImage; hshrink:Tdouble; vshrink:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_reduce(in:PVipsImage; out:PPVipsImage; hshrink:Tdouble; vshrink:Tdouble):longint;cdecl;external libvips;
function vips_reduceh(in:PVipsImage; out:PPVipsImage; hshrink:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_reduceh(in:PVipsImage; out:PPVipsImage; hshrink:Tdouble):longint;cdecl;external libvips;
function vips_reducev(in:PVipsImage; out:PPVipsImage; vshrink:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_reducev(in:PVipsImage; out:PPVipsImage; vshrink:Tdouble):longint;cdecl;external libvips;
function vips_thumbnail(filename:Pchar; out:PPVipsImage; width:longint; args:array of const):longint;cdecl;external libvips;
function vips_thumbnail(filename:Pchar; out:PPVipsImage; width:longint):longint;cdecl;external libvips;
function vips_thumbnail_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; width:longint; args:array of const):longint;cdecl;external libvips;
function vips_thumbnail_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; width:longint):longint;cdecl;external libvips;
function vips_thumbnail_image(in:PVipsImage; out:PPVipsImage; width:longint; args:array of const):longint;cdecl;external libvips;
function vips_thumbnail_image(in:PVipsImage; out:PPVipsImage; width:longint):longint;cdecl;external libvips;
function vips_thumbnail_source(source:PVipsSource; out:PPVipsImage; width:longint; args:array of const):longint;cdecl;external libvips;
function vips_thumbnail_source(source:PVipsSource; out:PPVipsImage; width:longint):longint;cdecl;external libvips;
function vips_similarity(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_similarity(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_rotate(in:PVipsImage; out:PPVipsImage; angle:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_rotate(in:PVipsImage; out:PPVipsImage; angle:Tdouble):longint;cdecl;external libvips;
function vips_affine(in:PVipsImage; out:PPVipsImage; a:Tdouble; b:Tdouble; c:Tdouble; 
           d:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_affine(in:PVipsImage; out:PPVipsImage; a:Tdouble; b:Tdouble; c:Tdouble; 
           d:Tdouble):longint;cdecl;external libvips;
function vips_resize(in:PVipsImage; out:PPVipsImage; scale:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_resize(in:PVipsImage; out:PPVipsImage; scale:Tdouble):longint;cdecl;external libvips;
function vips_mapim(in:PVipsImage; out:PPVipsImage; index:PVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_mapim(in:PVipsImage; out:PPVipsImage; index:PVipsImage):longint;cdecl;external libvips;
function vips_quadratic(in:PVipsImage; out:PPVipsImage; coeff:PVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_quadratic(in:PVipsImage; out:PPVipsImage; coeff:PVipsImage):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_RESAMPLE_H }

// === Konventiert am: 26-4-26 16:10:27 ===


implementation



end.
