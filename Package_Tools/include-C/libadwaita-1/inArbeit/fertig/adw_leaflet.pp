
unit adw_leaflet;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_leaflet.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_leaflet.h
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
PAdwLeaflet  = ^AdwLeaflet;
PAdwLeafletPage  = ^AdwLeafletPage;
PAdwLeafletTransitionType  = ^AdwLeafletTransitionType;
PAdwSpringParams  = ^AdwSpringParams;
Pchar  = ^char;
PGtkSelectionModel  = ^GtkSelectionModel;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Purism SPC
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
{$include "adw-navigation-direction.h"}
{$include "adw-spring-params.h"}

{ was #define dname def_expr }
function ADW_TYPE_LEAFLET_PAGE : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwLeafletPage, adw_leaflet_page, ADW, LEAFLET_PAGE, GObject) }
function adw_leaflet_page_get_child(self:PAdwLeafletPage):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_leaflet_page_get_name(self:PAdwLeafletPage):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_leaflet_page_set_name(self:PAdwLeafletPage; name:Pchar);cdecl;external;
function adw_leaflet_page_get_navigatable(self:PAdwLeafletPage):Tgboolean;cdecl;external;
procedure adw_leaflet_page_set_navigatable(self:PAdwLeafletPage; navigatable:Tgboolean);cdecl;external;
{ was #define dname def_expr }
function ADW_TYPE_LEAFLET : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwLeaflet, adw_leaflet, ADW, LEAFLET, GtkWidget) }
type
  PAdwLeafletTransitionType = ^TAdwLeafletTransitionType;
  TAdwLeafletTransitionType =  Longint;
  Const
    ADW_LEAFLET_TRANSITION_TYPE_OVER = 0;
    ADW_LEAFLET_TRANSITION_TYPE_UNDER = 1;
    ADW_LEAFLET_TRANSITION_TYPE_SLIDE = 2;
;

function adw_leaflet_new:PGtkWidget;cdecl;external;
function adw_leaflet_append(self:PAdwLeaflet; child:PGtkWidget):PAdwLeafletPage;cdecl;external;
function adw_leaflet_prepend(self:PAdwLeaflet; child:PGtkWidget):PAdwLeafletPage;cdecl;external;
function adw_leaflet_insert_child_after(self:PAdwLeaflet; child:PGtkWidget; sibling:PGtkWidget):PAdwLeafletPage;cdecl;external;
procedure adw_leaflet_reorder_child_after(self:PAdwLeaflet; child:PGtkWidget; sibling:PGtkWidget);cdecl;external;
procedure adw_leaflet_remove(self:PAdwLeaflet; child:PGtkWidget);cdecl;external;
function adw_leaflet_get_page(self:PAdwLeaflet; child:PGtkWidget):PAdwLeafletPage;cdecl;external;
function adw_leaflet_get_can_unfold(self:PAdwLeaflet):Tgboolean;cdecl;external;
procedure adw_leaflet_set_can_unfold(self:PAdwLeaflet; can_unfold:Tgboolean);cdecl;external;
function adw_leaflet_get_folded(self:PAdwLeaflet):Tgboolean;cdecl;external;
function adw_leaflet_get_fold_threshold_policy(self:PAdwLeaflet):TAdwFoldThresholdPolicy;cdecl;external;
procedure adw_leaflet_set_fold_threshold_policy(self:PAdwLeaflet; policy:TAdwFoldThresholdPolicy);cdecl;external;
function adw_leaflet_get_homogeneous(self:PAdwLeaflet):Tgboolean;cdecl;external;
procedure adw_leaflet_set_homogeneous(self:PAdwLeaflet; homogeneous:Tgboolean);cdecl;external;
function adw_leaflet_get_visible_child(self:PAdwLeaflet):PGtkWidget;cdecl;external;
procedure adw_leaflet_set_visible_child(self:PAdwLeaflet; visible_child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adw_leaflet_get_visible_child_name(self:PAdwLeaflet):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_leaflet_set_visible_child_name(self:PAdwLeaflet; name:Pchar);cdecl;external;
function adw_leaflet_get_transition_type(self:PAdwLeaflet):TAdwLeafletTransitionType;cdecl;external;
procedure adw_leaflet_set_transition_type(self:PAdwLeaflet; transition:TAdwLeafletTransitionType);cdecl;external;
function adw_leaflet_get_mode_transition_duration(self:PAdwLeaflet):Tguint;cdecl;external;
procedure adw_leaflet_set_mode_transition_duration(self:PAdwLeaflet; duration:Tguint);cdecl;external;
function adw_leaflet_get_child_transition_params(self:PAdwLeaflet):PAdwSpringParams;cdecl;external;
procedure adw_leaflet_set_child_transition_params(self:PAdwLeaflet; params:PAdwSpringParams);cdecl;external;
function adw_leaflet_get_child_transition_running(self:PAdwLeaflet):Tgboolean;cdecl;external;
function adw_leaflet_get_can_navigate_back(self:PAdwLeaflet):Tgboolean;cdecl;external;
procedure adw_leaflet_set_can_navigate_back(self:PAdwLeaflet; can_navigate_back:Tgboolean);cdecl;external;
function adw_leaflet_get_can_navigate_forward(self:PAdwLeaflet):Tgboolean;cdecl;external;
procedure adw_leaflet_set_can_navigate_forward(self:PAdwLeaflet; can_navigate_forward:Tgboolean);cdecl;external;
function adw_leaflet_get_adjacent_child(self:PAdwLeaflet; direction:TAdwNavigationDirection):PGtkWidget;cdecl;external;
function adw_leaflet_navigate(self:PAdwLeaflet; direction:TAdwNavigationDirection):Tgboolean;cdecl;external;
(* Const before type ignored *)
function adw_leaflet_get_child_by_name(self:PAdwLeaflet; name:Pchar):PGtkWidget;cdecl;external;
function adw_leaflet_get_pages(self:PAdwLeaflet):PGtkSelectionModel;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_LEAFLET_PAGE : longint; { return type might be wrong }
  begin
    ADW_TYPE_LEAFLET_PAGE:=adw_leaflet_page_get_type;
  end;

{ was #define dname def_expr }
function ADW_TYPE_LEAFLET : longint; { return type might be wrong }
  begin
    ADW_TYPE_LEAFLET:=adw_leaflet_get_type;
  end;


end.
