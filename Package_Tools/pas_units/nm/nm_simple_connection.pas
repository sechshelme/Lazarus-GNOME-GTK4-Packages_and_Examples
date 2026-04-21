unit nm_simple_connection;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2014 Red Hat, Inc.
  }
{$ifndef __NM_SIMPLE_CONNECTION_H__}
{$define __NM_SIMPLE_CONNECTION_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}
{$include "nm-connection.h"}

type

function nm_simple_connection_get_type:TGType;cdecl;external libnm;
function nm_simple_connection_new:PNMConnection;cdecl;external libnm;
function nm_simple_connection_new_from_dbus(dict:PGVariant; error:PPGError):PNMConnection;cdecl;external libnm;
function nm_simple_connection_new_clone(connection:PNMConnection):PNMConnection;cdecl;external libnm;
{$endif}
{ __NM_SIMPLE_CONNECTION__  }

// === Konventiert am: 19-4-26 19:20:42 ===

function NM_TYPE_SIMPLE_CONNECTION : TGType;
function NM_SIMPLE_CONNECTION(obj : Pointer) : PNMSimpleConnection;
function NM_SIMPLE_CONNECTION_CLASS(klass : Pointer) : PNMSimpleConnectionClass;
function NM_IS_SIMPLE_CONNECTION(obj : Pointer) : Tgboolean;
function NM_IS_SIMPLE_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
function NM_SIMPLE_CONNECTION_GET_CLASS(obj : Pointer) : PNMSimpleConnectionClass;

implementation

function NM_TYPE_SIMPLE_CONNECTION : TGType;
  begin
    NM_TYPE_SIMPLE_CONNECTION:=nm_simple_connection_get_type;
  end;

function NM_SIMPLE_CONNECTION(obj : Pointer) : PNMSimpleConnection;
begin
  Result := PNMSimpleConnection(g_type_check_instance_cast(obj, NM_TYPE_SIMPLE_CONNECTION));
end;

function NM_SIMPLE_CONNECTION_CLASS(klass : Pointer) : PNMSimpleConnectionClass;
begin
  Result := PNMSimpleConnectionClass(g_type_check_class_cast(klass, NM_TYPE_SIMPLE_CONNECTION));
end;

function NM_IS_SIMPLE_CONNECTION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_SIMPLE_CONNECTION);
end;

function NM_IS_SIMPLE_CONNECTION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_SIMPLE_CONNECTION);
end;

function NM_SIMPLE_CONNECTION_GET_CLASS(obj : Pointer) : PNMSimpleConnectionClass;
begin
  Result := PNMSimpleConnectionClass(PGTypeInstance(obj)^.g_class);
end;



end.
