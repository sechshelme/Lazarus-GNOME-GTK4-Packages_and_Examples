unit nma_ws_wpa_psk;

interface

uses
  fp_glib2, fp_nma;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: GPL-2.0+ }
{
 * Dan Williams <dcbw@redhat.com>
 *
 * Copyright 2007 - 2019 Red Hat, Inc.
  }
{$ifndef NMA_WS_WPA_PSK_H}
{$define NMA_WS_WPA_PSK_H}
{$include "nma-version.h"}
type

function nma_ws_wpa_psk_get_type:TGType;cdecl;external libnma;
function nma_ws_wpa_psk_new(connection:PNMConnection; secrets_only:Tgboolean):PNMAWsWpaPsk;cdecl;external libnma;
{$endif}
{ NMA_WS_WPA_PSK_H  }

// === Konventiert am: 8-8-26 13:23:52 ===

function NMA_TYPE_WS_WPA_PSK : TGType;
function NMA_WS_WPA_PSK(obj : Pointer) : PNMAWsWpaPsk;
function NMA_WS_WPA_PSK_CLASS(klass : Pointer) : PNMAWsWpaPskClass;
function NMA_IS_WS_WPA_PSK(obj : Pointer) : Tgboolean;
function NMA_IS_WS_WPA_PSK_CLASS(klass : Pointer) : Tgboolean;
function NMA_WS_WPA_PSK_GET_CLASS(obj : Pointer) : PNMAWsWpaPskClass;

implementation

function NMA_TYPE_WS_WPA_PSK : TGType;
  begin
    NMA_TYPE_WS_WPA_PSK:=nma_ws_wpa_psk_get_type;
  end;

function NMA_WS_WPA_PSK(obj : Pointer) : PNMAWsWpaPsk;
begin
  Result := PNMAWsWpaPsk(g_type_check_instance_cast(obj, NMA_TYPE_WS_WPA_PSK));
end;

function NMA_WS_WPA_PSK_CLASS(klass : Pointer) : PNMAWsWpaPskClass;
begin
  Result := PNMAWsWpaPskClass(g_type_check_class_cast(klass, NMA_TYPE_WS_WPA_PSK));
end;

function NMA_IS_WS_WPA_PSK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_TYPE_WS_WPA_PSK);
end;

function NMA_IS_WS_WPA_PSK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NMA_TYPE_WS_WPA_PSK);
end;

function NMA_WS_WPA_PSK_GET_CLASS(obj : Pointer) : PNMAWsWpaPskClass;
begin
  Result := PNMAWsWpaPskClass(PGTypeInstance(obj)^.g_class);
end;



end.
