
unit adap_bin;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_bin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_bin.h
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
PAdapBin  = ^AdapBin;
PAdapBinClass  = ^AdapBinClass;
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
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{ was #define dname def_expr }
function ADAP_TYPE_BIN : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapBin, adap_bin, ADAP, BIN, GtkWidget) }
type
  PAdapBinClass = ^TAdapBinClass;
  TAdapBinClass = record
      parent_class : TGtkWidgetClass;
    end;


function adap_bin_new:PGtkWidget;cdecl;external;
function adap_bin_get_child(self:PAdapBin):PGtkWidget;cdecl;external;
procedure adap_bin_set_child(self:PAdapBin; child:PGtkWidget);cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_BIN : longint; { return type might be wrong }
  begin
    ADAP_TYPE_BIN:=adap_bin_get_type;
  end;


end.
