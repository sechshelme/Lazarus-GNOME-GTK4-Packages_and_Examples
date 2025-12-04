unit adap_toast;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@gnome.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-enums.h"}
type
  PAdapToastPriority = ^TAdapToastPriority;
  TAdapToastPriority =  Longint;
  Const
    ADAP_TOAST_PRIORITY_NORMAL = 0;
    ADAP_TOAST_PRIORITY_HIGH = 1;
;

{G_DECLARE_FINAL_TYPE (AdapToast, adap_toast, ADAP, TOAST, GObject) }
function adap_toast_new(title:Pchar):PAdapToast;cdecl;external libadapta;
function adap_toast_new_format(format:Pchar; args:array of const):PAdapToast;cdecl;external libadapta;
function adap_toast_new_format(format:Pchar):PAdapToast;cdecl;external libadapta;
function adap_toast_get_title(self:PAdapToast):Pchar;cdecl;external libadapta;
procedure adap_toast_set_title(self:PAdapToast; title:Pchar);cdecl;external libadapta;
function adap_toast_get_button_label(self:PAdapToast):Pchar;cdecl;external libadapta;
procedure adap_toast_set_button_label(self:PAdapToast; button_label:Pchar);cdecl;external libadapta;
function adap_toast_get_action_name(self:PAdapToast):Pchar;cdecl;external libadapta;
procedure adap_toast_set_action_name(self:PAdapToast; action_name:Pchar);cdecl;external libadapta;
function adap_toast_get_action_target_value(self:PAdapToast):PGVariant;cdecl;external libadapta;
procedure adap_toast_set_action_target_value(self:PAdapToast; action_target:PGVariant);cdecl;external libadapta;
procedure adap_toast_set_action_target(self:PAdapToast; format_string:Pchar; args:array of const);cdecl;external libadapta;
procedure adap_toast_set_action_target(self:PAdapToast; format_string:Pchar);cdecl;external libadapta;
procedure adap_toast_set_detailed_action_name(self:PAdapToast; detailed_action_name:Pchar);cdecl;external libadapta;
function adap_toast_get_priority(self:PAdapToast):TAdapToastPriority;cdecl;external libadapta;
procedure adap_toast_set_priority(self:PAdapToast; priority:TAdapToastPriority);cdecl;external libadapta;
function adap_toast_get_timeout(self:PAdapToast):Tguint;cdecl;external libadapta;
procedure adap_toast_set_timeout(self:PAdapToast; timeout:Tguint);cdecl;external libadapta;
function adap_toast_get_custom_title(self:PAdapToast):PGtkWidget;cdecl;external libadapta;
procedure adap_toast_set_custom_title(self:PAdapToast; widget:PGtkWidget);cdecl;external libadapta;
function adap_toast_get_use_markup(self:PAdapToast):Tgboolean;cdecl;external libadapta;
procedure adap_toast_set_use_markup(self:PAdapToast; use_markup:Tgboolean);cdecl;external libadapta;
procedure adap_toast_dismiss(self:PAdapToast);cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:27:44 ===

function ADAP_TYPE_TOAST: TGType;
function ADAP_TOAST(obj: Pointer): PAdapToast;
function ADAP_IS_TOAST(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_TOAST: TGType;
begin
  Result := adap_toast_get_type;
end;

function ADAP_TOAST(obj: Pointer): PAdapToast;
begin
  Result := PAdapToast(g_type_check_instance_cast(obj, ADAP_TYPE_TOAST));
end;

function ADAP_IS_TOAST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_TOAST);
end;

type 
  TAdapToast = record
  end;
  PAdapToast = ^TAdapToast;

  TAdapToastClass = record
    parent_class: TGObjectClass;
  end;
  PAdapToastClass = ^TAdapToastClass;

function adap_toast_get_type: TGType; cdecl; external libgxxxxxxx;



end.
