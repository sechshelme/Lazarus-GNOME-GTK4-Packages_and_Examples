
unit adap_animation;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_animation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_animation.h
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
PAdapAnimationState  = ^AdapAnimationState;
PAdapAnimationTarget  = ^AdapAnimationTarget;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Purism SPC
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
{$include "adap-animation-target.h"}
{$include "adap-enums.h"}
{*
 * ADAP_DURATION_INFINITE:
 *
 * Indicates an [class@Animation] with an infinite duration.
 *
 * This value is mostly used internally.
  }

{ was #define dname def_expr }
function ADAP_DURATION_INFINITE : Tguint;  

{ was #define dname def_expr }
function ADAP_TYPE_ANIMATION : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapAnimation, adap_animation, ADAP, ANIMATION, GObject) }
type
  PAdapAnimationState = ^TAdapAnimationState;
  TAdapAnimationState =  Longint;
  Const
    ADAP_ANIMATION_IDLE = 0;
    ADAP_ANIMATION_PAUSED = 1;
    ADAP_ANIMATION_PLAYING = 2;
    ADAP_ANIMATION_FINISHED = 3;
;

function adap_animation_get_widget(self:PAdapAnimation):PGtkWidget;cdecl;external;
function adap_animation_get_target(self:PAdapAnimation):PAdapAnimationTarget;cdecl;external;
procedure adap_animation_set_target(self:PAdapAnimation; target:PAdapAnimationTarget);cdecl;external;
function adap_animation_get_value(self:PAdapAnimation):Tdouble;cdecl;external;
function adap_animation_get_state(self:PAdapAnimation):TAdapAnimationState;cdecl;external;
procedure adap_animation_play(self:PAdapAnimation);cdecl;external;
procedure adap_animation_pause(self:PAdapAnimation);cdecl;external;
procedure adap_animation_resume(self:PAdapAnimation);cdecl;external;
procedure adap_animation_reset(self:PAdapAnimation);cdecl;external;
procedure adap_animation_skip(self:PAdapAnimation);cdecl;external;
function adap_animation_get_follow_enable_animations_setting(self:PAdapAnimation):Tgboolean;cdecl;external;
procedure adap_animation_set_follow_enable_animations_setting(self:PAdapAnimation; setting:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_DURATION_INFINITE : Tguint;
  begin
    ADAP_DURATION_INFINITE:=Tguint($ffffffff);
  end;

{ was #define dname def_expr }
function ADAP_TYPE_ANIMATION : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ANIMATION:=adap_animation_get_type;
  end;


end.
