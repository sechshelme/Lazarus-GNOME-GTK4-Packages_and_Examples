
unit adw_bin;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_bin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_bin.h
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
PAdwBin  = ^AdwBin;
PAdwBinClass  = ^AdwBinClass;
PGtkWidget  = ^GtkWidget;
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

{ was #define dname def_expr }
function ADW_TYPE_BIN : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwBin, adw_bin, ADW, BIN, GtkWidget) }
type
  PAdwBinClass = ^TAdwBinClass;
  TAdwBinClass = record
      parent_class : TGtkWidgetClass;
    end;


function adw_bin_new:PGtkWidget;cdecl;external;
function adw_bin_get_child(self:PAdwBin):PGtkWidget;cdecl;external;
procedure adw_bin_set_child(self:PAdwBin; child:PGtkWidget);cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_BIN : longint; { return type might be wrong }
  begin
    ADW_TYPE_BIN:=adw_bin_get_type;
  end;


end.
