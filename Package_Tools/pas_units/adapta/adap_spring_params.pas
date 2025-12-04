unit adap_spring_params;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

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

function adap_spring_params_get_type:TGType;cdecl;external libadapta;
function adap_spring_params_new(damping_ratio:Tdouble; mass:Tdouble; stiffness:Tdouble):PAdapSpringParams;cdecl;external libadapta;
function adap_spring_params_new_full(damping:Tdouble; mass:Tdouble; stiffness:Tdouble):PAdapSpringParams;cdecl;external libadapta;
function adap_spring_params_ref(self:PAdapSpringParams):PAdapSpringParams;cdecl;external libadapta;
procedure adap_spring_params_unref(self:PAdapSpringParams);cdecl;external libadapta;
function adap_spring_params_get_damping(self:PAdapSpringParams):Tdouble;cdecl;external libadapta;
function adap_spring_params_get_damping_ratio(self:PAdapSpringParams):Tdouble;cdecl;external libadapta;
function adap_spring_params_get_mass(self:PAdapSpringParams):Tdouble;cdecl;external libadapta;
function adap_spring_params_get_stiffness(self:PAdapSpringParams):Tdouble;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:45 ===


implementation


{ was #define dname def_expr }
function ADAP_TYPE_SPRING_PARAMS : longint; { return type might be wrong }
  begin
    ADAP_TYPE_SPRING_PARAMS:=adap_spring_params_get_type;
  end;


end.
