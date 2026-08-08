unit nma_ws_leap;

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
{$ifndef NMA_WS_LEAP_H}
{$define NMA_WS_LEAP_H}
{$include "nma-version.h"}
type

function nma_ws_leap_get_type:TGType;cdecl;external libnma;
function nma_ws_leap_new(connection:PNMConnection; secrets_only:Tgboolean):PNMAWsLeap;cdecl;external libnma;
{$endif}
{ NMA_WS_LEAP_H  }

// === Konventiert am: 8-8-26 13:24:29 ===

function NMA_TYPE_WS_LEAP : TGType;
function NMA_WS_LEAP(obj : Pointer) : PNMAWsLeap;
function NMA_WS_LEAP_CLASS(klass : Pointer) : PNMAWsLeapClass;
function NMA_IS_WS_LEAP(obj : Pointer) : Tgboolean;
function NMA_IS_WS_LEAP_CLASS(klass : Pointer) : Tgboolean;
function NMA_WS_LEAP_GET_CLASS(obj : Pointer) : PNMAWsLeapClass;

implementation

function NMA_TYPE_WS_LEAP : TGType;
  begin
    NMA_TYPE_WS_LEAP:=nma_ws_leap_get_type;
  end;

function NMA_WS_LEAP(obj : Pointer) : PNMAWsLeap;
begin
  Result := PNMAWsLeap(g_type_check_instance_cast(obj, NMA_TYPE_WS_LEAP));
end;

function NMA_WS_LEAP_CLASS(klass : Pointer) : PNMAWsLeapClass;
begin
  Result := PNMAWsLeapClass(g_type_check_class_cast(klass, NMA_TYPE_WS_LEAP));
end;

function NMA_IS_WS_LEAP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NMA_TYPE_WS_LEAP);
end;

function NMA_IS_WS_LEAP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NMA_TYPE_WS_LEAP);
end;

function NMA_WS_LEAP_GET_CLASS(obj : Pointer) : PNMAWsLeapClass;
begin
  Result := PNMAWsLeapClass(PGTypeInstance(obj)^.g_class);
end;



end.
