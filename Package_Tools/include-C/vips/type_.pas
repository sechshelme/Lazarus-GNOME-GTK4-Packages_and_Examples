unit type_;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ the GTypes we define
 *
 * 27/10/11
 * 	- from header.h
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
{$ifndef VIPS_TYPE_H}
{$define VIPS_TYPE_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{ A very simple boxed type for testing. Just holds an int.
  }
type
  PVipsThing = ^TVipsThing;
  TVipsThing = record
      i : longint;
    end;
{*
 * VIPS_TYPE_THING:
 *
 * The #GType for a #VipsThing.
  }

{ was #define dname def_expr }
function VIPS_TYPE_THING : longint; { return type might be wrong }

function vips_thing_get_type:TGType;cdecl;external libvips;
function vips_thing_new(i:longint):PVipsThing;cdecl;external libvips;
{ A ref-counted area of memory. Can hold arrays of things as well.
  }
{ 0 if not known  }
{ If this area represents an array, the number of elements in the
	 * array. Equal to length / sizeof(element).
	  }
{< private > }
{ Reference count and lock.
	 *
	 * We could use an atomic int, but this is not a high-traffic data
	 * structure, so a simple GMutex is OK.
	  }
{ Things like ICC profiles need their own free functions.
	 *
	 * Set client to anything you like -- VipsArea doesn't use this.
	  }
{ If we are holding an array (for example, an array of double), the
	 * GType of the elements and their size. 0 for not known.
	 *
	 * n is always length / sizeof_type, we keep it as a member for
	 * convenience.
	  }
type
  PVipsArea = ^TVipsArea;
  TVipsArea = record
      data : pointer;
      length : Tsize_t;
      n : longint;
      count : longint;
      lock : PGMutex;
      free_fn : TVipsCallbackFn;
      client : pointer;
      _type : TGType;
      sizeof_type : Tsize_t;
    end;

function vips_area_copy(area:PVipsArea):PVipsArea;cdecl;external libvips;
function vips_area_free_cb(mem:pointer; area:PVipsArea):longint;cdecl;external libvips;
procedure vips_area_unref(area:PVipsArea);cdecl;external libvips;
function vips_area_new(free_fn:TVipsCallbackFn; data:pointer):PVipsArea;cdecl;external libvips;
function vips_area_new_array(_type:TGType; sizeof_type:Tsize_t; n:longint):PVipsArea;cdecl;external libvips;
function vips_area_new_array_object(n:longint):PVipsArea;cdecl;external libvips;
function vips_area_get_data(area:PVipsArea; length:Psize_t; n:Plongint; _type:PGType; sizeof_type:Psize_t):pointer;cdecl;external libvips;
{*
 * VIPS_TYPE_AREA:
 *
 * The #GType for a #VipsArea.
  }
{ was #define dname def_expr }
function VIPS_TYPE_AREA : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIPS_AREA(X : longint) : PVipsArea;

function vips_area_get_type:TGType;cdecl;external libvips;
{*
 * VIPS_TYPE_SAVE_STRING:
 *
 * The #GType for a #VipsSaveString.
  }
{ was #define dname def_expr }
function VIPS_TYPE_SAVE_STRING : longint; { return type might be wrong }

function vips_save_string_get_type:TGType;cdecl;external libvips;
type
  PVipsSaveString = ^TVipsSaveString;
  TVipsSaveString = record
      s : Pchar;
    end;
{*
 * VIPS_TYPE_REF_STRING:
 *
 * The #GType for a #VipsRefString.
  }

{ was #define dname def_expr }
function VIPS_TYPE_REF_STRING : longint; { return type might be wrong }

type
  PVipsRefString = ^TVipsRefString;
  TVipsRefString = record
      area : TVipsArea;
    end;

function vips_ref_string_new(str:Pchar):PVipsRefString;cdecl;external libvips;
function vips_ref_string_get(refstr:PVipsRefString; length:Psize_t):Pchar;cdecl;external libvips;
function vips_ref_string_get_type:TGType;cdecl;external libvips;
{*
 * VIPS_TYPE_BLOB:
 *
 * The %GType for a #VipsBlob.
  }
{ was #define dname def_expr }
function VIPS_TYPE_BLOB : longint; { return type might be wrong }

type
  PVipsBlob = ^TVipsBlob;
  TVipsBlob = record
      area : TVipsArea;
    end;

function vips_blob_new(free_fn:TVipsCallbackFn; data:pointer; length:Tsize_t):PVipsBlob;cdecl;external libvips;
function vips_blob_copy(data:pointer; length:Tsize_t):PVipsBlob;cdecl;external libvips;
function vips_blob_get(blob:PVipsBlob; length:Psize_t):pointer;cdecl;external libvips;
procedure vips_blob_set(blob:PVipsBlob; free_fn:TVipsCallbackFn; data:pointer; length:Tsize_t);cdecl;external libvips;
function vips_blob_get_type:TGType;cdecl;external libvips;
{*
 * VIPS_TYPE_ARRAY_DOUBLE:
 *
 * The #GType for a #VipsArrayDouble.
  }
{ was #define dname def_expr }
function VIPS_TYPE_ARRAY_DOUBLE : longint; { return type might be wrong }

type
  PVipsArrayDouble = ^TVipsArrayDouble;
  TVipsArrayDouble = record
      area : TVipsArea;
    end;

function vips_array_double_new(array:Pdouble; n:longint):PVipsArrayDouble;cdecl;external libvips;
function vips_array_double_newv(n:longint; args:array of const):PVipsArrayDouble;cdecl;external libvips;
function vips_array_double_newv(n:longint):PVipsArrayDouble;cdecl;external libvips;
function vips_array_double_get(array:PVipsArrayDouble; n:Plongint):Pdouble;cdecl;external libvips;
function vips_array_double_get_type:TGType;cdecl;external libvips;
{*
 * VIPS_TYPE_ARRAY_INT:
 *
 * The #GType for a #VipsArrayInt.
  }
{ was #define dname def_expr }
function VIPS_TYPE_ARRAY_INT : longint; { return type might be wrong }

type
  PVipsArrayInt = ^TVipsArrayInt;
  TVipsArrayInt = record
      area : TVipsArea;
    end;

function vips_array_int_new(array:Plongint; n:longint):PVipsArrayInt;cdecl;external libvips;
function vips_array_int_newv(n:longint; args:array of const):PVipsArrayInt;cdecl;external libvips;
function vips_array_int_newv(n:longint):PVipsArrayInt;cdecl;external libvips;
function vips_array_int_get(array:PVipsArrayInt; n:Plongint):Plongint;cdecl;external libvips;
function vips_array_int_get_type:TGType;cdecl;external libvips;
{*
 * VIPS_TYPE_ARRAY_IMAGE:
 *
 * The #GType for a #VipsArrayImage.
  }
{ was #define dname def_expr }
function VIPS_TYPE_ARRAY_IMAGE : longint; { return type might be wrong }

type
  PVipsArrayImage = ^TVipsArrayImage;
  TVipsArrayImage = record
      area : TVipsArea;
    end;
{ See image.h for vips_array_image_new() etc., they need to be declared after
 * VipsImage.
  }

function vips_array_image_get_type:TGType;cdecl;external libvips;
procedure vips_value_set_area(value:PGValue; free_fn:TVipsCallbackFn; data:pointer);cdecl;external libvips;
function vips_value_get_area(value:PGValue; length:Psize_t):pointer;cdecl;external libvips;
function vips_value_get_save_string(value:PGValue):Pchar;cdecl;external libvips;
procedure vips_value_set_save_string(value:PGValue; str:Pchar);cdecl;external libvips;
procedure vips_value_set_save_stringf(value:PGValue; fmt:Pchar; args:array of const);cdecl;external libvips;
procedure vips_value_set_save_stringf(value:PGValue; fmt:Pchar);cdecl;external libvips;
function vips_value_get_ref_string(value:PGValue; length:Psize_t):Pchar;cdecl;external libvips;
procedure vips_value_set_ref_string(value:PGValue; str:Pchar);cdecl;external libvips;
function vips_value_get_blob(value:PGValue; length:Psize_t):pointer;cdecl;external libvips;
procedure vips_value_set_blob(value:PGValue; free_fn:TVipsCallbackFn; data:pointer; length:Tsize_t);cdecl;external libvips;
procedure vips_value_set_blob_free(value:PGValue; data:pointer; length:Tsize_t);cdecl;external libvips;
procedure vips_value_set_array(value:PGValue; n:longint; _type:TGType; sizeof_type:Tsize_t);cdecl;external libvips;
function vips_value_get_array(value:PGValue; n:Plongint; _type:PGType; sizeof_type:Psize_t):pointer;cdecl;external libvips;
function vips_value_get_array_double(value:PGValue; n:Plongint):Pdouble;cdecl;external libvips;
procedure vips_value_set_array_double(value:PGValue; array:Pdouble; n:longint);cdecl;external libvips;
function vips_value_get_array_int(value:PGValue; n:Plongint):Plongint;cdecl;external libvips;
procedure vips_value_set_array_int(value:PGValue; array:Plongint; n:longint);cdecl;external libvips;
function vips_value_get_array_object(value:PGValue; n:Plongint):^PGObject;cdecl;external libvips;
procedure vips_value_set_array_object(value:PGValue; n:longint);cdecl;external libvips;
{ See also image.h, that has vips_array_image_get(), vips_array_image_new(),
 * vips_value_get_array_image() and vips_value_set_array_image(). They need
 * to be declared after VipsImage.
  }
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_TYPE_H }

// === Konventiert am: 26-4-26 16:09:18 ===


implementation


{ was #define dname def_expr }
function VIPS_TYPE_THING : longint; { return type might be wrong }
  begin
    VIPS_TYPE_THING:=vips_thing_get_type;
  end;

{ was #define dname def_expr }
function VIPS_TYPE_AREA : longint; { return type might be wrong }
  begin
    VIPS_TYPE_AREA:=vips_area_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function VIPS_AREA(X : longint) : PVipsArea;
begin
  VIPS_AREA:=PVipsArea(X);
end;

{ was #define dname def_expr }
function VIPS_TYPE_SAVE_STRING : longint; { return type might be wrong }
  begin
    VIPS_TYPE_SAVE_STRING:=vips_save_string_get_type;
  end;

{ was #define dname def_expr }
function VIPS_TYPE_REF_STRING : longint; { return type might be wrong }
  begin
    VIPS_TYPE_REF_STRING:=vips_ref_string_get_type;
  end;

{ was #define dname def_expr }
function VIPS_TYPE_BLOB : longint; { return type might be wrong }
  begin
    VIPS_TYPE_BLOB:=vips_blob_get_type;
  end;

{ was #define dname def_expr }
function VIPS_TYPE_ARRAY_DOUBLE : longint; { return type might be wrong }
  begin
    VIPS_TYPE_ARRAY_DOUBLE:=vips_array_double_get_type;
  end;

{ was #define dname def_expr }
function VIPS_TYPE_ARRAY_INT : longint; { return type might be wrong }
  begin
    VIPS_TYPE_ARRAY_INT:=vips_array_int_get_type;
  end;

{ was #define dname def_expr }
function VIPS_TYPE_ARRAY_IMAGE : longint; { return type might be wrong }
  begin
    VIPS_TYPE_ARRAY_IMAGE:=vips_array_image_get_type;
  end;


end.
