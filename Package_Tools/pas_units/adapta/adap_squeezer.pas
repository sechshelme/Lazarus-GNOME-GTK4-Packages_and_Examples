unit adap_squeezer;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Purism SPC
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

{xxxxADAP_DEPRECATED_IN_1_4 }
{G_DECLARE_FINAL_TYPE (AdapSqueezerPage, adap_squeezer_page, ADAP, SQUEEZER_PAGE, GObject) }
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_page_get_child(self:PAdapSqueezerPage):PGtkWidget;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_page_get_enabled(self:PAdapSqueezerPage):Tgboolean;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_page_set_enabled(self:PAdapSqueezerPage; enabled:Tgboolean);cdecl;external libadapta;
{ was #define dname def_expr }
function ADAP_TYPE_SQUEEZER : longint; { return type might be wrong }

{xxxxADAP_DEPRECATED_IN_1_4 }
{G_DECLARE_FINAL_TYPE (AdapSqueezer, adap_squeezer, ADAP, SQUEEZER, GtkWidget) }
type
  PAdapSqueezerTransitionType = ^TAdapSqueezerTransitionType;
  TAdapSqueezerTransitionType =  Longint;
  Const
    ADAP_SQUEEZER_TRANSITION_TYPE_NONE = 0;
    ADAP_SQUEEZER_TRANSITION_TYPE_CROSSFADE = 1;
;
{xxxxADAP_DEPRECATED_IN_1_4 }

function adap_squeezer_new:PGtkWidget;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_add(self:PAdapSqueezer; child:PGtkWidget):PAdapSqueezerPage;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_remove(self:PAdapSqueezer; child:PGtkWidget);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_page(self:PAdapSqueezer; child:PGtkWidget):PAdapSqueezerPage;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_visible_child(self:PAdapSqueezer):PGtkWidget;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_homogeneous(self:PAdapSqueezer):Tgboolean;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_set_homogeneous(self:PAdapSqueezer; homogeneous:Tgboolean);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_switch_threshold_policy(self:PAdapSqueezer):TAdapFoldThresholdPolicy;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_set_switch_threshold_policy(self:PAdapSqueezer; policy:TAdapFoldThresholdPolicy);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_allow_none(self:PAdapSqueezer):Tgboolean;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_set_allow_none(self:PAdapSqueezer; allow_none:Tgboolean);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_transition_duration(self:PAdapSqueezer):Tguint;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_set_transition_duration(self:PAdapSqueezer; duration:Tguint);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_transition_type(self:PAdapSqueezer):TAdapSqueezerTransitionType;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_set_transition_type(self:PAdapSqueezer; transition:TAdapSqueezerTransitionType);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_transition_running(self:PAdapSqueezer):Tgboolean;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_interpolate_size(self:PAdapSqueezer):Tgboolean;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_set_interpolate_size(self:PAdapSqueezer; interpolate_size:Tgboolean);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_xalign(self:PAdapSqueezer):single;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_set_xalign(self:PAdapSqueezer; xalign:single);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_yalign(self:PAdapSqueezer):single;cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
procedure adap_squeezer_set_yalign(self:PAdapSqueezer; yalign:single);cdecl;external libadapta;
{xxxxADAP_DEPRECATED_IN_1_4 }
function adap_squeezer_get_pages(self:PAdapSqueezer):PGtkSelectionModel;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:47 ===

function ADAP_TYPE_SQUEEZER_PAGE: TGType;
function ADAP_SQUEEZER_PAGE(obj: Pointer): PAdapSqueezerPage;
function ADAP_IS_SQUEEZER_PAGE(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_SQUEEZER_PAGE: TGType;
begin
  Result := adap_squeezer_page_get_type;
end;

function ADAP_SQUEEZER_PAGE(obj: Pointer): PAdapSqueezerPage;
begin
  Result := PAdapSqueezerPage(g_type_check_instance_cast(obj, ADAP_TYPE_SQUEEZER_PAGE));
end;

function ADAP_IS_SQUEEZER_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SQUEEZER_PAGE);
end;

type 
  TAdapSqueezerPage = record
  end;
  PAdapSqueezerPage = ^TAdapSqueezerPage;

  TAdapSqueezerPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdapSqueezerPageClass = ^TAdapSqueezerPageClass;

function adap_squeezer_page_get_type: TGType; cdecl; external libgxxxxxxx;


{ was #define dname def_expr }
function ADAP_TYPE_SQUEEZER : longint; { return type might be wrong }
  begin
    ADAP_TYPE_SQUEEZER:=adap_squeezer_get_type;
  end;


end.
