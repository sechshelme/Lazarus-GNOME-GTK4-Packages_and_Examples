
unit adw_style_manager;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_style_manager.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_style_manager.h
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
PAdwColorScheme  = ^AdwColorScheme;
PAdwStyleManager  = ^AdwStyleManager;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-enums.h"}
type
  PAdwColorScheme = ^TAdwColorScheme;
  TAdwColorScheme =  Longint;
  Const
    ADW_COLOR_SCHEME_DEFAULT = 0;
    ADW_COLOR_SCHEME_FORCE_LIGHT = 1;
    ADW_COLOR_SCHEME_PREFER_LIGHT = 2;
    ADW_COLOR_SCHEME_PREFER_DARK = 3;
    ADW_COLOR_SCHEME_FORCE_DARK = 4;
;

{ was #define dname def_expr }
function ADW_TYPE_STYLE_MANAGER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwStyleManager, adw_style_manager, ADW, STYLE_MANAGER, GObject) }
function adw_style_manager_get_default:PAdwStyleManager;cdecl;external;
function adw_style_manager_get_for_display(display:PGdkDisplay):PAdwStyleManager;cdecl;external;
function adw_style_manager_get_display(self:PAdwStyleManager):PGdkDisplay;cdecl;external;
function adw_style_manager_get_color_scheme(self:PAdwStyleManager):TAdwColorScheme;cdecl;external;
procedure adw_style_manager_set_color_scheme(self:PAdwStyleManager; color_scheme:TAdwColorScheme);cdecl;external;
function adw_style_manager_get_system_supports_color_schemes(self:PAdwStyleManager):Tgboolean;cdecl;external;
function adw_style_manager_get_dark(self:PAdwStyleManager):Tgboolean;cdecl;external;
function adw_style_manager_get_high_contrast(self:PAdwStyleManager):Tgboolean;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_STYLE_MANAGER : longint; { return type might be wrong }
  begin
    ADW_TYPE_STYLE_MANAGER:=adw_style_manager_get_type;
  end;


end.
