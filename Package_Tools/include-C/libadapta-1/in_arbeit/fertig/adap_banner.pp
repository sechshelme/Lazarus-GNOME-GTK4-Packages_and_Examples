
unit adap_banner;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_banner.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_banner.h
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
PAdapBanner  = ^AdapBanner;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-enums.h"}

{ was #define dname def_expr }
function ADAP_TYPE_BANNER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (AdapBanner, adap_banner, ADAP, BANNER, GtkWidget) }
(* Const before type ignored *)
function adap_banner_new(title:Pchar):PGtkWidget;cdecl;external;
(* Const before type ignored *)
function adap_banner_get_title(self:PAdapBanner):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_banner_set_title(self:PAdapBanner; title:Pchar);cdecl;external;
(* Const before type ignored *)
function adap_banner_get_button_label(self:PAdapBanner):Pchar;cdecl;external;
(* Const before type ignored *)
procedure adap_banner_set_button_label(self:PAdapBanner; _label:Pchar);cdecl;external;
function adap_banner_get_revealed(self:PAdapBanner):Tgboolean;cdecl;external;
procedure adap_banner_set_revealed(self:PAdapBanner; revealed:Tgboolean);cdecl;external;
function adap_banner_get_use_markup(self:PAdapBanner):Tgboolean;cdecl;external;
procedure adap_banner_set_use_markup(self:PAdapBanner; use_markup:Tgboolean);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_BANNER : longint; { return type might be wrong }
  begin
    ADAP_TYPE_BANNER:=adap_banner_get_type;
  end;


end.
