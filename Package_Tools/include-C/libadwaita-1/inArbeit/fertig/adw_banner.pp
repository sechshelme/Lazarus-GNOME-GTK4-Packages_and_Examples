
unit adw_banner;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_banner.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_banner.h
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
PAdwBanner  = ^AdwBanner;
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2022 Jamie Murphy <hello@itsjamie.dev>
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

{ was #define dname def_expr }
function ADW_TYPE_BANNER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdwBanner, adw_banner, ADW, BANNER, GtkWidget) }
(* Const before type ignored *)
function adw_banner_new(title:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adw_banner_get_title(self:PAdwBanner):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_banner_set_title(self:PAdwBanner; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adw_banner_get_button_label(self:PAdwBanner):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adw_banner_set_button_label(self:PAdwBanner; _label:Pchar);cdecl;external;
function adw_banner_get_revealed(self:PAdwBanner):Tgboolean;cdecl;external;
procedure adw_banner_set_revealed(self:PAdwBanner; revealed:Tgboolean);cdecl;external;
function adw_banner_get_use_markup(self:PAdwBanner):Tgboolean;cdecl;external;
procedure adw_banner_set_use_markup(self:PAdwBanner; use_markup:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_BANNER : longint; { return type might be wrong }
  begin
    ADW_TYPE_BANNER:=adw_banner_get_type;
  end;


end.
