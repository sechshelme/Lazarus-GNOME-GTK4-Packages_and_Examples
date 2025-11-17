
unit gphoto2_file;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_file.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_file.h
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
Pbyte  = ^byte;
PCameraFile  = ^CameraFile;
PCameraFileAccessType  = ^CameraFileAccessType;
PCameraFileHandler  = ^CameraFileHandler;
PCameraFileType  = ^CameraFileType;
Pchar  = ^char;
Pdword  = ^dword;
Psize_t  = ^size_t;
Ptime_t  = ^time_t;
Puint64_t  = ^uint64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file
 * \brief Abstracted gphoto2 file operations.
 *
 * \author Copyright 2000 Scott Fritzinger
 * \author Copyright 2008-2009 Marcus Meissner
 *
 * \note
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * \note
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * \note
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_FILE_H}
{$define LIBGPHOTO2_GPHOTO2_FILE_H}
{$include <time.h>}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }

const
  GP_MIME_TXT = 'text/plain';  
  GP_MIME_WAV = 'audio/wav';  
  GP_MIME_RAW = 'image/x-raw';  
  GP_MIME_PNG = 'image/png';  
  GP_MIME_PGM = 'image/x-portable-graymap';  
  GP_MIME_PPM = 'image/x-portable-pixmap';  
  GP_MIME_PNM = 'image/x-portable-anymap';  
  GP_MIME_JPEG = 'image/jpeg';  
  GP_MIME_TIFF = 'image/tiff';  
  GP_MIME_BMP = 'image/bmp';  
  GP_MIME_QUICKTIME = 'video/quicktime';  
  GP_MIME_AVI = 'video/x-msvideo';  
  GP_MIME_CRW = 'image/x-canon-raw';  
  GP_MIME_CR2 = 'image/x-canon-cr2';  
  GP_MIME_CR3 = 'image/x-canon-cr3';  
  GP_MIME_NEF = 'image/x-nikon-nef';  
  GP_MIME_UNKNOWN = 'application/octet-stream';  
  GP_MIME_EXIF = 'application/x-exif';  
  GP_MIME_MP3 = 'audio/mpeg';  
  GP_MIME_OGG = 'application/ogg';  
  GP_MIME_WMA = 'audio/x-wma';  
  GP_MIME_ASF = 'audio/x-asf';  
  GP_MIME_MPEG = 'video/mpeg';  
  GP_MIME_AVCHD = 'video/mp2t';  
  GP_MIME_RW2 = 'image/x-panasonic-raw2';  
  GP_MIME_ARW = 'image/x-sony-arw';  
{*
 * \brief The type of view on the specified file.
 *
 * Specifies the file of the current file, usually passed
 * to the gp_camera_file_get() and gp_camera_file_put()
 * functions. This is useful for multiple views of one
 * file, like that an single image file has "raw", "normal",
 * "exif" and "preview" views, or a media file has "normal"
 * and "metadata" file views.
  }
{*< A preview of an image.  }
{*< The regular normal data of a file.  }
{*< The raw mode of a file, for instance the raw bayer data for cameras
				 * where postprocessing is done in the driver. The RAW files of modern
				 * DSLRs are GP_FILE_TYPE_NORMAL usually.  }
{*< The audio view of a file. Perhaps an embedded comment or similar.  }
{*< The embedded EXIF data of an image.  }
{*< The metadata of a file, like Metadata of files on MTP devices.  }
type
  PCameraFileType = ^TCameraFileType;
  TCameraFileType =  Longint;
  Const
    GP_FILE_TYPE_PREVIEW = 0;
    GP_FILE_TYPE_NORMAL = 1;
    GP_FILE_TYPE_RAW = 2;
    GP_FILE_TYPE_AUDIO = 3;
    GP_FILE_TYPE_EXIF = 4;
    GP_FILE_TYPE_METADATA = 5;
;
{*
 * \brief File storage type.
 *
 * The file storage type. Only used internally for now, but might
 * be exposed later on. See gp_file_new() and gp_file_new_from_fd().
  }
{*< File is in system memory.  }
{*< File is associated with a UNIX filedescriptor.  }
{*< File is associated with a programmatic handler.  }
type
  PCameraFileAccessType = ^TCameraFileAccessType;
  TCameraFileAccessType =  Longint;
  Const
    GP_FILE_ACCESSTYPE_MEMORY = 0;
    GP_FILE_ACCESSTYPE_FD = 1;
    GP_FILE_ACCESSTYPE_HANDLER = 2;
