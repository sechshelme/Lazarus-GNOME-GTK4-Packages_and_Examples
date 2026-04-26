unit generate;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Generate pixels.
 *
 * J.Cupitt, 8/4/93
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
{$ifndef VIPS_GENERATE_H}
{$define VIPS_GENERATE_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
type

  TVipsRegionWrite = function (region:PVipsRegion; area:PVipsRect; a:pointer):longint;cdecl;

function vips_sink_disc(im:PVipsImage; write_fn:TVipsRegionWrite; a:pointer):longint;cdecl;external libvips;
function vips_sink(im:PVipsImage; start_fn:TVipsStartFn; generate_fn:TVipsGenerateFn; stop_fn:TVipsStopFn; a:pointer; 
           b:pointer):longint;cdecl;external libvips;
function vips_sink_tile(im:PVipsImage; tile_width:longint; tile_height:longint; start_fn:TVipsStartFn; generate_fn:TVipsGenerateFn; 
           stop_fn:TVipsStopFn; a:pointer; b:pointer):longint;cdecl;external libvips;
type

  TVipsSinkNotify = procedure (im:PVipsImage; rect:PVipsRect; a:pointer);cdecl;

function vips_sink_screen(in:PVipsImage; out:PVipsImage; mask:PVipsImage; tile_width:longint; tile_height:longint; 
           max_tiles:longint; priority:longint; notify_fn:TVipsSinkNotify; a:pointer):longint;cdecl;external libvips;
function vips_sink_memory(im:PVipsImage):longint;cdecl;external libvips;
function vips_start_one(out:PVipsImage; a:pointer; b:pointer):pointer;cdecl;external libvips;
function vips_stop_one(seq:pointer; a:pointer; b:pointer):longint;cdecl;external libvips;
function vips_start_many(out:PVipsImage; a:pointer; b:pointer):pointer;cdecl;external libvips;
function vips_stop_many(seq:pointer; a:pointer; b:pointer):longint;cdecl;external libvips;
function vips_allocate_input_array(out:PVipsImage; args:array of const):^PVipsImage;cdecl;external libvips;
function vips_allocate_input_array(out:PVipsImage):^PVipsImage;cdecl;external libvips;
function vips_image_generate(image:PVipsImage; start_fn:TVipsStartFn; generate_fn:TVipsGenerateFn; stop_fn:TVipsStopFn; a:pointer; 
           b:pointer):longint;cdecl;external libvips;
function vips_image_pipeline_array(image:PVipsImage; hint:TVipsDemandStyle; in:PPVipsImage):longint;cdecl;external libvips;
function vips_image_pipelinev(image:PVipsImage; hint:TVipsDemandStyle; args:array of const):longint;cdecl;external libvips;
function vips_image_pipelinev(image:PVipsImage; hint:TVipsDemandStyle):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_GENERATE_H }

// === Konventiert am: 26-4-26 16:13:16 ===


implementation



end.
