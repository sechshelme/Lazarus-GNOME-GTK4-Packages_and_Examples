unit adap_animation;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

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

function adap_animation_get_widget(self:PAdapAnimation):PGtkWidget;cdecl;external libadapta;
function adap_animation_get_target(self:PAdapAnimation):PAdapAnimationTarget;cdecl;external libadapta;
procedure adap_animation_set_target(self:PAdapAnimation; target:PAdapAnimationTarget);cdecl;external libadapta;
function adap_animation_get_value(self:PAdapAnimation):Tdouble;cdecl;external libadapta;
function adap_animation_get_state(self:PAdapAnimation):TAdapAnimationState;cdecl;external libadapta;
procedure adap_animation_play(self:PAdapAnimation);cdecl;external libadapta;
procedure adap_animation_pause(self:PAdapAnimation);cdecl;external libadapta;
procedure adap_animation_resume(self:PAdapAnimation);cdecl;external libadapta;
procedure adap_animation_reset(self:PAdapAnimation);cdecl;external libadapta;
procedure adap_animation_skip(self:PAdapAnimation);cdecl;external libadapta;
function adap_animation_get_follow_enable_animations_setting(self:PAdapAnimation):Tgboolean;cdecl;external libadapta;
procedure adap_animation_set_follow_enable_animations_setting(self:PAdapAnimation; setting:Tgboolean);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:00:13 ===

function ADAP_TYPE_ANIMATION: TGType;
function ADAP_ANIMATION(obj: Pointer): PAdapAnimation;
function ADAP_IS_ANIMATION(obj: Pointer): Tgboolean;
function ADAP_ANIMATION_CLASS(klass: Pointer): PAdapAnimationClass;
function ADAP_IS_ANIMATION_CLASS(klass: Pointer): Tgboolean;
function ADAP_ANIMATION_GET_CLASS(obj: Pointer): PAdapAnimationClass;

implementation

function ADAP_TYPE_ANIMATION: TGType;
begin
  Result := adap_animation_get_type;
end;

function ADAP_ANIMATION(obj: Pointer): PAdapAnimation;
begin
  Result := PAdapAnimation(g_type_check_instance_cast(obj, ADAP_TYPE_ANIMATION));
end;

function ADAP_IS_ANIMATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ANIMATION);
end;

function ADAP_ANIMATION_CLASS(klass: Pointer): PAdapAnimationClass;
begin
  Result := PAdapAnimationClass(g_type_check_class_cast(klass, ADAP_TYPE_ANIMATION));
end;

function ADAP_IS_ANIMATION_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_ANIMATION);
end;

function ADAP_ANIMATION_GET_CLASS(obj: Pointer): PAdapAnimationClass;
begin
  Result := PAdapAnimationClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapAnimation = record
    parent_instance: TGObject;
  end;
  PAdapAnimation = ^TAdapAnimation;

  TAdapAnimationClass = record
  end;
  PAdapAnimationClass = ^TAdapAnimationClass;

function adap_animation_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function ADAP_TYPE_ANIMATION : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ANIMATION:=adap_animation_get_type;
  end;


end.
