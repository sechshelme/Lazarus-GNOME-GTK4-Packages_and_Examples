
unit gresolver;
interface

{
  Automatically converted by H2Pas 1.0.0 from gresolver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gresolver.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGError  = ^GError;
PGInetAddress  = ^GInetAddress;
PGList  = ^GList;
PGResolver  = ^GResolver;
PGResolverClass  = ^GResolverClass;
PGResolverNameLookupFlags  = ^GResolverNameLookupFlags;
PGResolverPrivate  = ^GResolverPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GIO - GLib Input, Output and Streaming Library
 *
 * Copyright (C) 2008 Red Hat, Inc.
 * Copyright (C) 2018 Igalia S.L.
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
  }
{$ifndef __G_RESOLVER_H__}
{$define __G_RESOLVER_H__}
{$if !defined (__GIO_GIO_H_INSIDE__) && !defined (GIO_COMPILATION)}
{$error "Only <gio/gio.h> can be included directly."}
{$endif}
{$include <gio/giotypes.h>}

{ was #define dname def_expr }
function G_TYPE_RESOLVER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_RESOLVER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_RESOLVER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_RESOLVER(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_RESOLVER_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_RESOLVER_GET_CLASS(o : longint) : longint;

type
  PGResolver = ^TGResolver;
  TGResolver = record
      parent_instance : TGObject;
      priv : PGResolverPrivate;
    end;

{*
 * GResolverNameLookupFlags:
 * @G_RESOLVER_NAME_LOOKUP_FLAGS_DEFAULT: default behavior (same as g_resolver_lookup_by_name())
 * @G_RESOLVER_NAME_LOOKUP_FLAGS_IPV4_ONLY: only resolve ipv4 addresses
 * @G_RESOLVER_NAME_LOOKUP_FLAGS_IPV6_ONLY: only resolve ipv6 addresses
 *
 * Flags to modify lookup behavior.
 *
 * Since: 2.60
  }

  PGResolverNameLookupFlags = ^TGResolverNameLookupFlags;
  TGResolverNameLookupFlags =  Longint;
  Const
    G_RESOLVER_NAME_LOOKUP_FLAGS_DEFAULT = 0;
    G_RESOLVER_NAME_LOOKUP_FLAGS_IPV4_ONLY = 1 shl 0;
    G_RESOLVER_NAME_LOOKUP_FLAGS_IPV6_ONLY = 1 shl 1;
;
{ Signals  }
{ Virtual methods  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{*
   * GResolverClass::lookup_by_name_with_flags_async:
   * @resolver: a #GResolver
   * @hostname: the hostname to resolve
   * @flags: extra #GResolverNameLookupFlags to modify the lookup
   * @cancellable: (nullable): a #GCancellable
   * @callback: (scope async): a #GAsyncReadyCallback to call when completed
   * @user_data: data to pass to @callback
   *
   * Asynchronous version of GResolverClass::lookup_by_name_with_flags
   *
   * GResolverClass::lookup_by_name_with_flags_finish will be called to get
   * the result.
   *
   * Since: 2.60
    }
(* Const before type ignored *)
{*
   * GResolverClass::lookup_by_name_with_flags_finish:
   * @resolver: a #GResolver
   * @result: a #GAsyncResult
   * @error: (nullable): a pointer to a %NULL #GError
   *
   * Gets the result from GResolverClass::lookup_by_name_with_flags_async
   *
   * Returns: (element-type GInetAddress) (transfer full): List of #GInetAddress.
   * Since: 2.60
    }
{*
   * GResolverClass::lookup_by_name_with_flags:
   * @resolver: a #GResolver
   * @hostname: the hostname to resolve
   * @flags: extra #GResolverNameLookupFlags to modify the lookup
   * @cancellable: (nullable): a #GCancellable
   * @error: (nullable): a pointer to a %NULL #GError
   *
   * This is identical to GResolverClass::lookup_by_name except it takes
   * @flags which modifies the behavior of the lookup. See #GResolverNameLookupFlags
   * for more details.
   *
   * Returns: (element-type GInetAddress) (transfer full): List of #GInetAddress.
   * Since: 2.60
    }
(* Const before type ignored *)
type
  PGResolverClass = ^TGResolverClass;
  TGResolverClass = record
      parent_class : TGObjectClass;
      reload : procedure (resolver:PGResolver);cdecl;
      lookup_by_name : function (resolver:PGResolver; hostname:Pgchar; cancellable:PGCancellable; error:PPGError):PGList;cdecl;
      lookup_by_name_async : procedure (resolver:PGResolver; hostname:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      lookup_by_name_finish : function (resolver:PGResolver; result:PGAsyncResult; error:PPGError):PGList;cdecl;
      lookup_by_address : function (resolver:PGResolver; address:PGInetAddress; cancellable:PGCancellable; error:PPGError):Pgchar;cdecl;
      lookup_by_address_async : procedure (resolver:PGResolver; address:PGInetAddress; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      lookup_by_address_finish : function (resolver:PGResolver; result:PGAsyncResult; error:PPGError):Pgchar;cdecl;
      lookup_service : function (resolver:PGResolver; rrname:Pgchar; cancellable:PGCancellable; error:PPGError):PGList;cdecl;
      lookup_service_async : procedure (resolver:PGResolver; rrname:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      lookup_service_finish : function (resolver:PGResolver; result:PGAsyncResult; error:PPGError):PGList;cdecl;
      lookup_records : function (resolver:PGResolver; rrname:Pgchar; record_type:TGResolverRecordType; cancellable:PGCancellable; error:PPGError):PGList;cdecl;
      lookup_records_async : procedure (resolver:PGResolver; rrname:Pgchar; record_type:TGResolverRecordType; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      lookup_records_finish : function (resolver:PGResolver; result:PGAsyncResult; error:PPGError):PGList;cdecl;
      lookup_by_name_with_flags_async : procedure (resolver:PGResolver; hostname:Pgchar; flags:TGResolverNameLookupFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
                    user_data:Tgpointer);cdecl;
      lookup_by_name_with_flags_finish : function (resolver:PGResolver; result:PGAsyncResult; error:PPGError):PGList;cdecl;
      lookup_by_name_with_flags : function (resolver:PGResolver; hostname:Pgchar; flags:TGResolverNameLookupFlags; cancellable:PGCancellable; error:PPGError):PGList;cdecl;
    end;


function g_resolver_get_type:TGType;cdecl;external;
function g_resolver_get_default:PGResolver;cdecl;external;
procedure g_resolver_set_default(resolver:PGResolver);cdecl;external;
(* Const before type ignored *)
function g_resolver_lookup_by_name(resolver:PGResolver; hostname:Pgchar; cancellable:PGCancellable; error:PPGError):PGList;cdecl;external;
(* Const before type ignored *)
procedure g_resolver_lookup_by_name_async(resolver:PGResolver; hostname:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_resolver_lookup_by_name_finish(resolver:PGResolver; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
(* Const before type ignored *)
procedure g_resolver_lookup_by_name_with_flags_async(resolver:PGResolver; hostname:Pgchar; flags:TGResolverNameLookupFlags; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_resolver_lookup_by_name_with_flags_finish(resolver:PGResolver; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
(* Const before type ignored *)
function g_resolver_lookup_by_name_with_flags(resolver:PGResolver; hostname:Pgchar; flags:TGResolverNameLookupFlags; cancellable:PGCancellable; error:PPGError):PGList;cdecl;external;
procedure g_resolver_free_addresses(addresses:PGList);cdecl;external;
function g_resolver_lookup_by_address(resolver:PGResolver; address:PGInetAddress; cancellable:PGCancellable; error:PPGError):Pgchar;cdecl;external;
procedure g_resolver_lookup_by_address_async(resolver:PGResolver; address:PGInetAddress; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_resolver_lookup_by_address_finish(resolver:PGResolver; result:PGAsyncResult; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_resolver_lookup_service(resolver:PGResolver; service:Pgchar; protocol:Pgchar; domain:Pgchar; cancellable:PGCancellable; 
           error:PPGError):PGList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_resolver_lookup_service_async(resolver:PGResolver; service:Pgchar; protocol:Pgchar; domain:Pgchar; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function g_resolver_lookup_service_finish(resolver:PGResolver; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
(* Const before type ignored *)
function g_resolver_lookup_records(resolver:PGResolver; rrname:Pgchar; record_type:TGResolverRecordType; cancellable:PGCancellable; error:PPGError):PGList;cdecl;external;
(* Const before type ignored *)
procedure g_resolver_lookup_records_async(resolver:PGResolver; rrname:Pgchar; record_type:TGResolverRecordType; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
function g_resolver_lookup_records_finish(resolver:PGResolver; result:PGAsyncResult; error:PPGError):PGList;cdecl;external;
procedure g_resolver_free_targets(targets:PGList);cdecl;external;
function g_resolver_get_timeout(resolver:PGResolver):dword;cdecl;external;
procedure g_resolver_set_timeout(resolver:PGResolver; timeout_ms:dword);cdecl;external;
{*
 * G_RESOLVER_ERROR:
 *
 * Error domain for #GResolver. Errors in this domain will be from the
 * #GResolverError enumeration. See #GError for more information on
 * error domains.
  }
{ was #define dname def_expr }
function G_RESOLVER_ERROR : longint; { return type might be wrong }

function g_resolver_error_quark:TGQuark;cdecl;external;
{$endif}
{ __G_RESOLVER_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_RESOLVER : longint; { return type might be wrong }
  begin
    G_TYPE_RESOLVER:=g_resolver_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_RESOLVER(o : longint) : longint;
begin
  G_RESOLVER:=G_TYPE_CHECK_INSTANCE_CAST(o,G_TYPE_RESOLVER,GResolver);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_RESOLVER_CLASS(k : longint) : longint;
begin
  G_RESOLVER_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,G_TYPE_RESOLVER,GResolverClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_RESOLVER(o : longint) : longint;
begin
  G_IS_RESOLVER:=G_TYPE_CHECK_INSTANCE_TYPE(o,G_TYPE_RESOLVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_RESOLVER_CLASS(k : longint) : longint;
begin
  G_IS_RESOLVER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,G_TYPE_RESOLVER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_RESOLVER_GET_CLASS(o : longint) : longint;
begin
  G_RESOLVER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,G_TYPE_RESOLVER,GResolverClass);
end;

{ was #define dname def_expr }
function G_RESOLVER_ERROR : longint; { return type might be wrong }
  begin
    G_RESOLVER_ERROR:=g_resolver_error_quark;
  end;


end.
