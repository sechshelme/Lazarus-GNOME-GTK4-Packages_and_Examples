unit freqfilt;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ freq_filt.h
 *
 * 2/11/09
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
{$ifndef VIPS_FREQFILT_H}
{$define VIPS_FREQFILT_H}
{ C++ extern C conditionnal removed }
{__cplusplus }

function vips_fwfft(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_fwfft(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_invfft(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_invfft(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_freqmult(in:PVipsImage; mask:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_freqmult(in:PVipsImage; mask:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_spectrum(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_spectrum(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_phasecor(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_phasecor(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_FREQFILT_H }

// === Konventiert am: 26-4-26 16:13:25 ===


implementation



end.
