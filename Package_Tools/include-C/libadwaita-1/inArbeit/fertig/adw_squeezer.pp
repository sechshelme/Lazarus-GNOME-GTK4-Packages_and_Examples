
unit adw_squeezer;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_squeezer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_squeezer.h
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
PAdwSqueezer  = ^AdwSqueezer;
PAdwSqueezerPage  = ^AdwSqueezerPage;
PAdwSqueezerTransitionType  = ^AdwSqueezerTransitionType;
PGtkSelectionModel  = ^GtkSelectionModel;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Purism SPC
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

{ was #define dname def_expr }
function ADW_TYPE_SQUEEZER_PAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwSqueezerPage, adw_squeezer_page, ADW, SQUEEZER_PAGE, GObject) }
function adw_squeezer_page_get_child(self:PAdwSqueezerPage):PGtkWidget;cdecl;external;
function adw_squeezer_page_get_enabled(self:PAdwSqueezerPage):Tgboolean;cdecl;external;
procedure adw_squeezer_page_set_enabled(self:PAdwSqueezerPage; enabled:Tgboolean);cdecl;external;
{ was #define dname def_expr }
function ADW_TYPE_SQUEEZER : longint; { return type might be wrong }

{ xxxxxxxxxxxxxxxxxx }
{G_DECLARE_FINAL_TYPE (AdwSqueezer, adw_squeezer, ADW, SQUEEZER, GtkWidget) }
type
  PAdwSqueezerTransitionType = ^TAdwSqueezerTransitionType;
  TAdwSqueezerTransitionType =  Longint;
  Const
    ADW_SQUEEZER_TRANSITION_TYPE_NONE = 0;
    ADW_SQUEEZER_TRANSITION_TYPE_CROSSFADE = 1;
;

function adw_squeezer_new:PGtkWidget;cdecl;external;
function adw_squeezer_add(self:PAdwSqueezer; child:PGtkWidget):PAdwSqueezerPage;cdecl;external;
procedure adw_squeezer_remove(self:PAdwSqueezer; child:PGtkWidget);cdecl;external;
function adw_squeezer_get_page(self:PAdwSqueezer; child:PGtkWidget):PAdwSqueezerPage;cdecl;external;
function adw_squeezer_get_visible_child(self:PAdwSqueezer):PGtkWidget;cdecl;external;
function adw_squeezer_get_homogeneous(self:PAdwSqueezer):Tgboolean;cdecl;external;
procedure adw_squeezer_set_homogeneous(self:PAdwSqueezer; homogeneous:Tgboolean);cdecl;external;
function adw_squeezer_get_switch_threshold_policy(self:PAdwSqueezer):TAdwFoldThresholdPolicy;cdecl;external;
procedure adw_squeezer_set_switch_threshold_policy(self:PAdwSqueezer; policy:TAdwFoldThresholdPolicy);cdecl;external;
function adw_squeezer_get_allow_none(self:PAdwSqueezer):Tgboolean;cdecl;external;
procedure adw_squeezer_set_allow_none(self:PAdwSqueezer; allow_none:Tgboolean);cdecl;external;
function adw_squeezer_get_transition_duration(self:PAdwSqueezer):Tguint;cdecl;external;
procedure adw_squeezer_set_transition_duration(self:PAdwSqueezer; duration:Tguint);cdecl;external;
function adw_squeezer_get_transition_type(self:PAdwSqueezer):TAdwSqueezerTransitionType;cdecl;external;
procedure adw_squeezer_set_transition_type(self:PAdwSqueezer; transition:TAdwSqueezerTransitionType);cdecl;external;
function adw_squeezer_get_transition_running(self:PAdwSqueezer):Tgboolean;cdecl;external;
function adw_squeezer_get_interpolate_size(self:PAdwSqueezer):Tgboolean;cdecl;external;
procedure adw_squeezer_set_interpolate_size(self:PAdwSqueezer; interpolate_size:Tgboolean);cdecl;external;
function adw_squeezer_get_xalign(self:PAdwSqueezer):single;cdecl;external;
procedure adw_squeezer_set_xalign(self:PAdwSqueezer; xalign:single);cdecl;external;
function adw_squeezer_get_yalign(self:PAdwSqueezer):single;cdecl;external;
procedure adw_squeezer_set_yalign(self:PAdwSqueezer; yalign:single);cdecl;external;
function adw_squeezer_get_pages(self:PAdwSqueezer):PGtkSelectionModel;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_SQUEEZER_PAGE : longint; { return type might be wrong }
  begin
    ADW_TYPE_SQUEEZER_PAGE:=adw_squeezer_page_get_type;
  end;

{ was #define dname def_expr }
function ADW_TYPE_SQUEEZER : longint; { return type might be wrong }
  begin
    ADW_TYPE_SQUEEZER:=adw_squeezer_get_type;
  end;


end.
