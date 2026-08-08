
unit nma_wifi_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_wifi_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_wifi_dialog.h
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
PNMAccessPoint  = ^NMAccessPoint;
PNMAWifiDialog  = ^NMAWifiDialog;
PNMAWifiDialogClass  = ^NMAWifiDialogClass;
PNMClient  = ^NMClient;
PNMConnection  = ^NMConnection;
PNMDevice  = ^NMDevice;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: GPL-2.0+ }
{ NetworkManager Wireless Applet -- Display wireless access points and allow user control
 *
 * Dan Williams <dcbw@redhat.com>
 *
 * Copyright 2007 - 2014 Red Hat, Inc.
  }
{$ifndef __NMA_WIFI_DIALOG_H__}
{$define __NMA_WIFI_DIALOG_H__}
{$include <gtk/gtk.h>}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <NetworkManager.h>}
{$include "nma-version.h"}

{ was #define dname def_expr }
function NMA_TYPE_WIFI_DIALOG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WIFI_DIALOG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WIFI_DIALOG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WIFI_DIALOG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WIFI_DIALOG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WIFI_DIALOG_GET_CLASS(obj : longint) : longint;

type
  PNMAWifiDialog = ^TNMAWifiDialog;
  TNMAWifiDialog = record
      parent : TGtkDialog;
    end;

  PNMAWifiDialogClass = ^TNMAWifiDialogClass;
  TNMAWifiDialogClass = record
      parent : TGtkDialogClass;
    end;

function nma_wifi_dialog_get_type:TGType;cdecl;external;
function nma_wifi_dialog_new(client:PNMClient; connection:PNMConnection; device:PNMDevice; ap:PNMAccessPoint; secrets_only:Tgboolean):PGtkWidget;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before declarator ignored *)
function nma_wifi_dialog_new_for_secrets(client:PNMClient; connection:PNMConnection; secrets_setting_name:Pchar; secrets_hints:PPchar):PGtkWidget;cdecl;external;
function nma_wifi_dialog_new_for_hidden(client:PNMClient):PGtkWidget;cdecl;external;
function nma_wifi_dialog_new_for_create(client:PNMClient):PGtkWidget;cdecl;external;
function nma_wifi_dialog_get_connection(self:PNMAWifiDialog; device:PPNMDevice; ap:PPNMAccessPoint):PNMConnection;cdecl;external;
{xxxxxNMA_DEPRECATED_IN_1_2 }
function nma_wifi_dialog_nag_user(self:PNMAWifiDialog):PGtkWidget;cdecl;external;
{xxxxxNMA_DEPRECATED_IN_1_2 }
procedure nma_wifi_dialog_set_nag_ignored(self:PNMAWifiDialog; ignored:Tgboolean);cdecl;external;
{xxxxxNMA_DEPRECATED_IN_1_2 }
function nma_wifi_dialog_get_nag_ignored(self:PNMAWifiDialog):Tgboolean;cdecl;external;
{xxxxxNMA_DEPRECATED_IN_1_2_FOR(nma_wifi_dialog_new_for_hidden) }
function nma_wifi_dialog_new_for_other(client:PNMClient):PGtkWidget;cdecl;external;
{$endif}
{ __NMA_WIFI_DIALOG_H__  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_WIFI_DIALOG : longint; { return type might be wrong }
  begin
    NMA_TYPE_WIFI_DIALOG:=nma_wifi_dialog_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WIFI_DIALOG(obj : longint) : longint;
begin
  NMA_WIFI_DIALOG:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_WIFI_DIALOG,NMAWifiDialog);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WIFI_DIALOG_CLASS(klass : longint) : longint;
begin
  NMA_WIFI_DIALOG_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_WIFI_DIALOG,NMAWifiDialogClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WIFI_DIALOG(obj : longint) : longint;
begin
  NMA_IS_WIFI_DIALOG:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_WIFI_DIALOG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_WIFI_DIALOG_CLASS(klass : longint) : longint;
begin
  NMA_IS_WIFI_DIALOG_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_WIFI_DIALOG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_WIFI_DIALOG_GET_CLASS(obj : longint) : longint;
begin
  NMA_WIFI_DIALOG_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_WIFI_DIALOG,NMAWifiDialogClass);
end;


end.
