unit nma_ws_dynamic_wep;

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
{$ifndef NMA_WS_DYNAMIC_WEP_H}
{$define NMA_WS_DYNAMIC_WEP_H}
{$include "nma-version.h"}
type

function nma_ws_dynamic_wep_get_type:TGType;cdecl;external libnma;
function nma_ws_dynamic_wep_new(connection:PNMConnection; is_editor:Tgboolean; secrets_only:Tgboolean):PNMAWsDynamicWep;cdecl;external libnma;
{$endif}
{ NMA_WS_DYNAMIC_WEP_H  }

// === Konventiert am: 8-8-26 13:24:33 ===

function NMA_TYPE_WS_DYNAMIC_WEP : TGType;
function NMA_WS_DYNAMIC_WEP(obj : Pointer) : PNMAWsDynamicWep;
function NMA_WS_DYNAMIC_WEP_CLASS(klass : Pointer) : PNMAWsDynamicWepClass;
function NMA_IS_WS_DYNAMIC_WEP(obj : Pointer) : Tgboolean;
function NMA_IS_WS_DYNAMIC_WEP_CLASS(klass : Pointer) : Tgboolean;
function NMA_WS_DYNAMIC_WEP_GET_CLASS(obj : Pointer) : PNMAWsDynamicWepClass;

implementation

function NMA_TYPE_WS_DYNAMIC_WEP : TGType;
  begin
    NMA_TYPE_WS_DYNAMIC_WEP:=nma_ws_dynamic_wep_get_type;
  end;

function NMA_WS_DYNAMIC_WEP(obj : Pointer) : PNMAWsDynamicWep;
begin
  Result := PNMAWsDynamicWep(g_type_check_instance_cast(obj, NMA_TYPE_WS_DYNAMIC_WEP));
end;

function NMA_WS_DYNAMIC_WEP_CLASS(klass : Pointer) : PNMAWsDynamicWepClass;
begin
  Result := PNMAWsDynamicWepClass(g_type_check_class_cast(klass, NMA_TYPE_WS_DYNAMIC_WEP));
end;

function NMA_IS_WS_DYNAMIC_WEP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_TYPE_WS_DYNAMIC_WEP);
end;

function NMA_IS_WS_DYNAMIC_WEP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NMA_TYPE_WS_DYNAMIC_WEP);
end;

function NMA_WS_DYNAMIC_WEP_GET_CLASS(obj : Pointer) : PNMAWsDynamicWepClass;
begin
  Result := PNMAWsDynamicWepClass(PGTypeInstance(obj)^.g_class);
end;



end.
