unit nma_vpn_password_dialog;

interface

uses
  fp_glib2, fp_nma;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ vpn-password-dialog.c - A use password prompting dialog widget.
 *
 * The Gnome Library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public License as
 * published by the ree Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * The Gnome Library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * Copyright (C) 1999, 2000 Eazel, Inc.
 * Copyright (C) 2011, 2013 Red Hat, Inc.
 *
 * Authors: Ramiro Estrugo <ramiro@eazel.com>
 *          Dan Williams <dcbw@redhat.com>
  }
{$ifndef __NMA_VPN_PASSWORD_DIALOG_H__}
{$define __NMA_VPN_PASSWORD_DIALOG_H__}
{$include <gtk/gtk.h>}
{$include "nma-version.h"}

type
  PNMAVpnPasswordDialog = ^TNMAVpnPasswordDialog;
  TNMAVpnPasswordDialog = record
      parent : TGtkDialog;
    end;

  PNMAVpnPasswordDialogClass = ^TNMAVpnPasswordDialogClass;
  TNMAVpnPasswordDialogClass = record
      parent_class : TGtkDialogClass;
    end;


function nma_vpn_password_dialog_get_type:TGType;cdecl;external libnma;
function nma_vpn_password_dialog_new(title:Pchar; message:Pchar; password:Pchar):PGtkWidget;cdecl;external libnma;
function nma_vpn_password_dialog_run_and_block(dialog:PNMAVpnPasswordDialog):Tgboolean;cdecl;external libnma;
{ Attribute mutators  }
procedure nma_vpn_password_dialog_set_show_password(dialog:PNMAVpnPasswordDialog; show:Tgboolean);cdecl;external libnma;
procedure nma_vpn_password_dialog_focus_password(dialog:PNMAVpnPasswordDialog);cdecl;external libnma;
procedure nma_vpn_password_dialog_set_password(dialog:PNMAVpnPasswordDialog; password:Pchar);cdecl;external libnma;
procedure nma_vpn_password_dialog_set_password_label(dialog:PNMAVpnPasswordDialog; _label:Pchar);cdecl;external libnma;
procedure nma_vpn_password_dialog_set_show_password_secondary(dialog:PNMAVpnPasswordDialog; show:Tgboolean);cdecl;external libnma;
procedure nma_vpn_password_dialog_focus_password_secondary(dialog:PNMAVpnPasswordDialog);cdecl;external libnma;
procedure nma_vpn_password_dialog_set_password_secondary(dialog:PNMAVpnPasswordDialog; password_secondary:Pchar);cdecl;external libnma;
procedure nma_vpn_password_dialog_set_password_secondary_label(dialog:PNMAVpnPasswordDialog; _label:Pchar);cdecl;external libnma;
procedure nma_vpn_password_dialog_set_show_password_ternary(dialog:PNMAVpnPasswordDialog; show:Tgboolean);cdecl;external libnma;
procedure nma_vpn_password_dialog_focus_password_ternary(dialog:PNMAVpnPasswordDialog);cdecl;external libnma;
procedure nma_vpn_password_dialog_set_password_ternary(dialog:PNMAVpnPasswordDialog; password_ternary:Pchar);cdecl;external libnma;
procedure nma_vpn_password_dialog_set_password_ternary_label(dialog:PNMAVpnPasswordDialog; _label:Pchar);cdecl;external libnma;
{ Attribute accessors  }
function nma_vpn_password_dialog_get_password(dialog:PNMAVpnPasswordDialog):Pchar;cdecl;external libnma;
function nma_vpn_password_dialog_get_password_secondary(dialog:PNMAVpnPasswordDialog):Pchar;cdecl;external libnma;
function nma_vpn_password_dialog_get_password_ternary(dialog:PNMAVpnPasswordDialog):Pchar;cdecl;external libnma;
{$endif}
{ __NMA_VPN_PASSWORD_DIALOG_H__  }

// === Konventiert am: 8-8-26 13:25:12 ===

function NMA_VPN_TYPE_PASSWORD_DIALOG : TGType;
function NMA_VPN_PASSWORD_DIALOG(obj : Pointer) : PNMAVpnPasswordDialog;
function NMA_VPN_PASSWORD_DIALOG_CLASS(klass : Pointer) : PNMAVpnPasswordDialogClass;
function NMA_VPN_IS_PASSWORD_DIALOG(obj : Pointer) : Tgboolean;
function NMA_VPN_IS_PASSWORD_DIALOG_CLASS(klass : Pointer) : Tgboolean;

implementation

function NMA_VPN_TYPE_PASSWORD_DIALOG : TGType;
  begin
    NMA_VPN_TYPE_PASSWORD_DIALOG:=nma_vpn_password_dialog_get_type;
  end;

function NMA_VPN_PASSWORD_DIALOG(obj : Pointer) : PNMAVpnPasswordDialog;
begin
  Result := PNMAVpnPasswordDialog(g_type_check_instance_cast(obj, NMA_VPN_TYPE_PASSWORD_DIALOG));
end;

function NMA_VPN_PASSWORD_DIALOG_CLASS(klass : Pointer) : PNMAVpnPasswordDialogClass;
begin
  Result := PNMAVpnPasswordDialogClass(g_type_check_class_cast(klass, NMA_VPN_TYPE_PASSWORD_DIALOG));
end;

function NMA_VPN_IS_PASSWORD_DIALOG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_VPN_TYPE_PASSWORD_DIALOG);
end;

function NMA_VPN_IS_PASSWORD_DIALOG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NMA_VPN_TYPE_PASSWORD_DIALOG);
end;



end.
