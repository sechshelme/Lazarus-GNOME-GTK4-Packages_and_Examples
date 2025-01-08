
unit adw_application;
interface

{
  Automatically converted by H2Pas 1.0.0 from adw_application.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    adw_application.h
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
PAdwApplication  = ^AdwApplication;
PAdwApplicationClass  = ^AdwApplicationClass;
PAdwStyleManager  = ^AdwStyleManager;
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
{$if !defined(_ADWAITA_INSIDE) && !defined(ADWAITA_COMPILATION)}
{$error "Only <adwaita.h> can be included directly."}
{$endif}
{$include "adw-version.h"}
{$include <gtk/gtk.h>}
{$include "adw-style-manager.h"}

{ was #define dname def_expr }
function ADW_TYPE_APPLICATION : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (AdwApplication, adw_application, ADW, APPLICATION, GtkApplication) }
{*
 * AdwApplicationClass:
 * @parent_class: The parent class
  }
{< private > }
type
  PAdwApplicationClass = ^TAdwApplicationClass;
  TAdwApplicationClass = record
      parent_class : TGtkApplicationClass;
      padding : array[0..3] of Tgpointer;
    end;

(* Const before type ignored *)

function adw_application_new(application_id:Pchar; flags:TGApplicationFlags):PAdwApplication;cdecl;external;
function adw_application_get_style_manager(self:PAdwApplication):PAdwStyleManager;cdecl;external;

implementation

{ was #define dname def_expr }
function ADW_TYPE_APPLICATION : longint; { return type might be wrong }
  begin
    ADW_TYPE_APPLICATION:=adw_application_get_type;
  end;


end.
