
unit nma_cert_chooser;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_cert_chooser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_cert_chooser.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGtkSizeGroup  = ^GtkSizeGroup;
PGtkWidget  = ^GtkWidget;
PNMACertChooser  = ^NMACertChooser;
PNMACertChooserFlags  = ^NMACertChooserFlags;
PNMSetting  = ^NMSetting;
PNMSetting8021xCKScheme  = ^NMSetting8021xCKScheme;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1+ }
{ NetworkManager Applet -- allow user control over networking
 *
 * Lubomir Rintel <lkundrak@v3.sk>
 *
 * Copyright (C) 2015,2017 Red Hat, Inc.
  }
{$ifndef __NMA_CERT_CHOOSER_H__}
{$define __NMA_CERT_CHOOSER_H__}
{$include <gtk/gtk.h>}
{$include <NetworkManager.h>}
{$include "nma-version.h"}
{*
 * NMACertChooserFlags:
 * @NMA_CERT_CHOOSER_FLAG_NONE: No flags
 * @NMA_CERT_CHOOSER_FLAG_CERT: Only pick a certificate, not a key
 * @NMA_CERT_CHOOSER_FLAG_PASSWORDS: Hide all controls but the secrets entries
 * @NMA_CERT_CHOOSER_FLAG_PEM: Ensure the chooser only selects regular PEM files
 * @NMA_CERT_CHOOSER_FLAG_NO_PASSWORDS: Do not show password entries (Since: 1.8.34)
 *
 * Flags that controls what is the certificate chooser button able to pick.
 * Currently only local files are supported, but might be extended to use URIs,
 * such as PKCS\#11 certificate URIs in future as well.
 *
 * Since: 1.8.0
  }
type
  PNMACertChooserFlags = ^TNMACertChooserFlags;
  TNMACertChooserFlags =  Longint;
  Const
    NMA_CERT_CHOOSER_FLAG_NONE = $0;
    NMA_CERT_CHOOSER_FLAG_CERT = $1;
    NMA_CERT_CHOOSER_FLAG_PASSWORDS = $2;
    NMA_CERT_CHOOSER_FLAG_PEM = $4;
    NMA_CERT_CHOOSER_FLAG_NO_PASSWORDS = $8;
;

{ was #define dname def_expr }
function NMA_TYPE_CERT_CHOOSER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_CERT_CHOOSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_CERT_CHOOSER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_CERT_CHOOSER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_CERT_CHOOSER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_CERT_CHOOSER_GET_CLASS(obj : longint) : longint;

type

function nma_cert_chooser_get_type:TGType;cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_set_cert(cert_chooser:PNMACertChooser; value:Pgchar; scheme:TNMSetting8021xCKScheme);cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_set_cert_uri(cert_chooser:PNMACertChooser; uri:Pgchar);cdecl;external;
function nma_cert_chooser_get_cert(cert_chooser:PNMACertChooser; scheme:PNMSetting8021xCKScheme):Pgchar;cdecl;external;
function nma_cert_chooser_get_cert_uri(cert_chooser:PNMACertChooser):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_set_cert_password(cert_chooser:PNMACertChooser; password:Pgchar);cdecl;external;
(* Const before type ignored *)
function nma_cert_chooser_get_cert_password(cert_chooser:PNMACertChooser):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_set_key(cert_chooser:PNMACertChooser; value:Pgchar; scheme:TNMSetting8021xCKScheme);cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_set_key_uri(cert_chooser:PNMACertChooser; uri:Pgchar);cdecl;external;
function nma_cert_chooser_get_key(cert_chooser:PNMACertChooser; scheme:PNMSetting8021xCKScheme):Pgchar;cdecl;external;
function nma_cert_chooser_get_key_uri(cert_chooser:PNMACertChooser):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_set_key_password(cert_chooser:PNMACertChooser; password:Pgchar);cdecl;external;
(* Const before type ignored *)
function nma_cert_chooser_get_key_password(cert_chooser:PNMACertChooser):Pgchar;cdecl;external;
(* Const before type ignored *)
function nma_cert_chooser_new(title:Pgchar; flags:TNMACertChooserFlags):PGtkWidget;cdecl;external;
procedure nma_cert_chooser_add_to_size_group(cert_chooser:PNMACertChooser; group:PGtkSizeGroup);cdecl;external;
function nma_cert_chooser_validate(cert_chooser:PNMACertChooser; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_setup_cert_password_storage(cert_chooser:PNMACertChooser; initial_flags:TNMSettingSecretFlags; setting:PNMSetting; password_flags_name:Pchar; with_not_required:Tgboolean; 
            ask_mode:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_update_cert_password_storage(cert_chooser:PNMACertChooser; secret_flags:TNMSettingSecretFlags; setting:PNMSetting; password_flags_name:Pchar);cdecl;external;
function nma_cert_chooser_get_cert_password_flags(cert_chooser:PNMACertChooser):TNMSettingSecretFlags;cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_setup_key_password_storage(cert_chooser:PNMACertChooser; initial_flags:TNMSettingSecretFlags; setting:PNMSetting; password_flags_name:Pchar; with_not_required:Tgboolean; 
            ask_mode:Tgboolean);cdecl;external;
(* Const before type ignored *)
procedure nma_cert_chooser_update_key_password_storage(cert_chooser:PNMACertChooser; secret_flags:TNMSettingSecretFlags; setting:PNMSetting; password_flags_name:Pchar);cdecl;external;
function nma_cert_chooser_get_key_password_flags(cert_chooser:PNMACertChooser):TNMSettingSecretFlags;cdecl;external;
{$endif}
{ __NMA_CERT_CHOOSER_H__  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_CERT_CHOOSER : longint; { return type might be wrong }
  begin
    NMA_TYPE_CERT_CHOOSER:=nma_cert_chooser_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_CERT_CHOOSER(obj : longint) : longint;
begin
  NMA_CERT_CHOOSER:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_CERT_CHOOSER,NMACertChooser);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_CERT_CHOOSER_CLASS(klass : longint) : longint;
begin
  NMA_CERT_CHOOSER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_CERT_CHOOSER,NMACertChooserClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_CERT_CHOOSER(obj : longint) : longint;
begin
  NMA_IS_CERT_CHOOSER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_CERT_CHOOSER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_CERT_CHOOSER_CLASS(klass : longint) : longint;
begin
  NMA_IS_CERT_CHOOSER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_CERT_CHOOSER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_CERT_CHOOSER_GET_CLASS(obj : longint) : longint;
begin
  NMA_CERT_CHOOSER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_CERT_CHOOSER,NMACertChooserClass);
end;


end.
