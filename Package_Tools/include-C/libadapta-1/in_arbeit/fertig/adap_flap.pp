
unit adap_flap;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_flap.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_flap.h
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
PAdapFlap  = ^AdapFlap;
PAdapFlapFoldPolicy  = ^AdapFlapFoldPolicy;
PAdapFlapTransitionType  = ^AdapFlapTransitionType;
PAdapSpringParams  = ^AdapSpringParams;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-enums.h"}
{$include "adap-fold-threshold-policy.h"}
{$include "adap-spring-params.h"}

{ was #define dname def_expr }
function ADAP_TYPE_FLAP : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapFlap, adap_flap, ADAP, FLAP, GtkWidget) }
type
  PAdapFlapFoldPolicy = ^TAdapFlapFoldPolicy;
  TAdapFlapFoldPolicy =  Longint;
  Const
    ADAP_FLAP_FOLD_POLICY_NEVER = 0;
    ADAP_FLAP_FOLD_POLICY_ALWAYS = 1;
    ADAP_FLAP_FOLD_POLICY_AUTO = 2;
;
type
  PAdapFlapTransitionType = ^TAdapFlapTransitionType;
  TAdapFlapTransitionType =  Longint;
  Const
    ADAP_FLAP_TRANSITION_TYPE_OVER = 0;
    ADAP_FLAP_TRANSITION_TYPE_UNDER = 1;
    ADAP_FLAP_TRANSITION_TYPE_SLIDE = 2;
;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }

function adap_flap_new:PGtkWidget;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_content(self:PAdapFlap):PGtkWidget;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_content(self:PAdapFlap; content:PGtkWidget);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_flap(self:PAdapFlap):PGtkWidget;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_flap(self:PAdapFlap; flap:PGtkWidget);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_separator(self:PAdapFlap):PGtkWidget;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_separator(self:PAdapFlap; separator:PGtkWidget);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_flap_position(self:PAdapFlap):TGtkPackType;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_flap_position(self:PAdapFlap; position:TGtkPackType);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_reveal_flap(self:PAdapFlap):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_reveal_flap(self:PAdapFlap; reveal_flap:Tgboolean);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_reveal_params(self:PAdapFlap):PAdapSpringParams;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_reveal_params(self:PAdapFlap; params:PAdapSpringParams);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_reveal_progress(self:PAdapFlap):Tdouble;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_fold_policy(self:PAdapFlap):TAdapFlapFoldPolicy;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_fold_policy(self:PAdapFlap; policy:TAdapFlapFoldPolicy);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_fold_threshold_policy(self:PAdapFlap):TAdapFoldThresholdPolicy;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_fold_threshold_policy(self:PAdapFlap; policy:TAdapFoldThresholdPolicy);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_fold_duration(self:PAdapFlap):Tguint;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_fold_duration(self:PAdapFlap; duration:Tguint);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_folded(self:PAdapFlap):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_locked(self:PAdapFlap):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_locked(self:PAdapFlap; locked:Tgboolean);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_transition_type(self:PAdapFlap):TAdapFlapTransitionType;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_transition_type(self:PAdapFlap; transition_type:TAdapFlapTransitionType);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_modal(self:PAdapFlap):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_modal(self:PAdapFlap; modal:Tgboolean);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_swipe_to_open(self:PAdapFlap):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_swipe_to_open(self:PAdapFlap; swipe_to_open:Tgboolean);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_flap_get_swipe_to_close(self:PAdapFlap):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_flap_set_swipe_to_close(self:PAdapFlap; swipe_to_close:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_FLAP : longint; { return type might be wrong }
  begin
    ADAP_TYPE_FLAP:=adap_flap_get_type;
  end;


end.
