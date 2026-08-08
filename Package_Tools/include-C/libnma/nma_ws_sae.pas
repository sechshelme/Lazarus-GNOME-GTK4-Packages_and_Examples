unit nma_ws_sae;

interface

uses
  fp_glib2, fp_nma;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: GPL-2.0+ }
{
 * Copyright 2007 - 2019 Red Hat, Inc.
  }
{$ifndef NMA_WS_SAE_H}
{$define NMA_WS_SAE_H}
{$include "nma-version.h"}
type

function nma_ws_sae_get_type:TGType;cdecl;external libnma;
function nma_ws_sae_new(connection:PNMConnection; secrets_only:Tgboolean):PNMAWsSae;cdecl;external libnma;
{$endif}
{ NMA_WS_SAE_H  }

// === Konventiert am: 8-8-26 13:24:21 ===

function NMA_TYPE_WS_SAE : TGType;
function NMA_WS_SAE(obj : Pointer) : PNMAWsSae;
function NMA_WS_SAE_CLASS(klass : Pointer) : PNMAWsSaeClass;
function NMA_IS_WS_SAE(obj : Pointer) : Tgboolean;
function NMA_IS_WS_SAE_CLASS(klass : Pointer) : Tgboolean;
function NMA_WS_SAE_GET_CLASS(obj : Pointer) : PNMAWsSaeClass;

implementation

function NMA_TYPE_WS_SAE : TGType;
  begin
    NMA_TYPE_WS_SAE:=nma_ws_sae_get_type;
  end;

function NMA_WS_SAE(obj : Pointer) : PNMAWsSae;
begin
  Result := PNMAWsSae(g_type_check_instance_cast(obj, NMA_TYPE_WS_SAE));
end;

function NMA_WS_SAE_CLASS(klass : Pointer) : PNMAWsSaeClass;
begin
  Result := PNMAWsSaeClass(g_type_check_class_cast(klass, NMA_TYPE_WS_SAE));
end;

function NMA_IS_WS_SAE(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_TYPE_WS_SAE);
end;

function NMA_IS_WS_SAE_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NMA_TYPE_WS_SAE);
end;

function NMA_WS_SAE_GET_CLASS(obj : Pointer) : PNMAWsSaeClass;
begin
  Result := PNMAWsSaeClass(PGTypeInstance(obj)^.g_class);
end;



end.
