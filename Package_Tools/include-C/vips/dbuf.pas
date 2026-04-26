unit dbuf;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ A dynamic memory buffer that expands as you write.
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
{$ifndef VIPS_DBUF_H}
{$define VIPS_DBUF_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{$include <vips/vips.h>}
{ A buffer in the process of being written to.
  }
{ All fields are private.
	  }
{< private > }
{ The current base, and the size of the allocated memory area.
	  }
{ The size of the actual data that's been written. This will usually
	 * be <= allocated_size, but always >= write_point.
	  }
{ The write point.
	  }
type
  PVipsDbuf = ^TVipsDbuf;
  TVipsDbuf = record
      data : Pbyte;
      allocated_size : Tsize_t;
      data_size : Tsize_t;
      write_point : Tsize_t;
    end;

procedure vips_dbuf_init(dbuf:PVipsDbuf);cdecl;external libvips;
function vips_dbuf_minimum_size(dbuf:PVipsDbuf; size:Tsize_t):Tgboolean;cdecl;external libvips;
function vips_dbuf_allocate(dbuf:PVipsDbuf; size:Tsize_t):Tgboolean;cdecl;external libvips;
function vips_dbuf_read(dbuf:PVipsDbuf; data:Pbyte; size:Tsize_t):Tsize_t;cdecl;external libvips;
function vips_dbuf_get_write(dbuf:PVipsDbuf; size:Psize_t):Pbyte;cdecl;external libvips;
function vips_dbuf_write(dbuf:PVipsDbuf; data:Pbyte; size:Tsize_t):Tgboolean;cdecl;external libvips;
function vips_dbuf_writef(dbuf:PVipsDbuf; fmt:Pchar; args:array of const):Tgboolean;cdecl;external libvips;
function vips_dbuf_writef(dbuf:PVipsDbuf; fmt:Pchar):Tgboolean;cdecl;external libvips;
function vips_dbuf_write_amp(dbuf:PVipsDbuf; str:Pchar):Tgboolean;cdecl;external libvips;
procedure vips_dbuf_reset(dbuf:PVipsDbuf);cdecl;external libvips;
procedure vips_dbuf_destroy(dbuf:PVipsDbuf);cdecl;external libvips;
function vips_dbuf_seek(dbuf:PVipsDbuf; offset:Toff_t; whence:longint):Tgboolean;cdecl;external libvips;
procedure vips_dbuf_truncate(dbuf:PVipsDbuf);cdecl;external libvips;
function vips_dbuf_tell(dbuf:PVipsDbuf):Toff_t;cdecl;external libvips;
function vips_dbuf_string(dbuf:PVipsDbuf; size:Psize_t):Pbyte;cdecl;external libvips;
function vips_dbuf_steal(dbuf:PVipsDbuf; size:Psize_t):Pbyte;cdecl;external libvips;
{$endif}
{VIPS_DBUF_H }
{ C++ end of extern C conditionnal removed }
{__cplusplus }

// === Konventiert am: 26-4-26 16:14:38 ===


implementation



end.
