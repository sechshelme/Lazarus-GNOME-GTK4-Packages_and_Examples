
unit gtlspassword;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtlspassword.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtlspassword.h
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
Pgsize  = ^gsize;
PGTlsPassword  = ^GTlsPassword;
PGTlsPasswordClass  = ^GTlsPasswordClass;
PGTlsPasswordPrivate  = ^GTlsPasswordPrivate;
Pguchar  = ^guchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2011 Collabora, Ltd.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * Author: Stef Walter <stefw@collabora.co.uk>
  }
{$ifndef __G_TLS_PASSWORD_H__}
{$define __G_TLS_PASSWORD_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_TLS_PASSWORD : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_PASSWORD(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_PASSWORD_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_PASSWORD(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_PASSWORD_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_PASSWORD_GET_CLASS(o : longint) : longint;

type
  PGTlsPassword = ^TGTlsPassword;
  TGTlsPassword = record
      parent_instance : TGObject;
      priv : PGTlsPasswordPrivate;
    end;

{*
 * GTlsPasswordClass:
 * @get_value: virtual method for g_tls_password_get_value()
 * @set_value: virtual method for g_tls_password_set_value()
 * @get_default_warning: virtual method for g_tls_password_get_warning() if no
 *  value has been set using g_tls_password_set_warning()
 *
 * Class structure for #GTlsPassword.
  }
{ methods  }
(* Const before type ignored *)
(* Const before type ignored *)
{< private > }
{ Padding for future expansion  }
  PGTlsPasswordClass = ^TGTlsPasswordClass;
  TGTlsPasswordClass = record
      parent_class : TGObjectClass;
      get_value : function (password:PGTlsPassword; length:Pgsize):Pguchar;cdecl;
      set_value : procedure (password:PGTlsPassword; value:Pguchar; length:Tgssize; destroy:TGDestroyNotify);cdecl;
      get_default_warning : function (password:PGTlsPassword):Pgchar;cdecl;
      padding : array[0..3] of Tgpointer;
    end;


function g_tls_password_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function g_tls_password_new(flags:TGTlsPasswordFlags; description:Pgchar):PGTlsPassword;cdecl;external;
(* Const before type ignored *)
function g_tls_password_get_value(password:PGTlsPassword; length:Pgsize):Pguchar;cdecl;external;
(* Const before type ignored *)
procedure g_tls_password_set_value(password:PGTlsPassword; value:Pguchar; length:Tgssize);cdecl;external;
procedure g_tls_password_set_value_full(password:PGTlsPassword; value:Pguchar; length:Tgssize; destroy:TGDestroyNotify);cdecl;external;
function g_tls_password_get_flags(password:PGTlsPassword):TGTlsPasswordFlags;cdecl;external;
procedure g_tls_password_set_flags(password:PGTlsPassword; flags:TGTlsPasswordFlags);cdecl;external;
(* Const before type ignored *)
function g_tls_password_get_description(password:PGTlsPassword):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_tls_password_set_description(password:PGTlsPassword; description:Pgchar);cdecl;external;
(* Const before type ignored *)
function g_tls_password_get_warning(password:PGTlsPassword):Pgchar;cdecl;external;
(* Const before type ignored *)
procedure g_tls_password_set_warning(password:PGTlsPassword; warning:Pgchar);cdecl;external;
{$endif}
{ __G_TLS_PASSWORD_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_TLS_PASSWORD : longint; { return type might be wrong }
  begin
    G_TYPE_TLS_PASSWORD:=g_tls_password_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_PASSWORD(o : longint) : longint;
begin
  G_TLS_PASSWORD:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_TLS_PASSWORD,GTlsPassword);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_PASSWORD_CLASS(k : longint) : longint;
begin
  G_TLS_PASSWORD_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_TLS_PASSWORD,GTlsPasswordClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_PASSWORD(o : longint) : longint;
begin
  G_IS_TLS_PASSWORD:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_TLS_PASSWORD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_TLS_PASSWORD_CLASS(k : longint) : longint;
begin
  G_IS_TLS_PASSWORD_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_TLS_PASSWORD);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TLS_PASSWORD_GET_CLASS(o : longint) : longint;
begin
  G_TLS_PASSWORD_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_TLS_PASSWORD,GTlsPasswordClass);
end;


end.
