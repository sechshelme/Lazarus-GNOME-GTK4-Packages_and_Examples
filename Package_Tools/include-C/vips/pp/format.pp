
unit format;
interface

{
  Automatically converted by H2Pas 1.0.0 from format.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    format.h
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
PVipsFormat  = ^VipsFormat;
PVipsFormatClass  = ^VipsFormatClass;
PVipsFormatFlags  = ^VipsFormatFlags;
PVipsImage  = ^VipsImage;
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
{$ifndef VIPS_FORMAT_H}
{$define VIPS_FORMAT_H}
{ C++ extern C conditionnal removed }
{__cplusplus }

{ was #define dname def_expr }
function VIPS_TYPE_FORMAT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FORMAT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FORMAT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FORMAT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FORMAT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FORMAT_GET_CLASS(obj : longint) : longint;

{ Image file properties.
  }
{ No flags set  }
{ Lazy read OK (eg. tiled tiff)  }
{ Most-significant byte first  }
type
  PVipsFormatFlags = ^TVipsFormatFlags;
  TVipsFormatFlags =  Longint;
  Const
    VIPS_FORMAT_NONE = 0;
    VIPS_FORMAT_PARTIAL = 1;
    VIPS_FORMAT_BIGENDIAN = 2;
;
{ Don't instantiate these things, just use the class stuff.
  }
{< public > }
type
  PVipsFormat = ^TVipsFormat;
  TVipsFormat = record
      parent_object : TVipsObject;
    end;
{< public > }
{ Is a file in this format.
	  }
(* Const before type ignored *)
{ Read just the header into the VipsImage.
	  }
(* Const before type ignored *)
{ Load the whole image.
	  }
(* Const before type ignored *)
{ Write the VipsImage to the file in this format.
	  }
(* Const before type ignored *)
{ Get the flags for this file in this format.
	  }
(* Const before type ignored *)
{ Loop over formats in this order, default 0. We need this because
	 * some formats can be read by several loaders (eg. tiff can be read
	 * by the libMagick loader as well as by the tiff loader), and we want
	 * to make sure the better loader comes first.
	  }
{ Null-terminated list of allowed suffixes, eg. ".tif", ".tiff".
	  }
(* Const before type ignored *)

  PVipsFormatClass = ^TVipsFormatClass;
  TVipsFormatClass = record
      parent_class : TVipsObjectClass;
      is_a : function (para1:Pchar):Tgboolean;cdecl;
      header : function (para1:Pchar; para2:PVipsImage):longint;cdecl;
      load : function (para1:Pchar; para2:PVipsImage):longint;cdecl;
      save : function (para1:PVipsImage; para2:Pchar):longint;cdecl;
      get_flags : function (para1:Pchar):TVipsFormatFlags;cdecl;
      priority : longint;
      suffs : ^Pchar;
    end;

function vips_format_get_type:TGType;cdecl;external;
{ Map over and find formats. This uses type introspection to loop over
 * subclasses of VipsFormat.
  }
function vips_format_map(fn:TVipsSListMap2Fn; a:pointer; b:pointer):pointer;cdecl;external;
(* Const before type ignored *)
function vips_format_for_file(filename:Pchar):PVipsFormatClass;cdecl;external;
(* Const before type ignored *)
function vips_format_for_name(filename:Pchar):PVipsFormatClass;cdecl;external;
(* Const before type ignored *)
function vips_format_get_flags(format:PVipsFormatClass; filename:Pchar):TVipsFormatFlags;cdecl;external;
{ Read/write an image convenience functions.
  }
(* Const before type ignored *)
function vips_format_read(filename:Pchar; out:PVipsImage):longint;cdecl;external;
(* Const before type ignored *)
function vips_format_write(in:PVipsImage; filename:Pchar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_FORMAT_H }

implementation

{ was #define dname def_expr }
function VIPS_TYPE_FORMAT : longint; { return type might be wrong }
  begin
    VIPS_TYPE_FORMAT:=vips_format_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FORMAT(obj : longint) : longint;
begin
  VIPS_FORMAT:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_FORMAT,VipsFormat);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FORMAT_CLASS(klass : longint) : longint;
begin
  VIPS_FORMAT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_FORMAT,VipsFormatClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FORMAT(obj : longint) : longint;
begin
  VIPS_IS_FORMAT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_FORMAT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_FORMAT_CLASS(klass : longint) : longint;
begin
  VIPS_IS_FORMAT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_FORMAT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_FORMAT_GET_CLASS(obj : longint) : longint;
begin
  VIPS_FORMAT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_FORMAT,VipsFormatClass);
end;


end.
