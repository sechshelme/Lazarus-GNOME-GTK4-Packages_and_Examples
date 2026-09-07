unit pk_task;

interface

uses
  fp_glib2, fp_packagekit;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
 *
 * Copyright (C) 2009 Richard Hughes <richard@hughsie.com>
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
{$ifndef __PK_TASK_H}
{$define __PK_TASK_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <packagekit-glib2/pk-progress.h>}
{$include <packagekit-glib2/pk-results.h>}
{$include <packagekit-glib2/pk-client.h>}

{ was #define dname def_expr }
function PK_TASK_TYPE_ERROR : longint; { return type might be wrong }

type
{$ifdef //G_DEFINE_AUTOPTR_CLEANUP_FUNC }
{G_DEFINE_AUTOPTR_CLEANUP_FUNC (PkTask, g_object_unref) }
{$endif}
type
  PPkTask = ^TPkTask;
  TPkTask = record
      parent : TPkClient;
      priv : PPkTaskPrivate;
    end;

{ padding for future expansion  }
  PPkTaskClass = ^TPkTaskClass;
  TPkTaskClass = record
      parent_class : TPkClientClass;
      untrusted_question : procedure (task:PPkTask; request:Tguint; results:PPkResults);cdecl;
      key_question : procedure (task:PPkTask; request:Tguint; results:PPkResults);cdecl;
      eula_question : procedure (task:PPkTask; request:Tguint; results:PPkResults);cdecl;
      media_change_question : procedure (task:PPkTask; request:Tguint; results:PPkResults);cdecl;
      simulate_question : procedure (task:PPkTask; request:Tguint; results:PPkResults);cdecl;
      repair_question : procedure (task:PPkTask; request:Tguint; results:PPkResults);cdecl;
      _pk_reserved1 : procedure ;cdecl;
      _pk_reserved2 : procedure ;cdecl;
      _pk_reserved3 : procedure ;cdecl;
      _pk_reserved4 : procedure ;cdecl;
    end;


function pk_task_get_type:TGType;cdecl;external libpackagekit ;
function pk_task_new:PPkTask;cdecl;external libpackagekit ;
function pk_task_generic_finish(task:PPkTask; res:PGAsyncResult; error:PPGError):PPkResults;cdecl;external libpackagekit ;
procedure pk_task_install_packages_async(task:PPkTask; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_update_packages_async(task:PPkTask; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_remove_packages_async(task:PPkTask; package_ids:PPgchar; allow_deps:Tgboolean; autoremove:Tgboolean; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_purge_packages_async(task:PPkTask; package_ids:PPgchar; allow_deps:Tgboolean; autoremove:Tgboolean; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_install_files_async(task:PPkTask; files:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_resolve_async(task:PPkTask; filters:TPkBitfield; packages:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_search_names_async(task:PPkTask; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_search_details_async(task:PPkTask; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_search_groups_async(task:PPkTask; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_search_files_async(task:PPkTask; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_get_details_async(task:PPkTask; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_get_update_detail_async(task:PPkTask; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_download_packages_async(task:PPkTask; package_ids:PPgchar; directory:Pgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_get_updates_async(task:PPkTask; filters:TPkBitfield; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_depends_on_async(task:PPkTask; filters:TPkBitfield; package_ids:PPgchar; recursive:Tgboolean; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_get_packages_async(task:PPkTask; filters:TPkBitfield; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_required_by_async(task:PPkTask; filters:TPkBitfield; package_ids:PPgchar; recursive:Tgboolean; cancellable:PGCancellable; 
            progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_what_provides_async(task:PPkTask; filters:TPkBitfield; values:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_get_files_async(task:PPkTask; package_ids:PPgchar; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_get_categories_async(task:PPkTask; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_refresh_cache_async(task:PPkTask; force:Tgboolean; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_get_repo_list_async(task:PPkTask; filters:TPkBitfield; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; 
            callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_repo_enable_async(task:PPkTask; repo_id:Pgchar; enabled:Tgboolean; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_upgrade_system_async(task:PPkTask; distro_id:Pgchar; upgrade_kind:TPkUpgradeKindEnum; cancellable:PGCancellable; progress_callback:TPkProgressCallback; 
            progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libpackagekit ;
procedure pk_task_repair_system_async(task:PPkTask; cancellable:PGCancellable; progress_callback:TPkProgressCallback; progress_user_data:Tgpointer; callback_ready:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libpackagekit ;
function pk_task_user_accepted(task:PPkTask; request:Tguint):Tgboolean;cdecl;external libpackagekit ;
function pk_task_user_declined(task:PPkTask; request:Tguint):Tgboolean;cdecl;external libpackagekit ;
{ getters and setters  }
procedure pk_task_set_simulate(task:PPkTask; simulate:Tgboolean);cdecl;external libpackagekit ;
function pk_task_get_simulate(task:PPkTask):Tgboolean;cdecl;external libpackagekit ;
procedure pk_task_set_only_download(task:PPkTask; only_download:Tgboolean);cdecl;external libpackagekit ;
function pk_task_get_only_download(task:PPkTask):Tgboolean;cdecl;external libpackagekit ;
procedure pk_task_set_allow_downgrade(task:PPkTask; allow_downgrade:Tgboolean);cdecl;external libpackagekit ;
function pk_task_get_allow_downgrade(task:PPkTask):Tgboolean;cdecl;external libpackagekit ;
procedure pk_task_set_allow_reinstall(task:PPkTask; allow_reinstall:Tgboolean);cdecl;external libpackagekit ;
function pk_task_get_allow_reinstall(task:PPkTask):Tgboolean;cdecl;external libpackagekit ;
procedure pk_task_set_only_trusted(task:PPkTask; only_trusted:Tgboolean);cdecl;external libpackagekit ;
function pk_task_get_only_trusted(task:PPkTask):Tgboolean;cdecl;external libpackagekit ;
{$endif}
{ __PK_TASK_H  }

// === Konventiert am: 7-9-26 15:13:39 ===

function PK_TYPE_TASK : TGType;
function PK_TASK(obj : Pointer) : PPkTask;
function PK_TASK_CLASS(klass : Pointer) : PPkTaskClass;
function PK_IS_TASK(obj : Pointer) : Tgboolean;
function PK_IS_TASK_CLASS(klass : Pointer) : Tgboolean;
function PK_TASK_GET_CLASS(obj : Pointer) : PPkTaskClass;

implementation

function PK_TYPE_TASK : TGType;
  begin
    PK_TYPE_TASK:=pk_task_get_type;
  end;

function PK_TASK(obj : Pointer) : PPkTask;
begin
  Result := PPkTask(g_type_check_instance_cast(obj, PK_TYPE_TASK));
end;

function PK_TASK_CLASS(klass : Pointer) : PPkTaskClass;
begin
  Result := PPkTaskClass(g_type_check_class_cast(klass, PK_TYPE_TASK));
end;

function PK_IS_TASK(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PK_TYPE_TASK);
end;

function PK_IS_TASK_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  PK_TYPE_TASK);
end;

function PK_TASK_GET_CLASS(obj : Pointer) : PPkTaskClass;
begin
  Result := PPkTaskClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function PK_TASK_TYPE_ERROR : longint; { return type might be wrong }
  begin
    PK_TASK_TYPE_ERROR:=pk_task_error_get_type;
  end;


end.
