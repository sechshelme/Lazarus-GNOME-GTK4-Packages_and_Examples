
unit gegl_paramspecs;
interface

{
  Automatically converted by H2Pas 1.0.0 from gegl_paramspecs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gegl_paramspecs.h
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
PGeglParamSpecDouble  = ^GeglParamSpecDouble;
PGeglParamSpecEnum  = ^GeglParamSpecEnum;
PGeglParamSpecFilePath  = ^GeglParamSpecFilePath;
PGeglParamSpecFormat  = ^GeglParamSpecFormat;
PGeglParamSpecInt  = ^GeglParamSpecInt;
PGeglParamSpecSeed  = ^GeglParamSpecSeed;
PGeglParamSpecString  = ^GeglParamSpecString;
PGeglParamSpecUri  = ^GeglParamSpecUri;
PGParamSpec  = ^GParamSpec;
PGSList  = ^GSList;
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
 * Copyright 2003 Calvin Williamson
 *           2006 Øyvind Kolås
 *
 * Original contents copied from gimp/app/core/gimpparamspecs.h
 * (c) 1995-2006 Spencer Kimball, Peter Mattis and others.
  }
{$include <glib-object.h>}
{$ifndef __GEGL_PARAM_SPECS_H__}
{$define __GEGL_PARAM_SPECS_H__}
{
 * Keep in sync with libgeglconfig/geglconfig-params.h
  }

const
  GEGL_PARAM_NO_VALIDATE = 1 shl (6+G_PARAM_USER_SHIFT);  
