unit create;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ create.h
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
{$ifndef VIPS_CREATE_H}
{$define VIPS_CREATE_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
type
  PVipsTextWrap = ^TVipsTextWrap;
  TVipsTextWrap =  Longint;
  Const
    VIPS_TEXT_WRAP_WORD = 0;
    VIPS_TEXT_WRAP_CHAR = 1;
    VIPS_TEXT_WRAP_WORD_CHAR = 2;
    VIPS_TEXT_WRAP_NONE = 3;
    VIPS_TEXT_WRAP_LAST = 4;
;

function vips_black(out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_black(out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_xyz(out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_xyz(out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_grey(out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_grey(out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_gaussmat(out:PPVipsImage; sigma:Tdouble; min_ampl:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_gaussmat(out:PPVipsImage; sigma:Tdouble; min_ampl:Tdouble):longint;cdecl;external libvips;
function vips_logmat(out:PPVipsImage; sigma:Tdouble; min_ampl:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_logmat(out:PPVipsImage; sigma:Tdouble; min_ampl:Tdouble):longint;cdecl;external libvips;
function vips_text(out:PPVipsImage; text:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_text(out:PPVipsImage; text:Pchar):longint;cdecl;external libvips;
function vips_gaussnoise(out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_gaussnoise(out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_eye(out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_eye(out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_sines(out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_sines(out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_zone(out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_zone(out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_identity(out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_identity(out:PPVipsImage):longint;cdecl;external libvips;
function vips_buildlut(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_buildlut(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_invertlut(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_invertlut(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_tonelut(out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_tonelut(out:PPVipsImage):longint;cdecl;external libvips;
function vips_mask_ideal(out:PPVipsImage; width:longint; height:longint; frequency_cutoff:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_mask_ideal(out:PPVipsImage; width:longint; height:longint; frequency_cutoff:Tdouble):longint;cdecl;external libvips;
function vips_mask_ideal_ring(out:PPVipsImage; width:longint; height:longint; frequency_cutoff:Tdouble; ringwidth:Tdouble; 
           args:array of const):longint;cdecl;external libvips;
function vips_mask_ideal_ring(out:PPVipsImage; width:longint; height:longint; frequency_cutoff:Tdouble; ringwidth:Tdouble):longint;cdecl;external libvips;
function vips_mask_ideal_band(out:PPVipsImage; width:longint; height:longint; frequency_cutoff_x:Tdouble; frequency_cutoff_y:Tdouble; 
           radius:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_mask_ideal_band(out:PPVipsImage; width:longint; height:longint; frequency_cutoff_x:Tdouble; frequency_cutoff_y:Tdouble; 
           radius:Tdouble):longint;cdecl;external libvips;
function vips_mask_butterworth(out:PPVipsImage; width:longint; height:longint; order:Tdouble; frequency_cutoff:Tdouble; 
           amplitude_cutoff:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_mask_butterworth(out:PPVipsImage; width:longint; height:longint; order:Tdouble; frequency_cutoff:Tdouble; 
           amplitude_cutoff:Tdouble):longint;cdecl;external libvips;
function vips_mask_butterworth_ring(out:PPVipsImage; width:longint; height:longint; order:Tdouble; frequency_cutoff:Tdouble; 
           amplitude_cutoff:Tdouble; ringwidth:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_mask_butterworth_ring(out:PPVipsImage; width:longint; height:longint; order:Tdouble; frequency_cutoff:Tdouble; 
           amplitude_cutoff:Tdouble; ringwidth:Tdouble):longint;cdecl;external libvips;
function vips_mask_butterworth_band(out:PPVipsImage; width:longint; height:longint; order:Tdouble; frequency_cutoff_x:Tdouble; 
           frequency_cutoff_y:Tdouble; radius:Tdouble; amplitude_cutoff:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_mask_butterworth_band(out:PPVipsImage; width:longint; height:longint; order:Tdouble; frequency_cutoff_x:Tdouble; 
           frequency_cutoff_y:Tdouble; radius:Tdouble; amplitude_cutoff:Tdouble):longint;cdecl;external libvips;
function vips_mask_gaussian(out:PPVipsImage; width:longint; height:longint; frequency_cutoff:Tdouble; amplitude_cutoff:Tdouble; 
           args:array of const):longint;cdecl;external libvips;
function vips_mask_gaussian(out:PPVipsImage; width:longint; height:longint; frequency_cutoff:Tdouble; amplitude_cutoff:Tdouble):longint;cdecl;external libvips;
function vips_mask_gaussian_ring(out:PPVipsImage; width:longint; height:longint; frequency_cutoff:Tdouble; amplitude_cutoff:Tdouble; 
           ringwidth:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_mask_gaussian_ring(out:PPVipsImage; width:longint; height:longint; frequency_cutoff:Tdouble; amplitude_cutoff:Tdouble; 
           ringwidth:Tdouble):longint;cdecl;external libvips;
function vips_mask_gaussian_band(out:PPVipsImage; width:longint; height:longint; frequency_cutoff_x:Tdouble; frequency_cutoff_y:Tdouble; 
           radius:Tdouble; amplitude_cutoff:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_mask_gaussian_band(out:PPVipsImage; width:longint; height:longint; frequency_cutoff_x:Tdouble; frequency_cutoff_y:Tdouble; 
           radius:Tdouble; amplitude_cutoff:Tdouble):longint;cdecl;external libvips;
function vips_mask_fractal(out:PPVipsImage; width:longint; height:longint; fractal_dimension:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_mask_fractal(out:PPVipsImage; width:longint; height:longint; fractal_dimension:Tdouble):longint;cdecl;external libvips;
function vips_fractsurf(out:PPVipsImage; width:longint; height:longint; fractal_dimension:Tdouble; args:array of const):longint;cdecl;external libvips;
function vips_fractsurf(out:PPVipsImage; width:longint; height:longint; fractal_dimension:Tdouble):longint;cdecl;external libvips;
function vips_worley(out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_worley(out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_perlin(out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_perlin(out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_CREATE_H }

// === Konventiert am: 26-4-26 16:14:42 ===


implementation



end.
