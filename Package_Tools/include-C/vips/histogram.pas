unit histogram;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ histograms_lut.h
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
{$ifndef VIPS_HISTOGRAM_H}
{$define VIPS_HISTOGRAM_H}
{ C++ extern C conditionnal removed }
{__cplusplus }

function vips_maplut(in:PVipsImage; out:PPVipsImage; lut:PVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_maplut(in:PVipsImage; out:PPVipsImage; lut:PVipsImage):longint;cdecl;external libvips;
function vips_percent(in:PVipsImage; percent:Tdouble; threshold:Plongint; args:array of const):longint;cdecl;external libvips;
function vips_percent(in:PVipsImage; percent:Tdouble; threshold:Plongint):longint;cdecl;external libvips;
function vips_stdif(in:PVipsImage; out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_stdif(in:PVipsImage; out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_hist_cum(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_hist_cum(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_hist_norm(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_hist_norm(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_hist_equal(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_hist_equal(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_hist_plot(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_hist_plot(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_hist_match(in:PVipsImage; ref:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_hist_match(in:PVipsImage; ref:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_hist_local(in:PVipsImage; out:PPVipsImage; width:longint; height:longint; args:array of const):longint;cdecl;external libvips;
function vips_hist_local(in:PVipsImage; out:PPVipsImage; width:longint; height:longint):longint;cdecl;external libvips;
function vips_hist_ismonotonic(in:PVipsImage; out:Pgboolean; args:array of const):longint;cdecl;external libvips;
function vips_hist_ismonotonic(in:PVipsImage; out:Pgboolean):longint;cdecl;external libvips;
function vips_hist_entropy(in:PVipsImage; out:Pdouble; args:array of const):longint;cdecl;external libvips;
function vips_hist_entropy(in:PVipsImage; out:Pdouble):longint;cdecl;external libvips;
function vips_case(index:PVipsImage; cases:PPVipsImage; out:PPVipsImage; n:longint; args:array of const):longint;cdecl;external libvips;
function vips_case(index:PVipsImage; cases:PPVipsImage; out:PPVipsImage; n:longint):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_HISTOGRAM_H }

// === Konventiert am: 26-4-26 16:13:07 ===


implementation



end.
