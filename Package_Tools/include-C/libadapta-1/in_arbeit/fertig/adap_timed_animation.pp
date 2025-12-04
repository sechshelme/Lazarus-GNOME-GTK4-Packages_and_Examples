
unit adap_timed_animation;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_timed_animation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_timed_animation.h
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
PAdapTimedAnimation  = ^AdapTimedAnimation;
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
{$include "adap-easing.h"}

{ was #define dname def_expr }
function ADAP_TYPE_TIMED_ANIMATION : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdapTimedAnimation, adap_timed_animation, ADAP, TIMED_ANIMATION, AdapAnimation) }
function adap_timed_animation_new(widget:PGtkWidget; from:Tdouble; to:Tdouble; duration:Tguint; target:PAdapAnimationTarget):PAdapAnimation;cdecl;external;
function adap_timed_animation_get_value_from(self:PAdapTimedAnimation):Tdouble;cdecl;external;
procedure adap_timed_animation_set_value_from(self:PAdapTimedAnimation; value:Tdouble);cdecl;external;
function adap_timed_animation_get_value_to(self:PAdapTimedAnimation):Tdouble;cdecl;external;
procedure adap_timed_animation_set_value_to(self:PAdapTimedAnimation; value:Tdouble);cdecl;external;
function adap_timed_animation_get_duration(self:PAdapTimedAnimation):Tguint;cdecl;external;
procedure adap_timed_animation_set_duration(self:PAdapTimedAnimation; duration:Tguint);cdecl;external;
function adap_timed_animation_get_easing(self:PAdapTimedAnimation):TAdapEasing;cdecl;external;
procedure adap_timed_animation_set_easing(self:PAdapTimedAnimation; easing:TAdapEasing);cdecl;external;
function adap_timed_animation_get_repeat_count(self:PAdapTimedAnimation):Tguint;cdecl;external;
procedure adap_timed_animation_set_repeat_count(self:PAdapTimedAnimation; repeat_count:Tguint);cdecl;external;
function adap_timed_animation_get_reverse(self:PAdapTimedAnimation):Tgboolean;cdecl;external;
procedure adap_timed_animation_set_reverse(self:PAdapTimedAnimation; reverse:Tgboolean);cdecl;external;
function adap_timed_animation_get_alternate(self:PAdapTimedAnimation):Tgboolean;cdecl;external;
procedure adap_timed_animation_set_alternate(self:PAdapTimedAnimation; alternate:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_TIMED_ANIMATION : longint; { return type might be wrong }
  begin
    ADAP_TYPE_TIMED_ANIMATION:=adap_timed_animation_get_type;
  end;


end.
