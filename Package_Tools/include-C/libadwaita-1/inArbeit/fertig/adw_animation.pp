
unit adw_animation;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_animation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_animation.h
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
PAdwAnimationState  = ^AdwAnimationState;
PAdwAnimationTarget  = ^AdwAnimationTarget;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-animation-target.h"}
{$include "adw-enums.h"}
{*
 * ADW_DURATION_INFINITE:
 *
 * Indicates an [class@Animation] with an infinite duration.
 *
 * This value is mostly used internally.
  }

{ was #define dname def_expr }
function ADW_DURATION_INFINITE : Tguint;  

{ was #define dname def_expr }
function ADW_TYPE_ANIMATION : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwAnimation, adw_animation, ADW, ANIMATION, GObject) }
type
  PAdwAnimationState = ^TAdwAnimationState;
  TAdwAnimationState =  Longint;
  Const
    ADW_ANIMATION_IDLE = 0;
    ADW_ANIMATION_PAUSED = 1;
    ADW_ANIMATION_PLAYING = 2;
    ADW_ANIMATION_FINISHED = 3;
;

function adw_animation_get_widget(self:PAdwAnimation):PGtkWidget;cdecl;external;
function adw_animation_get_target(self:PAdwAnimation):PAdwAnimationTarget;cdecl;external;
procedure adw_animation_set_target(self:PAdwAnimation; target:PAdwAnimationTarget);cdecl;external;
function adw_animation_get_value(self:PAdwAnimation):Tdouble;cdecl;external;
function adw_animation_get_state(self:PAdwAnimation):TAdwAnimationState;cdecl;external;
procedure adw_animation_play(self:PAdwAnimation);cdecl;external;
procedure adw_animation_pause(self:PAdwAnimation);cdecl;external;
procedure adw_animation_resume(self:PAdwAnimation);cdecl;external;
procedure adw_animation_reset(self:PAdwAnimation);cdecl;external;
procedure adw_animation_skip(self:PAdwAnimation);cdecl;external;
function adw_animation_get_follow_enable_animations_setting(self:PAdwAnimation):Tgboolean;cdecl;external;
procedure adw_animation_set_follow_enable_animations_setting(self:PAdwAnimation; setting:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_DURATION_INFINITE : Tguint;
  begin
    ADW_DURATION_INFINITE:=Tguint($ffffffff);
  end;

{ was #define dname def_expr }
function ADW_TYPE_ANIMATION : longint; { return type might be wrong }
  begin
    ADW_TYPE_ANIMATION:=adw_animation_get_type;
  end;


end.
