
unit gegl_curve;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_curve.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_curve.h
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
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
PGeglCurve  = ^GeglCurve;
PGeglCurveClass  = ^GeglCurveClass;
PGParamSpec  = ^GParamSpec;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2007 Mark Probst <mark.probst@gmail.com>
  }
{$ifndef __GEGL_CURVE_H__}
{$define __GEGL_CURVE_H__}
{**
 * GeglCurve:
 *
 * #GeglCurve is a curve describing a unique mapping of values.
 *
 * Used for things like the curves widget in gimp it is a form of doodle
 * alpha.
  }
{$include <glib-object.h>}

{ was #define dname def_expr }
function GEGL_TYPE_CURVE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_CURVE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_CURVE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_CURVE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_CURVE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_CURVE_GET_CLASS(obj : longint) : longint;

type
  PGeglCurve = ^TGeglCurve;
  TGeglCurve = record
      parent_instance : TGObject;
    end;

  PGeglCurveClass = ^TGeglCurveClass;
  TGeglCurveClass = record
      parent_class : TGObjectClass;
    end;


function gegl_curve_get_type:TGType;cdecl;external;
{*
 * gegl_curve_new:
 * @y_min: minimum y value for curve.
 * @y_max: maximum y value for curve.
 *
 * Create a #GeglCurve that can store a curve with values between @y_min and
 * @y_max.
 *
 * Returns the newly created #GeglCurve.
  }
function gegl_curve_new(y_min:Tgdouble; y_max:Tgdouble):PGeglCurve;cdecl;external;
{*
 * gegl_curve_new_default:
 *
 * Create a default #GeglCurve with an identify mapping of
 * (0.0..1.0) -> (0.0..1.0).
 *
 * Returns the newly created default #GeglCurve.
  }
function gegl_curve_new_default:PGeglCurve;cdecl;external;
{*
 * gegl_curve_duplicate:
 * @curve: the curve to duplicate.
 *
 * Create a copy of @curve.
 *
 * Return value: (transfer full): A new copy of @curve.
  }
function gegl_curve_duplicate(curve:PGeglCurve):PGeglCurve;cdecl;external;
{*
 * gegl_curve_get_y_bounds:
 * @curve: a #GeglCurve.
 * @min_y: (out): return location for minimal value.
 * @max_y: (out): return location for maximal value.
 *
 * Get the bounds on the values of the curve and store the values in
 * the return locaitons provided in @min_y and @max_y.
  }
procedure gegl_curve_get_y_bounds(curve:PGeglCurve; min_y:Pgdouble; max_y:Pgdouble);cdecl;external;
{*
 * gegl_curve_add_point:
 * @curve: a #GeglCurve.
 * @x: x coordinate
 * @y: y coordinate
 *
 * Add a point to the curve at @x @y (replacing the value exactly for @x if it
 * already exists.
  }
function gegl_curve_add_point(curve:PGeglCurve; x:Tgdouble; y:Tgdouble):Tguint;cdecl;external;
{*
 * gegl_curve_get_point:
 * @curve: a #GeglCurve.
 * @index: the position of the value number to retrieve.
 * @x: (out): x coordinate return location.
 * @y: (out): y coordinate return location.
 *
 * Retrive the coordinates for an index.
  }
procedure gegl_curve_get_point(curve:PGeglCurve; index:Tguint; x:Pgdouble; y:Pgdouble);cdecl;external;
{*
 * gegl_curve_set_point:
 * @curve: a #GeglCurve.
 * @index: the position of the value number to retrieve.
 * @x: x coordinate
 * @y: y coordinate
 *
 * Replace an existing point in a curve.
  }
procedure gegl_curve_set_point(curve:PGeglCurve; index:Tguint; x:Tgdouble; y:Tgdouble);cdecl;external;
{*
 * gegl_curve_num_points:
 * @curve: a #GeglCurve.
 *
 * Retrieve the number of points in the curve.
 *
 * Returns the number of points for the coordinates in the curve.
  }
function gegl_curve_num_points(curve:PGeglCurve):Tguint;cdecl;external;
{*
 * gegl_curve_calc_value:
 * @curve: a #GeglCurve.
 *
 * Retrieve the number of points in the curve.
 *
 * Returns the number of points for the coordinates in the curve.
  }
function gegl_curve_calc_value(curve:PGeglCurve; x:Tgdouble):Tgdouble;cdecl;external;
{*
 * gegl_curve_calc_values: (skip)
 * @curve: a #GeglCurve.
 * @x_min: the minimum value to compute for
 * @x_max: the maximum value to compute for
 * @num_samples: number of samples to calculate
 * @xs: return location for the x coordinates
 * @ys: return location for the y coordinates
 *
 * Compute a set (lookup table) of coordinates.
  }
procedure gegl_curve_calc_values(curve:PGeglCurve; x_min:Tgdouble; x_max:Tgdouble; num_samples:Tguint; xs:Pgdouble; 
            ys:Pgdouble);cdecl;external;
{**
  }
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_CURVE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_CURVE(pspec : longint) : longint;

function gegl_param_curve_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_curve:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @default_curve: the default value for the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GParamSpec instance specifying a #GeglCurve property.
 *
 * Returns: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_curve(name:Pgchar; nick:Pgchar; blurb:Pgchar; default_curve:PGeglCurve; flags:TGParamFlags):PGParamSpec;cdecl;external;
{$endif}
{ __GEGL_CURVE_H__  }

implementation

{ was #define dname def_expr }
function GEGL_TYPE_CURVE : longint; { return type might be wrong }
  begin
    GEGL_TYPE_CURVE:=gegl_curve_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_CURVE(obj : longint) : longint;
begin
  GEGL_CURVE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEGL_TYPE_CURVE,GeglCurve);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_CURVE_CLASS(klass : longint) : longint;
begin
  GEGL_CURVE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEGL_TYPE_CURVE,GeglCurveClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_CURVE(obj : longint) : longint;
begin
  GEGL_IS_CURVE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEGL_TYPE_CURVE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_CURVE_CLASS(klass : longint) : longint;
begin
  GEGL_IS_CURVE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEGL_TYPE_CURVE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_CURVE_GET_CLASS(obj : longint) : longint;
begin
  GEGL_CURVE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEGL_TYPE_CURVE,GeglCurveClass);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_CURVE : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_CURVE:=gegl_param_curve_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_CURVE(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_CURVE:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_CURVE);
end;


end.
