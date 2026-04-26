unit interpolate;

interface

uses
  fp_glib2;

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

function vips_interpolate_get_type:TGType;cdecl;external libvips;
procedure vips_interpolate(interpolate:PVipsInterpolate; out:pointer; in:PVipsRegion; x:Tdouble; y:Tdouble);cdecl;external libvips;
function vips_interpolate_get_method(interpolate:PVipsInterpolate):TVipsInterpolateMethod;cdecl;external libvips;
function vips_interpolate_get_window_size(interpolate:PVipsInterpolate):longint;cdecl;external libvips;
function vips_interpolate_get_window_offset(interpolate:PVipsInterpolate):longint;cdecl;external libvips;
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

function vips_interpolate_nearest_static:PVipsInterpolate;cdecl;external libvips;
function vips_interpolate_bilinear_static:PVipsInterpolate;cdecl;external libvips;
{ Convenience: make an interpolator from a nickname. g_object_unref() when
 * you're done with it.
  }
function vips_interpolate_new(nickname:Pchar):PVipsInterpolate;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{VIPS_INTERPOLATE_H }

// === Konventiert am: 26-4-26 16:12:52 ===

function VIPS_TYPE_INTERPOLATE : TGType;
function VIPS_INTERPOLATE(obj : Pointer) : PVipsInterpolate;
function VIPS_INTERPOLATE_CLASS(klass : Pointer) : PVipsInterpolateClass;
function VIPS_IS_INTERPOLATE(obj : Pointer) : Tgboolean;
function VIPS_IS_INTERPOLATE_CLASS(klass : Pointer) : Tgboolean;
function VIPS_INTERPOLATE_GET_CLASS(obj : Pointer) : PVipsInterpolateClass;

implementation

function VIPS_TYPE_INTERPOLATE : TGType;
  begin
    VIPS_TYPE_INTERPOLATE:=vips_interpolate_get_type;
  end;

function VIPS_INTERPOLATE(obj : Pointer) : PVipsInterpolate;
begin
  Result := PVipsInterpolate(g_type_check_instance_cast(obj, VIPS_TYPE_INTERPOLATE));
end;

function VIPS_INTERPOLATE_CLASS(klass : Pointer) : PVipsInterpolateClass;
begin
  Result := PVipsInterpolateClass(g_type_check_class_cast(klass, VIPS_TYPE_INTERPOLATE));
end;

function VIPS_IS_INTERPOLATE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  VIPS_TYPE_INTERPOLATE);
end;

function VIPS_IS_INTERPOLATE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  VIPS_TYPE_INTERPOLATE);
end;

function VIPS_INTERPOLATE_GET_CLASS(obj : Pointer) : PVipsInterpolateClass;
begin
  Result := PVipsInterpolateClass(PGTypeInstance(obj)^.g_class);
end;



end.
