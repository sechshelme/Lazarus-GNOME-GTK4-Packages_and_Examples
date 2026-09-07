
unit pk_client_helper;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_client_helper.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_client_helper.h
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
Pgchar  = ^gchar;
PGError  = ^GError;
PGSocket  = ^GSocket;
PPkClientHelper  = ^PkClientHelper;
PPkClientHelperClass  = ^PkClientHelperClass;
PPkClientHelperPrivate  = ^PkClientHelperPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2010 Richard Hughes <richard@hughsie.com>
 *
 * Licensed under the GNU Lesser General Public License Version 2.1
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301 USA
  }
{$if !defined (__PACKAGEKIT_H_INSIDE__) && !defined (PK_COMPILATION)}
{$error "Only <packagekit.h> can be included directly."}
{$endif}
{$ifndef __PK_CLIENT_HELPER_H}
{$define __PK_CLIENT_HELPER_H}
{$include <glib-object.h>}
{$include <packagekit-glib2/pk-source.h>}
{$include <packagekit-glib2/pk-enum.h>}

{ was #define dname def_expr }
function PK_TYPE_CLIENT_HELPER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_HELPER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_HELPER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_CLIENT_HELPER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_CLIENT_HELPER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_HELPER_GET_CLASS(o : longint) : longint;

type
  PPkClientHelper = ^TPkClientHelper;
  TPkClientHelper = record
      parent : TGObject;
      priv : PPkClientHelperPrivate;
    end;

{ padding for future expansion  }
  PPkClientHelperClass = ^TPkClientHelperClass;
  TPkClientHelperClass = record
      parent_class : TGObjectClass;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_client_helper_get_type:TGType;cdecl;external;
function pk_client_helper_new:PPkClientHelper;cdecl;external;
function pk_client_helper_stop(client_helper:PPkClientHelper; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pk_client_helper_start(client_helper:PPkClientHelper; socket_filename:Pgchar; argv:PPgchar; envp:PPgchar; error:PPGError):Tgboolean;cdecl;external;
function pk_client_helper_start_with_socket(client_helper:PPkClientHelper; socket:PGSocket; argv:PPgchar; envp:PPgchar; error:PPGError):Tgboolean;cdecl;external;
function pk_client_helper_is_active(client_helper:PPkClientHelper):Tgboolean;cdecl;external;
{$endif}
{ __PK_CLIENT_HELPER_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_CLIENT_HELPER : longint; { return type might be wrong }
  begin
    PK_TYPE_CLIENT_HELPER:=pk_client_helper_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_HELPER(o : longint) : longint;
begin
  PK_CLIENT_HELPER:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_CLIENT_HELPER,PkClientHelper);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_HELPER_CLASS(k : longint) : longint;
begin
  PK_CLIENT_HELPER_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_CLIENT_HELPER,PkClientHelperClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_CLIENT_HELPER(o : longint) : longint;
begin
  PK_IS_CLIENT_HELPER:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_CLIENT_HELPER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_CLIENT_HELPER_CLASS(k : longint) : longint;
begin
  PK_IS_CLIENT_HELPER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_CLIENT_HELPER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_HELPER_GET_CLASS(o : longint) : longint;
begin
  PK_CLIENT_HELPER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_CLIENT_HELPER,PkClientHelperClass);
end;


end.
