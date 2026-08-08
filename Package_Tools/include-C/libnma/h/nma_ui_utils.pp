
unit nma_ui_utils;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_ui_utils.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_ui_utils.h
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
Pchar  = ^char;
PGtkWidget  = ^GtkWidget;
PNMSetting  = ^NMSetting;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: GPL-2.0+ }
{
 * Copyright 2015 Red Hat, Inc.
  }
{$ifndef __NMA_UI_UTILS_H__}
{$define __NMA_UI_UTILS_H__}
{$include <glib.h>}
{$include <gtk/gtk.h>}
{$include <NetworkManager.h>}
(* Const before type ignored *)

procedure nma_utils_setup_password_storage(passwd_entry:PGtkWidget; initial_flags:TNMSettingSecretFlags; setting:PNMSetting; password_flags_name:Pchar; with_not_required:Tgboolean; 
            ask_mode:Tgboolean);cdecl;external;
function nma_utils_menu_to_secret_flags(passwd_entry:PGtkWidget):TNMSettingSecretFlags;cdecl;external;
(* Const before type ignored *)
procedure nma_utils_update_password_storage(passwd_entry:PGtkWidget; secret_flags:TNMSettingSecretFlags; setting:PNMSetting; password_flags_name:Pchar);cdecl;external;
{$endif}
{ __NMA_UI_UTILS_H__  }

implementation


end.
