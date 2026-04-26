
unit freqfilt;
interface

{
  Automatically converted by H2Pas 1.0.0 from freqfilt.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    freqfilt.h
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
PVipsImage  = ^VipsImage;
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

function vips_fwfft(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_fwfft(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_invfft(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_invfft(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_freqmult(in:PVipsImage; mask:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_freqmult(in:PVipsImage; mask:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_spectrum(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_spectrum(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_phasecor(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external;
function vips_phasecor(in1:PVipsImage; in2:PVipsImage; out:PPVipsImage):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_FREQFILT_H }

implementation


end.
