
unit gegl_color;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_color.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_color.h
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
PBabl  = ^Babl;
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
PGeglColor  = ^GeglColor;
PGeglColorClass  = ^GeglColorClass;
PGeglColorPrivate  = ^GeglColorPrivate;
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
 * Copyright 2006 Martin Nordholts <enselic@hotmail.com>
  }
{$ifndef __GEGL_COLOR_H__}
{$define __GEGL_COLOR_H__}
{$include <glib-object.h>}

{ was #define dname def_expr }
function GEGL_TYPE_COLOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_COLOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_COLOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_COLOR(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_COLOR_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_COLOR_GET_CLASS(obj : longint) : longint;

type
  PGeglColor = ^TGeglColor;
  TGeglColor = record
      parent_instance : TGObject;
      priv : PGeglColorPrivate;
    end;

  PGeglColorClass = ^TGeglColorClass;
  TGeglColorClass = record
      parent_class : TGObjectClass;
    end;


function gegl_color_get_type:TGType;cdecl;external;
{**
 * GeglColor:
 *
 * GeglColor is an object containing a color at the moment only RGB colors
 * are supported, in the future a GeglColor might also indicate other
 * enumerated or natively in other color representations colors.
 *
 * GeglColor accepts a subset of format string as defined by the CSS color specification:
 *  http://dev.w3.org/csswg/css-color/
 *
 * - RGB hexadecimal notation: #rrggbb[aa] / #rgb[a]
 * - Named colors, limited to the 16 specified in HTML4
 * 
 * To specify linear-light floating-point RGB, use: rgb[a](0.40, 0.44, 0.92 [, a])
 * The normal bounds are [0.0 1.0], unlike CSS which is [0 255]. Out-of-bounds values are allowed.
  }
{*
 * gegl_color_new:
 * @string: a string describing the color to be created.
 *
 * Creates a new #GeglColor.
 *
 * Returns the newly created #GeglColor.
  }
(* Const before type ignored *)
function gegl_color_new(_string:Pgchar):PGeglColor;cdecl;external;
{*
 * gegl_color_duplicate:
 * @color: the color to duplicate.
 *
 * Creates a copy of @color.
 *
 * Return value: (transfer full): A new copy of @color.
  }
function gegl_color_duplicate(color:PGeglColor):PGeglColor;cdecl;external;
{*
 * gegl_color_get_rgba:
 * @color: a #GeglColor
 * @red: (out): red return location.
 * @green: (out): green return location.
 * @blue: (out): blue return location.
 * @alpha: (out): alpha return location.
 *
 * Retrieves the current set color as linear light non premultipled RGBA data,
 * any of the return pointers can be omitted.
  }
procedure gegl_color_get_rgba(color:PGeglColor; red:Pgdouble; green:Pgdouble; blue:Pgdouble; alpha:Pgdouble);cdecl;external;
{*
 * gegl_color_set_rgba:
 * @color: a #GeglColor
 * @red: red value
 * @green: green value
 * @blue: blue value
 * @alpha: alpha value
 *
 * Set color as linear light non premultipled RGBA data
  }
procedure gegl_color_set_rgba(color:PGeglColor; red:Tgdouble; green:Tgdouble; blue:Tgdouble; alpha:Tgdouble);cdecl;external;
{*
 * gegl_color_get_rgba_with_space:
 * @color: a #GeglColor
 * @red: (out): red return location.
 * @green: (out): green return location.
 * @blue: (out): blue return location.
 * @alpha: (out): alpha return location.
 * @space: RGB space.
 *
 * Retrieves the current set color stored as @space.
 * If @space is %NULL, this is equivalent to requesting color in sRGB.
  }
(* Const before type ignored *)
procedure gegl_color_get_rgba_with_space(color:PGeglColor; red:Pgdouble; green:Pgdouble; blue:Pgdouble; alpha:Pgdouble; 
            space:PBabl);cdecl;external;
{*
 * gegl_color_set_rgba_with_space:
 * @color: a #GeglColor
 * @red: red value
 * @green: green value
 * @blue: blue value
 * @alpha: alpha value
 * @space: RGB space.
 *
 * Set color as RGBA data stored as @space. If @space is %NULL, this is
 * equivalent to storing as sRGB.
  }
(* Const before type ignored *)
procedure gegl_color_set_rgba_with_space(color:PGeglColor; red:Tgdouble; green:Tgdouble; blue:Tgdouble; alpha:Tgdouble; 
            space:PBabl);cdecl;external;
{*
 * gegl_color_get_cmyk:
 * @color: a #GeglColor
 * @cyan: (out): cyan return location.
 * @magenta: (out): magenta return location.
 * @yellow: (out): yellow return location.
 * @key: (out): key return location.
 * @alpha: (out): alpha return location.
 * @space: (nullable): CMYK space.
 *
 * Retrieves the current set color stored as @space.
 * If @space is %NULL, this is equivalent to requesting color in the default
 * naive CMYK space.
  }
(* Const before type ignored *)
procedure gegl_color_get_cmyk(color:PGeglColor; cyan:Pgdouble; magenta:Pgdouble; yellow:Pgdouble; key:Pgdouble; 
            alpha:Pgdouble; space:PBabl);cdecl;external;
{*
 * gegl_color_set_cmyk:
 * @color: a #GeglColor
 * @cyan: cyan value
 * @magenta: magenta value
 * @yellow: yellow value
 * @key: key value
 * @alpha: alpha value
 * @space: (nullable): CMYK space.
 *
 * Set color as CMYK data stored as @space. If @space is %NULL, this is
 * equivalent to storing with the default naive CMYK space.
  }
(* Const before type ignored *)
procedure gegl_color_set_cmyk(color:PGeglColor; cyan:Tgdouble; magenta:Tgdouble; yellow:Tgdouble; key:Tgdouble; 
            alpha:Tgdouble; space:PBabl);cdecl;external;
{*
 * gegl_color_set_pixel: (skip)
 * @color: a #GeglColor
 * @format: a babl pixel format
 * @pixel: pointer to a pixel
 *
 * Set a GeglColor from a pointer to a pixel and it's babl format.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure gegl_color_set_pixel(color:PGeglColor; format:PBabl; pixel:pointer);cdecl;external;
{*
 * gegl_color_get_pixel: (skip)
 * @color: a #GeglColor
 * @format: a babl pixel format
 * @pixel: pointer to a pixel
 *
 * Store the color in a pixel in the given format.
  }
(* Const before type ignored *)
procedure gegl_color_get_pixel(color:PGeglColor; format:PBabl; pixel:pointer);cdecl;external;
{*
 * gegl_color_set_bytes:
 * @color:  a #GeglColor
 * @format: a babl pixel format
 * @bytes:  color stored as @format
 *
 * Set a GeglColor from a pixel stored in a %GBytes and it's babl format.
  }
(* Const before type ignored *)
procedure gegl_color_set_bytes(color:PGeglColor; format:PBabl; bytes:PGBytes);cdecl;external;
{*
 * gegl_color_get_bytes:
 * @color: a #GeglColor
 * @format: a babl pixel format
 *
 * Returns: the color in the given @format.
  }
(* Const before type ignored *)
function gegl_color_get_bytes(color:PGeglColor; format:PBabl):PGBytes;cdecl;external;
{**
  }
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_COLOR : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_COLOR(pspec : longint) : longint;

function gegl_param_color_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_color:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @default_color: the default value for the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GParamSpec instance specifying a #GeglColor property.
 *
 * Returns: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_color(name:Pgchar; nick:Pgchar; blurb:Pgchar; default_color:PGeglColor; flags:TGParamFlags):PGParamSpec;cdecl;external;
{*
 * gegl_param_spec_color_from_string:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @default_color_string: the default value for the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GParamSpec instance specifying a #GeglColor property.
 *
 * Returns: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_color_from_string(name:Pgchar; nick:Pgchar; blurb:Pgchar; default_color_string:Pgchar; flags:TGParamFlags):PGParamSpec;cdecl;external;
{*
 * gegl_param_spec_color_get_default:
 * @self: a #GeglColor #GParamSpec
 *
 * Get the default color value of the param spec
 *
 * Returns: (transfer none): the default #GeglColor
  }
function gegl_param_spec_color_get_default(self:PGParamSpec):PGeglColor;cdecl;external;
{*
 * gegl_color_get_format:
 * @color: a #GeglColor
 *
 * Return: (transfer none): the pixel format encoding of the set color.
  }
(* Const before type ignored *)
function gegl_color_get_format(color:PGeglColor):PBabl;cdecl;external;
{$endif}
{ __GEGL_COLOR_H__  }

implementation

{ was #define dname def_expr }
function GEGL_TYPE_COLOR : longint; { return type might be wrong }
  begin
    GEGL_TYPE_COLOR:=gegl_color_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_COLOR(obj : longint) : longint;
begin
  GEGL_COLOR:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEGL_TYPE_COLOR,GeglColor);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_COLOR_CLASS(klass : longint) : longint;
begin
  GEGL_COLOR_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEGL_TYPE_COLOR,GeglColorClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_COLOR(obj : longint) : longint;
begin
  GEGL_IS_COLOR:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEGL_TYPE_COLOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_COLOR_CLASS(klass : longint) : longint;
begin
  GEGL_IS_COLOR_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEGL_TYPE_COLOR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_COLOR_GET_CLASS(obj : longint) : longint;
begin
  GEGL_COLOR_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEGL_TYPE_COLOR,GeglColorClass);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_COLOR : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_COLOR:=gegl_param_color_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_COLOR(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_COLOR:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_COLOR);
end;


end.
