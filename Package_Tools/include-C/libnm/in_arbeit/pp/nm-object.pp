
unit nm-object;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-object.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-object.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PNMClient  = ^NMClient;
PNMObject  = ^NMObject;
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

{ was #define dname def_expr }
function NM_TYPE_OBJECT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_OBJECT_GET_CLASS(obj : longint) : longint;

const
  NM_OBJECT_PATH = 'path';  
  NM_OBJECT_CLIENT = 'client';  
{*
 * NMObject:
  }
type

function nm_object_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function nm_object_get_path(object:PNMObject):Pchar;cdecl;external;
type
  PNMClient = ^TNMClient;
  TNMClient = record
      {undefined structure}
    end;


function nm_object_get_client(object:PNMObject):PNMClient;cdecl;external;
{$endif}
{ __NM_OBJECT_H__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_OBJECT : longint; { return type might be wrong }
  begin
    NM_TYPE_OBJECT:=nm_object_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_OBJECT(obj : longint) : longint;
begin
  NM_OBJECT:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_OBJECT,NMObject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_OBJECT_CLASS(klass : longint) : longint;
begin
  NM_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_OBJECT,NMObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_OBJECT(obj : longint) : longint;
begin
  NM_IS_OBJECT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_OBJECT_CLASS(klass : longint) : longint;
begin
  NM_IS_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_OBJECT_GET_CLASS(obj : longint) : longint;
begin
  NM_OBJECT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_OBJECT,NMObjectClass);
end;


end.
