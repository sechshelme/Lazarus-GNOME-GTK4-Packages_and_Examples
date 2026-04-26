unit foreign;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Base type for supported image formats. Subclass this to add a new
 * format.
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
{$ifndef VIPS_FOREIGN_H}
{$define VIPS_FOREIGN_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/object.h>}
{$include <vips/operation.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }

{< public > }
type
  PVipsForeign = ^TVipsForeign;
  TVipsForeign = record
      parent_object : TVipsOperation;
    end;
{< public > }
{ Loop over formats in this order, default 0. We need this because
	 * some formats can be read by several loaders (eg. tiff can be read
	 * by the libMagick loader as well as by the tiff loader), and we want
	 * to make sure the better loader comes first.
	  }
{ Null-terminated list of recommended suffixes, eg. ".tif", ".tiff".
	 * This can be used by both load and save, so it's in the base class.
	  }

  PVipsForeignClass = ^TVipsForeignClass;
  TVipsForeignClass = record
      parent_class : TVipsOperationClass;
      priority : longint;
      suffs : ^Pchar;
    end;
{ Don't put spaces around void here, it breaks gtk-doc.
  }

function vips_foreign_get_type:TGType;cdecl;external libvips;
{ Map over and find formats. This uses type introspection to loop over
 * subclasses of VipsForeign.
  }
function vips_foreign_map(base:Pchar; fn:TVipsSListMap2Fn; a:pointer; b:pointer):pointer;cdecl;external libvips;
{ Image file load properties.
 *
 * Keep in sync with the deprecated VipsFormatFlags, we need to be able to
 * cast between them.
  }
{< flags > }{ No flags set  }
{ Lazy read OK (eg. tiled tiff)  }
{ Most-significant byte first  }
{ Top-to-bottom lazy read OK  }
{ All flags set  }
type
  PVipsForeignFlags = ^TVipsForeignFlags;
  TVipsForeignFlags =  Longint;
  Const
    VIPS_FOREIGN_NONE = 0;
    VIPS_FOREIGN_PARTIAL = 1;
    VIPS_FOREIGN_BIGENDIAN = 2;
    VIPS_FOREIGN_SEQUENTIAL = 4;
    VIPS_FOREIGN_ALL = 7;
;
{*
 * VipsFailOn:
 * @VIPS_FAIL_ON_NONE: never stop
 * @VIPS_FAIL_ON_TRUNCATED: stop on image truncated, nothing else
 * @VIPS_FAIL_ON_ERROR: stop on serious error or truncation
 * @VIPS_FAIL_ON_WARNING: stop on anything, even warnings
 *
 * How sensitive loaders are to errors, from never stop (very insensitive), to
 * stop on the smallest warning (very sensitive).
 *
 * Each one implies the ones before it, so #VIPS_FAIL_ON_ERROR implies
 * #VIPS_FAIL_ON_TRUNCATED.
  }
type
  PVipsFailOn = ^TVipsFailOn;
  TVipsFailOn =  Longint;
  Const
    VIPS_FAIL_ON_NONE = 0;
    VIPS_FAIL_ON_TRUNCATED = 1;
    VIPS_FAIL_ON_ERROR = 2;
    VIPS_FAIL_ON_WARNING = 3;
    VIPS_FAIL_ON_LAST = 4;
;

