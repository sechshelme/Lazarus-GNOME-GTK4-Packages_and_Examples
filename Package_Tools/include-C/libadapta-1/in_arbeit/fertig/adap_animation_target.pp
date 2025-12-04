
unit adap_animation_target;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_animation_target.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_animation_target.h
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
PAdapAnimationTarget  = ^AdapAnimationTarget;
PAdapPropertyAnimationTarget  = ^AdapPropertyAnimationTarget;
Pchar  = ^char;
PGObject  = ^GObject;
PGParamSpec  = ^GParamSpec;
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

{ was #define dname def_expr }
function ADAP_TYPE_ANIMATION_TARGET : longint; { return type might be wrong }

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
function adap_callback_animation_target_new(callback:TAdapAnimationTargetFunc; user_data:Tgpointer; destroy:TGDestroyNotify):PAdapAnimationTarget;cdecl;external;
{ was #define dname def_expr }
function ADAP_TYPE_PROPERTY_ANIMATION_TARGET : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdapPropertyAnimationTarget, adap_property_animation_target, ADAP, PROPERTY_ANIMATION_TARGET, AdapAnimationTarget) }
(* Const before type ignored *)
function adap_property_animation_target_new(object:PGObject; property_name:Pchar):PAdapAnimationTarget;cdecl;external;
function adap_property_animation_target_new_for_pspec(object:PGObject; pspec:PGParamSpec):PAdapAnimationTarget;cdecl;external;
function adap_property_animation_target_get_object(self:PAdapPropertyAnimationTarget):PGObject;cdecl;external;
function adap_property_animation_target_get_pspec(self:PAdapPropertyAnimationTarget):PGParamSpec;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_ANIMATION_TARGET : longint; { return type might be wrong }
  begin
    ADAP_TYPE_ANIMATION_TARGET:=adap_animation_target_get_type;
  end;

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
