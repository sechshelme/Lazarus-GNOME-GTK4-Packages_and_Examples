unit adap_animation_target;

interface

uses
  fp_adapta;

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

{GDK_DECLARE_INTERNAL_TYPE (AdapAnimationTarget, adap_animation_target, ADAP, ANIMATION_TARGET, GObject) }
{*
 * AdapAnimationTargetFunc:
 * @value: The animation value
 * @user_data: (nullable): The user data provided when creating the target
 *
 * Prototype for animation targets based on user callbacks.
  }
type

  TAdapAnimationTargetFunc = procedure (value:Tdouble; user_data:Tgpointer);cdecl;

{ was #define dname def_expr }
function ADAP_TYPE_CALLBACK_ANIMATION_TARGET : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdapCallbackAnimationTarget, adap_callback_animation_target, ADAP, CALLBACK_ANIMATION_TARGET, AdapAnimationTarget) }
function adap_callback_animation_target_new(callback:TAdapAnimationTargetFunc; user_data:Tgpointer; destroy:TGDestroyNotify):PAdapAnimationTarget;cdecl;external libadapta;
{ was #define dname def_expr }
function ADAP_TYPE_PROPERTY_ANIMATION_TARGET : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdapPropertyAnimationTarget, adap_property_animation_target, ADAP, PROPERTY_ANIMATION_TARGET, AdapAnimationTarget) }
function adap_property_animation_target_new(object:PGObject; property_name:Pchar):PAdapAnimationTarget;cdecl;external libadapta;
function adap_property_animation_target_new_for_pspec(object:PGObject; pspec:PGParamSpec):PAdapAnimationTarget;cdecl;external libadapta;
function adap_property_animation_target_get_object(self:PAdapPropertyAnimationTarget):PGObject;cdecl;external libadapta;
function adap_property_animation_target_get_pspec(self:PAdapPropertyAnimationTarget):PGParamSpec;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:00:21 ===

function ADAP_TYPE_ANIMATION_TARGET: TGType;
function ADAP_ANIMATION_TARGET(obj: Pointer): PAdapAnimationTarget;
function ADAP_IS_ANIMATION_TARGET(obj: Pointer): Tgboolean;
function ADAP_ANIMATION_TARGET_CLASS(klass: Pointer): PAdapAnimationTargetClass;
function ADAP_IS_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
function ADAP_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdapAnimationTargetClass;

implementation

function ADAP_TYPE_ANIMATION_TARGET: TGType;
begin
  Result := adap_animation_target_get_type;
end;

function ADAP_ANIMATION_TARGET(obj: Pointer): PAdapAnimationTarget;
begin
  Result := PAdapAnimationTarget(g_type_check_instance_cast(obj, ADAP_TYPE_ANIMATION_TARGET));
end;

function ADAP_IS_ANIMATION_TARGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_ANIMATION_TARGET);
end;

function ADAP_ANIMATION_TARGET_CLASS(klass: Pointer): PAdapAnimationTargetClass;
begin
  Result := PAdapAnimationTargetClass(g_type_check_class_cast(klass, ADAP_TYPE_ANIMATION_TARGET));
end;

function ADAP_IS_ANIMATION_TARGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_ANIMATION_TARGET);
end;

function ADAP_ANIMATION_TARGET_GET_CLASS(obj: Pointer): PAdapAnimationTargetClass;
begin
  Result := PAdapAnimationTargetClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapAnimationTarget = record
  end;
  PAdapAnimationTarget = ^TAdapAnimationTarget;

  TAdapAnimationTargetClass = record
  end;
  PAdapAnimationTargetClass = ^TAdapAnimationTargetClass;

function adap_animation_target_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function ADAP_TYPE_CALLBACK_ANIMATION_TARGET : longint; { return type might be wrong }
  begin
    ADAP_TYPE_CALLBACK_ANIMATION_TARGET:=adap_callback_animation_target_get_type;
  end;

{ was #define dname def_expr }
function ADAP_TYPE_PROPERTY_ANIMATION_TARGET : longint; { return type might be wrong }
  begin
    ADAP_TYPE_PROPERTY_ANIMATION_TARGET:=adap_property_animation_target_get_type;
  end;


end.