type
{
 * GEGL_TYPE_PARAM_DOUBLE
  }

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_DOUBLE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_DOUBLE(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_DOUBLE(pspec : longint) : longint;

{ reasonable range to present to user  }
{ a desired non-linear mapping or 1.0, useful
                                  when the control the user needs is not a
                                  linear mapping, like controlling brush-size
                                  or gaussian blur radius - where more
                                  detailed control of small values is needed
                                   }
type
  PGeglParamSpecDouble = ^TGeglParamSpecDouble;
  TGeglParamSpecDouble = record
      parent_instance : TGParamSpecDouble;
      ui_minimum : Tgdouble;
      ui_maximum : Tgdouble;
      ui_gamma : Tgdouble;
      ui_step_small : Tgdouble;
      ui_step_big : Tgdouble;
      ui_digits : Tgint;
    end;


function gegl_param_double_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_double:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * @ui_minimum: minimum value a user should be allowed to input
 * @ui_maximum: maximum value a user should be allowed to input
 * @ui_gamma: the gamma that should be used when adjusting the value
 * @flags: flags for the property specified
 *
 * Creates a new #GeglParamSpecDouble instance.
 *
 * Return value: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_double(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tgdouble; maximum:Tgdouble; 
           default_value:Tgdouble; ui_minimum:Tgdouble; ui_maximum:Tgdouble; ui_gamma:Tgdouble; flags:TGParamFlags):PGParamSpec;cdecl;external;
{ utility function to initialize ui_steps; should be moved to constructor
 * when breaking API/ABI  }
procedure gegl_param_spec_double_set_steps(pspec:PGeglParamSpecDouble; small_step:Tgdouble; big_step:Tgdouble);cdecl;external;
procedure gegl_param_spec_double_set_digits(pspec:PGeglParamSpecDouble; digits:Tgint);cdecl;external;
{
 * GEGL_TYPE_PARAM_INT
  }
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_INT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_INT(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_INT(pspec : longint) : longint;

{ reasonable range to present to user  }
type
  PGeglParamSpecInt = ^TGeglParamSpecInt;
  TGeglParamSpecInt = record
      parent_instance : TGParamSpecInt;
      ui_minimum : Tgint;
      ui_maximum : Tgint;
      ui_gamma : Tgdouble;
      ui_step_small : Tgint;
      ui_step_big : Tgint;
    end;


function gegl_param_int_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_int:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @minimum: minimum value for the property specified
 * @maximum: maximum value for the property specified
 * @default_value: default value for the property specified
 * @ui_minimum: minimum value a user should be allowed to input
 * @ui_maximum: maximum value a user should be allowed to input
 * @ui_gamma: the gamma that should be used when adjusting the value
 * @flags: flags for the property specified
 *
 * Creates a new #GeglParamSpecInt instance.
 *
 * Return value: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_int(name:Pgchar; nick:Pgchar; blurb:Pgchar; minimum:Tgint; maximum:Tgint; 
           default_value:Tgint; ui_minimum:Tgint; ui_maximum:Tgint; ui_gamma:Tgdouble; flags:TGParamFlags):PGParamSpec;cdecl;external;
procedure gegl_param_spec_int_set_steps(pspec:PGeglParamSpecInt; small_step:Tgint; big_step:Tgint);cdecl;external;
{
 * GEGL_TYPE_PARAM_STRING
  }
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_STRING : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_STRING(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_STRING(pspec : longint) : longint;

type
  PGeglParamSpecString = ^TGeglParamSpecString;
  TGeglParamSpecString = record
      parent_instance : TGParamSpecString;
      flag0 : word;
    end;


const
  bm_TGeglParamSpecString_no_validate = $1;
  bp_TGeglParamSpecString_no_validate = 0;
  bm_TGeglParamSpecString_null_ok = $2;
  bp_TGeglParamSpecString_null_ok = 1;

function no_validate(var a : TGeglParamSpecString) : Tguint;
procedure set_no_validate(var a : TGeglParamSpecString; __no_validate : Tguint);
function null_ok(var a : TGeglParamSpecString) : Tguint;
procedure set_null_ok(var a : TGeglParamSpecString; __null_ok : Tguint);

function gegl_param_string_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_string:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @no_validate: true if the string should be validated with g_utf8_validate
 * @null_ok: true if the string can be NULL
 * @default_value: default value for the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GeglParamSpecString instance.
 *
 * Return value: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_string(name:Pgchar; nick:Pgchar; blurb:Pgchar; no_validate:Tgboolean; null_ok:Tgboolean; 
           default_value:Pgchar; flags:TGParamFlags):PGParamSpec;cdecl;external;
{
 * GEGL_TYPE_PARAM_FILEPATH
  }
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_FILE_PATH : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_FILE_PATH(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_FILE_PATH(pspec : longint) : longint;

type
  PGeglParamSpecFilePath = ^TGeglParamSpecFilePath;
  TGeglParamSpecFilePath = record
      parent_instance : TGParamSpecString;
      flag0 : word;
    end;


const
  bm_TGeglParamSpecFilePath_no_validate = $1;
  bp_TGeglParamSpecFilePath_no_validate = 0;
  bm_TGeglParamSpecFilePath_null_ok = $2;
  bp_TGeglParamSpecFilePath_null_ok = 1;

function no_validate(var a : TGeglParamSpecFilePath) : Tguint;
procedure set_no_validate(var a : TGeglParamSpecFilePath; __no_validate : Tguint);
function null_ok(var a : TGeglParamSpecFilePath) : Tguint;
procedure set_null_ok(var a : TGeglParamSpecFilePath; __null_ok : Tguint);

function gegl_param_file_path_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_file_path:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @no_validate: true if the string should be validated with g_utf8_validate
 * @null_ok: true if the string can be NULL
 * @default_value: default value for the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GeglParamSpecFilePath instance.
 *
 * Return value: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_file_path(name:Pgchar; nick:Pgchar; blurb:Pgchar; no_validate:Tgboolean; null_ok:Tgboolean; 
           default_value:Pgchar; flags:TGParamFlags):PGParamSpec;cdecl;external;
{
 * GEGL_TYPE_PARAM_ENUM
  }
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_ENUM : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_ENUM(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_ENUM(pspec : longint) : longint;

type
  PGeglParamSpecEnum = ^TGeglParamSpecEnum;
  TGeglParamSpecEnum = record
      parent_instance : TGParamSpecEnum;
      excluded_values : PGSList;
    end;


function gegl_param_enum_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_enum:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @enum_type: the enum type to get valid values from
 * @default_value: default value for the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GeglParamSpecEnum instance.
 *
 * Return value: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_enum(name:Pgchar; nick:Pgchar; blurb:Pgchar; enum_type:TGType; default_value:Tgint; 
           flags:TGParamFlags):PGParamSpec;cdecl;external;
procedure gegl_param_spec_enum_exclude_value(espec:PGeglParamSpecEnum; value:Tgint);cdecl;external;
{
 * GEGL_TYPE_PARAM_SEED
  }
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_SEED : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_SEED(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_SEED(pspec : longint) : longint;

type
  PGeglParamSpecSeed = ^TGeglParamSpecSeed;
  TGeglParamSpecSeed = record
      parent_instance : TGParamSpecUInt;
      ui_minimum : Tguint;
      ui_maximum : Tguint;
    end;


function gegl_param_seed_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_seed:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GeglParamSpecSeed instance specifying an integer random seed.
 *
 * Returns: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_seed(name:Pgchar; nick:Pgchar; blurb:Pgchar; flags:TGParamFlags):PGParamSpec;cdecl;external;
{
 * GEGL_TYPE_PARAM_FORMAT
  }
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_FORMAT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_FORMAT(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_FORMAT(pspec : longint) : longint;

type
  PGeglParamSpecFormat = ^TGeglParamSpecFormat;
  TGeglParamSpecFormat = record
      parent_instance : TGParamSpecPointer;
    end;


function gegl_param_format_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_format:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GeglParamSpecFormat instance specifying a Babl format.
 *
 * Returns: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_format(name:Pgchar; nick:Pgchar; blurb:Pgchar; flags:TGParamFlags):PGParamSpec;cdecl;external;
{
 * GEGL_TYPE_PARAM_URI
  }
{ was #define dname def_expr }
function GEGL_TYPE_PARAM_URI : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_URI(pspec : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_URI(pspec : longint) : longint;

type
  PGeglParamSpecUri = ^TGeglParamSpecUri;
  TGeglParamSpecUri = record
      parent_instance : TGParamSpecString;
      flag0 : word;
    end;


const
  bm_TGeglParamSpecUri_no_validate = $1;
  bp_TGeglParamSpecUri_no_validate = 0;
  bm_TGeglParamSpecUri_null_ok = $2;
  bp_TGeglParamSpecUri_null_ok = 1;

function no_validate(var a : TGeglParamSpecUri) : Tguint;
procedure set_no_validate(var a : TGeglParamSpecUri; __no_validate : Tguint);
function null_ok(var a : TGeglParamSpecUri) : Tguint;
procedure set_null_ok(var a : TGeglParamSpecUri; __null_ok : Tguint);

function gegl_param_uri_get_type:TGType;cdecl;external;
{*
 * gegl_param_spec_uri:
 * @name: canonical name of the property specified
 * @nick: nick name for the property specified
 * @blurb: description of the property specified
 * @no_validate: true if the string should be validated with g_utf8_validate
 * @null_ok: true if the string can be NULL
 * @default_value: default value for the property specified
 * @flags: flags for the property specified
 *
 * Creates a new #GeglParamSpecUri instance.
 *
 * Return value: (transfer full): a newly created parameter specification
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gegl_param_spec_uri(name:Pgchar; nick:Pgchar; blurb:Pgchar; no_validate:Tgboolean; null_ok:Tgboolean; 
           default_value:Pgchar; flags:TGParamFlags):PGParamSpec;cdecl;external;
{$endif}
{  __GEGL_PARAM_SPECS_H__   }

implementation

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_DOUBLE : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_DOUBLE:=gegl_param_double_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_DOUBLE(pspec : longint) : longint;
begin
  GEGL_PARAM_SPEC_DOUBLE:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GEGL_TYPE_PARAM_DOUBLE,GeglParamSpecDouble);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_DOUBLE(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_DOUBLE:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_DOUBLE);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_INT : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_INT:=gegl_param_int_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_INT(pspec : longint) : longint;
begin
  GEGL_PARAM_SPEC_INT:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GEGL_TYPE_PARAM_INT,GeglParamSpecInt);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_INT(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_INT:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_INT);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_STRING : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_STRING:=gegl_param_string_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_STRING(pspec : longint) : longint;
begin
  GEGL_PARAM_SPEC_STRING:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GEGL_TYPE_PARAM_STRING,GeglParamSpecString);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_STRING(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_STRING:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_STRING);
end;

function no_validate(var a : TGeglParamSpecString) : Tguint;
begin
  no_validate:=(a.flag0 and bm_TGeglParamSpecString_no_validate) shr bp_TGeglParamSpecString_no_validate;
end;

procedure set_no_validate(var a : TGeglParamSpecString; __no_validate : Tguint);
begin
  a.flag0:=a.flag0 or ((__no_validate shl bp_TGeglParamSpecString_no_validate) and bm_TGeglParamSpecString_no_validate);
end;

function null_ok(var a : TGeglParamSpecString) : Tguint;
begin
  null_ok:=(a.flag0 and bm_TGeglParamSpecString_null_ok) shr bp_TGeglParamSpecString_null_ok;
end;

procedure set_null_ok(var a : TGeglParamSpecString; __null_ok : Tguint);
begin
  a.flag0:=a.flag0 or ((__null_ok shl bp_TGeglParamSpecString_null_ok) and bm_TGeglParamSpecString_null_ok);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_FILE_PATH : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_FILE_PATH:=gegl_param_file_path_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_FILE_PATH(pspec : longint) : longint;
begin
  GEGL_PARAM_SPEC_FILE_PATH:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GEGL_TYPE_PARAM_FILE_PATH,GeglParamSpecFilePath);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_FILE_PATH(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_FILE_PATH:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_FILE_PATH);
end;

function no_validate(var a : TGeglParamSpecFilePath) : Tguint;
begin
  no_validate:=(a.flag0 and bm_TGeglParamSpecFilePath_no_validate) shr bp_TGeglParamSpecFilePath_no_validate;
end;

procedure set_no_validate(var a : TGeglParamSpecFilePath; __no_validate : Tguint);
begin
  a.flag0:=a.flag0 or ((__no_validate shl bp_TGeglParamSpecFilePath_no_validate) and bm_TGeglParamSpecFilePath_no_validate);
end;

function null_ok(var a : TGeglParamSpecFilePath) : Tguint;
begin
  null_ok:=(a.flag0 and bm_TGeglParamSpecFilePath_null_ok) shr bp_TGeglParamSpecFilePath_null_ok;
end;

procedure set_null_ok(var a : TGeglParamSpecFilePath; __null_ok : Tguint);
begin
  a.flag0:=a.flag0 or ((__null_ok shl bp_TGeglParamSpecFilePath_null_ok) and bm_TGeglParamSpecFilePath_null_ok);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_ENUM : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_ENUM:=gegl_param_enum_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_ENUM(pspec : longint) : longint;
begin
  GEGL_PARAM_SPEC_ENUM:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GEGL_TYPE_PARAM_ENUM,GeglParamSpecEnum);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_ENUM(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_ENUM:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_ENUM);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_SEED : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_SEED:=gegl_param_seed_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_SEED(pspec : longint) : longint;
begin
  GEGL_PARAM_SPEC_SEED:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GEGL_TYPE_PARAM_SEED,GeglParamSpecSeed);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_SEED(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_SEED:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_SEED);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_FORMAT : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_FORMAT:=gegl_param_format_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_FORMAT(pspec : longint) : longint;
begin
  GEGL_PARAM_SPEC_FORMAT:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GEGL_TYPE_PARAM_FORMAT,GeglParamSpecFormat);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_FORMAT(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_FORMAT:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_FORMAT);
end;

{ was #define dname def_expr }
function GEGL_TYPE_PARAM_URI : longint; { return type might be wrong }
  begin
    GEGL_TYPE_PARAM_URI:=gegl_param_uri_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_PARAM_SPEC_URI(pspec : longint) : longint;
begin
  GEGL_PARAM_SPEC_URI:=G_TYPE_CHECK_INSTANCE_CAST(pspec,GEGL_TYPE_PARAM_URI,GeglParamSpecUri);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEGL_IS_PARAM_SPEC_URI(pspec : longint) : longint;
begin
  GEGL_IS_PARAM_SPEC_URI:=G_TYPE_CHECK_INSTANCE_TYPE(pspec,GEGL_TYPE_PARAM_URI);
end;

function no_validate(var a : TGeglParamSpecUri) : Tguint;
begin
  no_validate:=(a.flag0 and bm_TGeglParamSpecUri_no_validate) shr bp_TGeglParamSpecUri_no_validate;
end;

procedure set_no_validate(var a : TGeglParamSpecUri; __no_validate : Tguint);
begin
  a.flag0:=a.flag0 or ((__no_validate shl bp_TGeglParamSpecUri_no_validate) and bm_TGeglParamSpecUri_no_validate);
end;

function null_ok(var a : TGeglParamSpecUri) : Tguint;
begin
  null_ok:=(a.flag0 and bm_TGeglParamSpecUri_null_ok) shr bp_TGeglParamSpecUri_null_ok;
end;

procedure set_null_ok(var a : TGeglParamSpecUri; __null_ok : Tguint);
begin
  a.flag0:=a.flag0 or ((__null_ok shl bp_TGeglParamSpecUri_null_ok) and bm_TGeglParamSpecUri_null_ok);
end;


end.
