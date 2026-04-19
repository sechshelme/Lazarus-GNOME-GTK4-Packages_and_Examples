
unit nm-simple-connection;
interface

{
  Automatically converted by H2Pas 1.0.0 from nm-simple-connection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nm-simple-connection.h
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
PGError  = ^GError;
PGVariant  = ^GVariant;
PNMConnection  = ^NMConnection;
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

{ was #define dname def_expr }
function NM_TYPE_SIMPLE_CONNECTION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SIMPLE_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SIMPLE_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SIMPLE_CONNECTION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SIMPLE_CONNECTION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SIMPLE_CONNECTION_GET_CLASS(obj : longint) : longint;

type

function nm_simple_connection_get_type:TGType;cdecl;external;
function nm_simple_connection_new:PNMConnection;cdecl;external;
function nm_simple_connection_new_from_dbus(dict:PGVariant; error:PPGError):PNMConnection;cdecl;external;
function nm_simple_connection_new_clone(connection:PNMConnection):PNMConnection;cdecl;external;
{$endif}
{ __NM_SIMPLE_CONNECTION__  }

implementation

{ was #define dname def_expr }
function NM_TYPE_SIMPLE_CONNECTION : longint; { return type might be wrong }
  begin
    NM_TYPE_SIMPLE_CONNECTION:=nm_simple_connection_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SIMPLE_CONNECTION(obj : longint) : longint;
begin
  NM_SIMPLE_CONNECTION:=G_TYPE_CHECK_INSTANCE_CAST(obj,NM_TYPE_SIMPLE_CONNECTION,NMSimpleConnection);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SIMPLE_CONNECTION_CLASS(klass : longint) : longint;
begin
  NM_SIMPLE_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,NM_TYPE_SIMPLE_CONNECTION,NMSimpleConnectionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SIMPLE_CONNECTION(obj : longint) : longint;
begin
  NM_IS_SIMPLE_CONNECTION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,NM_TYPE_SIMPLE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_IS_SIMPLE_CONNECTION_CLASS(klass : longint) : longint;
begin
  NM_IS_SIMPLE_CONNECTION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,NM_TYPE_SIMPLE_CONNECTION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function NM_SIMPLE_CONNECTION_GET_CLASS(obj : longint) : longint;
begin
  NM_SIMPLE_CONNECTION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,NM_TYPE_SIMPLE_CONNECTION,NMSimpleConnectionClass);
end;


end.
