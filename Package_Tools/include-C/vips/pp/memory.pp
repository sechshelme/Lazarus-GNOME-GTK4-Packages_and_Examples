
unit memory;
interface

{
  Automatically converted by H2Pas 1.0.0 from memory.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    memory.h
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
Pchar  = ^char;
PVipsObject  = ^VipsObject;
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

function vips_malloc(object:PVipsObject; size:Tsize_t):pointer;cdecl;external;
(* Const before type ignored *)
function vips_strdup(object:PVipsObject; str:Pchar):Pchar;cdecl;external;
procedure vips_tracked_free(s:pointer);cdecl;external;
procedure vips_tracked_aligned_free(s:pointer);cdecl;external;
function vips_tracked_malloc(size:Tsize_t):pointer;cdecl;external;
function vips_tracked_aligned_alloc(size:Tsize_t; align:Tsize_t):pointer;cdecl;external;
function vips_tracked_get_mem:Tsize_t;cdecl;external;
function vips_tracked_get_mem_highwater:Tsize_t;cdecl;external;
function vips_tracked_get_allocs:longint;cdecl;external;
(* Const before type ignored *)
function vips_tracked_open(pathname:Pchar; flags:longint; mode:longint):longint;cdecl;external;
function vips_tracked_close(fd:longint):longint;cdecl;external;
function vips_tracked_get_files:longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_MEMORY_H }

implementation


end.
