
unit adw_spring_params;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_spring_params.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_spring_params.h
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
PAdwSpringParams  = ^AdwSpringParams;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "adw-version.h"}
{$include <glib-object.h>}

{ was #define dname def_expr }
function ADW_TYPE_SPRING_PARAMS : longint; { return type might be wrong }

type

function adw_spring_params_get_type:TGType;cdecl;external;
function adw_spring_params_new(damping_ratio:Tdouble; mass:Tdouble; stiffness:Tdouble):PAdwSpringParams;cdecl;external;
function adw_spring_params_new_full(damping:Tdouble; mass:Tdouble; stiffness:Tdouble):PAdwSpringParams;cdecl;external;
function adw_spring_params_ref(self:PAdwSpringParams):PAdwSpringParams;cdecl;external;
procedure adw_spring_params_unref(self:PAdwSpringParams);cdecl;external;
function adw_spring_params_get_damping(self:PAdwSpringParams):Tdouble;cdecl;external;
function adw_spring_params_get_damping_ratio(self:PAdwSpringParams):Tdouble;cdecl;external;
function adw_spring_params_get_mass(self:PAdwSpringParams):Tdouble;cdecl;external;
function adw_spring_params_get_stiffness(self:PAdwSpringParams):Tdouble;cdecl;external;
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (AdwSpringParams, adw_spring_params_unref) }

implementation

{ was #define dname def_expr }
function ADW_TYPE_SPRING_PARAMS : longint; { return type might be wrong }
  begin
    ADW_TYPE_SPRING_PARAMS:=adw_spring_params_get_type;
  end;


end.
