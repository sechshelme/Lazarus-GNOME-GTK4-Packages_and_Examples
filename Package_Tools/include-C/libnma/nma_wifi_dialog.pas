unit nma_wifi_dialog;

interface

uses
  fp_glib2, fp_nma;

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

type
  PNMAWifiDialog = ^TNMAWifiDialog;
  TNMAWifiDialog = record
      parent : TGtkDialog;
    end;

  PNMAWifiDialogClass = ^TNMAWifiDialogClass;
  TNMAWifiDialogClass = record
      parent : TGtkDialogClass;
    end;

function nma_wifi_dialog_get_type:TGType;cdecl;external libnma;
function nma_wifi_dialog_new(client:PNMClient; connection:PNMConnection; device:PNMDevice; ap:PNMAccessPoint; secrets_only:Tgboolean):PGtkWidget;cdecl;external libnma;
function nma_wifi_dialog_new_for_secrets(client:PNMClient; connection:PNMConnection; secrets_setting_name:Pchar; secrets_hints:PPchar):PGtkWidget;cdecl;external libnma;
function nma_wifi_dialog_new_for_hidden(client:PNMClient):PGtkWidget;cdecl;external libnma;
function nma_wifi_dialog_new_for_create(client:PNMClient):PGtkWidget;cdecl;external libnma;
function nma_wifi_dialog_get_connection(self:PNMAWifiDialog; device:PPNMDevice; ap:PPNMAccessPoint):PNMConnection;cdecl;external libnma;
{xxxxxNMA_DEPRECATED_IN_1_2 }
function nma_wifi_dialog_nag_user(self:PNMAWifiDialog):PGtkWidget;cdecl;external libnma;
{xxxxxNMA_DEPRECATED_IN_1_2 }
procedure nma_wifi_dialog_set_nag_ignored(self:PNMAWifiDialog; ignored:Tgboolean);cdecl;external libnma;
{xxxxxNMA_DEPRECATED_IN_1_2 }
function nma_wifi_dialog_get_nag_ignored(self:PNMAWifiDialog):Tgboolean;cdecl;external libnma;
{xxxxxNMA_DEPRECATED_IN_1_2_FOR(nma_wifi_dialog_new_for_hidden) }
function nma_wifi_dialog_new_for_other(client:PNMClient):PGtkWidget;cdecl;external libnma;
{$endif}
{ __NMA_WIFI_DIALOG_H__  }

// === Konventiert am: 8-8-26 13:24:53 ===

function NMA_TYPE_WIFI_DIALOG : TGType;
function NMA_WIFI_DIALOG(obj : Pointer) : PNMAWifiDialog;
function NMA_WIFI_DIALOG_CLASS(klass : Pointer) : PNMAWifiDialogClass;
function NMA_IS_WIFI_DIALOG(obj : Pointer) : Tgboolean;
function NMA_IS_WIFI_DIALOG_CLASS(klass : Pointer) : Tgboolean;
function NMA_WIFI_DIALOG_GET_CLASS(obj : Pointer) : PNMAWifiDialogClass;

implementation

function NMA_TYPE_WIFI_DIALOG : TGType;
  begin
    NMA_TYPE_WIFI_DIALOG:=nma_wifi_dialog_get_type;
  end;

function NMA_WIFI_DIALOG(obj : Pointer) : PNMAWifiDialog;
begin
  Result := PNMAWifiDialog(g_type_check_instance_cast(obj, NMA_TYPE_WIFI_DIALOG));
end;

function NMA_WIFI_DIALOG_CLASS(klass : Pointer) : PNMAWifiDialogClass;
begin
  Result := PNMAWifiDialogClass(g_type_check_class_cast(klass, NMA_TYPE_WIFI_DIALOG));
end;

function NMA_IS_WIFI_DIALOG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_TYPE_WIFI_DIALOG);
end;

function NMA_IS_WIFI_DIALOG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NMA_TYPE_WIFI_DIALOG);
end;

function NMA_WIFI_DIALOG_GET_CLASS(obj : Pointer) : PNMAWifiDialogClass;
begin
  Result := PNMAWifiDialogClass(PGTypeInstance(obj)^.g_class);
end;



end.
