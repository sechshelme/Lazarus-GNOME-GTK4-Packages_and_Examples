
unit image;
interface

{
  Automatically converted by H2Pas 1.0.0 from image.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    image.h
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
Pgboolean  = ^gboolean;
PGHashTable  = ^GHashTable;
PGMutex  = ^GMutex;
PGSList  = ^GSList;
PGTimer  = ^GTimer;
PGValue  = ^GValue;
Plongint  = ^longint;
Psize_t  = ^size_t;
PVipsAccess  = ^VipsAccess;
PVipsArrayImage  = ^VipsArrayImage;
PVipsBandFormat  = ^VipsBandFormat;
PVipsCoding  = ^VipsCoding;
PVipsDemandStyle  = ^VipsDemandStyle;
PVipsImage  = ^VipsImage;
PVipsImageClass  = ^VipsImageClass;
PVipsImageType  = ^VipsImageType;
PVipsInterpretation  = ^VipsInterpretation;
PVipsPel  = ^VipsPel;
PVipsProgress  = ^VipsProgress;
PVipsRect  = ^VipsRect;
PVipsRegion  = ^VipsRegion;
PVipsSource  = ^VipsSource;
PVipsStartFn  = ^VipsStartFn;
PVipsTarget  = ^VipsTarget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ VIPS image class.
 *
 * 7/7/09
 * 	- from vips.h
 * 2/3/11
 * 	- move to GObject
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
{$ifndef VIPS_IMAGE_H}
{$define VIPS_IMAGE_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/object.h>}
{$include <vips/connection.h>}
{$include <vips/rect.h>}
{$include <vips/region.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ If you read MSB first, you get these two values.
 * intel order: byte 0 = b6
 * SPARC order: byte 0 = 08
  }

const
  VIPS_MAGIC_INTEL = $b6a6f208;  
  VIPS_MAGIC_SPARC = $08f2a6b6;  
{ We have a maximum value for a coordinate at various points for sanity
 * checking. For example, vips_black() has a max with and height. We use int
 * for width/height so we could go up to 2bn, but it's good to have a lower
 * value set so we can see crazy numbers early.
 *
 * This was 1m for a while, but someone found a use for a 4m wide image.
  }
  VIPS_MAX_COORD = 10000000;  
type
  PVipsDemandStyle = ^TVipsDemandStyle;
  TVipsDemandStyle =  Longint;
  Const
    VIPS_DEMAND_STYLE_ERROR = -(1);
    VIPS_DEMAND_STYLE_SMALLTILE = (-(1))+1;
    VIPS_DEMAND_STYLE_FATSTRIP = (-(1))+2;
    VIPS_DEMAND_STYLE_THINSTRIP = (-(1))+3;
    VIPS_DEMAND_STYLE_ANY = (-(1))+4;
;
{ Types of image descriptor we may have. The type field is advisory only: it
 * does not imply that any fields in IMAGE have valid data.
  }
{ no type set  }
{ malloced memory array  }
{ memory array, don't free on close  }
{ input from fd with a window  }
{ memory mapped input file  }
{ memory mapped read/write file  }
{ output to fd  }
{ partial image  }
type
  PVipsImageType = ^TVipsImageType;
  TVipsImageType =  Longint;
  Const
    VIPS_IMAGE_ERROR = -(1);
    VIPS_IMAGE_NONE = (-(1))+1;
    VIPS_IMAGE_SETBUF = (-(1))+2;
    VIPS_IMAGE_SETBUF_FOREIGN = (-(1))+3;
    VIPS_IMAGE_OPENIN = (-(1))+4;
    VIPS_IMAGE_MMAPIN = (-(1))+5;
    VIPS_IMAGE_MMAPINRW = (-(1))+6;
    VIPS_IMAGE_OPENOUT = (-(1))+7;
    VIPS_IMAGE_PARTIAL = (-(1))+8;
;
type
  PVipsInterpretation = ^TVipsInterpretation;
  TVipsInterpretation =  Longint;
  Const
    VIPS_INTERPRETATION_ERROR = -(1);
    VIPS_INTERPRETATION_MULTIBAND = 0;
    VIPS_INTERPRETATION_B_W = 1;
    VIPS_INTERPRETATION_HISTOGRAM = 10;
    VIPS_INTERPRETATION_XYZ = 12;
    VIPS_INTERPRETATION_LAB = 13;
    VIPS_INTERPRETATION_CMYK = 15;
    VIPS_INTERPRETATION_LABQ = 16;
    VIPS_INTERPRETATION_RGB = 17;
    VIPS_INTERPRETATION_CMC = 18;
    VIPS_INTERPRETATION_LCH = 19;
    VIPS_INTERPRETATION_LABS = 21;
    VIPS_INTERPRETATION_sRGB = 22;
    VIPS_INTERPRETATION_YXY = 23;
    VIPS_INTERPRETATION_FOURIER = 24;
    VIPS_INTERPRETATION_RGB16 = 25;
    VIPS_INTERPRETATION_GREY16 = 26;
    VIPS_INTERPRETATION_MATRIX = 27;
    VIPS_INTERPRETATION_scRGB = 28;
    VIPS_INTERPRETATION_HSV = 29;
    VIPS_INTERPRETATION_LAST = 30;
;
type
  PVipsBandFormat = ^TVipsBandFormat;
  TVipsBandFormat =  Longint;
  Const
    VIPS_FORMAT_NOTSET = -(1);
    VIPS_FORMAT_UCHAR = 0;
    VIPS_FORMAT_CHAR = 1;
    VIPS_FORMAT_USHORT = 2;
    VIPS_FORMAT_SHORT = 3;
    VIPS_FORMAT_UINT = 4;
    VIPS_FORMAT_INT = 5;
    VIPS_FORMAT_FLOAT = 6;
    VIPS_FORMAT_COMPLEX = 7;
    VIPS_FORMAT_DOUBLE = 8;
    VIPS_FORMAT_DPCOMPLEX = 9;
    VIPS_FORMAT_LAST = 10;
;
type
  PVipsCoding = ^TVipsCoding;
  TVipsCoding =  Longint;
  Const
    VIPS_CODING_ERROR = -(1);
    VIPS_CODING_NONE = 0;
    VIPS_CODING_LABQ = 2;
    VIPS_CODING_RAD = 6;
    VIPS_CODING_LAST = 7;
;
type
  PVipsAccess = ^TVipsAccess;
  TVipsAccess =  Longint;
  Const
    VIPS_ACCESS_RANDOM = 0;
    VIPS_ACCESS_SEQUENTIAL = 1;
    VIPS_ACCESS_SEQUENTIAL_UNBUFFERED = 2;
    VIPS_ACCESS_LAST = 3;
;
type
  PVipsStartFn = ^TVipsStartFn;
  TVipsStartFn = function (out:PVipsImage; a:pointer; b:pointer):pointer;cdecl;

  TVipsGenerateFn = function (out:PVipsRegion; seq:pointer; a:pointer; b:pointer; stop:Pgboolean):longint;cdecl;

  TVipsStopFn = function (seq:pointer; a:pointer; b:pointer):longint;cdecl;
{ Struct we keep a record of execution time in. Passed to eval signal so
 * it can assess progress.
  }
{< private > }
{ Image we are part of  }
{< public > }
{ Time we have been running  }
{ Estimated seconds of computation left  }
{ Number of pels we expect to calculate  }
{ Number of pels calculated so far  }
{ Percent complete  }
{ Start time  }

  PVipsProgress = ^TVipsProgress;
  TVipsProgress = record
      im : PVipsImage;
      run : longint;
      eta : longint;
      tpels : Tgint64;
      npels : Tgint64;
      percent : longint;
      start : PGTimer;
    end;

{ was #define dname def_expr }
function VIPS_TYPE_IMAGE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IMAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IMAGE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_IMAGE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_IMAGE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IMAGE_GET_CLASS(obj : longint) : longint;

{ Matching typedef in basic.h.
  }
{< private > }
{ We have to keep these names for compatibility with the old API.
	 * Don't use them though, use vips_image_get_width() and friends.
	  }
{ image width, in pixels  }
{ image height, in pixels  }
{ number of image bands  }
{ pixel format  }
{ pixel coding  }
{ pixel interpretation  }
{ horizontal pixels per millimetre  }
{ vertical pixels per millimetre  }
{ image origin hint  }
{ image origin hint  }
{ No longer used, the names are here for compat with very, very old
	 * code.
	  }
{ was number of bits in this format  }
{ Old code expects to see this member, newer code has a param on
	 * eval().
	  }
{ Derived fields that some code can fiddle with. New code should use
	 * vips_image_get_history() and friends.
	  }
{ don't use, see vips_image_get_history()  }
{ pointer to copy of filename  }
{ start of image data for WIO  }
{ set to non-zero to block eval  }
{ Everything below this private and only used internally by
	 * VipsImage.
	  }
{ During vips image read and write we need temporary float-sized
	 * fields in the struct for staging xres/yres. Don't use these any
	 * other time.
	  }
{ mode string passed to _new()  }
{ descriptor type  }
{ file descriptor  }
{ pointer to the start of an mmap file  }
{ size of mmap area  }
{ magic from header, endian-ness of image  }
{ Partial image stuff. All these fields are initialised
	 * to NULL and ignored unless set by vips_image_generate() etc.
	  }
{ user arguments  }
{ start-stop lock  }
{ list of regions current for this image  }
{ demand style hint  }
{ Extra user-defined fields ... see vips_image_get() etc.
	  }
{ GhashTable of GValue  }
{ traverse order for Meta  }
{ Part of mmap() read ... the sizeof() the header we skip from the
	 * file start. Usually VIPS_SIZEOF_HEADER, but can be something else
	 * for binary file read.
	 *
	 * guint64 so that we can guarantee to work even on systems with
	 * strange ideas about large files.
	  }
{ If this is a large disc image, don't map the whole thing, instead
	 * have a set of windows shared between the regions active on the
	 * image. List of VipsWindow.
	  }
{ Upstream/downstream relationships, built from args to
	 * vips_demand_hint().
	 *
	 * We use these to invalidate downstream pixel buffers.
	 * Use 'serial' to spot circular dependencies.
	 *
	 * See also hint_set below.
	  }
{ Keep a list of recounted GValue strings so we can share hist
	 * efficiently.
	  }
{ The VipsImage (if any) we should signal eval progress on.
	  }
{ Record the file length here. We use this to stop ourselves mapping
	 * things beyond the end of the file in the case that the file has
	 * been truncated.
	 *
	 * gint64 so that we can guarantee to work even on systems with
	 * strange ideas about large files.
	  }
{ Set this when vips_demand_hint_array() is called, and check in any
	 * operation that will demand pixels from the image.
	 *
	 * We use vips_demand_hint_array() to build the tree of
	 * upstream/downstream relationships, so it's a mandatory thing.
	  }
{ Delete-on-close is hard to do with signals and callbacks since we
	 * really need to do this in finalize after the fd has been closed,
	 * but you can't emit signals then.
	 *
	 * Also keep a private copy of the filename string to be deleted,
	 * since image->filename will be freed in _dispose().
	  }
type
  PVipsImage = ^TVipsImage;
  TVipsImage = record
      parent_instance : TVipsObject;
      Xsize : longint;
      Ysize : longint;
      Bands : longint;
      BandFmt : TVipsBandFormat;
      Coding : TVipsCoding;
      _Type : TVipsInterpretation;
      Xres : Tdouble;
      Yres : Tdouble;
      Xoffset : longint;
      Yoffset : longint;
      Length : longint;
      Compression : smallint;
      Level : smallint;
      Bbits : longint;
      time : PVipsProgress;
      Hist : Pchar;
      filename : Pchar;
      data : PVipsPel;
      kill : longint;
      Xres_float : single;
      Yres_float : single;
      mode : Pchar;
      dtype : TVipsImageType;
      fd : longint;
      baseaddr : pointer;
      length : Tsize_t;
      magic : Tguint32;
      start_fn : TVipsStartFn;
      generate_fn : TVipsGenerateFn;
      stop_fn : TVipsStopFn;
      client1 : pointer;
      client2 : pointer;
      sslock : PGMutex;
      regions : PGSList;
      dhint : TVipsDemandStyle;
      meta : PGHashTable;
      meta_traverse : PGSList;
      sizeof_header : Tgint64;
      windows : PGSList;
      upstream : PGSList;
      downstream : PGSList;
      serial : longint;
      history_list : PGSList;
      progress_signal : PVipsImage;
      file_length : Tgint64;
      hint_set : Tgboolean;
      delete_on_close : Tgboolean;
      delete_on_close_filename : Pchar;
    end;

{ Signals we emit.
	  }
{ Evaluation is starting.
	  }
{ Evaluation progress.
	  }
{ Evaluation is ending.
	  }
{ An image has been written to.
	 * Used by eg. vips_image_new_mode("x.jpg", "w") to do the
	 * final write to jpeg.
	 * Set *result to non-zero to indicate an error on write.
	  }
{ An image has been modified in some way and all caches
	 * need dropping.
	  }
{ Minimise this pipeline.
	 *
	 * This is triggered (sometimes) at the end of eval to signal that
	 * we're probably done and that operations involved should try to
	 * minimise memory use by, for example, dropping caches.
	 *
	 * See vips_tilecache().
	  }

  PVipsImageClass = ^TVipsImageClass;
  TVipsImageClass = record
      parent_class : TVipsObjectClass;
      preeval : procedure (image:PVipsImage; progress:PVipsProgress; data:pointer);cdecl;
      eval : procedure (image:PVipsImage; progress:PVipsProgress; data:pointer);cdecl;
      posteval : procedure (image:PVipsImage; progress:PVipsProgress; data:pointer);cdecl;
      written : procedure (image:PVipsImage; result:Plongint; data:pointer);cdecl;
      invalidate : procedure (image:PVipsImage; data:pointer);cdecl;
      minimise : procedure (image:PVipsImage; data:pointer);cdecl;
    end;
{ Don't put spaces around void here, it breaks gtk-doc.
  }

function vips_image_get_type:TGType;cdecl;external;
{ Has to be guint64 and not size_t/off_t since we have to be able to address
 * huge images on platforms with 32-bit files.
  }
{ Pixel address calculation macros.
  }
procedure vips_progress_set(progress:Tgboolean);cdecl;external;
procedure vips_image_invalidate_all(image:PVipsImage);cdecl;external;
procedure vips_image_minimise_all(image:PVipsImage);cdecl;external;
function vips_image_is_sequential(image:PVipsImage):Tgboolean;cdecl;external;
procedure vips_image_set_progress(image:PVipsImage; progress:Tgboolean);cdecl;external;
function vips_image_iskilled(image:PVipsImage):Tgboolean;cdecl;external;
procedure vips_image_set_kill(image:PVipsImage; kill:Tgboolean);cdecl;external;
(* Const before type ignored *)
function vips_filename_get_filename(vips_filename:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function vips_filename_get_options(vips_filename:Pchar):Pchar;cdecl;external;
function vips_image_new:PVipsImage;cdecl;external;
function vips_image_new_memory:PVipsImage;cdecl;external;
function vips_image_memory:PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_image_new_from_file(name:Pchar; args:array of const):PVipsImage;cdecl;external;
function vips_image_new_from_file(name:Pchar):PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_image_new_from_file_RW(filename:Pchar):PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_image_new_from_file_raw(filename:Pchar; xsize:longint; ysize:longint; bands:longint; offset:Tguint64):PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_image_new_from_memory(data:pointer; size:Tsize_t; width:longint; height:longint; bands:longint; 
           format:TVipsBandFormat):PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_image_new_from_memory_copy(data:pointer; size:Tsize_t; width:longint; height:longint; bands:longint; 
           format:TVipsBandFormat):PVipsImage;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function vips_image_new_from_buffer(buf:pointer; len:Tsize_t; option_string:Pchar; args:array of const):PVipsImage;cdecl;external;
function vips_image_new_from_buffer(buf:pointer; len:Tsize_t; option_string:Pchar):PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_image_new_from_source(source:PVipsSource; option_string:Pchar; args:array of const):PVipsImage;cdecl;external;
function vips_image_new_from_source(source:PVipsSource; option_string:Pchar):PVipsImage;cdecl;external;
function vips_image_new_matrix(width:longint; height:longint):PVipsImage;cdecl;external;
function vips_image_new_matrixv(width:longint; height:longint; args:array of const):PVipsImage;cdecl;external;
function vips_image_new_matrixv(width:longint; height:longint):PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_image_new_matrix_from_array(width:longint; height:longint; array:Pdouble; size:longint):PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_image_matrix_from_array(width:longint; height:longint; array:Pdouble; size:longint):PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_image_new_from_image(image:PVipsImage; c:Pdouble; n:longint):PVipsImage;cdecl;external;
function vips_image_new_from_image1(image:PVipsImage; c:Tdouble):PVipsImage;cdecl;external;
procedure vips_image_set_delete_on_close(image:PVipsImage; delete_on_close:Tgboolean);cdecl;external;
function vips_get_disc_threshold:Tguint64;cdecl;external;
(* Const before type ignored *)
function vips_image_new_temp_file(format:Pchar):PVipsImage;cdecl;external;
function vips_image_write(image:PVipsImage; out:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_write_to_file(image:PVipsImage; name:Pchar; args:array of const):longint;cdecl;external;
function vips_image_write_to_file(image:PVipsImage; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_write_to_buffer(in:PVipsImage; suffix:Pchar; buf:Ppointer; size:Psize_t; args:array of const):longint;cdecl;external;
function vips_image_write_to_buffer(in:PVipsImage; suffix:Pchar; buf:Ppointer; size:Psize_t):longint;cdecl;external;
(* Const before type ignored *)
function vips_image_write_to_target(in:PVipsImage; suffix:Pchar; target:PVipsTarget; args:array of const):longint;cdecl;external;
function vips_image_write_to_target(in:PVipsImage; suffix:Pchar; target:PVipsTarget):longint;cdecl;external;
function vips_image_write_to_memory(in:PVipsImage; size:Psize_t):pointer;cdecl;external;
function vips_image_decode_predict(in:PVipsImage; bands:Plongint; format:PVipsBandFormat):longint;cdecl;external;
function vips_image_decode(in:PVipsImage; out:PPVipsImage):longint;cdecl;external;
function vips_image_encode(in:PVipsImage; out:PPVipsImage; coding:TVipsCoding):longint;cdecl;external;
function vips_image_isMSBfirst(image:PVipsImage):Tgboolean;cdecl;external;
function vips_image_isfile(image:PVipsImage):Tgboolean;cdecl;external;
function vips_image_ispartial(image:PVipsImage):Tgboolean;cdecl;external;
function vips_image_hasalpha(image:PVipsImage):Tgboolean;cdecl;external;
function vips_image_copy_memory(image:PVipsImage):PVipsImage;cdecl;external;
function vips_image_wio_input(image:PVipsImage):longint;cdecl;external;
function vips_image_pio_input(image:PVipsImage):longint;cdecl;external;
function vips_image_pio_output(image:PVipsImage):longint;cdecl;external;
function vips_image_inplace(image:PVipsImage):longint;cdecl;external;
function vips_image_write_prepare(image:PVipsImage):longint;cdecl;external;
function vips_image_write_line(image:PVipsImage; ypos:longint; linebuffer:PVipsPel):longint;cdecl;external;
function vips_band_format_isint(format:TVipsBandFormat):Tgboolean;cdecl;external;
function vips_band_format_isuint(format:TVipsBandFormat):Tgboolean;cdecl;external;
function vips_band_format_is8bit(format:TVipsBandFormat):Tgboolean;cdecl;external;
function vips_band_format_isfloat(format:TVipsBandFormat):Tgboolean;cdecl;external;
function vips_band_format_iscomplex(format:TVipsBandFormat):Tgboolean;cdecl;external;
(* Const before type ignored *)
function vips_system(cmd_format:Pchar; args:array of const):longint;cdecl;external;
function vips_system(cmd_format:Pchar):longint;cdecl;external;
{ Defined in type.c but declared here, since they use VipsImage.
  }
function vips_array_image_new(array:PPVipsImage; n:longint):PVipsArrayImage;cdecl;external;
function vips_array_image_newv(n:longint; args:array of const):PVipsArrayImage;cdecl;external;
function vips_array_image_newv(n:longint):PVipsArrayImage;cdecl;external;
(* Const before type ignored *)
function vips_array_image_new_from_string(_string:Pchar; flags:TVipsAccess):PVipsArrayImage;cdecl;external;
function vips_array_image_empty:PVipsArrayImage;cdecl;external;
function vips_array_image_append(array:PVipsArrayImage; image:PVipsImage):PVipsArrayImage;cdecl;external;
function vips_array_image_get(array:PVipsArrayImage; n:Plongint):^PVipsImage;cdecl;external;
(* Const before type ignored *)
function vips_value_get_array_image(value:PGValue; n:Plongint):^PVipsImage;cdecl;external;
procedure vips_value_set_array_image(value:PGValue; n:longint);cdecl;external;
{ Defined in reorder.c, but really a function on image.
  }
function vips_reorder_prepare_many(image:PVipsImage; regions:PPVipsRegion; r:PVipsRect):longint;cdecl;external;
procedure vips_reorder_margin_hint(image:PVipsImage; margin:longint);cdecl;external;
procedure vips_image_free_buffer(image:PVipsImage; buffer:pointer);cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_IMAGE_H }

implementation

{ was #define dname def_expr }
function VIPS_TYPE_IMAGE : longint; { return type might be wrong }
  begin
    VIPS_TYPE_IMAGE:=vips_image_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IMAGE(obj : longint) : longint;
begin
  VIPS_IMAGE:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_IMAGE,VipsImage);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IMAGE_CLASS(klass : longint) : longint;
begin
  VIPS_IMAGE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_IMAGE,VipsImageClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_IMAGE(obj : longint) : longint;
begin
  VIPS_IS_IMAGE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_IMAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_IMAGE_CLASS(klass : longint) : longint;
begin
  VIPS_IS_IMAGE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_IMAGE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IMAGE_GET_CLASS(obj : longint) : longint;
begin
  VIPS_IMAGE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_IMAGE,VipsImageClass);
end;


end.