;
{ FIXME: api might be unstable. function return gphoto results codes.  }
{ only for read?  }
{ FIXME: should we have both read/write methods?  }
{ FIXME: how to finish method, due to LRU it might be longlived.  }
type
  PCameraFileHandler = ^TCameraFileHandler;
  TCameraFileHandler = record
      size : function (priv:pointer; size:Puint64_t):longint;cdecl;
      read : function (priv:pointer; data:Pbyte; len:Puint64_t):longint;cdecl;
      write : function (priv:pointer; data:Pbyte; len:Puint64_t):longint;cdecl;
    end;
{! \struct CameraFile
 * \brief File structure.
 *
 * The internals of the CameraFile struct are private, please use
 * the accessor functions.
  }

function gp_file_new(file:PPCameraFile):longint;cdecl;external;
function gp_file_new_from_fd(file:PPCameraFile; fd:longint):longint;cdecl;external;
function gp_file_new_from_handler(file:PPCameraFile; handler:PCameraFileHandler; priv:pointer):longint;cdecl;external;
function gp_file_ref(file:PCameraFile):longint;cdecl;external;
function gp_file_unref(file:PCameraFile):longint;cdecl;external;
function gp_file_free(file:PCameraFile):longint;cdecl;external;
(* Const before type ignored *)
function gp_file_set_name(file:PCameraFile; name:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_file_get_name(file:PCameraFile; name:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_file_set_mime_type(file:PCameraFile; mime_type:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_file_get_mime_type(file:PCameraFile; mime_type:PPchar):longint;cdecl;external;
function gp_file_set_mtime(file:PCameraFile; mtime:Ttime_t):longint;cdecl;external;
function gp_file_get_mtime(file:PCameraFile; mtime:Ptime_t):longint;cdecl;external;
function gp_file_detect_mime_type(file:PCameraFile):longint;cdecl;external;
function gp_file_adjust_name_for_mime_type(file:PCameraFile):longint;cdecl;external;
(* Const before type ignored *)
function gp_file_get_name_by_type(file:PCameraFile; basename:Pchar; _type:TCameraFileType; newname:PPchar):longint;cdecl;external;
function gp_file_set_data_and_size(para1:PCameraFile; data:Pchar; size:dword):longint;cdecl;external;
(* Const before type ignored *)
function gp_file_get_data_and_size(para1:PCameraFile; data:PPchar; size:Pdword):longint;cdecl;external;
{ "Do not use those"
 *
 * These functions probably were originally intended for internal use only.
 * However, due to
 *   - the lack of good documentation
 *   - this being the obvious way to save a file
 *   - the fact that libgphoto2 has been exporting all its internal
 *     symbols for years (until 2005-06)
 *   - our in-house frontends gphoto2 and gtkam using them
 * a number of external frontends started to use these functions, as
 * of 2005-06:
 *    - digikam
 *    - f-spot
 *    - gthumb
 * But a few frontends can live without it (and thus are likely to
 * use the correct API):
 *    - flphoto
 *    - kamera
 *
 * So we're going to phase these functions out over the next year or
 * so, going the GTK way of keeping the ABI but breaking the API. So
 * we'll continue to export functionally equivalent functions, but the
 * header files will not contain definitions for you to use any more.
  }
(* Const before type ignored *)
function gp_file_open(file:PCameraFile; filename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function gp_file_save(file:PCameraFile; filename:Pchar):longint;cdecl;external;
function gp_file_clean(file:PCameraFile):longint;cdecl;external;
function gp_file_copy(destination:PCameraFile; source:PCameraFile):longint;cdecl;external;
{ These are for use by camera drivers only  }
(* Const before type ignored *)
function gp_file_append(para1:PCameraFile; data:Pchar; size:dword):longint;cdecl;external;
function gp_file_slurp(para1:PCameraFile; data:Pchar; size:Tsize_t; readlen:Psize_t):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_FILE_H)  }

implementation


end.
