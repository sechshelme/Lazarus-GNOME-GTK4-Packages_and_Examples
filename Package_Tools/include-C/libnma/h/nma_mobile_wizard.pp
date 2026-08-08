
unit nma_mobile_wizard;
interface

{
  Automatically converted by H2Pas 1.0.0 from nma_mobile_wizard.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nma_mobile_wizard.h
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
PGtkWindow  = ^GtkWindow;
PGtkWindowGroup  = ^GtkWindowGroup;
PNMAMobileWizard  = ^NMAMobileWizard;
PNMAMobileWizardAccessMethod  = ^NMAMobileWizardAccessMethod;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: GPL-2.0+ }
{ NetworkManager Connection editor -- Connection editor for NetworkManager
 *
 * Dan Williams <dcbw@redhat.com>
 * Lubomir Rintel <lkundrak@v3.sk>
 *
 * (C) Copyright 2008 - 2018 Red Hat, Inc.
  }
{$ifndef __NMA_MOBILE_WIZARD_H__}
{$define __NMA_MOBILE_WIZARD_H__}
{$include <glib.h>}
{$include <gtk/gtk.h>}
{$include <NetworkManager.h>}
{$include <nm-device.h>}
{$include "nma-version.h"}
type
{*
 * NMAMobileWizardAccessMethod:
 * @provider_name: The mobile network provider name
 * @plan_name: The provided network access billing plan
 * @devtype: Required NetworkManager device capabilities
 * @username: User login
 * @password: User secret
 * @gsm_apn: The GSM Access Point Name
 *
 * Network access method details.
  }

  PNMAMobileWizardAccessMethod = ^TNMAMobileWizardAccessMethod;
  TNMAMobileWizardAccessMethod = record
      provider_name : Pchar;
      plan_name : Pchar;
      devtype : TNMDeviceModemCapabilities;
      username : Pchar;
      password : Pchar;
      gsm_apn : Pchar;
    end;

  TNMAMobileWizardCallback = procedure (self:PNMAMobileWizard; canceled:Tgboolean; method:PNMAMobileWizardAccessMethod; user_data:Tgpointer);cdecl;

{ was #define dname def_expr }
function NMA_TYPE_MOBILE_WIZARD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_WIZARD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_WIZARD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_MOBILE_WIZARD(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_MOBILE_WIZARD_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_WIZARD_GET_CLASS(obj : longint) : longint;

function nma_mobile_wizard_get_type:TGType;cdecl;external;
function nma_mobile_wizard_new(parent:PGtkWindow; window_group:PGtkWindowGroup; modem_caps:TNMDeviceModemCapabilities; will_connect_after:Tgboolean; cb:TNMAMobileWizardCallback; 
           user_data:Tgpointer):PNMAMobileWizard;cdecl;external;
procedure nma_mobile_wizard_present(wizard:PNMAMobileWizard);cdecl;external;
procedure nma_mobile_wizard_destroy(self:PNMAMobileWizard);cdecl;external;
{$endif}
{ __NMA_MOBILE_WIZARD_H__  }

implementation

{ was #define dname def_expr }
function NMA_TYPE_MOBILE_WIZARD : longint; { return type might be wrong }
  begin
    NMA_TYPE_MOBILE_WIZARD:=nma_mobile_wizard_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_WIZARD(obj : longint) : longint;
begin
  NMA_MOBILE_WIZARD:=G_TYPE_CHECK_INSTANCE_CAST(obj,NMA_TYPE_MOBILE_WIZARD,NMAMobileWizard);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_WIZARD_CLASS(klass : longint) : longint;
begin
  NMA_MOBILE_WIZARD_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NMA_TYPE_MOBILE_WIZARD,NMAMobileWizardClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_MOBILE_WIZARD(obj : longint) : longint;
begin
  NMA_IS_MOBILE_WIZARD:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NMA_TYPE_MOBILE_WIZARD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_IS_MOBILE_WIZARD_CLASS(klass : longint) : longint;
begin
  NMA_IS_MOBILE_WIZARD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NMA_TYPE_MOBILE_WIZARD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NMA_MOBILE_WIZARD_GET_CLASS(obj : longint) : longint;
begin
  NMA_MOBILE_WIZARD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NMA_TYPE_MOBILE_WIZARD,NMAMobileWizardClass);
end;


end.
