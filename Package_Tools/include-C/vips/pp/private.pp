
unit private;
interface

{
  Automatically converted by H2Pas 1.0.0 from private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    private.h
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
P_VipsImage  = ^_VipsImage;
P_VipsRegion  = ^_VipsRegion;
Pchar  = ^char;
PGHashTable  = ^GHashTable;
PGParamSpec  = ^GParamSpec;
PGSList  = ^GSList;
PGThread  = ^GThread;
PRegionType  = ^RegionType;
PVipsArgument  = ^VipsArgument;
PVipsArgumentClass  = ^VipsArgumentClass;
PVipsArgumentInstance  = ^VipsArgumentInstance;
PVipsArgumentTable  = ^VipsArgumentTable;
PVipsBuffer  = ^VipsBuffer;
PVipsBufferCache  = ^VipsBufferCache;
PVipsBufferThread  = ^VipsBufferThread;
PVipsImage  = ^VipsImage;
PVipsObject  = ^VipsObject;
PVipsPel  = ^VipsPel;
PVipsRect  = ^VipsRect;
PVipsRegion  = ^VipsRegion;
PVipsWindow  = ^VipsWindow;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Declarations which are public-facing, but private. See internal.h for
 * declarations which are only used internally by vips and which are not
 * externally visible.
 *
 * 6/7/09
 * 	- from vips.h
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
{$ifndef VIPS_PRIVATE_H}
{$define VIPS_PRIVATE_H}
{ C++ extern C conditionnal removed }
{__cplusplus }

const
  VIPS_SPARE = 8;  
{ Private to iofuncs: the minimum number of scanlines we add above and below
 * the window as a margin for slop.
  }
  VIPS__WINDOW_MARGIN_PIXELS = 128;  
{ Private to iofuncs: add at least this many bytes above and below the window.
 * There's no point mapping just a few KB of a small image.
  }
  VIPS__WINDOW_MARGIN_BYTES = (1024*1024)*10;  
{ sizeof() a VIPS header on disc.
  }
  VIPS_SIZEOF_HEADER = 64;  
{ What we track for each mmap window. Have a list of these on an openin
 * VipsImage.
  }
{ # of regions referencing us  }
{ VipsImage we are attached to  }
{ Area of image we have mapped, in pixels  }
{ First pixel of line 'top'  }
{ Base of window  }
{ Size of window  }
type
  PVipsWindow = ^TVipsWindow;
  TVipsWindow = record
      ref_count : longint;
      im : PVipsImage;
      top : longint;
      height : longint;
      data : PVipsPel;
      baseaddr : pointer;
      length : Tsize_t;
    end;

function vips_window_unref(window:PVipsWindow):longint;cdecl;external;
procedure vips_window_print(window:PVipsWindow);cdecl;external;
{ Per-thread buffer state. Held in a GPrivate.
  }
{ VipsImage -> VipsBufferCache*  }
{ Just for sanity checking  }
type
  PVipsBufferThread = ^TVipsBufferThread;
  TVipsBufferThread = record
      hash : PGHashTable;
      thread : PGThread;
    end;
{ Per-image buffer cache. This keeps a list of "done" VipsBuffer that this
 * worker has generated. We use this to reuse results within a thread.
 *
 * Hash to this from VipsBufferThread::hash.
 * We can't store the GSList directly in the hash table as GHashTable lacks an
 * update operation and we'd need to _remove() and _insert() on every list
 * operation.
  }
{ GSList of "done" VipsBuffer*  }
{ Just for sanity checking  }
{ VipsBuffer kept in reserve  }
{ Number in reserve  }

  PVipsBufferCache = ^TVipsBufferCache;
  TVipsBufferCache = record
      buffers : PGSList;
      thread : PGThread;
      im : PVipsImage;
      buffer_thread : PVipsBufferThread;
      reserve : PGSList;
      n_reserve : longint;
    end;
{ What we track for each pixel buffer. These can move between caches and
 * between threads, but not between images.
 *
 * Moving between threads is difficult, use region ownership stuff.
  }
{ # of regions referencing us  }
{ VipsImage we are attached to  }
{ Area this pixel buffer covers  }
{ Calculated and in a cache  }
{ The cache this buffer is published on  }
{ Private malloc() area  }
{ Size of private malloc()  }

  PVipsBuffer = ^TVipsBuffer;
  TVipsBuffer = record
      ref_count : longint;
      im : PVipsImage;
      area : TVipsRect;
      done : Tgboolean;
      cache : PVipsBufferCache;
      buf : PVipsPel;
      bsize : Tsize_t;
    end;

procedure vips_buffer_dump_all;cdecl;external;
procedure vips_buffer_done(buffer:PVipsBuffer);cdecl;external;
procedure vips_buffer_undone(buffer:PVipsBuffer);cdecl;external;
procedure vips_buffer_unref(buffer:PVipsBuffer);cdecl;external;
function vips_buffer_new(im:PVipsImage; area:PVipsRect):PVipsBuffer;cdecl;external;
function vips_buffer_ref(im:PVipsImage; area:PVipsRect):PVipsBuffer;cdecl;external;
function vips_buffer_unref_ref(buffer:PVipsBuffer; im:PVipsImage; area:PVipsRect):PVipsBuffer;cdecl;external;
procedure vips_buffer_print(buffer:PVipsBuffer);cdecl;external;
procedure vips__render_shutdown;cdecl;external;
{ Sections of region.h that are private to VIPS.
  }
{ Region types.
  }
{ A VipsBuffer  }
{ Memory on another region  }
{ Memory on another image  }
{ A VipsWindow on fd  }
type
  PRegionType = ^TRegionType;
  TRegionType =  Longint;
  Const
    VIPS_REGION_NONE = 0;
    VIPS_REGION_BUFFER = 1;
    VIPS_REGION_OTHER_REGION = 2;
    VIPS_REGION_OTHER_IMAGE = 3;
    VIPS_REGION_WINDOW = 4;
;
{ Private to iofuncs: the size of the `tiles' requested by
 * vips_image_generate() when acting as a data sink.
  }
  VIPS__TILE_WIDTH = 128;  
  VIPS__TILE_HEIGHT = 128;  
{ The height of the strips for the other two request styles.
  }
  VIPS__THINSTRIP_HEIGHT = 1;  
  VIPS__FATSTRIP_HEIGHT = 16;  
{ Functions on regions.
  }
type
  PVipsRegion = ^TVipsRegion;
  TVipsRegion = record
      {undefined structure}
    end;


procedure vips__region_take_ownership(reg:PVipsRegion);cdecl;external;
procedure vips__region_check_ownership(reg:PVipsRegion);cdecl;external;
{ TODO(kleisauke): extern is required by vipsdisp.
  }
procedure vips__region_no_ownership(reg:PVipsRegion);cdecl;external;
type

  TVipsRegionFillFn = function (para1:PVipsRegion; para2:pointer):longint;cdecl;
(* Const before type ignored *)

function vips_region_fill(reg:PVipsRegion; r:PVipsRect; fn:TVipsRegionFillFn; a:pointer):longint;cdecl;external;
function vips__image_wio_output(image:PVipsImage):longint;cdecl;external;
function vips__image_pio_output(image:PVipsImage):longint;cdecl;external;
{ VIPS_ARGUMENT_FOR_ALL() needs to have this visible.
  }
function vips__argument_get_instance(argument_class:PVipsArgumentClass; object:PVipsObject):PVipsArgumentInstance;cdecl;external;
function vips__argument_table_lookup(table:PVipsArgumentTable; pspec:PGParamSpec):PVipsArgument;cdecl;external;
{ im_demand_hint_array() needs to have this visible.
  }
{$if VIPS_ENABLE_DEPRECATED}
{$endif}

procedure vips__demand_hint_array(image:PVipsImage; hint:longint; in:PPVipsImage);cdecl;external;
{ im_cp_desc_array() needs to have this visible.
  }
{$if VIPS_ENABLE_DEPRECATED}
{$endif}

function vips__image_copy_fields_array(out:PVipsImage; in:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
procedure vips__region_count_pixels(region:PVipsRegion; nickname:Pchar);cdecl;external;
procedure vips_region_dump_all;cdecl;external;
(* Const before type ignored *)
function vips_region_prepare_many(reg:PPVipsRegion; r:PVipsRect):longint;cdecl;external;
{ Handy for debugging.
  }
function vips__view_image(image:PVipsImage):longint;cdecl;external;
{ Pre 8.7 libvipses used this for allocating argument ids.
  }
  var
    _vips__argument_id : longint;cvar;external;

procedure vips__meta_init;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_PRIVATE_H }

implementation


end.
