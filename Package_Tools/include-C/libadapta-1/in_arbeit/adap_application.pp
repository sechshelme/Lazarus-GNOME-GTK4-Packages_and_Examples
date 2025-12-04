
unit adap_application;
interface

{
  Automatically converted by H2Pas 1.0.0 from adap_application.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adap_application.h
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
PAdapApplication  = ^AdapApplication;
PAdapApplicationClass  = ^AdapApplicationClass;
PAdapStyleManager  = ^AdapStyleManager;
Pchar  = ^char;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Nahuel Gomez Castro
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-style-manager.h"}

{ was #define dname def_expr }
function ADAP_TYPE_APPLICATION : longint; { return type might be wrong }

{////////G_DECLARE_DERIVABLE_TYPE (AdapApplication, adap_application, ADAP, APPLICATION, GtkApplication) }
{*
 * AdapApplicationClass:
 * @parent_class: The parent class
  }
{< private > }
type
  PAdapApplicationClass = ^TAdapApplicationClass;
  TAdapApplicationClass = record
      parent_class : TGtkApplicationClass;
      padding : array[0..3] of Tgpointer;
    end;

(* Const before type ignored *)

function adap_application_new(application_id:Pchar; flags:TGApplicationFlags):PAdapApplication;cdecl;external;
function adap_application_get_style_manager(self:PAdapApplication):PAdapStyleManager;cdecl;external;

implementation

{ was #define dname def_expr }
function ADAP_TYPE_APPLICATION : longint; { return type might be wrong }
  begin
    ADAP_TYPE_APPLICATION:=adap_application_get_type;
  end;


end.
