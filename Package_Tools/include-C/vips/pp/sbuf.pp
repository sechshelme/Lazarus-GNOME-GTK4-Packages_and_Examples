
unit sbuf;
interface

{
  Automatically converted by H2Pas 1.0.0 from sbuf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sbuf.h
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
PVipsSbuf  = ^VipsSbuf;
PVipsSbufClass  = ^VipsSbufClass;
PVipsSource  = ^VipsSource;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Buffered inputput from a VipsSource
 *
 * J.Cupitt, 18/11/19
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
{$ifndef VIPS_SBUF_H}
{$define VIPS_SBUF_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/object.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }

{ was #define dname def_expr }
function VIPS_TYPE_SBUF : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SBUF(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SBUF_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SBUF(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SBUF_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SBUF_GET_CLASS(obj : longint) : longint;

const
  VIPS_SBUF_BUFFER_SIZE = 4096;  
{ Layer over source: read with an input buffer.
 *
 * Libraries like libjpeg do their own input buffering and need raw IO, but
 * others, like radiance, need to parse the input into lines. A buffered read
 * class is very convenient.
  }
{< private > }
{ The VipsSource we wrap.
	  }
{ The +1 means there's always a \0 byte at the end.
	 *
	 * Unsigned char, since we don't want >127 to be -ve.
	 *
	 * chars_in_buffer is how many chars we have in input_buffer,
	 * read_point is the current read position in that buffer.
	  }
{ Build lines of text here.
	  }
type
  PVipsSbuf = ^TVipsSbuf;
  TVipsSbuf = record
      parent_object : TVipsObject;
      source : PVipsSource;
      input_buffer : array[0..(VIPS_SBUF_BUFFER_SIZE+1)-1] of byte;
      chars_in_buffer : longint;
      read_point : longint;
      line : array[0..(VIPS_SBUF_BUFFER_SIZE+1)-1] of byte;
    end;

  PVipsSbufClass = ^TVipsSbufClass;
  TVipsSbufClass = record
      parent_class : TVipsObjectClass;
    end;

function vips_sbuf_get_type:TGType;cdecl;external;
function vips_sbuf_new_from_source(source:PVipsSource):PVipsSbuf;cdecl;external;
procedure vips_sbuf_unbuffer(sbuf:PVipsSbuf);cdecl;external;
function vips_sbuf_getc(sbuf:PVipsSbuf):longint;cdecl;external;
procedure vips_sbuf_ungetc(sbuf:PVipsSbuf);cdecl;external;
function vips_sbuf_require(sbuf:PVipsSbuf; require:longint):longint;cdecl;external;
(* Const before type ignored *)
function vips_sbuf_get_line(sbuf:PVipsSbuf):Pchar;cdecl;external;
function vips_sbuf_get_line_copy(sbuf:PVipsSbuf):Pchar;cdecl;external;
(* Const before type ignored *)
function vips_sbuf_get_non_whitespace(sbuf:PVipsSbuf):Pchar;cdecl;external;
function vips_sbuf_skip_whitespace(sbuf:PVipsSbuf):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_SBUF_H }

implementation

{ was #define dname def_expr }
function VIPS_TYPE_SBUF : longint; { return type might be wrong }
  begin
    VIPS_TYPE_SBUF:=vips_sbuf_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SBUF(obj : longint) : longint;
begin
  VIPS_SBUF:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_SBUF,VipsSbuf);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SBUF_CLASS(klass : longint) : longint;
begin
  VIPS_SBUF_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_SBUF,VipsSbufClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SBUF(obj : longint) : longint;
begin
  VIPS_IS_SBUF:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_SBUF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_SBUF_CLASS(klass : longint) : longint;
begin
  VIPS_IS_SBUF_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_SBUF);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_SBUF_GET_CLASS(obj : longint) : longint;
begin
  VIPS_SBUF_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_SBUF,VipsSbufClass);
end;


end.
