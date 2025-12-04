
unit adap_spring_animation;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_spring_animation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_spring_animation.h
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
PAdapAnimation  = ^AdapAnimation;
PAdapAnimationTarget  = ^AdapAnimationTarget;
PAdapSpringAnimation  = ^AdapSpringAnimation;
PAdapSpringParams  = ^AdapSpringParams;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Manuel Genovés <manuel.genoves@gmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-animation.h"}
{$include "adap-spring-params.h"}

{ was #define dname def_expr }
function ADAP_TYPE_SPRING_ANIMATION : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdapSpringAnimation, adap_spring_animation, ADAP, SPRING_ANIMATION, AdapAnimation) }
function adap_spring_animation_new(widget:PGtkWidget; from:Tdouble; to:Tdouble; spring_params:PAdapSpringParams; target:PAdapAnimationTarget):PAdapAnimation;cdecl;external;
function adap_spring_animation_get_value_from(self:PAdapSpringAnimation):Tdouble;cdecl;external;
procedure adap_spring_animation_set_value_from(self:PAdapSpringAnimation; value:Tdouble);cdecl;external;
function adap_spring_animation_get_value_to(self:PAdapSpringAnimation):Tdouble;cdecl;external;
procedure adap_spring_animation_set_value_to(self:PAdapSpringAnimation; value:Tdouble);cdecl;external;
function adap_spring_animation_get_spring_params(self:PAdapSpringAnimation):PAdapSpringParams;cdecl;external;
procedure adap_spring_animation_set_spring_params(self:PAdapSpringAnimation; spring_params:PAdapSpringParams);cdecl;external;
function adap_spring_animation_get_initial_velocity(self:PAdapSpringAnimation):Tdouble;cdecl;external;
procedure adap_spring_animation_set_initial_velocity(self:PAdapSpringAnimation; velocity:Tdouble);cdecl;external;
function adap_spring_animation_get_epsilon(self:PAdapSpringAnimation):Tdouble;cdecl;external;
procedure adap_spring_animation_set_epsilon(self:PAdapSpringAnimation; epsilon:Tdouble);cdecl;external;
function adap_spring_animation_get_clamp(self:PAdapSpringAnimation):Tgboolean;cdecl;external;
procedure adap_spring_animation_set_clamp(self:PAdapSpringAnimation; clamp:Tgboolean);cdecl;external;
function adap_spring_animation_get_estimated_duration(self:PAdapSpringAnimation):Tguint;cdecl;external;
function adap_spring_animation_get_velocity(self:PAdapSpringAnimation):Tdouble;cdecl;external;
function adap_spring_animation_calculate_value(self:PAdapSpringAnimation; time:Tguint):Tdouble;cdecl;external;
function adap_spring_animation_calculate_velocity(self:PAdapSpringAnimation; time:Tguint):Tdouble;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_SPRING_ANIMATION : longint; { return type might be wrong }
  begin
    ADAP_TYPE_SPRING_ANIMATION:=adap_spring_animation_get_type;
  end;


end.
