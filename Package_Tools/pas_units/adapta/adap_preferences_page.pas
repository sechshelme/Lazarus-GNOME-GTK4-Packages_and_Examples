unit adap_preferences_page;

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
{$include "adap-preferences-group.h"}

{////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesPage, adap_preferences_page, ADAP, PREFERENCES_PAGE, GtkWidget) }
{*
 * AdapPreferencesPageClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapPreferencesPageClass = ^TAdapPreferencesPageClass;
  TAdapPreferencesPageClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_preferences_page_new:PGtkWidget;cdecl;external libadapta;
procedure adap_preferences_page_add(self:PAdapPreferencesPage; group:PAdapPreferencesGroup);cdecl;external libadapta;
procedure adap_preferences_page_remove(self:PAdapPreferencesPage; group:PAdapPreferencesGroup);cdecl;external libadapta;
function adap_preferences_page_get_icon_name(self:PAdapPreferencesPage):Pchar;cdecl;external libadapta;
procedure adap_preferences_page_set_icon_name(self:PAdapPreferencesPage; icon_name:Pchar);cdecl;external libadapta;
function adap_preferences_page_get_title(self:PAdapPreferencesPage):Pchar;cdecl;external libadapta;
procedure adap_preferences_page_set_title(self:PAdapPreferencesPage; title:Pchar);cdecl;external libadapta;
function adap_preferences_page_get_description(self:PAdapPreferencesPage):Pchar;cdecl;external libadapta;
procedure adap_preferences_page_set_description(self:PAdapPreferencesPage; description:Pchar);cdecl;external libadapta;
function adap_preferences_page_get_name(self:PAdapPreferencesPage):Pchar;cdecl;external libadapta;
procedure adap_preferences_page_set_name(self:PAdapPreferencesPage; name:Pchar);cdecl;external libadapta;
function adap_preferences_page_get_use_underline(self:PAdapPreferencesPage):Tgboolean;cdecl;external libadapta;
procedure adap_preferences_page_set_use_underline(self:PAdapPreferencesPage; use_underline:Tgboolean);cdecl;external libadapta;
procedure adap_preferences_page_scroll_to_top(self:PAdapPreferencesPage);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:30 ===

function ADAP_TYPE_PREFERENCES_PAGE: TGType;
function ADAP_PREFERENCES_PAGE(obj: Pointer): PAdapPreferencesPage;
function ADAP_IS_PREFERENCES_PAGE(obj: Pointer): Tgboolean;
function ADAP_PREFERENCES_PAGE_CLASS(klass: Pointer): PAdapPreferencesPageClass;
function ADAP_IS_PREFERENCES_PAGE_CLASS(klass: Pointer): Tgboolean;
function ADAP_PREFERENCES_PAGE_GET_CLASS(obj: Pointer): PAdapPreferencesPageClass;

implementation

function ADAP_TYPE_PREFERENCES_PAGE: TGType;
begin
  Result := adap_preferences_page_get_type;
end;

function ADAP_PREFERENCES_PAGE(obj: Pointer): PAdapPreferencesPage;
begin
  Result := PAdapPreferencesPage(g_type_check_instance_cast(obj, ADAP_TYPE_PREFERENCES_PAGE));
end;

function ADAP_IS_PREFERENCES_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_PREFERENCES_PAGE);
end;

function ADAP_PREFERENCES_PAGE_CLASS(klass: Pointer): PAdapPreferencesPageClass;
begin
  Result := PAdapPreferencesPageClass(g_type_check_class_cast(klass, ADAP_TYPE_PREFERENCES_PAGE));
end;

function ADAP_IS_PREFERENCES_PAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_PREFERENCES_PAGE);
end;

function ADAP_PREFERENCES_PAGE_GET_CLASS(obj: Pointer): PAdapPreferencesPageClass;
begin
  Result := PAdapPreferencesPageClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapPreferencesPage = record
    parent_instance: TGtkWidget;
  end;
  PAdapPreferencesPage = ^TAdapPreferencesPage;

  TAdapPreferencesPageClass = record
  end;
  PAdapPreferencesPageClass = ^TAdapPreferencesPageClass;

function adap_preferences_page_get_type: TGType; cdecl; external libgxxxxxxx;



end.
