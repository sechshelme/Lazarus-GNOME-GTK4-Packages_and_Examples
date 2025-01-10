
unit adw_timed_animation;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_timed_animation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_timed_animation.h
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
PAdwTimedAnimation  = ^AdwTimedAnimation;
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
{$include "adw-easing.h"}

{ was #define dname def_expr }
function ADW_TYPE_TIMED_ANIMATION : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdwTimedAnimation, adw_timed_animation, ADW, TIMED_ANIMATION, AdwAnimation) }
function adw_timed_animation_new(widget:PGtkWidget; from:Tdouble; to:Tdouble; duration:Tguint; target:PAdwAnimationTarget):PAdwAnimation;cdecl;external;
function adw_timed_animation_get_value_from(self:PAdwTimedAnimation):Tdouble;cdecl;external;
procedure adw_timed_animation_set_value_from(self:PAdwTimedAnimation; value:Tdouble);cdecl;external;
function adw_timed_animation_get_value_to(self:PAdwTimedAnimation):Tdouble;cdecl;external;
procedure adw_timed_animation_set_value_to(self:PAdwTimedAnimation; value:Tdouble);cdecl;external;
function adw_timed_animation_get_duration(self:PAdwTimedAnimation):Tguint;cdecl;external;
procedure adw_timed_animation_set_duration(self:PAdwTimedAnimation; duration:Tguint);cdecl;external;
function adw_timed_animation_get_easing(self:PAdwTimedAnimation):TAdwEasing;cdecl;external;
procedure adw_timed_animation_set_easing(self:PAdwTimedAnimation; easing:TAdwEasing);cdecl;external;
function adw_timed_animation_get_repeat_count(self:PAdwTimedAnimation):Tguint;cdecl;external;
procedure adw_timed_animation_set_repeat_count(self:PAdwTimedAnimation; repeat_count:Tguint);cdecl;external;
function adw_timed_animation_get_reverse(self:PAdwTimedAnimation):Tgboolean;cdecl;external;
procedure adw_timed_animation_set_reverse(self:PAdwTimedAnimation; reverse:Tgboolean);cdecl;external;
function adw_timed_animation_get_alternate(self:PAdwTimedAnimation):Tgboolean;cdecl;external;
procedure adw_timed_animation_set_alternate(self:PAdwTimedAnimation; alternate:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_TIMED_ANIMATION : longint; { return type might be wrong }
  begin
    ADW_TYPE_TIMED_ANIMATION:=adw_timed_animation_get_type;
  end;


end.
