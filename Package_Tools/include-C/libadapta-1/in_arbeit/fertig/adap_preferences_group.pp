
unit adap_preferences_group;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_preferences_group.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_preferences_group.h
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
PAdapPreferencesGroup  = ^AdapPreferencesGroup;
PAdapPreferencesGroupClass  = ^AdapPreferencesGroupClass;
Pchar  = ^char;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADAP_TYPE_PREFERENCES_GROUP : longint; { return type might be wrong }

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


function adap_preferences_group_new:PGtkWidget;cdecl;external;
procedure adap_preferences_group_add(self:PAdapPreferencesGroup; child:PGtkWidget);cdecl;external;
procedure adap_preferences_group_remove(self:PAdapPreferencesGroup; child:PGtkWidget);cdecl;external;
(* Const before type ignored *)
function adap_preferences_group_get_title(self:PAdapPreferencesGroup):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_preferences_group_set_title(self:PAdapPreferencesGroup; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_preferences_group_get_description(self:PAdapPreferencesGroup):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_preferences_group_set_description(self:PAdapPreferencesGroup; description:Pchar);cdecl;external;
function adap_preferences_group_get_header_suffix(self:PAdapPreferencesGroup):PGtkWidget;cdecl;external;
procedure adap_preferences_group_set_header_suffix(self:PAdapPreferencesGroup; suffix:PGtkWidget);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_PREFERENCES_GROUP : longint; { return type might be wrong }
  begin
    ADAP_TYPE_PREFERENCES_GROUP:=adap_preferences_group_get_type;
  end;


end.
