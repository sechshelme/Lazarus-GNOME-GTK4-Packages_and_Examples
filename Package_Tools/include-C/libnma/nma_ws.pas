unit nma_ws;

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
{$ifndef NMA_WS_H}
{$define NMA_WS_H}
{$include "nma-version.h"}
type

function nma_ws_get_type:TGType;cdecl;external libnma;
function nma_ws_validate(self:PNMAWs; error:PPGError):Tgboolean;cdecl;external libnma;
procedure nma_ws_add_to_size_group(self:PNMAWs; group:PGtkSizeGroup);cdecl;external libnma;
procedure nma_ws_fill_connection(self:PNMAWs; connection:PNMConnection);cdecl;external libnma;
procedure nma_ws_update_secrets(self:PNMAWs; connection:PNMConnection);cdecl;external libnma;
procedure nma_ws_focus_secrets_default(self:PNMAWs);cdecl;external libnma;
function nma_ws_adhoc_compatible(self:PNMAWs):Tgboolean;cdecl;external libnma;
function nma_ws_hotspot_compatible(self:PNMAWs):Tgboolean;cdecl;external libnma;
{$include "nma-ws-802-1x.h"}
{$include "nma-ws-dynamic-wep.h"}
{$include "nma-ws-leap.h"}
{$include "nma-ws-owe.h"}
{$include "nma-ws-sae.h"}
{$include "nma-ws-wep-key.h"}
{$include "nma-ws-wpa-eap.h"}
{$include "nma-ws-wpa-psk.h"}
{$endif}
{ NMA_WS_H  }

// === Konventiert am: 8-8-26 13:24:46 ===

function NMA_TYPE_WS : TGType;
function NMA_WS(obj : Pointer) : PNMAWs;
function NMA_IS_WS(obj : Pointer) : Tgboolean;
function NMA_WS_GET_INTERFACE(obj : Pointer) : PNMAWsInterface;

implementation

function NMA_TYPE_WS : TGType;
  begin
    NMA_TYPE_WS:=nma_ws_get_type;
  end;

function NMA_WS(obj : Pointer) : PNMAWs;
begin
  Result := PNMAWs(g_type_check_instance_cast(obj, NMA_TYPE_WS));
end;

function NMA_IS_WS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_TYPE_WS);
end;

function NMA_WS_GET_INTERFACE(obj : Pointer) : PNMAWsInterface;
begin
  Result := g_type_interface_peek(obj, NMA_TYPE_WS);
end;



end.
