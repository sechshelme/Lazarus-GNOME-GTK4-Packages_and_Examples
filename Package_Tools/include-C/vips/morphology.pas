unit morphology;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ morphology.h
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
{$ifndef VIPS_MORPHOLOGY_H}
{$define VIPS_MORPHOLOGY_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
type
  PVipsOperationMorphology = ^TVipsOperationMorphology;
  TVipsOperationMorphology =  Longint;
  Const
    VIPS_OPERATION_MORPHOLOGY_ERODE = 0;
    VIPS_OPERATION_MORPHOLOGY_DILATE = 1;
    VIPS_OPERATION_MORPHOLOGY_LAST = 2;
;

function vips_morph(in:PVipsImage; out:PPVipsImage; mask:PVipsImage; morph:TVipsOperationMorphology; args:array of const):longint;cdecl;external libvips;
function vips_morph(in:PVipsImage; out:PPVipsImage; mask:PVipsImage; morph:TVipsOperationMorphology):longint;cdecl;external libvips;
function vips_rank(in:PVipsImage; out:PPVipsImage; width:longint; height:longint; index:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_rank(in:PVipsImage; out:PPVipsImage; width:longint; height:longint; index:longint):longint;cdecl;external libvips;
function vips_median(in:PVipsImage; out:PPVipsImage; size:longint; args:array of const):longint;cdecl;external libvips;
function vips_median(in:PVipsImage; out:PPVipsImage; size:longint):longint;cdecl;external libvips;
function vips_countlines(in:PVipsImage; nolines:Pdouble; direction:TVipsDirection; args:array of const):longint;cdecl;external libvips;
function vips_countlines(in:PVipsImage; nolines:Pdouble; direction:TVipsDirection):longint;cdecl;external libvips;
function vips_labelregions(in:PVipsImage; mask:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_labelregions(in:PVipsImage; mask:PPVipsImage):longint;cdecl;external libvips;
function vips_fill_nearest(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_fill_nearest(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_MORPHOLOGY_H }

// === Konventiert am: 26-4-26 16:12:06 ===


implementation



end.
