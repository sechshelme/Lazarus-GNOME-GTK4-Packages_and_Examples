unit nma_ws_wpa_eap;

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
{$ifndef NMA_WS_WPA_EAP_H}
{$define NMA_WS_WPA_EAP_H}
{$include "nma-version.h"}
type

function nma_ws_wpa_eap_get_type:TGType;cdecl;external libnma;
function nma_ws_wpa_eap_new(connection:PNMConnection; is_editor:Tgboolean; secrets_only:Tgboolean; secrets_hints:PPchar):PNMAWsWpaEap;cdecl;external libnma;
{$endif}
{ NMA_WS_WPA_EAP_H  }

// === Konventiert am: 8-8-26 13:23:57 ===

function NMA_TYPE_WS_WPA_EAP : TGType;
function NMA_WS_WPA_EAP(obj : Pointer) : PNMAWsWpaEap;
function NMA_WS_WPA_EAP_CLASS(klass : Pointer) : PNMAWsWpaEapClass;
function NMA_IS_WS_WPA_EAP(obj : Pointer) : Tgboolean;
function NMA_IS_WS_WPA_EAP_CLASS(klass : Pointer) : Tgboolean;
function NMA_WS_WPA_EAP_GET_CLASS(obj : Pointer) : PNMAWsWpaEapClass;

implementation

function NMA_TYPE_WS_WPA_EAP : TGType;
  begin
    NMA_TYPE_WS_WPA_EAP:=nma_ws_wpa_eap_get_type;
  end;

function NMA_WS_WPA_EAP(obj : Pointer) : PNMAWsWpaEap;
begin
  Result := PNMAWsWpaEap(g_type_check_instance_cast(obj, NMA_TYPE_WS_WPA_EAP));
end;

function NMA_WS_WPA_EAP_CLASS(klass : Pointer) : PNMAWsWpaEapClass;
begin
  Result := PNMAWsWpaEapClass(g_type_check_class_cast(klass, NMA_TYPE_WS_WPA_EAP));
end;

function NMA_IS_WS_WPA_EAP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_TYPE_WS_WPA_EAP);
end;

function NMA_IS_WS_WPA_EAP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NMA_TYPE_WS_WPA_EAP);
end;

function NMA_WS_WPA_EAP_GET_CLASS(obj : Pointer) : PNMAWsWpaEapClass;
begin
  Result := PNMAWsWpaEapClass(PGTypeInstance(obj)^.g_class);
end;



end.
