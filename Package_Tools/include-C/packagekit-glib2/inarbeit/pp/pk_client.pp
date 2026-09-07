
unit pk_client;
interface

{
  Automatically converted by H2Pas 1.0.0 from pk_client.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pk_client.h
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
PPkClient  = ^PkClient;
PPkClientClass  = ^PkClientClass;
PPkClientError  = ^PkClientError;
PPkClientPrivate  = ^PkClientPrivate;
PPkProgress  = ^PkProgress;
PPkResults  = ^PkResults;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009-2014 Richard Hughes <richard@hughsie.com>
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
{$ifndef __PK_CLIENT_H}
{$define __PK_CLIENT_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <packagekit-glib2/pk-results.h>}
{$include <packagekit-glib2/pk-progress.h>}
{$include <packagekit-glib2/pk-bitfield.h>}
{$include <packagekit-glib2/pk-source.h>}

{ was #define dname def_expr }
function PK_TYPE_CLIENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_CLIENT(o : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_CLIENT_CLASS(k : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_GET_CLASS(o : longint) : longint;

{ was #define dname def_expr }
function PK_CLIENT_ERROR : longint; { return type might be wrong }

{ was #define dname def_expr }
function PK_CLIENT_TYPE_ERROR : longint; { return type might be wrong }

{*
 * PkClientError:
 * @PK_CLIENT_ERROR_FAILED: the transaction failed for an unknown reason
 * @PK_CLIENT_ERROR_FAILED_AUTH: the transaction failed authentication/authorization
 * @PK_CLIENT_ERROR_NO_TID: the transaction id was not pre-allocated (internal error)
 * @PK_CLIENT_ERROR_ALREADY_TID: the transaction id has already been used (internal error)
 * @PK_CLIENT_ERROR_ROLE_UNKNOWN: the role was not set (internal error)
 * @PK_CLIENT_ERROR_CANNOT_START_DAEMON: the PackageKit daemon failed to start
 * @PK_CLIENT_ERROR_INVALID_INPUT: the package_id is invalid
 * @PK_CLIENT_ERROR_INVALID_FILE: the file is invalid
 * @PK_CLIENT_ERROR_NOT_SUPPORTED: the action is not supported
 * @PK_CLIENT_ERROR_DECLINED_SIMULATION: the simulation was declined by the user
 * @PK_CLIENT_ERROR_DECLINED_INTERACTION: the user declined interaction on the task
 * @PK_CLIENT_ERROR_LAST:
 *
 * Errors that can be thrown
  }
{ we define this so we can punt the PkErrorEnums here at offset 0xff  }
type
  PPkClientError = ^TPkClientError;
  TPkClientError =  Longint;
  Const
    PK_CLIENT_ERROR_FAILED = 0;
    PK_CLIENT_ERROR_FAILED_AUTH = 1;
    PK_CLIENT_ERROR_NO_TID = 2;
    PK_CLIENT_ERROR_ALREADY_TID = 3;
    PK_CLIENT_ERROR_ROLE_UNKNOWN = 4;
    PK_CLIENT_ERROR_CANNOT_START_DAEMON = 5;
    PK_CLIENT_ERROR_INVALID_INPUT = 6;
    PK_CLIENT_ERROR_INVALID_FILE = 7;
    PK_CLIENT_ERROR_NOT_SUPPORTED = 8;
    PK_CLIENT_ERROR_DECLINED_SIMULATION = 9;
    PK_CLIENT_ERROR_DECLINED_INTERACTION = 10;
    PK_CLIENT_ERROR_LAST = 11;
;
type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkClient, g_object_unref) }
{$endif}
type
  PPkClient = ^TPkClient;
  TPkClient = record
      parent : TGObject;
      priv : PPkClientPrivate;
    end;

{ signals  }
{ padding for future expansion  }
  PPkClientClass = ^TPkClientClass;
  TPkClientClass = record
      parent_class : TGObjectClass;
      changed : procedure (client:PPkClient);cdecl;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
      _pk_reserved5 : procedure ;cdecl;
    end;


function pk_client_error_quark:TGQuark;cdecl;external;
function pk_client_get_type:TGType;cdecl;external;
function pk_client_new:PPkClient;cdecl;external;
{ get transaction results  }
function pk_client_generic_finish(client:PPkClient; res:PGAsyncResult; error:PPGError):PPkResults;cdecl;external;
procedure pk_client_resolve_async(client:PPkClient; filters:TPkBitfield; packages:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_search_names_async(client:PPkClient; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_search_details_async(client:PPkClient; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_search_groups_async(client:PPkClient; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_search_files_async(client:PPkClient; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_details_async(client:PPkClient; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_details_local_async(client:PPkClient; files:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_files_local_async(client:PPkClient; files:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_update_detail_async(client:PPkClient; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure pk_client_download_packages_async(client:PPkClient; package_ids:PPgchar; directory:Pgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_updates_async(client:PPkClient; filters:TPkBitfield; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_old_transactions_async(client:PPkClient; number:Tguint; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_depends_on_async(client:PPkClient; filters:TPkBitfield; package_ids:PPgchar; recursive:Tgboolean; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_packages_async(client:PPkClient; filters:TPkBitfield; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_required_by_async(client:PPkClient; filters:TPkBitfield; package_ids:PPgchar; recursive:Tgboolean; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_what_provides_async(client:PPkClient; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_distro_upgrades_async(client:PPkClient; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
procedure pk_client_get_files_async(client:PPkClient; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_categories_async(client:PPkClient; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external;
procedure pk_client_remove_packages_async(client:PPkClient; transaction_flags:TPkBitfield; package_ids:PPgchar; allow_deps:Tgboolean; autoremove:Tgboolean; 
            cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_purge_packages_async(client:PPkClient; transaction_flags:TPkBitfield; package_ids:PPgchar; allow_deps:Tgboolean; autoremove:Tgboolean; 
            cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_refresh_cache_async(client:PPkClient; force:Tgboolean; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_install_packages_async(client:PPkClient; transaction_flags:TPkBitfield; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure pk_client_install_signature_async(client:PPkClient; _type:TPkSigTypeEnum; key_id:Pgchar; package_id:Pgchar; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_update_packages_async(client:PPkClient; transaction_flags:TPkBitfield; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_install_files_async(client:PPkClient; transaction_flags:TPkBitfield; files:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure pk_client_accept_eula_async(client:PPkClient; eula_id:Pgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_get_repo_list_async(client:PPkClient; filters:TPkBitfield; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure pk_client_repo_enable_async(client:PPkClient; repo_id:Pgchar; enabled:Tgboolean; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure pk_client_repo_set_data_async(client:PPkClient; repo_id:Pgchar; parameter:Pgchar; value:Pgchar; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure pk_client_repo_remove_async(client:PPkClient; transaction_flags:TPkBitfield; repo_id:Pgchar; autoremove:Tgboolean; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure pk_client_upgrade_system_async(client:PPkClient; transaction_flags:TPkBitfield; distro_id:Pgchar; upgrade_kind:TPkUpgradeKindEnum; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
procedure pk_client_repair_system_async(client:PPkClient; transaction_flags:TPkBitfield; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
procedure pk_client_adopt_async(client:PPkClient; transaction_id:Pgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function pk_client_get_progress_finish(client:PPkClient; res:PGAsyncResult; error:PPGError):PPkProgress;cdecl;external;
(* Const before type ignored *)
procedure pk_client_get_progress_async(client:PPkClient; transaction_id:Pgchar; cancellable:PGCancellable; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function pk_client_create_helper_argv_envp(argv:PPPgchar; envp_out:PPPgchar):Tgboolean;cdecl;external;
{ getters and setters  }
(* Const before type ignored *)
procedure pk_client_set_locale(client:PPkClient; locale:Pgchar);cdecl;external;
(* Const before type ignored *)
function pk_client_get_locale(client:PPkClient):Pgchar;cdecl;external;
procedure pk_client_set_background(client:PPkClient; background:Tgboolean);cdecl;external;
function pk_client_get_background(client:PPkClient):Tgboolean;cdecl;external;
procedure pk_client_set_interactive(client:PPkClient; interactive:Tgboolean);cdecl;external;
function pk_client_get_interactive(client:PPkClient):Tgboolean;cdecl;external;
function pk_client_get_idle(client:PPkClient):Tgboolean;cdecl;external;
procedure pk_client_set_cache_age(client:PPkClient; cache_age:Tguint);cdecl;external;
function pk_client_get_cache_age(client:PPkClient):Tguint;cdecl;external;
procedure pk_client_set_details_with_deps_size(client:PPkClient; details_with_deps_size:Tgboolean);cdecl;external;
function pk_client_get_details_with_deps_size(client:PPkClient):Tgboolean;cdecl;external;
{$endif}
{ __PK_CLIENT_H  }

implementation

{ was #define dname def_expr }
function PK_TYPE_CLIENT : longint; { return type might be wrong }
  begin
    PK_TYPE_CLIENT:=pk_client_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT(o : longint) : longint;
begin
  PK_CLIENT:=G_TYPE_CHECK_INSTANCE_CAST(o,PK_TYPE_CLIENT,PkClient);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_CLASS(k : longint) : longint;
begin
  PK_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_CAST(k,PK_TYPE_CLIENT,PkClientClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_CLIENT(o : longint) : longint;
begin
  PK_IS_CLIENT:=G_TYPE_CHECK_INSTANCE_TYPE(o,PK_TYPE_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_IS_CLIENT_CLASS(k : longint) : longint;
begin
  PK_IS_CLIENT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(k,PK_TYPE_CLIENT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PK_CLIENT_GET_CLASS(o : longint) : longint;
begin
  PK_CLIENT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(o,PK_TYPE_CLIENT,PkClientClass);
end;

{ was #define dname def_expr }
function PK_CLIENT_ERROR : longint; { return type might be wrong }
  begin
    PK_CLIENT_ERROR:=pk_client_error_quark;
  end;

{ was #define dname def_expr }
function PK_CLIENT_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_CLIENT_TYPE_ERROR:=pk_client_error_get_type;
  end;


end.
