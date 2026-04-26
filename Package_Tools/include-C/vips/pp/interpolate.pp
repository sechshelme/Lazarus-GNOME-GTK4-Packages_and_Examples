
unit interpolate;
interface

{
  Automatically converted by H2Pas 1.0.0 from interpolate.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    interpolate.h
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
PVipsInterpolate  = ^VipsInterpolate;
PVipsInterpolateClass  = ^VipsInterpolateClass;
PVipsRegion  = ^VipsRegion;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Various interpolators.
 *
 * J.Cupitt, 15/10/08
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
{$ifndef VIPS_INTERPOLATE_H}
{$define VIPS_INTERPOLATE_H}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <vips/object.h>}
{$include <vips/region.h>}
{ C++ extern C conditionnal removed }
{__cplusplus }

{ was #define dname def_expr }
function VIPS_TYPE_INTERPOLATE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_INTERPOLATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_INTERPOLATE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_INTERPOLATE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_INTERPOLATE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_INTERPOLATE_GET_CLASS(obj : longint) : longint;

type
  PVipsInterpolate = ^TVipsInterpolate;
  TVipsInterpolate = record
      parent_object : TVipsObject;
    end;
{ An interpolation function. This is a class method, but we have a lookup
 * function for it to speed up dispatch. Write to the memory at "out",
 * interpolate the value at position (x, y) in "in".
  }

  TVipsInterpolateMethod = procedure (interpolate:PVipsInterpolate; out:pointer; in:PVipsRegion; x:Tdouble; y:Tdouble);cdecl;
{ Write to pixel out(x,y), interpolating from in(x,y). The caller has
	 * to set the regions up.
	  }
{ This interpolator needs a window this many pixels across and down.
	  }
{ Or just set this if you want a constant.
	  }
{ Stencils are offset by this much. Default to window_size / 2 - 1
	 * (centering) if get_window_offset is NULL and window_offset is -1.
	  }

  PVipsInterpolateClass = ^TVipsInterpolateClass;
  TVipsInterpolateClass = record
      parent_class : TVipsObjectClass;
      interpolate : TVipsInterpolateMethod;
      get_window_size : function (interpolate:PVipsInterpolate):longint;cdecl;
      window_size : longint;
      get_window_offset : function (interpolate:PVipsInterpolate):longint;cdecl;
      window_offset : longint;
    end;
{ Don't put spaces around void here, it breaks gtk-doc.
  }

function vips_interpolate_get_type:TGType;cdecl;external;
procedure vips_interpolate(interpolate:PVipsInterpolate; out:pointer; in:PVipsRegion; x:Tdouble; y:Tdouble);cdecl;external;
function vips_interpolate_get_method(interpolate:PVipsInterpolate):TVipsInterpolateMethod;cdecl;external;
function vips_interpolate_get_window_size(interpolate:PVipsInterpolate):longint;cdecl;external;
function vips_interpolate_get_window_offset(interpolate:PVipsInterpolate):longint;cdecl;external;
{ How many bits of precision we keep for transformations, ie. how many
 * pre-computed matrices we have.
  }
const
  VIPS_TRANSFORM_SHIFT = 6;  
  VIPS_TRANSFORM_SCALE = 1 shl VIPS_TRANSFORM_SHIFT;  
{ How many bits of precision we keep for interpolation, ie. where the decimal
 * is in the fixed-point tables. For 16-bit pixels, we need 16 bits for the
 * data and 4 bits to add 16 values together. That leaves 12 bits for the
 * fractional part.
  }
  VIPS_INTERPOLATE_SHIFT = 12;  
  VIPS_INTERPOLATE_SCALE = 1 shl VIPS_INTERPOLATE_SHIFT;  
{ Convenience: return static interpolators, no need to unref.
  }

function vips_interpolate_nearest_static:PVipsInterpolate;cdecl;external;
function vips_interpolate_bilinear_static:PVipsInterpolate;cdecl;external;
{ Convenience: make an interpolator from a nickname. g_object_unref() when
 * you're done with it.
  }
(* Const before type ignored *)
function vips_interpolate_new(nickname:Pchar):PVipsInterpolate;cdecl;external;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_INTERPOLATE_H }

implementation

{ was #define dname def_expr }
function VIPS_TYPE_INTERPOLATE : longint; { return type might be wrong }
  begin
    VIPS_TYPE_INTERPOLATE:=vips_interpolate_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_INTERPOLATE(obj : longint) : longint;
begin
  VIPS_INTERPOLATE:=G_TYPE_CHECK_INSTANCE_CAST(obj,VIPS_TYPE_INTERPOLATE,VipsInterpolate);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_INTERPOLATE_CLASS(klass : longint) : longint;
begin
  VIPS_INTERPOLATE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,VIPS_TYPE_INTERPOLATE,VipsInterpolateClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_INTERPOLATE(obj : longint) : longint;
begin
  VIPS_IS_INTERPOLATE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,VIPS_TYPE_INTERPOLATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_IS_INTERPOLATE_CLASS(klass : longint) : longint;
begin
  VIPS_IS_INTERPOLATE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,VIPS_TYPE_INTERPOLATE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function VIPS_INTERPOLATE_GET_CLASS(obj : longint) : longint;
begin
  VIPS_INTERPOLATE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,VIPS_TYPE_INTERPOLATE,VipsInterpolateClass);
end;


end.
