unit gtlspassword;

interface

uses
  fp_glib2;

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


function g_tls_password_get_type:TGType;cdecl;external libgio2;
function g_tls_password_new(flags:TGTlsPasswordFlags; description:Pgchar):PGTlsPassword;cdecl;external libgio2;
function g_tls_password_get_value(password:PGTlsPassword; length:Pgsize):Pguchar;cdecl;external libgio2;
procedure g_tls_password_set_value(password:PGTlsPassword; value:Pguchar; length:Tgssize);cdecl;external libgio2;
procedure g_tls_password_set_value_full(password:PGTlsPassword; value:Pguchar; length:Tgssize; destroy:TGDestroyNotify);cdecl;external libgio2;
function g_tls_password_get_flags(password:PGTlsPassword):TGTlsPasswordFlags;cdecl;external libgio2;
procedure g_tls_password_set_flags(password:PGTlsPassword; flags:TGTlsPasswordFlags);cdecl;external libgio2;
function g_tls_password_get_description(password:PGTlsPassword):Pgchar;cdecl;external libgio2;
procedure g_tls_password_set_description(password:PGTlsPassword; description:Pgchar);cdecl;external libgio2;
function g_tls_password_get_warning(password:PGTlsPassword):Pgchar;cdecl;external libgio2;
procedure g_tls_password_set_warning(password:PGTlsPassword; warning:Pgchar);cdecl;external libgio2;
{$endif}
{ __G_TLS_PASSWORD_H__  }

// === Konventiert am: 26-6-26 20:03:45 ===

function G_TYPE_TLS_PASSWORD : TGType;
function G_TLS_PASSWORD(obj : Pointer) : PGTlsPassword;
function G_TLS_PASSWORD_CLASS(klass : Pointer) : PGTlsPasswordClass;
function G_IS_TLS_PASSWORD(obj : Pointer) : Tgboolean;
function G_IS_TLS_PASSWORD_CLASS(klass : Pointer) : Tgboolean;
function G_TLS_PASSWORD_GET_CLASS(obj : Pointer) : PGTlsPasswordClass;

implementation

function G_TYPE_TLS_PASSWORD : TGType;
  begin
    G_TYPE_TLS_PASSWORD:=g_tls_password_get_type;
  end;

function G_TLS_PASSWORD(obj : Pointer) : PGTlsPassword;
begin
  Result := PGTlsPassword(g_type_check_instance_cast(obj, G_TYPE_TLS_PASSWORD));
end;

function G_TLS_PASSWORD_CLASS(klass : Pointer) : PGTlsPasswordClass;
begin
  Result := PGTlsPasswordClass(g_type_check_class_cast(klass, G_TYPE_TLS_PASSWORD));
end;

function G_IS_TLS_PASSWORD(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  G_TYPE_TLS_PASSWORD);
end;

function G_IS_TLS_PASSWORD_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  G_TYPE_TLS_PASSWORD);
end;

function G_TLS_PASSWORD_GET_CLASS(obj : Pointer) : PGTlsPasswordClass;
begin
  Result := PGTlsPasswordClass(PGTypeInstance(obj)^.g_class);
end;



end.