{ was #define dname def_expr }
function VIPS_TYPE_FOREIGN_LOAD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_LOAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_LOAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FOREIGN_LOAD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FOREIGN_LOAD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_LOAD_GET_CLASS(obj : longint) : longint;

{< private > }
{ Set TRUE to force open via memory.
	  }
{ Type of access upstream wants and the loader must supply.
	  }
{ Flags for this load operation.
	  }
{ Behaviour on error.
	  }
{ Deprecated and unused. Just here for compat.
	  }
{< public > }
{ The image we generate. This must be set by ->header().
	  }
{ The behind-the-scenes real image we decompress to. This can be a
	 * disc file or a memory buffer. This must be set by ->load().
	  }
{ Set this to tag the operation as nocache.
	  }
{ Deprecated: the memory option used to be called disc and default
	 * TRUE.
	  }
{ Set if a start function fails. We want to prevent the other starts
	 * from also triggering the load.
	  }
{ Set by "revalidate": set the REVALIDATE flag for this operation to
	 * force it to execute.
	  }
type
  PVipsForeignLoad = ^TVipsForeignLoad;
  TVipsForeignLoad = record
      parent_object : TVipsForeign;
      memory : Tgboolean;
      access : TVipsAccess;
      flags : TVipsForeignFlags;
      fail_on : TVipsFailOn;
      fail : Tgboolean;
      sequential : Tgboolean;
      out : PVipsImage;
      real : PVipsImage;
      nocache : Tgboolean;
      disc : Tgboolean;
      error : Tgboolean;
      revalidate : Tgboolean;
    end;
{< public > }
{ Is a file in this format.
	 *
	 * This function should return %TRUE if the file contains an image of
	 * this type. If you don't define this function, #VipsForeignLoad
	 * will use @suffs instead.
	  }
{ Is a buffer in this format.
	 *
	 * This function should return %TRUE if the buffer contains an image of
	 * this type.
	  }
{ Is a stream in this format.
	 *
	 * This function should return %TRUE if the stream contains an image of
	 * this type.
	  }
{ Get the flags from a filename.
	 *
	 * This function should examine the file and return a set
	 * of flags. If you don't define it, vips will default to 0 (no flags
	 * set).
	 *
	 * This method is necessary for vips7 compatibility. Don't define
	 * it if you don't need vips7.
	  }
{ Get the flags for this load operation. Images can be loaded from
	 * (for example) memory areas rather than files, so you can't just use
	 * @get_flags_filename().
	  }
{ Do the minimum read we can.
	 *
	 * Set the header fields in @out from @filename. If you can read the
	 * whole image as well with no performance cost (as with vipsload),
	 * or if your loader does not support reading only the header, read
	 * the entire image in this method and leave @load() NULL.
	 *
	 * @header() needs to set the dhint on the image .. otherwise you get
	 * the default SMALLTILE.
	 *
	 * Return 0 for success, -1 for error, setting vips_error().
	  }
{ Read the whole image into @real. The pixels will get copied to @out
	 * later.
	 *
	 * You can omit this method if you define a @header() method which
	 * loads the whole file.
	 *
	 * Return 0 for success, -1 for error, setting
	 * vips_error().
	  }

  PVipsForeignLoadClass = ^TVipsForeignLoadClass;
  TVipsForeignLoadClass = record
      parent_class : TVipsForeignClass;
      is_a : function (filename:Pchar):Tgboolean;cdecl;
      is_a_buffer : function (data:pointer; size:Tsize_t):Tgboolean;cdecl;
      is_a_source : function (source:PVipsSource):Tgboolean;cdecl;
      get_flags_filename : function (filename:Pchar):TVipsForeignFlags;cdecl;
      get_flags : function (load:PVipsForeignLoad):TVipsForeignFlags;cdecl;
      header : function (load:PVipsForeignLoad):longint;cdecl;
      load : function (load:PVipsForeignLoad):longint;cdecl;
    end;
{ Don't put spaces around void here, it breaks gtk-doc.
  }

