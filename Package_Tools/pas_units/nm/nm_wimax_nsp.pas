unit nm_wimax_nsp;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2011 Red Hat, Inc.
 * Copyright (C) 2009 Novell, Inc.
  }
{$ifndef __NM_WIMAX_NSP_H__}
{$define __NM_WIMAX_NSP_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-object.h"}

const
  NM_WIMAX_NSP_NAME = 'name';  
  NM_WIMAX_NSP_SIGNAL_QUALITY = 'signal-quality';  
  NM_WIMAX_NSP_NETWORK_TYPE = 'network-type';  
{*
 * NMWimaxNsp:
 *
 * Deprecated: 1.22: WiMAX is no longer supported by NetworkManager since 1.2.0.
  }
type

function nm_wimax_nsp_get_type:TGType;cdecl;external libnm;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
function nm_wimax_nsp_get_name(nsp:PNMWimaxNsp):Pchar;cdecl;external libnm;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
function nm_wimax_nsp_get_signal_quality(nsp:PNMWimaxNsp):Tguint32;cdecl;external libnm;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
function nm_wimax_nsp_get_network_type(nsp:PNMWimaxNsp):TNMWimaxNspNetworkType;cdecl;external libnm;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
function nm_wimax_nsp_filter_connections(nsp:PNMWimaxNsp; connections:PGPtrArray):PGPtrArray;cdecl;external libnm;
{xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxxxxxxx //xxxx NM_DEPRECATED_IN__1_22 }
function nm_wimax_nsp_connection_valid(nsp:PNMWimaxNsp; connection:PNMConnection):Tgboolean;cdecl;external libnm;
{$endif}
{ __NM_WIMAX_NSP_H__  }

// === Konventiert am: 19-4-26 19:18:26 ===

function NM_TYPE_WIMAX_NSP : TGType;
function NM_WIMAX_NSP(obj : Pointer) : PNMWimaxNsp;
function NM_WIMAX_NSP_CLASS(klass : Pointer) : PNMWimaxNspClass;
function NM_IS_WIMAX_NSP(obj : Pointer) : Tgboolean;
function NM_IS_WIMAX_NSP_CLASS(klass : Pointer) : Tgboolean;
function NM_WIMAX_NSP_GET_CLASS(obj : Pointer) : PNMWimaxNspClass;

implementation

function NM_TYPE_WIMAX_NSP : TGType;
  begin
    NM_TYPE_WIMAX_NSP:=nm_wimax_nsp_get_type;
  end;

function NM_WIMAX_NSP(obj : Pointer) : PNMWimaxNsp;
begin
  Result := PNMWimaxNsp(g_type_check_instance_cast(obj, NM_TYPE_WIMAX_NSP));
end;

function NM_WIMAX_NSP_CLASS(klass : Pointer) : PNMWimaxNspClass;
begin
  Result := PNMWimaxNspClass(g_type_check_class_cast(klass, NM_TYPE_WIMAX_NSP));
end;

function NM_IS_WIMAX_NSP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_WIMAX_NSP);
end;

function NM_IS_WIMAX_NSP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_WIMAX_NSP);
end;

function NM_WIMAX_NSP_GET_CLASS(obj : Pointer) : PNMWimaxNspClass;
begin
  Result := PNMWimaxNspClass(PGTypeInstance(obj)^.g_class);
end;



end.
