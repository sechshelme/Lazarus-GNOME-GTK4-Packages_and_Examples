
unit adap_style_manager;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_style_manager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_style_manager.h
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
PAdapColorScheme  = ^AdapColorScheme;
PAdapStyleManager  = ^AdapStyleManager;
PGdkDisplay  = ^GdkDisplay;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-enums.h"}
type
  PAdapColorScheme = ^TAdapColorScheme;
  TAdapColorScheme =  Longint;
  Const
    ADAP_COLOR_SCHEME_DEFAULT = 0;
    ADAP_COLOR_SCHEME_FORCE_LIGHT = 1;
    ADAP_COLOR_SCHEME_PREFER_LIGHT = 2;
    ADAP_COLOR_SCHEME_PREFER_DARK = 3;
    ADAP_COLOR_SCHEME_FORCE_DARK = 4;
;

{ was #define dname def_expr }
function ADAP_TYPE_STYLE_MANAGER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapStyleManager, adap_style_manager, ADAP, STYLE_MANAGER, GObject) }
function adap_style_manager_get_default:PAdapStyleManager;cdecl;external;
function adap_style_manager_get_for_display(display:PGdkDisplay):PAdapStyleManager;cdecl;external;
function adap_style_manager_get_display(self:PAdapStyleManager):PGdkDisplay;cdecl;external;
function adap_style_manager_get_color_scheme(self:PAdapStyleManager):TAdapColorScheme;cdecl;external;
procedure adap_style_manager_set_color_scheme(self:PAdapStyleManager; color_scheme:TAdapColorScheme);cdecl;external;
function adap_style_manager_get_system_supports_color_schemes(self:PAdapStyleManager):Tgboolean;cdecl;external;
function adap_style_manager_get_dark(self:PAdapStyleManager):Tgboolean;cdecl;external;
function adap_style_manager_get_high_contrast(self:PAdapStyleManager):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_STYLE_MANAGER : longint; { return type might be wrong }
  begin
    ADAP_TYPE_STYLE_MANAGER:=adap_style_manager_get_type;
  end;


end.
