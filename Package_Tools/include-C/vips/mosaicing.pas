unit mosaicing;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ mosaicing.h
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
{$ifndef VIPS_MOSAICING_H}
{$define VIPS_MOSAICING_H}
{ C++ extern C conditionnal removed }
{__cplusplus }

function vips_merge(ref:PVipsImage; sec:PVipsImage; out:PPVipsImage; direction:TVipsDirection; dx:longint; 
           dy:longint; args:array of const):longint;cdecl;external libvips;
function vips_merge(ref:PVipsImage; sec:PVipsImage; out:PPVipsImage; direction:TVipsDirection; dx:longint; 
           dy:longint):longint;cdecl;external libvips;
function vips_mosaic(ref:PVipsImage; sec:PVipsImage; out:PPVipsImage; direction:TVipsDirection; xref:longint; 
           yref:longint; xsec:longint; ysec:longint; args:array of const):longint;cdecl;external libvips;
function vips_mosaic(ref:PVipsImage; sec:PVipsImage; out:PPVipsImage; direction:TVipsDirection; xref:longint; 
           yref:longint; xsec:longint; ysec:longint):longint;cdecl;external libvips;
function vips_mosaic1(ref:PVipsImage; sec:PVipsImage; out:PPVipsImage; direction:TVipsDirection; xr1:longint; 
           yr1:longint; xs1:longint; ys1:longint; xr2:longint; yr2:longint; 
           xs2:longint; ys2:longint; args:array of const):longint;cdecl;external libvips;
function vips_mosaic1(ref:PVipsImage; sec:PVipsImage; out:PPVipsImage; direction:TVipsDirection; xr1:longint; 
           yr1:longint; xs1:longint; ys1:longint; xr2:longint; yr2:longint; 
           xs2:longint; ys2:longint):longint;cdecl;external libvips;
function vips_match(ref:PVipsImage; sec:PVipsImage; out:PPVipsImage; xr1:longint; yr1:longint; 
           xs1:longint; ys1:longint; xr2:longint; yr2:longint; xs2:longint; 
           ys2:longint; args:array of const):longint;cdecl;external libvips;
function vips_match(ref:PVipsImage; sec:PVipsImage; out:PPVipsImage; xr1:longint; yr1:longint; 
           xs1:longint; ys1:longint; xr2:longint; yr2:longint; xs2:longint; 
           ys2:longint):longint;cdecl;external libvips;
function vips_globalbalance(in:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_globalbalance(in:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
function vips_remosaic(in:PVipsImage; out:PPVipsImage; old_str:Pchar; new_str:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_remosaic(in:PVipsImage; out:PPVipsImage; old_str:Pchar; new_str:Pchar):longint;cdecl;external libvips;
function vips_matrixinvert(m:PVipsImage; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_matrixinvert(m:PVipsImage; out:PPVipsImage):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_MOSAICING_H }

// === Konventiert am: 26-4-26 16:12:00 ===


implementation



end.
