
unit connection;
interface

{
  Automatically converted by H2Pas 1.0.0 from connection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    connection.h
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
Pchar  = ^char;
PGByteArray  = ^GByteArray;
PGFileInfo  = ^GFileInfo;
PGInputStream  = ^GInputStream;
PGSeekable  = ^GSeekable;
PGString  = ^GString;
Psize_t  = ^size_t;
PVipsBlob  = ^VipsBlob;
PVipsConnection  = ^VipsConnection;
PVipsConnectionClass  = ^VipsConnectionClass;
PVipsGInputStream  = ^VipsGInputStream;
PVipsGInputStreamClass  = ^VipsGInputStreamClass;
PVipsSource  = ^VipsSource;
PVipsSourceClass  = ^VipsSourceClass;
PVipsSourceCustom  = ^VipsSourceCustom;
PVipsSourceCustomClass  = ^VipsSourceCustomClass;
PVipsSourceGInputStream  = ^VipsSourceGInputStream;
PVipsSourceGInputStreamClass  = ^VipsSourceGInputStreamClass;
PVipsTarget  = ^VipsTarget;
PVipsTargetClass  = ^VipsTargetClass;
PVipsTargetCustom  = ^VipsTargetCustom;
PVipsTargetCustomClass  = ^VipsTargetCustomClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ A byte source/sink .. it can be a pipe, socket, or perhaps a node.js stream.
 *
 * J.Cupitt, 19/6/14
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
{$ifndef VIPS_CONNECTION_H}
{$define VIPS_CONNECTION_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <vips/object.h>}
{$include <vips/type.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }

{ was #define dname def_expr }
function VIPS_TYPE_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_CONNECTION_GET_CLASS(obj : longint) : longint;

{ Communicate with something like a socket or pipe.
  }
{< private > }
{ Read/write this fd if connected to a system pipe/socket. Override
	 * ::read() and ::write() to do something else.
	  }
{ A descriptor we close with vips_tracked_close().
	  }
{ A descriptor we close with close().
	  }
{ If descriptor is a file, the filename we opened. Handy for error
	 * messages.
	  }
type
  PVipsConnection = ^TVipsConnection;
  TVipsConnection = record
      parent_object : TVipsObject;
      descriptor : longint;
      tracked_descriptor : longint;
      close_descriptor : longint;
      filename : Pchar;
    end;

  PVipsConnectionClass = ^TVipsConnectionClass;
  TVipsConnectionClass = record
      parent_class : TVipsObjectClass;
    end;

function vips_connection_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function vips_connection_filename(connection:PVipsConnection):Pchar;cdecl;external;
(* Const before type ignored *)
function vips_connection_nick(connection:PVipsConnection):Pchar;cdecl;external;
procedure vips_pipe_read_limit_set(limit:Tgint64);cdecl;external;
{ was #define dname def_expr }
function VIPS_TYPE_SOURCE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_GET_CLASS(obj : longint) : longint;

{ Read from something like a socket, file or memory area and present the data
 * with a unified seek / read / map interface.
 *
 * During the header phase, we save data from unseekable sources in a buffer
 * so readers can rewind and read again. We don't buffer data during the
 * decode stage.
  }
{ We have two phases:
	 *
	 * During the header phase, we save bytes read from the input (if this
	 * is an unseekable source) so that we can rewind and try again, if
	 * necessary.
	 *
	 * Once we reach decode phase, we no longer support rewind and the
	 * buffer of saved data is discarded.
	  }
{ TRUE if this input is something like a pipe. These don't support
	 * seek or map -- all you can do is read() bytes sequentially.
	 *
	 * If you attempt to map or get the size of a pipe-style input, it'll
	 * get read entirely into memory. Seeks will cause read up to the seek
	 * point.
	  }
{ The current read point and length.
	 *
	 * length is -1 for is_pipe sources.
	 *
	 * off_t can be 32 bits on some platforms, so make sure we have a
	 * full 64.
	  }
{< private > }
{ For sources where we have the whole image in memory (from a memory
	 * buffer, from mmaping the file, from reading the pipe into memory),
	 * a pointer to the start.
	  }
(* Const before type ignored *)
{ For is_pipe sources, save data read during header phase here. If
	 * we rewind and try again, serve data from this until it runs out.
	 *
	 * If we need to force the whole pipe into memory, read everything to
	 * this and put a copy of the pointer in data.
	  }
{ Save the first few bytes here for file type sniffing.
	  }
{ For a memory source, the blob we read from.
	  }
{ If we mmaped the file, what we need to unmmap on finalize.
	  }
type
  PVipsSource = ^TVipsSource;
  TVipsSource = record
      parent_object : TVipsConnection;
      decode : Tgboolean;
      have_tested_seek : Tgboolean;
      is_pipe : Tgboolean;
      read_position : Tgint64;
      length : Tgint64;
      data : pointer;
      header_bytes : PGByteArray;
      sniff : PGByteArray;
      blob : PVipsBlob;
      mmap_baseaddr : pointer;
      mmap_length : Tsize_t;
    end;

{ Subclasses can define these to implement other source methods.
	  }
{ Read from the source into the supplied buffer, args exactly as
	 * read(2). Set errno on error.
	 *
	 * We must return gint64, since ssize_t is often defined as unsigned
	 * on Windows.
	  }
{ Seek to a certain position, args exactly as lseek(2). Set errno on
	 * error.
	 *
	 * Unseekable sources should always return -1. VipsSource will then
	 * seek by _read()ing bytes into memory as required.
	 *
	 * We have to use int64 rather than off_t, since we must work on
	 * Windows, where off_t can be 32-bits.
	  }

  PVipsSourceClass = ^TVipsSourceClass;
  TVipsSourceClass = record
      parent_class : TVipsConnectionClass;
      read : function (para1:PVipsSource; para2:pointer; para3:Tsize_t):Tgint64;cdecl;
      seek : function (para1:PVipsSource; para2:Tgint64; para3:longint):Tgint64;cdecl;
    end;

function vips_source_get_type:TGType;cdecl;external;
function vips_source_new_from_descriptor(descriptor:longint):PVipsSource;cdecl;external;
(* Const before type ignored *)
function vips_source_new_from_file(filename:Pchar):PVipsSource;cdecl;external;
function vips_source_new_from_blob(blob:PVipsBlob):PVipsSource;cdecl;external;
function vips_source_new_from_target(target:PVipsTarget):PVipsSource;cdecl;external;
(* Const before type ignored *)
function vips_source_new_from_memory(data:pointer; size:Tsize_t):PVipsSource;cdecl;external;
(* Const before type ignored *)
function vips_source_new_from_options(options:Pchar):PVipsSource;cdecl;external;
procedure vips_source_minimise(source:PVipsSource);cdecl;external;
function vips_source_unminimise(source:PVipsSource):longint;cdecl;external;
function vips_source_decode(source:PVipsSource):longint;cdecl;external;
function vips_source_read(source:PVipsSource; data:pointer; length:Tsize_t):Tgint64;cdecl;external;
function vips_source_is_mappable(source:PVipsSource):Tgboolean;cdecl;external;
function vips_source_is_file(source:PVipsSource):Tgboolean;cdecl;external;
(* Const before type ignored *)
function vips_source_map(source:PVipsSource; length:Psize_t):pointer;cdecl;external;
function vips_source_map_blob(source:PVipsSource):PVipsBlob;cdecl;external;
function vips_source_seek(source:PVipsSource; offset:Tgint64; whence:longint):Tgint64;cdecl;external;
function vips_source_rewind(source:PVipsSource):longint;cdecl;external;
function vips_source_sniff_at_most(source:PVipsSource; data:PPbyte; length:Tsize_t):Tgint64;cdecl;external;
function vips_source_sniff(source:PVipsSource; length:Tsize_t):Pbyte;cdecl;external;
function vips_source_length(source:PVipsSource):Tgint64;cdecl;external;
{ was #define dname def_expr }
function VIPS_TYPE_SOURCE_CUSTOM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_CUSTOM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_CUSTOM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_CUSTOM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_CUSTOM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_CUSTOM_GET_CLASS(obj : longint) : longint;

{ Subclass of source_custom with signals for handlers. This is supposed to be
 * useful for language bindings.
  }
type
  PVipsSourceCustom = ^TVipsSourceCustom;
  TVipsSourceCustom = record
      parent_object : TVipsSource;
    end;
{ The action signals clients can use to implement read and seek.
	 * We must use gint64 everywhere since there's no G_TYPE_SIZE.
	  }

  PVipsSourceCustomClass = ^TVipsSourceCustomClass;
  TVipsSourceCustomClass = record
      parent_class : TVipsSourceClass;
      read : function (para1:PVipsSourceCustom; para2:pointer; para3:Tgint64):Tgint64;cdecl;
      seek : function (para1:PVipsSourceCustom; para2:Tgint64; para3:longint):Tgint64;cdecl;
    end;

function vips_source_custom_get_type:TGType;cdecl;external;
function vips_source_custom_new:PVipsSourceCustom;cdecl;external;
{ A GInputStream that wraps a VipsSource. This lets us eg.
 * hook librsvg up to libvips using their GInputStream interface.
  }
{ was #define dname def_expr }
function VIPS_TYPE_G_INPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_G_INPUT_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_G_INPUT_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_G_INPUT_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_G_INPUT_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_G_INPUT_STREAM_GET_CLASS(obj : longint) : longint;

{< private > }
{ The VipsSource we wrap.
	  }
type
  PVipsGInputStream = ^TVipsGInputStream;
  TVipsGInputStream = record
      parent_instance : TGInputStream;
      source : PVipsSource;
    end;

  PVipsGInputStreamClass = ^TVipsGInputStreamClass;
  TVipsGInputStreamClass = record
      parent_class : TGInputStreamClass;
    end;

function vips_g_input_stream_new_from_source(source:PVipsSource):PGInputStream;cdecl;external;
{ A VipsSource that wraps a GInputStream. This lets us eg. load PNGs from
 * GFile objects.
  }
{ was #define dname def_expr }
function VIPS_TYPE_SOURCE_G_INPUT_STREAM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_G_INPUT_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_G_INPUT_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_G_INPUT_STREAM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_G_INPUT_STREAM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_G_INPUT_STREAM_GET_CLASS(obj : longint) : longint;

{< private > }
{ The GInputStream we wrap.
	  }
type
  PVipsSourceGInputStream = ^TVipsSourceGInputStream;
  TVipsSourceGInputStream = record
      parent_instance : TVipsSource;
      stream : PGInputStream;
      seekable : PGSeekable;
      info : PGFileInfo;
    end;

  PVipsSourceGInputStreamClass = ^TVipsSourceGInputStreamClass;
  TVipsSourceGInputStreamClass = record
      parent_class : TVipsSourceClass;
    end;

function vips_source_g_input_stream_new(stream:PGInputStream):PVipsSourceGInputStream;cdecl;external;
{ was #define dname def_expr }
function VIPS_TYPE_TARGET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_TARGET(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_TARGET_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_GET_CLASS(obj : longint) : longint;

{ PNG writes in 8kb chunks, so we need to be a little larger than that.
  }
const
  VIPS_TARGET_BUFFER_SIZE = 8500;  
{ Output to something like a socket, pipe or memory area.
  }
{< private > }
{ This target should write to memory.
	  }
{ The target has been ended and can no longer be written.
	  }
{ Write memory output here. We use a GString rather than a
	 * GByteArray since we need eg. g_string_overwrite_len().
	 * @position tracks the current write position in this.
	  }
{ And return memory via this blob.
	  }
{ Buffer small writes here. write_point is the index of the next
	 * character to write.
	  }
{ Write position in memory_buffer.
	  }
{ Temp targets on the filesystem need deleting, sometimes.
	  }
type
  PVipsTarget = ^TVipsTarget;
  TVipsTarget = record
      parent_object : TVipsConnection;
      memory : Tgboolean;
      ended : Tgboolean;
      memory_buffer : PGString;
      blob : PVipsBlob;
      output_buffer : array[0..(VIPS_TARGET_BUFFER_SIZE)-1] of byte;
      write_point : longint;
      position : Toff_t;
      delete_on_close : Tgboolean;
      delete_on_close_filename : Pchar;
    end;

{ Write to output. Args exactly as write(2).
	 *
	 * We must return gint64, since ssize_t is often defined as unsigned
	 * on Windows.
	  }
(* Const before type ignored *)
{ Deprecated in favour of ::end.
	  }
{ libtiff needs to be able to seek and read on targets,
	 * unfortunately.
	 *
	 * This will not work for eg. pipes, of course.
	  }
{ Read from the target into the supplied buffer, args exactly as
	 * read(2). Set errno on error.
	 *
	 * We must return gint64, since ssize_t is often defined as unsigned
	 * on Windows.
	  }
{ Seek output. Args exactly as lseek(2).
	  }
{ Output has been generated, so do any clearing up,
	 * eg. copy the bytes we saved in memory to the target blob.
	  }

  PVipsTargetClass = ^TVipsTargetClass;
  TVipsTargetClass = record
      parent_class : TVipsConnectionClass;
      write : function (para1:PVipsTarget; para2:pointer; para3:Tsize_t):Tgint64;cdecl;
      finish : procedure (para1:PVipsTarget);cdecl;
      read : function (para1:PVipsTarget; para2:pointer; para3:Tsize_t):Tgint64;cdecl;
      seek : function (para1:PVipsTarget; offset:Toff_t; whence:longint):Toff_t;cdecl;
      end : function (para1:PVipsTarget):longint;cdecl;
    end;

function vips_target_get_type:TGType;cdecl;external;
function vips_target_new_to_descriptor(descriptor:longint):PVipsTarget;cdecl;external;
(* Const before type ignored *)
function vips_target_new_to_file(filename:Pchar):PVipsTarget;cdecl;external;
function vips_target_new_to_memory:PVipsTarget;cdecl;external;
function vips_target_new_temp(target:PVipsTarget):PVipsTarget;cdecl;external;
(* Const before type ignored *)
function vips_target_write(target:PVipsTarget; data:pointer; length:Tsize_t):longint;cdecl;external;
function vips_target_read(target:PVipsTarget; buffer:pointer; length:Tsize_t):Tgint64;cdecl;external;
function vips_target_seek(target:PVipsTarget; offset:Toff_t; whence:longint):Toff_t;cdecl;external;
function vips_target_end(target:PVipsTarget):longint;cdecl;external;
{xxxx VIPS_DEPRECATED_FOR(vips_target_end) }
procedure vips_target_finish(target:PVipsTarget);cdecl;external;
function vips_target_steal(target:PVipsTarget; length:Psize_t):Pbyte;cdecl;external;
function vips_target_steal_text(target:PVipsTarget):Pchar;cdecl;external;
function vips_target_putc(target:PVipsTarget; ch:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_target_writes(target:PVipsTarget; str:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_target_writef(target:PVipsTarget; fmt:Pchar; args:array of const):longint;cdecl;external;
function vips_target_writef(target:PVipsTarget; fmt:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function vips_target_write_amp(target:PVipsTarget; str:Pchar):longint;cdecl;external;
{ was #define dname def_expr }
function VIPS_TYPE_TARGET_CUSTOM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_CUSTOM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_CUSTOM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_TARGET_CUSTOM(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_TARGET_CUSTOM_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_CUSTOM_GET_CLASS(obj : longint) : longint;

const
  VIPS_TARGET_CUSTOM_BUFFER_SIZE = 4096;  
{ Output to something like a socket, pipe or memory area.
  }
type
  PVipsTargetCustom = ^TVipsTargetCustom;
  TVipsTargetCustom = record
      parent_object : TVipsTarget;
    end;
{ The action signals clients can use to implement write and finish.
	 * We must use gint64 everywhere since there's no G_TYPE_SIZE.
	  }
(* Const before type ignored *)

  PVipsTargetCustomClass = ^TVipsTargetCustomClass;
  TVipsTargetCustomClass = record
      parent_class : TVipsTargetClass;
      write : function (para1:PVipsTargetCustom; para2:pointer; para3:Tgint64):Tgint64;cdecl;
      finish : procedure (para1:PVipsTargetCustom);cdecl;
      read : function (para1:PVipsTargetCustom; para2:pointer; para3:Tgint64):Tgint64;cdecl;
      seek : function (para1:PVipsTargetCustom; para2:Tgint64; para3:longint):Tgint64;cdecl;
      end : function (para1:PVipsTargetCustom):longint;cdecl;
    end;

function vips_target_custom_get_type:TGType;cdecl;external;
function vips_target_custom_new:PVipsTargetCustom;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_CONNECTION_H }

implementation

{ was #define dname def_expr }
function VIPS_TYPE_CONNECTION : longint; { return type might be wrong }
  begin
    VIPS_TYPE_CONNECTION:=vips_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_CONNECTION(obj : longint) : longint;
begin
  VIPS_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_CONNECTION,VipsConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_CONNECTION_CLASS(klass : longint) : longint;
begin
  VIPS_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_CONNECTION,VipsConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_CONNECTION(obj : longint) : longint;
begin
  VIPS_IS_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_CONNECTION_CLASS(klass : longint) : longint;
begin
  VIPS_IS_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_CONNECTION_GET_CLASS(obj : longint) : longint;
begin
  VIPS_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_CONNECTION,VipsConnectionClass);
end;

{ was #define dname def_expr }
function VIPS_TYPE_SOURCE : longint; { return type might be wrong }
  begin
    VIPS_TYPE_SOURCE:=vips_source_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE(obj : longint) : longint;
begin
  VIPS_SOURCE:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_SOURCE,VipsSource);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_CLASS(klass : longint) : longint;
begin
  VIPS_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_SOURCE,VipsSourceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE(obj : longint) : longint;
begin
  VIPS_IS_SOURCE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_CLASS(klass : longint) : longint;
begin
  VIPS_IS_SOURCE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_SOURCE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_GET_CLASS(obj : longint) : longint;
begin
  VIPS_SOURCE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_SOURCE,VipsSourceClass);
end;

{ was #define dname def_expr }
function VIPS_TYPE_SOURCE_CUSTOM : longint; { return type might be wrong }
  begin
    VIPS_TYPE_SOURCE_CUSTOM:=vips_source_custom_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_CUSTOM(obj : longint) : longint;
begin
  VIPS_SOURCE_CUSTOM:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_SOURCE_CUSTOM,VipsSourceCustom);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_CUSTOM_CLASS(klass : longint) : longint;
begin
  VIPS_SOURCE_CUSTOM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_SOURCE_CUSTOM,VipsSourceCustomClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_CUSTOM(obj : longint) : longint;
begin
  VIPS_IS_SOURCE_CUSTOM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_SOURCE_CUSTOM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_CUSTOM_CLASS(klass : longint) : longint;
begin
  VIPS_IS_SOURCE_CUSTOM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_SOURCE_CUSTOM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_CUSTOM_GET_CLASS(obj : longint) : longint;
begin
  VIPS_SOURCE_CUSTOM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_SOURCE_CUSTOM,VipsSourceCustomClass);
end;

{ was #define dname def_expr }
function VIPS_TYPE_G_INPUT_STREAM : longint; { return type might be wrong }
  begin
    VIPS_TYPE_G_INPUT_STREAM:=vips_g_input_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_G_INPUT_STREAM(obj : longint) : longint;
begin
  VIPS_G_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_G_INPUT_STREAM,VipsGInputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_G_INPUT_STREAM_CLASS(klass : longint) : longint;
begin
  VIPS_G_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_G_INPUT_STREAM,VipsGInputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_G_INPUT_STREAM(obj : longint) : longint;
begin
  VIPS_IS_G_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_G_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_G_INPUT_STREAM_CLASS(klass : longint) : longint;
begin
  VIPS_IS_G_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_G_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_G_INPUT_STREAM_GET_CLASS(obj : longint) : longint;
begin
  VIPS_G_INPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_G_INPUT_STREAM,VipsGInputStreamClass);
end;

{ was #define dname def_expr }
function VIPS_TYPE_SOURCE_G_INPUT_STREAM : longint; { return type might be wrong }
  begin
    VIPS_TYPE_SOURCE_G_INPUT_STREAM:=vips_source_g_input_stream_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_G_INPUT_STREAM(obj : longint) : longint;
begin
  VIPS_SOURCE_G_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_SOURCE_G_INPUT_STREAM,VipsSourceGInputStream);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_G_INPUT_STREAM_CLASS(klass : longint) : longint;
begin
  VIPS_SOURCE_G_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_SOURCE_G_INPUT_STREAM,VipsSourceGInputStreamClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_G_INPUT_STREAM(obj : longint) : longint;
begin
  VIPS_IS_SOURCE_G_INPUT_STREAM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_SOURCE_G_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SOURCE_G_INPUT_STREAM_CLASS(klass : longint) : longint;
begin
  VIPS_IS_SOURCE_G_INPUT_STREAM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_SOURCE_G_INPUT_STREAM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SOURCE_G_INPUT_STREAM_GET_CLASS(obj : longint) : longint;
begin
  VIPS_SOURCE_G_INPUT_STREAM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_SOURCE_G_INPUT_STREAM,VipsSourceGInputStreamClass);
end;

{ was #define dname def_expr }
function VIPS_TYPE_TARGET : longint; { return type might be wrong }
  begin
    VIPS_TYPE_TARGET:=vips_target_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET(obj : longint) : longint;
begin
  VIPS_TARGET:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_TARGET,VipsTarget);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_CLASS(klass : longint) : longint;
begin
  VIPS_TARGET_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_TARGET,VipsTargetClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_TARGET(obj : longint) : longint;
begin
  VIPS_IS_TARGET:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_TARGET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_TARGET_CLASS(klass : longint) : longint;
begin
  VIPS_IS_TARGET_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_TARGET);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_GET_CLASS(obj : longint) : longint;
begin
  VIPS_TARGET_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_TARGET,VipsTargetClass);
end;

{ was #define dname def_expr }
function VIPS_TYPE_TARGET_CUSTOM : longint; { return type might be wrong }
  begin
    VIPS_TYPE_TARGET_CUSTOM:=vips_target_custom_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_CUSTOM(obj : longint) : longint;
begin
  VIPS_TARGET_CUSTOM:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_TARGET_CUSTOM,VipsTargetCustom);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_CUSTOM_CLASS(klass : longint) : longint;
begin
  VIPS_TARGET_CUSTOM_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_TARGET_CUSTOM,VipsTargetCustomClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_TARGET_CUSTOM(obj : longint) : longint;
begin
  VIPS_IS_TARGET_CUSTOM:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_TARGET_CUSTOM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_TARGET_CUSTOM_CLASS(klass : longint) : longint;
begin
  VIPS_IS_TARGET_CUSTOM_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_TARGET_CUSTOM);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_TARGET_CUSTOM_GET_CLASS(obj : longint) : longint;
begin
  VIPS_TARGET_CUSTOM_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_TARGET_CUSTOM,VipsTargetCustomClass);
end;


end.
