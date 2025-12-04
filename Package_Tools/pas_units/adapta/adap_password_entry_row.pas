unit adap_password_entry_row;

interface

uses
  fp_adapta;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 Maximiliano Sandoval <msandova@protonmail.com>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
  }
(** unsupported pragma#pragma once*)
{$if !defined(_ADAPTA_INSIDE) && !defined(ADAPTA_COMPILATION)}
{$error "Only <adapta.h> can be included directly."}
{$endif}
{$include "adap-version.h"}
{$include <gtk/gtk.h>}
{$include "adap-entry-row.h"}

{G_DECLARE_FINAL_TYPE (AdapPasswordEntryRow, adap_password_entry_row, ADAP, PASSWORD_ENTRY_ROW, AdapEntryRow) }
function adap_password_entry_row_new:PGtkWidget;cdecl;external libadapta;

// === Konventiert am: 4-12-25 17:18:22 ===

function ADAP_TYPE_PASSWORD_ENTRY_ROW: TGType;
function ADAP_PASSWORD_ENTRY_ROW(obj: Pointer): PAdapPasswordEntryRow;
function ADAP_IS_PASSWORD_ENTRY_ROW(obj: Pointer): Tgboolean;

implementation

function ADAP_TYPE_PASSWORD_ENTRY_ROW: TGType;
begin
  Result := adap_password_entry_row_get_type;
end;

function ADAP_PASSWORD_ENTRY_ROW(obj: Pointer): PAdapPasswordEntryRow;
begin
  Result := PAdapPasswordEntryRow(g_type_check_instance_cast(obj, ADAP_TYPE_PASSWORD_ENTRY_ROW));
end;

function ADAP_IS_PASSWORD_ENTRY_ROW(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_PASSWORD_ENTRY_ROW);
end;

type 
  TAdapPasswordEntryRow = record
  end;
  PAdapPasswordEntryRow = ^TAdapPasswordEntryRow;

  TAdapPasswordEntryRowClass = record
    parent_class: TAdapEntryRowClass;
  end;
  PAdapPasswordEntryRowClass = ^TAdapPasswordEntryRowClass;

function adap_password_entry_row_get_type: TGType; cdecl; external libgxxxxxxx;



end.
