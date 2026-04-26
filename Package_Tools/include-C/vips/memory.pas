unit memory;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ memory utilities
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
{$ifndef VIPS_MEMORY_H}
{$define VIPS_MEMORY_H}
{ C++ extern C conditionnal removed }
{__cplusplus }

function vips_malloc(object:PVipsObject; size:Tsize_t):pointer;cdecl;external libvips;
function vips_strdup(object:PVipsObject; str:Pchar):Pchar;cdecl;external libvips;
procedure vips_tracked_free(s:pointer);cdecl;external libvips;
procedure vips_tracked_aligned_free(s:pointer);cdecl;external libvips;
function vips_tracked_malloc(size:Tsize_t):pointer;cdecl;external libvips;
function vips_tracked_aligned_alloc(size:Tsize_t; align:Tsize_t):pointer;cdecl;external libvips;
function vips_tracked_get_mem:Tsize_t;cdecl;external libvips;
function vips_tracked_get_mem_highwater:Tsize_t;cdecl;external libvips;
function vips_tracked_get_allocs:longint;cdecl;external libvips;
function vips_tracked_open(pathname:Pchar; flags:longint; mode:longint):longint;cdecl;external libvips;
function vips_tracked_close(fd:longint):longint;cdecl;external libvips;
function vips_tracked_get_files:longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_MEMORY_H }

// === Konventiert am: 26-4-26 16:12:10 ===


implementation



end.
