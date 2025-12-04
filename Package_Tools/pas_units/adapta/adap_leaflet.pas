unit adap_leaflet;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

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

{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
{G_DECLARE_FINAL_TYPE (AdapLeafletPage, adap_leaflet_page, ADAP, LEAFLET_PAGE, GObject) }
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_page_get_child(self:PAdapLeafletPage):PGtkWidget;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_page_get_name(self:PAdapLeafletPage):Pchar;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_page_set_name(self:PAdapLeafletPage; name:Pchar);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_page_get_navigatable(self:PAdapLeafletPage):Tgboolean;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_page_set_navigatable(self:PAdapLeafletPage; navigatable:Tgboolean);cdecl;external libadapta;
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

function adap_leaflet_new:PGtkWidget;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_append(self:PAdapLeaflet; child:PGtkWidget):PAdapLeafletPage;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_prepend(self:PAdapLeaflet; child:PGtkWidget):PAdapLeafletPage;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_insert_child_after(self:PAdapLeaflet; child:PGtkWidget; sibling:PGtkWidget):PAdapLeafletPage;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_reorder_child_after(self:PAdapLeaflet; child:PGtkWidget; sibling:PGtkWidget);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_remove(self:PAdapLeaflet; child:PGtkWidget);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_page(self:PAdapLeaflet; child:PGtkWidget):PAdapLeafletPage;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_can_unfold(self:PAdapLeaflet):Tgboolean;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_can_unfold(self:PAdapLeaflet; can_unfold:Tgboolean);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_folded(self:PAdapLeaflet):Tgboolean;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_fold_threshold_policy(self:PAdapLeaflet):TAdapFoldThresholdPolicy;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_fold_threshold_policy(self:PAdapLeaflet; policy:TAdapFoldThresholdPolicy);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_homogeneous(self:PAdapLeaflet):Tgboolean;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_homogeneous(self:PAdapLeaflet; homogeneous:Tgboolean);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_visible_child(self:PAdapLeaflet):PGtkWidget;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_visible_child(self:PAdapLeaflet; visible_child:PGtkWidget);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_visible_child_name(self:PAdapLeaflet):Pchar;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_visible_child_name(self:PAdapLeaflet; name:Pchar);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_transition_type(self:PAdapLeaflet):TAdapLeafletTransitionType;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_transition_type(self:PAdapLeaflet; transition:TAdapLeafletTransitionType);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_mode_transition_duration(self:PAdapLeaflet):Tguint;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_mode_transition_duration(self:PAdapLeaflet; duration:Tguint);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_child_transition_params(self:PAdapLeaflet):PAdapSpringParams;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_child_transition_params(self:PAdapLeaflet; params:PAdapSpringParams);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_child_transition_running(self:PAdapLeaflet):Tgboolean;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_can_navigate_back(self:PAdapLeaflet):Tgboolean;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_can_navigate_back(self:PAdapLeaflet; can_navigate_back:Tgboolean);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_can_navigate_forward(self:PAdapLeaflet):Tgboolean;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_leaflet_set_can_navigate_forward(self:PAdapLeaflet; can_navigate_forward:Tgboolean);cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_adjacent_child(self:PAdapLeaflet; direction:TAdapNavigationDirection):PGtkWidget;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_navigate(self:PAdapLeaflet; direction:TAdapNavigationDirection):Tgboolean;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_child_by_name(self:PAdapLeaflet; name:Pchar):PGtkWidget;cdecl;external libadapta;
{xxxxxxxxxADAP_DEPRECATED_IN_1_4 }
function adap_leaflet_get_pages(self:PAdapLeaflet):PGtkSelectionModel;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:08:45 ===

function ADAP_TYPE_LEAFLET_PAGE: TGType;
function ADAP_LEAFLET_PAGE(obj: Pointer): PAdapLeafletPage;
function ADAP_IS_LEAFLET_PAGE(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_LEAFLET_PAGE: TGType;
begin
  Result := adap_leaflet_page_get_type;
end;

function ADAP_LEAFLET_PAGE(obj: Pointer): PAdapLeafletPage;
begin
  Result := PAdapLeafletPage(g_type_check_instance_cast(obj, ADAP_TYPE_LEAFLET_PAGE));
end;

function ADAP_IS_LEAFLET_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_LEAFLET_PAGE);
end;

type 
  TAdapLeafletPage = record
  end;
  PAdapLeafletPage = ^TAdapLeafletPage;

  TAdapLeafletPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdapLeafletPageClass = ^TAdapLeafletPageClass;

function adap_leaflet_page_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function ADAP_TYPE_LEAFLET : longint; { return type might be wrong }
  begin
    ADAP_TYPE_LEAFLET:=adap_leaflet_get_type;
  end;


end.
