unit adap_preferences_group;

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

{////////G_DECLARE_DERIVABLE_TYPE (AdapPreferencesGroup, adap_preferences_group, ADAP, PREFERENCES_GROUP, GtkWidget) }
{*
 * AdapPreferencesGroupClass
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapPreferencesGroupClass = ^TAdapPreferencesGroupClass;
  TAdapPreferencesGroupClass = record
      parent_class : TGtkWidgetClass;
      padding : array[0..3] of Tgpointer;
    end;


function adap_preferences_group_new:PGtkWidget;cdecl;external libadapta;
procedure adap_preferences_group_add(self:PAdapPreferencesGroup; child:PGtkWidget);cdecl;external libadapta;
procedure adap_preferences_group_remove(self:PAdapPreferencesGroup; child:PGtkWidget);cdecl;external libadapta;
function adap_preferences_group_get_title(self:PAdapPreferencesGroup):Pchar;cdecl;external libadapta;
procedure adap_preferences_group_set_title(self:PAdapPreferencesGroup; title:Pchar);cdecl;external libadapta;
function adap_preferences_group_get_description(self:PAdapPreferencesGroup):Pchar;cdecl;external libadapta;
procedure adap_preferences_group_set_description(self:PAdapPreferencesGroup; description:Pchar);cdecl;external libadapta;
function adap_preferences_group_get_header_suffix(self:PAdapPreferencesGroup):PGtkWidget;cdecl;external libadapta;
procedure adap_preferences_group_set_header_suffix(self:PAdapPreferencesGroup; suffix:PGtkWidget);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:27 ===

function ADAP_TYPE_PREFERENCES_GROUP: TGType;
function ADAP_PREFERENCES_GROUP(obj: Pointer): PAdapPreferencesGroup;
function ADAP_IS_PREFERENCES_GROUP(obj: Pointer): Tgboolean;
function ADAP_PREFERENCES_GROUP_CLASS(klass: Pointer): PAdapPreferencesGroupClass;
function ADAP_IS_PREFERENCES_GROUP_CLASS(klass: Pointer): Tgboolean;
function ADAP_PREFERENCES_GROUP_GET_CLASS(obj: Pointer): PAdapPreferencesGroupClass;

implementation

function ADAP_TYPE_PREFERENCES_GROUP: TGType;
begin
  Result := adap_preferences_group_get_type;
end;

function ADAP_PREFERENCES_GROUP(obj: Pointer): PAdapPreferencesGroup;
begin
  Result := PAdapPreferencesGroup(g_type_check_instance_cast(obj, ADAP_TYPE_PREFERENCES_GROUP));
end;

function ADAP_IS_PREFERENCES_GROUP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_PREFERENCES_GROUP);
end;

function ADAP_PREFERENCES_GROUP_CLASS(klass: Pointer): PAdapPreferencesGroupClass;
begin
  Result := PAdapPreferencesGroupClass(g_type_check_class_cast(klass, ADAP_TYPE_PREFERENCES_GROUP));
end;

function ADAP_IS_PREFERENCES_GROUP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, ADAP_TYPE_PREFERENCES_GROUP);
end;

function ADAP_PREFERENCES_GROUP_GET_CLASS(obj: Pointer): PAdapPreferencesGroupClass;
begin
  Result := PAdapPreferencesGroupClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TAdapPreferencesGroup = record
    parent_instance: TGtkWidget;
  end;
  PAdapPreferencesGroup = ^TAdapPreferencesGroup;

  TAdapPreferencesGroupClass = record
  end;
  PAdapPreferencesGroupClass = ^TAdapPreferencesGroupClass;

function adap_preferences_group_get_type: TGType; cdecl; external libgxxxxxxx;



end.
