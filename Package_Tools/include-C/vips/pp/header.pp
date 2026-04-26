
unit header;
interface

{
  Automatically converted by H2Pas 1.0.0 from header.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    header.h
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
Pdouble  = ^double;
Pgchar  = ^gchar;
PGValue  = ^GValue;
Plongint  = ^longint;
Psize_t  = ^size_t;
PVipsImage  = ^VipsImage;
PVipsImageMapFn  = ^VipsImageMapFn;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ image header funcs
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
{$ifndef VIPS_HEADER_H}
{$define VIPS_HEADER_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{*
 * VIPS_META_EXIF_NAME:
 *
 * The name that read and write operations use for the image's EXIF data.
  }

const
  VIPS_META_EXIF_NAME = 'exif-data';  
{*
 * VIPS_META_XMP_NAME:
 *
 * The name that read and write operations use for the image's XMP data.
  }
  VIPS_META_XMP_NAME = 'xmp-data';  
{*
 * VIPS_META_IPTC_NAME:
 *
 * The name that read and write operations use for the image's IPTC data.
  }
  VIPS_META_IPTC_NAME = 'iptc-data';  
{*
 * VIPS_META_PHOTOSHOP_NAME:
 *
 * The name that TIFF read and write operations use for the image's
 * TIFFTAG_PHOTOSHOP data.
  }
  VIPS_META_PHOTOSHOP_NAME = 'photoshop-data';  
{*
 * VIPS_META_ICC_NAME:
 *
 * The name we use to attach an ICC profile. The file read and write
 * operations for TIFF, JPEG, PNG and others use this item of metadata to
 * attach and save ICC profiles. The profile is updated by the
 * vips_icc_transform() operations.
  }
  VIPS_META_ICC_NAME = 'icc-profile-data';  
{*
 * VIPS_META_IMAGEDESCRIPTION:
 *
 * The IMAGEDESCRIPTION tag. Often has useful metadata.
  }
  VIPS_META_IMAGEDESCRIPTION = 'image-description';  
{*
 * VIPS_META_RESOLUTION_UNIT:
 *
 * The JPEG and TIFF read and write operations use this to record the
 * file's preferred unit for resolution.
  }
  VIPS_META_RESOLUTION_UNIT = 'resolution-unit';  
{*
 * VIPS_META_BITS_PER_SAMPLE:
 *
 * The bits per sample for each channel.
  }
  VIPS_META_BITS_PER_SAMPLE = 'bits-per-sample';  
{*
 * VIPS_META_LOADER:
 *
 * Record the name of the original loader here. Handy for hinting file formats
 * and for debugging.
  }
  VIPS_META_LOADER = 'vips-loader';  
{*
 * VIPS_META_SEQUENTIAL:
 *
 * Images loaded via vips_sequential() have this int field defined. Some
 * operations (eg. vips_shrinkv()) add extra caches if they see it on their
 * input.
  }
  VIPS_META_SEQUENTIAL = 'vips-sequential';  
{*
 * VIPS_META_ORIENTATION:
 *
 * The orientation tag for this image. An int from 1 - 8 using the standard
 * exif/tiff meanings.
 *
 * * 1 - The 0th row represents the visual top of the image, and the 0th column
 *   represents the visual left-hand side.
 * * 2 - The 0th row represents the visual top of the image, and the 0th column
 *   represents the visual right-hand side.
 * * 3 - The 0th row represents the visual bottom of the image, and the 0th
 *   column represents the visual right-hand side.
 * * 4 - The 0th row represents the visual bottom of the image, and the 0th
 *   column represents the visual left-hand side.
 * * 5 - The 0th row represents the visual left-hand side of the image, and the
 *   0th column represents the visual top.
 * * 6 - The 0th row represents the visual right-hand side of the image, and the
 *   0th column represents the visual top.
 * * 7 - The 0th row represents the visual right-hand side of the image, and the
 *   0th column represents the visual bottom.
 * * 8 - The 0th row represents the visual left-hand side of the image, and the
 *   0th column represents the visual bottom.
  }
  VIPS_META_ORIENTATION = 'orientation';  
{*
 * VIPS_META_PAGE_HEIGHT:
 *
 * If set, the height of each page when this image was loaded. If you save an
 * image with "page-height" set to a format that supports multiple pages, such
 * as tiff, the image will be saved as a series of pages.
  }
  VIPS_META_PAGE_HEIGHT = 'page-height';  
{*
 * VIPS_META_N_PAGES:
 *
 * If set, the number of pages in the original file.
  }
  VIPS_META_N_PAGES = 'n-pages';  
{*
 * VIPS_META_N_SUBIFDS:
 *
 * If set, the number of subifds in the first page of the file.
  }
  VIPS_META_N_SUBIFDS = 'n-subifds';  
{*
 * VIPS_META_CONCURRENCY:
 *
 * If set, the suggested concurrency for this image.
  }
  VIPS_META_CONCURRENCY = 'concurrency';  

function vips_format_sizeof(format:TVipsBandFormat):Tguint64;cdecl;external;
function vips_format_sizeof_unsafe(format:TVipsBandFormat):Tguint64;cdecl;external;
function vips_interpretation_max_alpha(interpretation:TVipsInterpretation):Tdouble;cdecl;external;
(* Const before type ignored *)
function vips_image_get_width(image:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_get_height(image:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_get_bands(image:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_get_format(image:PVipsImage):TVipsBandFormat;cdecl;external;
function vips_image_get_format_max(format:TVipsBandFormat):Tdouble;cdecl;external;
(* Const before type ignored *)
function vips_image_guess_format(image:PVipsImage):TVipsBandFormat;cdecl;external;
(* Const before type ignored *)
function vips_image_get_coding(image:PVipsImage):TVipsCoding;cdecl;external;
(* Const before type ignored *)
function vips_image_get_interpretation(image:PVipsImage):TVipsInterpretation;cdecl;external;
(* Const before type ignored *)
function vips_image_guess_interpretation(image:PVipsImage):TVipsInterpretation;cdecl;external;
(* Const before type ignored *)
function vips_image_get_xres(image:PVipsImage):Tdouble;cdecl;external;
(* Const before type ignored *)
function vips_image_get_yres(image:PVipsImage):Tdouble;cdecl;external;
(* Const before type ignored *)
function vips_image_get_xoffset(image:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_get_yoffset(image:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_filename(image:PVipsImage):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_mode(image:PVipsImage):Pchar;cdecl;external;
(* Const before type ignored *)
function vips_image_get_scale(image:PVipsImage):Tdouble;cdecl;external;
(* Const before type ignored *)
function vips_image_get_offset(image:PVipsImage):Tdouble;cdecl;external;
function vips_image_get_page_height(image:PVipsImage):longint;cdecl;external;
function vips_image_get_n_pages(image:PVipsImage):longint;cdecl;external;
function vips_image_get_n_subifds(image:PVipsImage):longint;cdecl;external;
function vips_image_get_orientation(image:PVipsImage):longint;cdecl;external;
function vips_image_get_orientation_swap(image:PVipsImage):Tgboolean;cdecl;external;
function vips_image_get_concurrency(image:PVipsImage; default_concurrency:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_get_data(image:PVipsImage):pointer;cdecl;external;
procedure vips_image_init_fields(image:PVipsImage; xsize:longint; ysize:longint; bands:longint; format:TVipsBandFormat; 
            coding:TVipsCoding; interpretation:TVipsInterpretation; xres:Tdouble; yres:Tdouble);cdecl;external;
(* Const before type ignored *)
procedure vips_image_set(image:PVipsImage; name:Pchar; value:PGValue);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get(image:PVipsImage; name:Pchar; value_copy:PGValue):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_as_string(image:PVipsImage; name:Pchar; out:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_typeof(image:PVipsImage; name:Pchar):TGType;cdecl;external;
(* Const before type ignored *)
function vips_image_remove(image:PVipsImage; name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
type
  PVipsImageMapFn = ^TVipsImageMapFn;
  TVipsImageMapFn = function (image:PVipsImage; name:Pchar; value:PGValue; a:pointer):pointer;cdecl;

function vips_image_map(image:PVipsImage; fn:TVipsImageMapFn; a:pointer):pointer;cdecl;external;
function vips_image_get_fields(image:PVipsImage):^Pgchar;cdecl;external;
(* Const before type ignored *)
procedure vips_image_set_area(image:PVipsImage; name:Pchar; free_fn:TVipsCallbackFn; data:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_area(image:PVipsImage; name:Pchar; data:Ppointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_image_set_blob(image:PVipsImage; name:Pchar; free_fn:TVipsCallbackFn; data:pointer; length:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_image_set_blob_copy(image:PVipsImage; name:Pchar; data:pointer; length:Tsize_t);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_blob(image:PVipsImage; name:Pchar; data:Ppointer; length:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_int(image:PVipsImage; name:Pchar; out:Plongint):longint;cdecl;external;
(* Const before type ignored *)
procedure vips_image_set_int(image:PVipsImage; name:Pchar; i:longint);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_double(image:PVipsImage; name:Pchar; out:Pdouble):longint;cdecl;external;
(* Const before type ignored *)
procedure vips_image_set_double(image:PVipsImage; name:Pchar; d:Tdouble);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_string(image:PVipsImage; name:Pchar; out:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_image_set_string(image:PVipsImage; name:Pchar; str:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_image_print_field(image:PVipsImage; name:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_get_image(image:PVipsImage; name:Pchar; out:PPVipsImage):longint;cdecl;external;
(* Const before type ignored *)
procedure vips_image_set_image(image:PVipsImage; name:Pchar; im:PVipsImage);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_image_set_array_int(image:PVipsImage; name:Pchar; array:Plongint; n:longint);cdecl;external;
(* Const before type ignored *)
function vips_image_get_array_int(image:PVipsImage; name:Pchar; out:PPlongint; n:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_get_array_double(image:PVipsImage; name:Pchar; out:PPdouble; n:Plongint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure vips_image_set_array_double(image:PVipsImage; name:Pchar; array:Pdouble; n:longint);cdecl;external;
(* Const before type ignored *)
function vips_image_history_printf(image:PVipsImage; format:Pchar; args:array of const):longint;cdecl;external;
function vips_image_history_printf(image:PVipsImage; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_history_args(image:PVipsImage; name:Pchar; argc:longint; argv:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_get_history(image:PVipsImage):Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_HEADER_H }

implementation


end.
