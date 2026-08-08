
unit nma_vpn_password_dialog;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_vpn_password_dialog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_vpn_password_dialog.h
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
PNMAVpnPasswordDialog  = ^NMAVpnPasswordDialog;
PNMAVpnPasswordDialogClass  = ^NMAVpnPasswordDialogClass;
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

{ was #define dname def_expr }
function NMA_VPN_TYPE_PASSWORD_DIALOG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_VPN_PASSWORD_DIALOG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_VPN_PASSWORD_DIALOG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_VPN_IS_PASSWORD_DIALOG(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_VPN_IS_PASSWORD_DIALOG_CLASS(klass : longint) : longint;

type
  PNMAVpnPasswordDialog = ^TNMAVpnPasswordDialog;
  TNMAVpnPasswordDialog = record
      parent : TGtkDialog;
    end;

  PNMAVpnPasswordDialogClass = ^TNMAVpnPasswordDialogClass;
  TNMAVpnPasswordDialogClass = record
      parent_class : TGtkDialogClass;
    end;


function nma_vpn_password_dialog_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function nma_vpn_password_dialog_new(title:Pchar; message:Pchar; password:Pchar):PGtkWidget;cdecl;external;
function nma_vpn_password_dialog_run_and_block(dialog:PNMAVpnPasswordDialog):Tgboolean;cdecl;external;
{ Attribute mutators  }
procedure nma_vpn_password_dialog_set_show_password(dialog:PNMAVpnPasswordDialog; show:Tgboolean);cdecl;external;
procedure nma_vpn_password_dialog_focus_password(dialog:PNMAVpnPasswordDialog);cdecl;external;
(* Const before type ignored *)
procedure nma_vpn_password_dialog_set_password(dialog:PNMAVpnPasswordDialog; password:Pchar);cdecl;external;
(* Const before type ignored *)
procedure nma_vpn_password_dialog_set_password_label(dialog:PNMAVpnPasswordDialog; _label:Pchar);cdecl;external;
procedure nma_vpn_password_dialog_set_show_password_secondary(dialog:PNMAVpnPasswordDialog; show:Tgboolean);cdecl;external;
procedure nma_vpn_password_dialog_focus_password_secondary(dialog:PNMAVpnPasswordDialog);cdecl;external;
(* Const before type ignored *)
procedure nma_vpn_password_dialog_set_password_secondary(dialog:PNMAVpnPasswordDialog; password_secondary:Pchar);cdecl;external;
(* Const before type ignored *)
procedure nma_vpn_password_dialog_set_password_secondary_label(dialog:PNMAVpnPasswordDialog; _label:Pchar);cdecl;external;
procedure nma_vpn_password_dialog_set_show_password_ternary(dialog:PNMAVpnPasswordDialog; show:Tgboolean);cdecl;external;
procedure nma_vpn_password_dialog_focus_password_ternary(dialog:PNMAVpnPasswordDialog);cdecl;external;
(* Const before type ignored *)
procedure nma_vpn_password_dialog_set_password_ternary(dialog:PNMAVpnPasswordDialog; password_ternary:Pchar);cdecl;external;
(* Const before type ignored *)
procedure nma_vpn_password_dialog_set_password_ternary_label(dialog:PNMAVpnPasswordDialog; _label:Pchar);cdecl;external;
{ Attribute accessors  }
(* Const before type ignored *)
function nma_vpn_password_dialog_get_password(dialog:PNMAVpnPasswordDialog):Pchar;cdecl;external;
(* Const before type ignored *)
function nma_vpn_password_dialog_get_password_secondary(dialog:PNMAVpnPasswordDialog):Pchar;cdecl;external;
(* Const before type ignored *)
function nma_vpn_password_dialog_get_password_ternary(dialog:PNMAVpnPasswordDialog):Pchar;cdecl;external;
{$endif}
{ __NMA_VPN_PASSWORD_DIALOG_H__  }

implementation

{ was #define dname def_expr }
function NMA_VPN_TYPE_PASSWORD_DIALOG : longint; { return type might be wrong }
  begin
    NMA_VPN_TYPE_PASSWORD_DIALOG:=nma_vpn_password_dialog_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_VPN_PASSWORD_DIALOG(obj : longint) : longint;
begin
  NMA_VPN_PASSWORD_DIALOG:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_VPN_TYPE_PASSWORD_DIALOG,NMAVpnPasswordDialog);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_VPN_PASSWORD_DIALOG_CLASS(klass : longint) : longint;
begin
  NMA_VPN_PASSWORD_DIALOG_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_VPN_TYPE_PASSWORD_DIALOG,NMAVpnPasswordDialogClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_VPN_IS_PASSWORD_DIALOG(obj : longint) : longint;
begin
  NMA_VPN_IS_PASSWORD_DIALOG:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_VPN_TYPE_PASSWORD_DIALOG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_VPN_IS_PASSWORD_DIALOG_CLASS(klass : longint) : longint;
begin
  NMA_VPN_IS_PASSWORD_DIALOG_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_VPN_TYPE_PASSWORD_DIALOG);
end;


end.
