
unit adap_spring_params;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_spring_params.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_spring_params.h
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
PAdapSpringParams  = ^AdapSpringParams;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1+
  }
(** unsupported pragma#pragma once*)
{$include "adap-version.h"}
{$include <glib-object.h>}

{ was #define dname def_expr }
function ADAP_TYPE_SPRING_PARAMS : longint; { return type might be wrong }

type

function adap_spring_params_get_type:TGType;cdecl;external;
function adap_spring_params_new(damping_ratio:Tdouble; mass:Tdouble; stiffness:Tdouble):PAdapSpringParams;cdecl;external;
function adap_spring_params_new_full(damping:Tdouble; mass:Tdouble; stiffness:Tdouble):PAdapSpringParams;cdecl;external;
function adap_spring_params_ref(self:PAdapSpringParams):PAdapSpringParams;cdecl;external;
procedure adap_spring_params_unref(self:PAdapSpringParams);cdecl;external;
function adap_spring_params_get_damping(self:PAdapSpringParams):Tdouble;cdecl;external;
function adap_spring_params_get_damping_ratio(self:PAdapSpringParams):Tdouble;cdecl;external;
function adap_spring_params_get_mass(self:PAdapSpringParams):Tdouble;cdecl;external;
function adap_spring_params_get_stiffness(self:PAdapSpringParams):Tdouble;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_SPRING_PARAMS : longint; { return type might be wrong }
  begin
    ADAP_TYPE_SPRING_PARAMS:=adap_spring_params_get_type;
  end;


end.
