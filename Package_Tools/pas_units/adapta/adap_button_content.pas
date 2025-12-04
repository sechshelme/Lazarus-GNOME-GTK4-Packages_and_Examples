unit adap_button_content;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Purism SPC
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * Author: Alice Mikhaylenko <alice.mikhaylenko@puri.sm>
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}

{G_DECLARE_FINAL_TYPE (AdapButtonContent, adap_button_content, ADAP, BUTTON_CONTENT, GtkWidget) }
function adap_button_content_new:PGtkWidget;cdecl;external libadapta;
function adap_button_content_get_label(self:PAdapButtonContent):Pchar;cdecl;external libadapta;
procedure adap_button_content_set_label(self:PAdapButtonContent; _label:Pchar);cdecl;external libadapta;
function adap_button_content_get_icon_name(self:PAdapButtonContent):Pchar;cdecl;external libadapta;
procedure adap_button_content_set_icon_name(self:PAdapButtonContent; icon_name:Pchar);cdecl;external libadapta;
function adap_button_content_get_use_underline(self:PAdapButtonContent):Tgboolean;cdecl;external libadapta;
procedure adap_button_content_set_use_underline(self:PAdapButtonContent; use_underline:Tgboolean);cdecl;external libadapta;
function adap_button_content_get_can_shrink(self:PAdapButtonContent):Tgboolean;cdecl;external libadapta;
procedure adap_button_content_set_can_shrink(self:PAdapButtonContent; can_shrink:Tgboolean);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:01:21 ===

function ADAP_TYPE_BUTTON_CONTENT: TGType;
function ADAP_BUTTON_CONTENT(obj: Pointer): PAdapButtonContent;
function ADAP_IS_BUTTON_CONTENT(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_BUTTON_CONTENT: TGType;
begin
  Result := adap_button_content_get_type;
end;

function ADAP_BUTTON_CONTENT(obj: Pointer): PAdapButtonContent;
begin
  Result := PAdapButtonContent(g_type_check_instance_cast(obj, ADAP_TYPE_BUTTON_CONTENT));
end;

function ADAP_IS_BUTTON_CONTENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_BUTTON_CONTENT);
end;

type 
  TAdapButtonContent = record
  end;
  PAdapButtonContent = ^TAdapButtonContent;

  TAdapButtonContentClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapButtonContentClass = ^TAdapButtonContentClass;

function adap_button_content_get_type: TGType; cdecl; external libgxxxxxxx;



end.
