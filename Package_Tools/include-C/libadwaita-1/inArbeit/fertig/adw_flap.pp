
unit adw_flap;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_flap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_flap.h
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
PAdwFlap  = ^AdwFlap;
PAdwFlapFoldPolicy  = ^AdwFlapFoldPolicy;
PAdwFlapTransitionType  = ^AdwFlapTransitionType;
PAdwSpringParams  = ^AdwSpringParams;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2020 Felix Häcker <haeckerfelix@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-enums.h"}
{$include "adw-fold-threshold-policy.h"}
{$include "adw-spring-params.h"}

{ was #define dname def_expr }
function ADW_TYPE_FLAP : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwFlap, adw_flap, ADW, FLAP, GtkWidget) }
type
  PAdwFlapFoldPolicy = ^TAdwFlapFoldPolicy;
  TAdwFlapFoldPolicy =  Longint;
  Const
    ADW_FLAP_FOLD_POLICY_NEVER = 0;
    ADW_FLAP_FOLD_POLICY_ALWAYS = 1;
    ADW_FLAP_FOLD_POLICY_AUTO = 2;
;
type
  PAdwFlapTransitionType = ^TAdwFlapTransitionType;
  TAdwFlapTransitionType =  Longint;
  Const
    ADW_FLAP_TRANSITION_TYPE_OVER = 0;
    ADW_FLAP_TRANSITION_TYPE_UNDER = 1;
    ADW_FLAP_TRANSITION_TYPE_SLIDE = 2;
;

function adw_flap_new:PGtkWidget;cdecl;external;
function adw_flap_get_content(self:PAdwFlap):PGtkWidget;cdecl;external;
procedure adw_flap_set_content(self:PAdwFlap; content:PGtkWidget);cdecl;external;
function adw_flap_get_flap(self:PAdwFlap):PGtkWidget;cdecl;external;
procedure adw_flap_set_flap(self:PAdwFlap; flap:PGtkWidget);cdecl;external;
function adw_flap_get_separator(self:PAdwFlap):PGtkWidget;cdecl;external;
procedure adw_flap_set_separator(self:PAdwFlap; separator:PGtkWidget);cdecl;external;
function adw_flap_get_flap_position(self:PAdwFlap):TGtkPackType;cdecl;external;
procedure adw_flap_set_flap_position(self:PAdwFlap; position:TGtkPackType);cdecl;external;
function adw_flap_get_reveal_flap(self:PAdwFlap):Tgboolean;cdecl;external;
procedure adw_flap_set_reveal_flap(self:PAdwFlap; reveal_flap:Tgboolean);cdecl;external;
function adw_flap_get_reveal_params(self:PAdwFlap):PAdwSpringParams;cdecl;external;
procedure adw_flap_set_reveal_params(self:PAdwFlap; params:PAdwSpringParams);cdecl;external;
function adw_flap_get_reveal_progress(self:PAdwFlap):Tdouble;cdecl;external;
function adw_flap_get_fold_policy(self:PAdwFlap):TAdwFlapFoldPolicy;cdecl;external;
procedure adw_flap_set_fold_policy(self:PAdwFlap; policy:TAdwFlapFoldPolicy);cdecl;external;
function adw_flap_get_fold_threshold_policy(self:PAdwFlap):TAdwFoldThresholdPolicy;cdecl;external;
procedure adw_flap_set_fold_threshold_policy(self:PAdwFlap; policy:TAdwFoldThresholdPolicy);cdecl;external;
function adw_flap_get_fold_duration(self:PAdwFlap):Tguint;cdecl;external;
procedure adw_flap_set_fold_duration(self:PAdwFlap; duration:Tguint);cdecl;external;
function adw_flap_get_folded(self:PAdwFlap):Tgboolean;cdecl;external;
function adw_flap_get_locked(self:PAdwFlap):Tgboolean;cdecl;external;
procedure adw_flap_set_locked(self:PAdwFlap; locked:Tgboolean);cdecl;external;
function adw_flap_get_transition_type(self:PAdwFlap):TAdwFlapTransitionType;cdecl;external;
procedure adw_flap_set_transition_type(self:PAdwFlap; transition_type:TAdwFlapTransitionType);cdecl;external;
function adw_flap_get_modal(self:PAdwFlap):Tgboolean;cdecl;external;
procedure adw_flap_set_modal(self:PAdwFlap; modal:Tgboolean);cdecl;external;
function adw_flap_get_swipe_to_open(self:PAdwFlap):Tgboolean;cdecl;external;
procedure adw_flap_set_swipe_to_open(self:PAdwFlap; swipe_to_open:Tgboolean);cdecl;external;
function adw_flap_get_swipe_to_close(self:PAdwFlap):Tgboolean;cdecl;external;
procedure adw_flap_set_swipe_to_close(self:PAdwFlap; swipe_to_close:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_FLAP : longint; { return type might be wrong }
  begin
    ADW_TYPE_FLAP:=adw_flap_get_type;
  end;


end.
