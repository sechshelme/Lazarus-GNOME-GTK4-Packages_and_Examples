unit format;

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
{$ifndef VIPS_FORMAT_H}
{$define VIPS_FORMAT_H}
{ C++ extern C conditionnal removed }
{__cplusplus }

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
{ Read just the header into the VipsImage.
	  }
{ Load the whole image.
	  }
{ Write the VipsImage to the file in this format.
	  }
{ Get the flags for this file in this format.
	  }
{ Loop over formats in this order, default 0. We need this because
	 * some formats can be read by several loaders (eg. tiff can be read
	 * by the libMagick loader as well as by the tiff loader), and we want
	 * to make sure the better loader comes first.
	  }
{ Null-terminated list of allowed suffixes, eg. ".tif", ".tiff".
	  }

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

function vips_format_get_type:TGType;cdecl;external libvips;
{ Map over and find formats. This uses type introspection to loop over
 * subclasses of VipsFormat.
  }
function vips_format_map(fn:TVipsSListMap2Fn; a:pointer; b:pointer):pointer;cdecl;external libvips;
function vips_format_for_file(filename:Pchar):PVipsFormatClass;cdecl;external libvips;
function vips_format_for_name(filename:Pchar):PVipsFormatClass;cdecl;external libvips;
function vips_format_get_flags(format:PVipsFormatClass; filename:Pchar):TVipsFormatFlags;cdecl;external libvips;
{ Read/write an image convenience functions.
  }
function vips_format_read(filename:Pchar; out:PVipsImage):longint;cdecl;external libvips;
function vips_format_write(in:PVipsImage; filename:Pchar):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_FORMAT_H }

// === Konventiert am: 26-4-26 16:13:33 ===

function VIPS_TYPE_FORMAT : TGType;
function VIPS_FORMAT(obj : Pointer) : PVipsFormat;
function VIPS_FORMAT_CLASS(klass : Pointer) : PVipsFormatClass;
function VIPS_IS_FORMAT(obj : Pointer) : Tgboolean;
function VIPS_IS_FORMAT_CLASS(klass : Pointer) : Tgboolean;
function VIPS_FORMAT_GET_CLASS(obj : Pointer) : PVipsFormatClass;

implementation

function VIPS_TYPE_FORMAT : TGType;
  begin
    VIPS_TYPE_FORMAT:=vips_format_get_type;
  end;

function VIPS_FORMAT(obj : Pointer) : PVipsFormat;
begin
  Result := PVipsFormat(g_type_check_instance_cast(obj, VIPS_TYPE_FORMAT));
end;

function VIPS_FORMAT_CLASS(klass : Pointer) : PVipsFormatClass;
begin
  Result := PVipsFormatClass(g_type_check_class_cast(klass, VIPS_TYPE_FORMAT));
end;

function VIPS_IS_FORMAT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  VIPS_TYPE_FORMAT);
end;

function VIPS_IS_FORMAT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  VIPS_TYPE_FORMAT);
end;

function VIPS_FORMAT_GET_CLASS(obj : Pointer) : PVipsFormatClass;
begin
  Result := PVipsFormatClass(PGTypeInstance(obj)^.g_class);
end;



end.
