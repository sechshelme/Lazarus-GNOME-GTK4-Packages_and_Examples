
unit adw_animation_target;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_animation_target.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_animation_target.h
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
PAdwAnimationTarget  = ^AdwAnimationTarget;
PAdwPropertyAnimationTarget  = ^AdwPropertyAnimationTarget;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADW_TYPE_ANIMATION_TARGET : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdwAnimationTarget, adw_animation_target, ADW, ANIMATION_TARGET, GObject) }
{*
 * AdwAnimationTargetFunc:
 * @value: The animation value
 * @user_data: (nullable): The user data provided when creating the target
 *
 * Prototype for animation targets based on user callbacks.
  }
type

  TAdwAnimationTargetFunc = procedure (value:Tdouble; user_data:Tgpointer);cdecl;

{ was #define dname def_expr }
function ADW_TYPE_CALLBACK_ANIMATION_TARGET : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdwCallbackAnimationTarget, adw_callback_animation_target, ADW, CALLBACK_ANIMATION_TARGET, AdwAnimationTarget) }
function adw_callback_animation_target_new(callback:TAdwAnimationTargetFunc; user_data:Tgpointer; destroy:TGDestroyNotify):PAdwAnimationTarget;cdecl;external;
{ was #define dname def_expr }
function ADW_TYPE_PROPERTY_ANIMATION_TARGET : longint; { return type might be wrong }

{GDK_DECLARE_INTERNAL_TYPE (AdwPropertyAnimationTarget, adw_property_animation_target, ADW, PROPERTY_ANIMATION_TARGET, AdwAnimationTarget) }
(* Const before type ignored *)
function adw_property_animation_target_new(object:PGObject; property_name:Pchar):PAdwAnimationTarget;cdecl;external;
function adw_property_animation_target_new_for_pspec(object:PGObject; pspec:PGParamSpec):PAdwAnimationTarget;cdecl;external;
function adw_property_animation_target_get_object(self:PAdwPropertyAnimationTarget):PGObject;cdecl;external;
function adw_property_animation_target_get_pspec(self:PAdwPropertyAnimationTarget):PGParamSpec;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_ANIMATION_TARGET : longint; { return type might be wrong }
  begin
    ADW_TYPE_ANIMATION_TARGET:=adw_animation_target_get_type;
  end;

{ was #define dname def_expr }
function ADW_TYPE_CALLBACK_ANIMATION_TARGET : longint; { return type might be wrong }
  begin
    ADW_TYPE_CALLBACK_ANIMATION_TARGET:=adw_callback_animation_target_get_type;
  end;

{ was #define dname def_expr }
function ADW_TYPE_PROPERTY_ANIMATION_TARGET : longint; { return type might be wrong }
  begin
    ADW_TYPE_PROPERTY_ANIMATION_TARGET:=adw_property_animation_target_get_type;
  end;


end.
