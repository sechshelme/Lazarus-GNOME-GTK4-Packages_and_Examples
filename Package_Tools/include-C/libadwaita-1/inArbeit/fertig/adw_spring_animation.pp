
unit adw_spring_animation;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_spring_animation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_spring_animation.h
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
PAdwAnimation  = ^AdwAnimation;
PAdwAnimationTarget  = ^AdwAnimationTarget;
PAdwSpringAnimation  = ^AdwSpringAnimation;
PAdwSpringParams  = ^AdwSpringParams;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-animation.h"}
{$include "adw-spring-params.h"}

{ was #define dname def_expr }
function ADW_TYPE_SPRING_ANIMATION : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdwSpringAnimation, adw_spring_animation, ADW, SPRING_ANIMATION, AdwAnimation) }
function adw_spring_animation_new(widget:PGtkWidget; from:Tdouble; to:Tdouble; spring_params:PAdwSpringParams; target:PAdwAnimationTarget):PAdwAnimation;cdecl;external;
function adw_spring_animation_get_value_from(self:PAdwSpringAnimation):Tdouble;cdecl;external;
procedure adw_spring_animation_set_value_from(self:PAdwSpringAnimation; value:Tdouble);cdecl;external;
function adw_spring_animation_get_value_to(self:PAdwSpringAnimation):Tdouble;cdecl;external;
procedure adw_spring_animation_set_value_to(self:PAdwSpringAnimation; value:Tdouble);cdecl;external;
function adw_spring_animation_get_spring_params(self:PAdwSpringAnimation):PAdwSpringParams;cdecl;external;
procedure adw_spring_animation_set_spring_params(self:PAdwSpringAnimation; spring_params:PAdwSpringParams);cdecl;external;
function adw_spring_animation_get_initial_velocity(self:PAdwSpringAnimation):Tdouble;cdecl;external;
procedure adw_spring_animation_set_initial_velocity(self:PAdwSpringAnimation; velocity:Tdouble);cdecl;external;
function adw_spring_animation_get_epsilon(self:PAdwSpringAnimation):Tdouble;cdecl;external;
procedure adw_spring_animation_set_epsilon(self:PAdwSpringAnimation; epsilon:Tdouble);cdecl;external;
function adw_spring_animation_get_clamp(self:PAdwSpringAnimation):Tgboolean;cdecl;external;
procedure adw_spring_animation_set_clamp(self:PAdwSpringAnimation; clamp:Tgboolean);cdecl;external;
function adw_spring_animation_get_estimated_duration(self:PAdwSpringAnimation):Tguint;cdecl;external;
function adw_spring_animation_get_velocity(self:PAdwSpringAnimation):Tdouble;cdecl;external;
function adw_spring_animation_calculate_value(self:PAdwSpringAnimation; time:Tguint):Tdouble;cdecl;external;
function adw_spring_animation_calculate_velocity(self:PAdwSpringAnimation; time:Tguint):Tdouble;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_SPRING_ANIMATION : longint; { return type might be wrong }
  begin
    ADW_TYPE_SPRING_ANIMATION:=adw_spring_animation_get_type;
  end;


end.
