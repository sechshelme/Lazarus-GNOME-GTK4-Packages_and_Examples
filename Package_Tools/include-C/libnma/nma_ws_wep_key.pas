unit nma_ws_wep_key;

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
{$ifndef NMA_WS_WEP_KEY_H}
{$define NMA_WS_WEP_KEY_H}
{$include "nma-version.h"}
type

function nma_ws_wep_key_get_type:TGType;cdecl;external libnma;
function nma_ws_wep_key_new(connection:PNMConnection; _type:TNMWepKeyType; adhoc_create:Tgboolean; secrets_only:Tgboolean):PNMAWsWepKey;cdecl;external libnma;
{$endif}
{ NMA_WS_WEP_KEY_H  }

// === Konventiert am: 8-8-26 13:24:17 ===

function NMA_TYPE_WS_WEP_KEY : TGType;
function NMA_WS_WEP_KEY(obj : Pointer) : PNMAWsWepKey;
function NMA_WS_WEP_KEY_CLASS(klass : Pointer) : PNMAWsWepKeyClass;
function NMA_IS_WS_WEP_KEY(obj : Pointer) : Tgboolean;
function NMA_IS_WS_WEP_KEY_CLASS(klass : Pointer) : Tgboolean;
function NMA_WS_WEP_KEY_GET_CLASS(obj : Pointer) : PNMAWsWepKeyClass;

implementation

function NMA_TYPE_WS_WEP_KEY : TGType;
  begin
    NMA_TYPE_WS_WEP_KEY:=nma_ws_wep_key_get_type;
  end;

function NMA_WS_WEP_KEY(obj : Pointer) : PNMAWsWepKey;
begin
  Result := PNMAWsWepKey(g_type_check_instance_cast(obj, NMA_TYPE_WS_WEP_KEY));
end;

function NMA_WS_WEP_KEY_CLASS(klass : Pointer) : PNMAWsWepKeyClass;
begin
  Result := PNMAWsWepKeyClass(g_type_check_class_cast(klass, NMA_TYPE_WS_WEP_KEY));
end;

function NMA_IS_WS_WEP_KEY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_TYPE_WS_WEP_KEY);
end;

function NMA_IS_WS_WEP_KEY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NMA_TYPE_WS_WEP_KEY);
end;

function NMA_WS_WEP_KEY_GET_CLASS(obj : Pointer) : PNMAWsWepKeyClass;
begin
  Result := PNMAWsWepKeyClass(PGTypeInstance(obj)^.g_class);
end;



end.