function vips_foreign_load_get_type:TGType;cdecl;external libvips;
function vips_foreign_find_load(filename:Pchar):Pchar;cdecl;external libvips;
function vips_foreign_find_load_buffer(data:pointer; size:Tsize_t):Pchar;cdecl;external libvips;
function vips_foreign_find_load_source(source:PVipsSource):Pchar;cdecl;external libvips;
function vips_foreign_flags(loader:Pchar; filename:Pchar):TVipsForeignFlags;cdecl;external libvips;
function vips_foreign_is_a(loader:Pchar; filename:Pchar):Tgboolean;cdecl;external libvips;
function vips_foreign_is_a_buffer(loader:Pchar; data:pointer; size:Tsize_t):Tgboolean;cdecl;external libvips;
function vips_foreign_is_a_source(loader:Pchar; source:PVipsSource):Tgboolean;cdecl;external libvips;
procedure vips_foreign_load_invalidate(image:PVipsImage);cdecl;external libvips;
{ was #define dname def_expr }
function VIPS_TYPE_FOREIGN_SAVE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_SAVE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_SAVE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FOREIGN_SAVE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FOREIGN_SAVE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_SAVE_GET_CLASS(obj : longint) : longint;

{*
 * VipsSaveable:
 * @VIPS_SAVEABLE_MONO: 1 band (eg. CSV)
 * @VIPS_SAVEABLE_RGB: 1 or 3 bands (eg. PPM)
 * @VIPS_SAVEABLE_RGBA: 1, 2, 3 or 4 bands (eg. PNG)
 * @VIPS_SAVEABLE_RGBA_ONLY: 3 or 4 bands (eg. WEBP)
 * @VIPS_SAVEABLE_RGB_CMYK: 1, 3 or 4 bands (eg. JPEG)
 * @VIPS_SAVEABLE_ANY: any number of bands (eg. TIFF)
 *
 * See also: #VipsForeignSave.
  }
type
  PVipsSaveable = ^TVipsSaveable;
  TVipsSaveable =  Longint;
  Const
    VIPS_SAVEABLE_MONO = 0;
    VIPS_SAVEABLE_RGB = 1;
    VIPS_SAVEABLE_RGBA = 2;
    VIPS_SAVEABLE_RGBA_ONLY = 3;
    VIPS_SAVEABLE_RGB_CMYK = 4;
    VIPS_SAVEABLE_ANY = 5;
    VIPS_SAVEABLE_LAST = 6;
;
{*
 * VipsForeignKeep:
 * @VIPS_FOREIGN_KEEP_NONE: don't attach metadata
 * @VIPS_FOREIGN_KEEP_EXIF: keep Exif metadata
 * @VIPS_FOREIGN_KEEP_XMP: keep XMP metadata
 * @VIPS_FOREIGN_KEEP_IPTC: keep IPTC metadata
 * @VIPS_FOREIGN_KEEP_ICC: keep ICC metadata
 * @VIPS_FOREIGN_KEEP_OTHER: keep other metadata (e.g. PNG comments and some TIFF tags)
 * @VIPS_FOREIGN_KEEP_ALL: keep all metadata
 *
 * Which metadata to retain.
  }
{< flags > }type
  PVipsForeignKeep = ^TVipsForeignKeep;
  TVipsForeignKeep =  Longint;
  Const
    VIPS_FOREIGN_KEEP_NONE = 0;
    VIPS_FOREIGN_KEEP_EXIF = 1 shl 0;
    VIPS_FOREIGN_KEEP_XMP = 1 shl 1;
    VIPS_FOREIGN_KEEP_IPTC = 1 shl 2;
    VIPS_FOREIGN_KEEP_ICC = 1 shl 3;
    VIPS_FOREIGN_KEEP_OTHER = 1 shl 4;
    VIPS_FOREIGN_KEEP_ALL = (((VIPS_FOREIGN_KEEP_EXIF or VIPS_FOREIGN_KEEP_XMP) or VIPS_FOREIGN_KEEP_IPTC) or VIPS_FOREIGN_KEEP_ICC) or VIPS_FOREIGN_KEEP_OTHER;
;
{ Deprecated in favor of [keep=none]
	  }
{ Which metadata to retain.
	  }
{ Filename of profile to embed.
	  }
{ If flattening out alpha, the background colour to use. Default to
	 * 0 (black).
	  }
{ Set to non-zero to set the page size for multi-page save.
	  }
{< public > }
{ The image we are to save, as supplied by our caller.
	  }
{ @in converted to a saveable format (eg. 8-bit RGB) according to the
	 * instructions you give in the class fields below.
	 *
	 * This is the image you should actually write to the output.
	  }
type
  PVipsForeignSave = ^TVipsForeignSave;
  TVipsForeignSave = record
      parent_object : TVipsForeign;
      strip : Tgboolean;
      keep : TVipsForeignKeep;
      profile : Pchar;
      background : PVipsArrayDouble;
      page_height : longint;
      in : PVipsImage;
      ready : PVipsImage;
    end;
{< public > }
{ How this format treats bands.
	 *
	 * @saveable describes the bands that your saver can handle. For
	 * example, PPM images can have 1 or 3 bands (mono or RGB), so it
	 * uses #VIPS_SAVEABLE_RGB.
	  }
{ How this format treats band formats.
	 *
	 * @format_table describes the band formats that your saver can
	 * handle. For each of the 10 #VipsBandFormat values, the array
	 * should give the format your saver will accept.
	  }
{ The set of coding types this format can save. For example, jpeg can
	 * only save NONE, so has NONE TRUE and RAD and LABQ FALSE.
	 *
	 * Default NONE TRUE, RAD and LABQ FALSE.
	  }

  PVipsForeignSaveClass = ^TVipsForeignSaveClass;
  TVipsForeignSaveClass = record
      parent_class : TVipsForeignClass;
      saveable : TVipsSaveable;
      format_table : PVipsBandFormat;
      coding : array[0..(VIPS_CODING_LAST)-1] of Tgboolean;
    end;
{ Don't put spaces around void here, it breaks gtk-doc.
  }

function vips_foreign_save_get_type:TGType;cdecl;external libvips;
function vips_foreign_find_save(filename:Pchar):Pchar;cdecl;external libvips;
function vips_foreign_get_suffixes:^Pgchar;cdecl;external libvips;
function vips_foreign_find_save_buffer(suffix:Pchar):Pchar;cdecl;external libvips;
function vips_foreign_find_save_target(suffix:Pchar):Pchar;cdecl;external libvips;
function vips_vipsload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_vipsload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_vipsload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_vipsload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_vipssave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_vipssave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_vipssave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_vipssave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_openslideload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_openslideload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_openslideload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_openslideload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
{*
 * VipsForeignSubsample:
 * @VIPS_FOREIGN_SUBSAMPLE_AUTO: prevent subsampling when quality >= 90
 * @VIPS_FOREIGN_SUBSAMPLE_ON: always perform subsampling
 * @VIPS_FOREIGN_SUBSAMPLE_OFF: never perform subsampling
 *
 * Set subsampling mode.
  }
type
  PVipsForeignSubsample = ^TVipsForeignSubsample;
  TVipsForeignSubsample =  Longint;
  Const
    VIPS_FOREIGN_SUBSAMPLE_AUTO = 0;
    VIPS_FOREIGN_SUBSAMPLE_ON = 1;
    VIPS_FOREIGN_SUBSAMPLE_OFF = 2;
    VIPS_FOREIGN_SUBSAMPLE_LAST = 3;
;
{*
 * VipsForeignJpegSubsample:
 * @VIPS_FOREIGN_JPEG_SUBSAMPLE_AUTO: default preset
 * @VIPS_FOREIGN_JPEG_SUBSAMPLE_ON: always perform subsampling
 * @VIPS_FOREIGN_JPEG_SUBSAMPLE_OFF: never perform subsampling
 *
 * Set jpeg subsampling mode.
 *
 * DEPRECATED: use #VipsForeignSubsample
  }
type
  PVipsForeignJpegSubsample = ^TVipsForeignJpegSubsample;
  TVipsForeignJpegSubsample =  Longint;
  Const
    VIPS_FOREIGN_JPEG_SUBSAMPLE_AUTO = 0;
    VIPS_FOREIGN_JPEG_SUBSAMPLE_ON = 1;
    VIPS_FOREIGN_JPEG_SUBSAMPLE_OFF = 2;
    VIPS_FOREIGN_JPEG_SUBSAMPLE_LAST = 3;
;

function vips_jpegload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jpegload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_jpegload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jpegload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_jpegload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jpegload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_jpegsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_jpegsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_jpegsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_jpegsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_jpegsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_jpegsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
function vips_jpegsave_mime(in:PVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jpegsave_mime(in:PVipsImage):longint;cdecl;external libvips;
{*
 * VipsForeignWebpPreset:
 * @VIPS_FOREIGN_WEBP_PRESET_DEFAULT: default preset
 * @VIPS_FOREIGN_WEBP_PRESET_PICTURE: digital picture, like portrait, inner shot
 * @VIPS_FOREIGN_WEBP_PRESET_PHOTO: outdoor photograph, with natural lighting
 * @VIPS_FOREIGN_WEBP_PRESET_DRAWING: hand or line drawing, with high-contrast details
 * @VIPS_FOREIGN_WEBP_PRESET_ICON: small-sized colorful images
 * @VIPS_FOREIGN_WEBP_PRESET_TEXT: text-like
 *
 * Tune lossy encoder settings for different image types.
  }
type
  PVipsForeignWebpPreset = ^TVipsForeignWebpPreset;
  TVipsForeignWebpPreset =  Longint;
  Const
    VIPS_FOREIGN_WEBP_PRESET_DEFAULT = 0;
    VIPS_FOREIGN_WEBP_PRESET_PICTURE = 1;
    VIPS_FOREIGN_WEBP_PRESET_PHOTO = 2;
    VIPS_FOREIGN_WEBP_PRESET_DRAWING = 3;
    VIPS_FOREIGN_WEBP_PRESET_ICON = 4;
    VIPS_FOREIGN_WEBP_PRESET_TEXT = 5;
    VIPS_FOREIGN_WEBP_PRESET_LAST = 6;
;

function vips_webpload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_webpload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_webpload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_webpload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_webpload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_webpload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_webpsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_webpsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_webpsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_webpsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_webpsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_webpsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
function vips_webpsave_mime(in:PVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_webpsave_mime(in:PVipsImage):longint;cdecl;external libvips;
{*
 * VipsForeignTiffCompression:
 * @VIPS_FOREIGN_TIFF_COMPRESSION_NONE: no compression
 * @VIPS_FOREIGN_TIFF_COMPRESSION_JPEG: jpeg compression
 * @VIPS_FOREIGN_TIFF_COMPRESSION_DEFLATE: deflate (zip) compression
 * @VIPS_FOREIGN_TIFF_COMPRESSION_PACKBITS: packbits compression
 * @VIPS_FOREIGN_TIFF_COMPRESSION_CCITTFAX4: fax4 compression
 * @VIPS_FOREIGN_TIFF_COMPRESSION_LZW: LZW compression
 * @VIPS_FOREIGN_TIFF_COMPRESSION_WEBP: WEBP compression
 * @VIPS_FOREIGN_TIFF_COMPRESSION_ZSTD: ZSTD compression
 * @VIPS_FOREIGN_TIFF_COMPRESSION_JP2K: JP2K compression
 *
 * The compression types supported by the tiff writer.
 *
 * Use @Q to set the jpeg compression level, default 75.
 *
 * Use @predictor to set the lzw or deflate prediction, default horizontal.
 *
 * Use @lossless to set WEBP lossless compression.
 *
 * Use @level to set webp and zstd compression level.
  }
type
  PVipsForeignTiffCompression = ^TVipsForeignTiffCompression;
  TVipsForeignTiffCompression =  Longint;
  Const
    VIPS_FOREIGN_TIFF_COMPRESSION_NONE = 0;
    VIPS_FOREIGN_TIFF_COMPRESSION_JPEG = 1;
    VIPS_FOREIGN_TIFF_COMPRESSION_DEFLATE = 2;
    VIPS_FOREIGN_TIFF_COMPRESSION_PACKBITS = 3;
    VIPS_FOREIGN_TIFF_COMPRESSION_CCITTFAX4 = 4;
    VIPS_FOREIGN_TIFF_COMPRESSION_LZW = 5;
    VIPS_FOREIGN_TIFF_COMPRESSION_WEBP = 6;
    VIPS_FOREIGN_TIFF_COMPRESSION_ZSTD = 7;
    VIPS_FOREIGN_TIFF_COMPRESSION_JP2K = 8;
    VIPS_FOREIGN_TIFF_COMPRESSION_LAST = 9;
;
{*
 * VipsForeignTiffPredictor:
 * @VIPS_FOREIGN_TIFF_PREDICTOR_NONE: no prediction
 * @VIPS_FOREIGN_TIFF_PREDICTOR_HORIZONTAL: horizontal differencing
 * @VIPS_FOREIGN_TIFF_PREDICTOR_FLOAT: float predictor
 *
 * The predictor can help deflate and lzw compression. The values are fixed by
 * the tiff library.
  }
type
  PVipsForeignTiffPredictor = ^TVipsForeignTiffPredictor;
  TVipsForeignTiffPredictor =  Longint;
  Const
    VIPS_FOREIGN_TIFF_PREDICTOR_NONE = 1;
    VIPS_FOREIGN_TIFF_PREDICTOR_HORIZONTAL = 2;
    VIPS_FOREIGN_TIFF_PREDICTOR_FLOAT = 3;
    VIPS_FOREIGN_TIFF_PREDICTOR_LAST = 4;
;
{*
 * VipsForeignTiffResunit:
 * @VIPS_FOREIGN_TIFF_RESUNIT_CM: use centimeters
 * @VIPS_FOREIGN_TIFF_RESUNIT_INCH: use inches
 *
 * Use inches or centimeters as the resolution unit for a tiff file.
  }
type
  PVipsForeignTiffResunit = ^TVipsForeignTiffResunit;
  TVipsForeignTiffResunit =  Longint;
  Const
    VIPS_FOREIGN_TIFF_RESUNIT_CM = 0;
    VIPS_FOREIGN_TIFF_RESUNIT_INCH = 1;
    VIPS_FOREIGN_TIFF_RESUNIT_LAST = 2;
;

function vips_tiffload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_tiffload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_tiffload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_tiffload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_tiffload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_tiffload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_tiffsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_tiffsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_tiffsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_tiffsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
function vips_tiffsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_tiffsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_openexrload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_openexrload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_fitsload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_fitsload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_fitssave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_fitssave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_analyzeload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_analyzeload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_rawload(filename:Pchar; out:PPVipsImage; width:longint; height:longint; bands:longint; 
           args:array of const):longint;cdecl;external libvips;
function vips_rawload(filename:Pchar; out:PPVipsImage; width:longint; height:longint; bands:longint):longint;cdecl;external libvips;
function vips_rawsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_rawsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_rawsave_fd(in:PVipsImage; fd:longint; args:array of const):longint;cdecl;external libvips;
function vips_rawsave_fd(in:PVipsImage; fd:longint):longint;cdecl;external libvips;
function vips_csvload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_csvload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_csvload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_csvload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_csvsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_csvsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_csvsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_csvsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_matrixload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_matrixload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_matrixload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_matrixload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_matrixsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_matrixsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_matrixsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_matrixsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_matrixprint(in:PVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_matrixprint(in:PVipsImage):longint;cdecl;external libvips;
function vips_magickload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_magickload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_magickload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_magickload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_magicksave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_magicksave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_magicksave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_magicksave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
{*
 * VipsForeignPngFilter:
 * @VIPS_FOREIGN_PNG_FILTER_NONE: no filtering
 * @VIPS_FOREIGN_PNG_FILTER_SUB: difference to the left
 * @VIPS_FOREIGN_PNG_FILTER_UP: difference up
 * @VIPS_FOREIGN_PNG_FILTER_AVG: average of left and up
 * @VIPS_FOREIGN_PNG_FILTER_PAETH: pick best neighbor predictor automatically
 * @VIPS_FOREIGN_PNG_FILTER_ALL: adaptive
 *
 * http://www.w3.org/TR/PNG-Filters.html
 * The values mirror those of png.h in libpng.
  }
{< flags > }type
  PVipsForeignPngFilter = ^TVipsForeignPngFilter;
  TVipsForeignPngFilter =  Longint;
  Const
    VIPS_FOREIGN_PNG_FILTER_NONE = $08;
    VIPS_FOREIGN_PNG_FILTER_SUB = $10;
    VIPS_FOREIGN_PNG_FILTER_UP = $20;
    VIPS_FOREIGN_PNG_FILTER_AVG = $40;
    VIPS_FOREIGN_PNG_FILTER_PAETH = $80;
    VIPS_FOREIGN_PNG_FILTER_ALL = $F8;
;

function vips_pngload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_pngload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_pngload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_pngload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_pngload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_pngload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_pngsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_pngsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_pngsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_pngsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_pngsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_pngsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
{*
 * VipsForeignPpmFormat:
 * @VIPS_FOREIGN_PPM_FORMAT_PBM: portable bitmap
 * @VIPS_FOREIGN_PPM_FORMAT_PGM: portable greymap
 * @VIPS_FOREIGN_PPM_FORMAT_PPM: portable pixmap
 * @VIPS_FOREIGN_PPM_FORMAT_PFM: portable float map
 * @VIPS_FOREIGN_PPM_FORMAT_PNM: portable anymap
 *
 * The netpbm file format to save as.
 *
 * #VIPS_FOREIGN_PPM_FORMAT_PBM images are single bit.
 *
 * #VIPS_FOREIGN_PPM_FORMAT_PGM images are 8, 16, or 32-bits, one band.
 *
 * #VIPS_FOREIGN_PPM_FORMAT_PPM images are 8, 16, or 32-bits, three bands.
 *
 * #VIPS_FOREIGN_PPM_FORMAT_PFM images are 32-bit float pixels.
 *
 * #VIPS_FOREIGN_PPM_FORMAT_PNM images are anymap images -- the image format
 * is used to pick the saver.
 *
  }
type
  PVipsForeignPpmFormat = ^TVipsForeignPpmFormat;
  TVipsForeignPpmFormat =  Longint;
  Const
    VIPS_FOREIGN_PPM_FORMAT_PBM = 0;
    VIPS_FOREIGN_PPM_FORMAT_PGM = 1;
    VIPS_FOREIGN_PPM_FORMAT_PPM = 2;
    VIPS_FOREIGN_PPM_FORMAT_PFM = 3;
    VIPS_FOREIGN_PPM_FORMAT_PNM = 4;
    VIPS_FOREIGN_PPM_FORMAT_LAST = 5;
;

function vips_ppmload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_ppmload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_ppmload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_ppmload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_ppmsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_ppmsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_ppmsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_ppmsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_matload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_matload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_radload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_radload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_radload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_radload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_radload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_radload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_radsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_radsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_radsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_radsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
function vips_radsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_radsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_pdfload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_pdfload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_pdfload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_pdfload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_pdfload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_pdfload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_svgload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_svgload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_svgload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_svgload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_svgload_string(str:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_svgload_string(str:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_svgload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_svgload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_gifload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_gifload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_gifload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_gifload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_gifload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_gifload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_gifsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_gifsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_gifsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_gifsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
function vips_gifsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_gifsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_heifload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_heifload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_heifload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_heifload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_heifload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_heifload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_heifsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_heifsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_heifsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_heifsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
function vips_heifsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_heifsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_niftiload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_niftiload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_niftiload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_niftiload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_niftisave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_niftisave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_jp2kload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jp2kload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_jp2kload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jp2kload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_jp2kload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jp2kload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_jp2ksave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_jp2ksave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_jp2ksave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_jp2ksave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
function vips_jp2ksave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_jp2ksave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
function vips_jxlload_source(source:PVipsSource; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jxlload_source(source:PVipsSource; out:PPVipsImage):longint;cdecl;external libvips;
function vips_jxlload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jxlload_buffer(buf:pointer; len:Tsize_t; out:PPVipsImage):longint;cdecl;external libvips;
function vips_jxlload(filename:Pchar; out:PPVipsImage; args:array of const):longint;cdecl;external libvips;
function vips_jxlload(filename:Pchar; out:PPVipsImage):longint;cdecl;external libvips;
function vips_jxlsave(in:PVipsImage; filename:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_jxlsave(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
function vips_jxlsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_jxlsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
function vips_jxlsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_jxlsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
{*
 * VipsForeignDzLayout:
 * @VIPS_FOREIGN_DZ_LAYOUT_DZ: use DeepZoom directory layout
 * @VIPS_FOREIGN_DZ_LAYOUT_ZOOMIFY: use Zoomify directory layout
 * @VIPS_FOREIGN_DZ_LAYOUT_GOOGLE: use Google maps directory layout
 * @VIPS_FOREIGN_DZ_LAYOUT_IIIF: use IIIF v2 directory layout
 * @VIPS_FOREIGN_DZ_LAYOUT_IIIF3: use IIIF v3 directory layout
 *
 * What directory layout and metadata standard to use.
  }
type
  PVipsForeignDzLayout = ^TVipsForeignDzLayout;
  TVipsForeignDzLayout =  Longint;
  Const
    VIPS_FOREIGN_DZ_LAYOUT_DZ = 0;
    VIPS_FOREIGN_DZ_LAYOUT_ZOOMIFY = 1;
    VIPS_FOREIGN_DZ_LAYOUT_GOOGLE = 2;
    VIPS_FOREIGN_DZ_LAYOUT_IIIF = 3;
    VIPS_FOREIGN_DZ_LAYOUT_IIIF3 = 4;
    VIPS_FOREIGN_DZ_LAYOUT_LAST = 5;
;
{*
 * VipsForeignDzDepth:
 * @VIPS_FOREIGN_DZ_DEPTH_ONEPIXEL: create layers down to 1x1 pixel
 * @VIPS_FOREIGN_DZ_DEPTH_ONETILE: create layers down to 1x1 tile
 * @VIPS_FOREIGN_DZ_DEPTH_ONE: only create a single layer
 *
 * How many pyramid layers to create.
  }
type
  PVipsForeignDzDepth = ^TVipsForeignDzDepth;
  TVipsForeignDzDepth =  Longint;
  Const
    VIPS_FOREIGN_DZ_DEPTH_ONEPIXEL = 0;
    VIPS_FOREIGN_DZ_DEPTH_ONETILE = 1;
    VIPS_FOREIGN_DZ_DEPTH_ONE = 2;
    VIPS_FOREIGN_DZ_DEPTH_LAST = 3;
;
{*
 * VipsForeignDzContainer:
 * @VIPS_FOREIGN_DZ_CONTAINER_FS: write tiles to the filesystem
 * @VIPS_FOREIGN_DZ_CONTAINER_ZIP: write tiles to a zip file
 * @VIPS_FOREIGN_DZ_CONTAINER_SZI: write to a szi file
 *
 * How many pyramid layers to create.
  }
type
  PVipsForeignDzContainer = ^TVipsForeignDzContainer;
  TVipsForeignDzContainer =  Longint;
  Const
    VIPS_FOREIGN_DZ_CONTAINER_FS = 0;
    VIPS_FOREIGN_DZ_CONTAINER_ZIP = 1;
    VIPS_FOREIGN_DZ_CONTAINER_SZI = 2;
    VIPS_FOREIGN_DZ_CONTAINER_LAST = 3;
;

function vips_dzsave(in:PVipsImage; name:Pchar; args:array of const):longint;cdecl;external libvips;
function vips_dzsave(in:PVipsImage; name:Pchar):longint;cdecl;external libvips;
function vips_dzsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t; args:array of const):longint;cdecl;external libvips;
function vips_dzsave_buffer(in:PVipsImage; buf:Ppointer; len:Psize_t):longint;cdecl;external libvips;
function vips_dzsave_target(in:PVipsImage; target:PVipsTarget; args:array of const):longint;cdecl;external libvips;
function vips_dzsave_target(in:PVipsImage; target:PVipsTarget):longint;cdecl;external libvips;
{*
 * VipsForeignHeifCompression:
 * @VIPS_FOREIGN_HEIF_COMPRESSION_HEVC: x265
 * @VIPS_FOREIGN_HEIF_COMPRESSION_AVC: x264
 * @VIPS_FOREIGN_HEIF_COMPRESSION_JPEG: jpeg
 * @VIPS_FOREIGN_HEIF_COMPRESSION_AV1: aom
 *
 * The compression format to use inside a HEIF container.
 *
 * This is assumed to use the same numbering as %heif_compression_format.
  }
type
  PVipsForeignHeifCompression = ^TVipsForeignHeifCompression;
  TVipsForeignHeifCompression =  Longint;
  Const
    VIPS_FOREIGN_HEIF_COMPRESSION_HEVC = 1;
    VIPS_FOREIGN_HEIF_COMPRESSION_AVC = 2;
    VIPS_FOREIGN_HEIF_COMPRESSION_JPEG = 3;
    VIPS_FOREIGN_HEIF_COMPRESSION_AV1 = 4;
    VIPS_FOREIGN_HEIF_COMPRESSION_LAST = 5;
;
{*
 * VipsForeignHeifEncoder:
 * @VIPS_FOREIGN_HEIF_ENCODER_AUTO: auto
 * @VIPS_FOREIGN_HEIF_ENCODER_AOM: aom
 * @VIPS_FOREIGN_HEIF_ENCODER_RAV1E: RAV1E
 * @VIPS_FOREIGN_HEIF_ENCODER_SVT: SVT-AV1
 * @VIPS_FOREIGN_HEIF_ENCODER_X265: x265
 *
 * The selected encoder to use.
 * If libheif hasn't been compiled with the selected encoder,
 * we will fallback to the default encoder for the compression format.
 *
  }
type
  PVipsForeignHeifEncoder = ^TVipsForeignHeifEncoder;
  TVipsForeignHeifEncoder =  Longint;
  Const
    VIPS_FOREIGN_HEIF_ENCODER_AUTO = 0;
    VIPS_FOREIGN_HEIF_ENCODER_AOM = 1;
    VIPS_FOREIGN_HEIF_ENCODER_RAV1E = 2;
    VIPS_FOREIGN_HEIF_ENCODER_SVT = 3;
    VIPS_FOREIGN_HEIF_ENCODER_X265 = 4;
    VIPS_FOREIGN_HEIF_ENCODER_LAST = 5;
;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_FOREIGN_H }

// === Konventiert am: 26-4-26 16:13:44 ===

function VIPS_TYPE_FOREIGN : TGType;
function VIPS_FOREIGN(obj : Pointer) : PVipsForeign;
function VIPS_FOREIGN_CLASS(klass : Pointer) : PVipsForeignClass;
function VIPS_IS_FOREIGN(obj : Pointer) : Tgboolean;
function VIPS_IS_FOREIGN_CLASS(klass : Pointer) : Tgboolean;
function VIPS_FOREIGN_GET_CLASS(obj : Pointer) : PVipsForeignClass;

implementation

function VIPS_TYPE_FOREIGN : TGType;
  begin
    VIPS_TYPE_FOREIGN:=vips_foreign_get_type;
  end;

function VIPS_FOREIGN(obj : Pointer) : PVipsForeign;
begin
  Result := PVipsForeign(g_type_check_instance_cast(obj, VIPS_TYPE_FOREIGN));
end;

function VIPS_FOREIGN_CLASS(klass : Pointer) : PVipsForeignClass;
begin
  Result := PVipsForeignClass(g_type_check_class_cast(klass, VIPS_TYPE_FOREIGN));
end;

function VIPS_IS_FOREIGN(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  VIPS_TYPE_FOREIGN);
end;

function VIPS_IS_FOREIGN_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  VIPS_TYPE_FOREIGN);
end;

function VIPS_FOREIGN_GET_CLASS(obj : Pointer) : PVipsForeignClass;
begin
  Result := PVipsForeignClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function VIPS_TYPE_FOREIGN_LOAD : longint; { return type might be wrong }
  begin
    VIPS_TYPE_FOREIGN_LOAD:=vips_foreign_load_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_LOAD(obj : longint) : longint;
begin
  VIPS_FOREIGN_LOAD:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_FOREIGN_LOAD,VipsForeignLoad);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_LOAD_CLASS(klass : longint) : longint;
begin
  VIPS_FOREIGN_LOAD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_FOREIGN_LOAD,VipsForeignLoadClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FOREIGN_LOAD(obj : longint) : longint;
begin
  VIPS_IS_FOREIGN_LOAD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_FOREIGN_LOAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FOREIGN_LOAD_CLASS(klass : longint) : longint;
begin
  VIPS_IS_FOREIGN_LOAD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_FOREIGN_LOAD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_LOAD_GET_CLASS(obj : longint) : longint;
begin
  VIPS_FOREIGN_LOAD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_FOREIGN_LOAD,VipsForeignLoadClass);
end;

{ was #define dname def_expr }
function VIPS_TYPE_FOREIGN_SAVE : longint; { return type might be wrong }
  begin
    VIPS_TYPE_FOREIGN_SAVE:=vips_foreign_save_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_SAVE(obj : longint) : longint;
begin
  VIPS_FOREIGN_SAVE:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_FOREIGN_SAVE,VipsForeignSave);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_SAVE_CLASS(klass : longint) : longint;
begin
  VIPS_FOREIGN_SAVE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_FOREIGN_SAVE,VipsForeignSaveClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FOREIGN_SAVE(obj : longint) : longint;
begin
  VIPS_IS_FOREIGN_SAVE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_FOREIGN_SAVE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FOREIGN_SAVE_CLASS(klass : longint) : longint;
begin
  VIPS_IS_FOREIGN_SAVE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_FOREIGN_SAVE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FOREIGN_SAVE_GET_CLASS(obj : longint) : longint;
begin
  VIPS_FOREIGN_SAVE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_FOREIGN_SAVE,VipsForeignSaveClass);
end;


end.
