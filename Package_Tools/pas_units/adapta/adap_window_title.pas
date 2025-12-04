unit adap_window_title;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Christopher Davis <christopherdavis@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{G_DECLARE_FINAL_TYPE (AdapWindowTitle, adap_window_title, ADAP, WINDOW_TITLE, GtkWidget) }
function adap_window_title_new(title:Pchar; subtitle:Pchar):PGtkWidget;cdecl;external libadapta;
function adap_window_title_get_title(self:PAdapWindowTitle):Pchar;cdecl;external libadapta;
procedure adap_window_title_set_title(self:PAdapWindowTitle; title:Pchar);cdecl;external libadapta;
function adap_window_title_get_subtitle(self:PAdapWindowTitle):Pchar;cdecl;external libadapta;
procedure adap_window_title_set_subtitle(self:PAdapWindowTitle; subtitle:Pchar);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:16 ===

function ADAP_TYPE_WINDOW_TITLE: TGType;
function ADAP_WINDOW_TITLE(obj: Pointer): PAdapWindowTitle;
function ADAP_IS_WINDOW_TITLE(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_WINDOW_TITLE: TGType;
begin
  Result := adap_window_title_get_type;
end;

function ADAP_WINDOW_TITLE(obj: Pointer): PAdapWindowTitle;
begin
  Result := PAdapWindowTitle(g_type_check_instance_cast(obj, ADAP_TYPE_WINDOW_TITLE));
end;

function ADAP_IS_WINDOW_TITLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_WINDOW_TITLE);
end;

type 
  TAdapWindowTitle = record
  end;
  PAdapWindowTitle = ^TAdapWindowTitle;

  TAdapWindowTitleClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapWindowTitleClass = ^TAdapWindowTitleClass;

function adap_window_title_get_type: TGType; cdecl; external libgxxxxxxx;



end.
