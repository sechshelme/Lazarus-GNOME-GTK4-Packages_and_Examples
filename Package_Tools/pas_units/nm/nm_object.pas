unit nm_object;

interface

uses
  fp_glib2, fp_nm;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: LGPL-2.1-or-later  }
{
 * Copyright (C) 2007 - 2008 Novell, Inc.
 * Copyright (C) 2007 - 2012 Red Hat, Inc.
  }
{$ifndef __NM_OBJECT_H__}
{$define __NM_OBJECT_H__}
{$if !defined(__NETWORKMANAGER_H_INSIDE__) && !defined(NETWORKMANAGER_COMPILATION)}
{$error "Only <NetworkManager.h> can be included directly."}
{$endif}

const
  NM_OBJECT_PATH = 'path';  
  NM_OBJECT_CLIENT = 'client';  
{*
 * NMObject:
  }
type

function nm_object_get_type:TGType;cdecl;external libnm;
function nm_object_get_path(object:PNMObject):Pchar;cdecl;external libnm;
type
  PNMClient = ^TNMClient;
  TNMClient = record
      {undefined structure}
    end;


function nm_object_get_client(object:PNMObject):PNMClient;cdecl;external libnm;
{$endif}
{ __NM_OBJECT_H__  }

// === Konventiert am: 19-4-26 19:28:34 ===

function NM_TYPE_OBJECT : TGType;
function NM_OBJECT(obj : Pointer) : PNMObject;
function NM_OBJECT_CLASS(klass : Pointer) : PNMObjectClass;
function NM_IS_OBJECT(obj : Pointer) : Tgboolean;
function NM_IS_OBJECT_CLASS(klass : Pointer) : Tgboolean;
function NM_OBJECT_GET_CLASS(obj : Pointer) : PNMObjectClass;

implementation

function NM_TYPE_OBJECT : TGType;
  begin
    NM_TYPE_OBJECT:=nm_object_get_type;
  end;

function NM_OBJECT(obj : Pointer) : PNMObject;
begin
  Result := PNMObject(g_type_check_instance_cast(obj, NM_TYPE_OBJECT));
end;

function NM_OBJECT_CLASS(klass : Pointer) : PNMObjectClass;
begin
  Result := PNMObjectClass(g_type_check_class_cast(klass, NM_TYPE_OBJECT));
end;

function NM_IS_OBJECT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  NM_TYPE_OBJECT);
end;

function NM_IS_OBJECT_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  NM_TYPE_OBJECT);
end;

function NM_OBJECT_GET_CLASS(obj : Pointer) : PNMObjectClass;
begin
  Result := PNMObjectClass(PGTypeInstance(obj)^.g_class);
end;



end.
