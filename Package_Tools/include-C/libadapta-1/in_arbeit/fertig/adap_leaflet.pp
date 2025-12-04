
unit adap_leaflet;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_leaflet.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_leaflet.h
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
PAdapLeaflet  = ^AdapLeaflet;
PAdapLeafletPage  = ^AdapLeafletPage;
PAdapLeafletTransitionType  = ^AdapLeafletTransitionType;
PAdapSpringParams  = ^AdapSpringParams;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-enums.h"}
{$include "adap-fold-threshold-policy.h"}
{$include "adap-navigation-direction.h"}
{$include "adap-spring-params.h"}

{ was #define dname def_expr }
function ADAP_TYPE_LEAFLET_PAGE : longint; { return type might be wrong }

{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
{G_DECLARE_FINAL_TYPE (AdapLeafletPage, adap_leaflet_page, ADAP, LEAFLET_PAGE, GObject) }
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_page_get_child(self:PAdapLeafletPage):PGtkWidget;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
(* Const before type ignored *)
function adap_leaflet_page_get_name(self:PAdapLeafletPage):Pchar;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
(* Const before type ignored *)
procedure adap_leaflet_page_set_name(self:PAdapLeafletPage; name:Pchar);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_page_get_navigatable(self:PAdapLeafletPage):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_page_set_navigatable(self:PAdapLeafletPage; navigatable:Tgboolean);cdecl;external;
{ was #define dname def_expr }
function ADAP_TYPE_LEAFLET : longint; { return type might be wrong }

{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
{G_DECLARE_FINAL_TYPE (AdapLeaflet, adap_leaflet, ADAP, LEAFLET, GtkWidget) }
type
  PAdapLeafletTransitionType = ^TAdapLeafletTransitionType;
  TAdapLeafletTransitionType =  Longint;
  Const
    ADAP_LEAFLET_TRANSITION_TYPE_OVER = 0;
    ADAP_LEAFLET_TRANSITION_TYPE_UNDER = 1;
    ADAP_LEAFLET_TRANSITION_TYPE_SLIDE = 2;
;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }

function adap_leaflet_new:PGtkWidget;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_append(self:PAdapLeaflet; child:PGtkWidget):PAdapLeafletPage;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_prepend(self:PAdapLeaflet; child:PGtkWidget):PAdapLeafletPage;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_insert_child_after(self:PAdapLeaflet; child:PGtkWidget; sibling:PGtkWidget):PAdapLeafletPage;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_reorder_child_after(self:PAdapLeaflet; child:PGtkWidget; sibling:PGtkWidget);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_remove(self:PAdapLeaflet; child:PGtkWidget);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_page(self:PAdapLeaflet; child:PGtkWidget):PAdapLeafletPage;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_can_unfold(self:PAdapLeaflet):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_can_unfold(self:PAdapLeaflet; can_unfold:Tgboolean);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_folded(self:PAdapLeaflet):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_fold_threshold_policy(self:PAdapLeaflet):TAdapFoldThresholdPolicy;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_fold_threshold_policy(self:PAdapLeaflet; policy:TAdapFoldThresholdPolicy);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_homogeneous(self:PAdapLeaflet):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_homogeneous(self:PAdapLeaflet; homogeneous:Tgboolean);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_visible_child(self:PAdapLeaflet):PGtkWidget;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_visible_child(self:PAdapLeaflet; visible_child:PGtkWidget);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
(* Const before type ignored *)
function adap_leaflet_get_visible_child_name(self:PAdapLeaflet):Pchar;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
(* Const before type ignored *)
procedure adap_leaflet_set_visible_child_name(self:PAdapLeaflet; name:Pchar);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_transition_type(self:PAdapLeaflet):TAdapLeafletTransitionType;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_transition_type(self:PAdapLeaflet; transition:TAdapLeafletTransitionType);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_mode_transition_duration(self:PAdapLeaflet):Tguint;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_mode_transition_duration(self:PAdapLeaflet; duration:Tguint);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_child_transition_params(self:PAdapLeaflet):PAdapSpringParams;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_child_transition_params(self:PAdapLeaflet; params:PAdapSpringParams);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_child_transition_running(self:PAdapLeaflet):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_can_navigate_back(self:PAdapLeaflet):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_can_navigate_back(self:PAdapLeaflet; can_navigate_back:Tgboolean);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_can_navigate_forward(self:PAdapLeaflet):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_can_navigate_forward(self:PAdapLeaflet; can_navigate_forward:Tgboolean);cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_adjacent_child(self:PAdapLeaflet; direction:TAdapNavigationDirection):PGtkWidget;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_navigate(self:PAdapLeaflet; direction:TAdapNavigationDirection):Tgboolean;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
(* Const before type ignored *)
function adap_leaflet_get_child_by_name(self:PAdapLeaflet; name:Pchar):PGtkWidget;cdecl;external;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_pages(self:PAdapLeaflet):PGtkSelectionModel;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_LEAFLET_PAGE : longint; { return type might be wrong }
  begin
    ADAP_TYPE_LEAFLET_PAGE:=adap_leaflet_page_get_type;
  end;

{ was #define dname def_expr }
function ADAP_TYPE_LEAFLET : longint; { return type might be wrong }
  begin
    ADAP_TYPE_LEAFLET:=adap_leaflet_get_type;
  end;


end.
