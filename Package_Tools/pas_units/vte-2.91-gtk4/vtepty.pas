unit vtepty;

interface

uses
  fp_glib2, fp_GTK4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009, 2010 Christian Persch
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published
 * by the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__VTE_VTE_H_INSIDE__) && !defined (VTE_COMPILATION)}
{$error "Only <vte/vte.h> can be included directly."}
{$endif}
{$include <gio/gio.h>}
{$include "vteenums.h"}
{$include "vtemacros.h"}

const
  VTE_SPAWN_NO_PARENT_ENVV = 1 shl 25;  
  VTE_SPAWN_NO_SYSTEMD_SCOPE = 1 shl 26;  
  VTE_SPAWN_REQUIRE_SYSTEMD_SCOPE = 1 shl 27;  

function vte_pty_error_quark:TGQuark;cdecl;external libvte_2_91_gtk4 ;
{*
 * VTE_PTY_ERROR:
 *
 * Error domain for VTE PTY errors. Errors in this domain will be from the #VtePtyError
 * enumeration. See #GError for more information on error domains.
  }
{ was #define dname def_expr }
function VTE_PTY_ERROR : longint; { return type might be wrong }

{ VTE PTY object  }
type

function vte_pty_get_type:TGType;cdecl;external libvte_2_91_gtk4 ;
function vte_pty_new_sync(flags:TVtePtyFlags; cancellable:PGCancellable; error:PPGError):PVtePty;cdecl;external libvte_2_91_gtk4 ;
function vte_pty_new_foreign_sync(fd:longint; cancellable:PGCancellable; error:PPGError):PVtePty;cdecl;external libvte_2_91_gtk4 ;
function vte_pty_get_fd(pty:PVtePty):longint;cdecl;external libvte_2_91_gtk4 ;
procedure vte_pty_child_setup(pty:PVtePty);cdecl;external libvte_2_91_gtk4 ;
function vte_pty_get_size(pty:PVtePty; rows:Plongint; columns:Plongint; error:PPGError):Tgboolean;cdecl;external libvte_2_91_gtk4 ;
function vte_pty_set_size(pty:PVtePty; rows:longint; columns:longint; error:PPGError):Tgboolean;cdecl;external libvte_2_91_gtk4 ;
function vte_pty_set_utf8(pty:PVtePty; utf8:Tgboolean; error:PPGError):Tgboolean;cdecl;external libvte_2_91_gtk4 ;
procedure vte_pty_spawn_async(pty:PVtePty; working_directory:Pchar; argv:PPchar; envv:PPchar; spawn_flags:TGSpawnFlags; 
            child_setup:TGSpawnChildSetupFunc; child_setup_data:Tgpointer; child_setup_data_destroy:TGDestroyNotify; timeout:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external libvte_2_91_gtk4 ;
procedure vte_pty_spawn_with_fds_async(pty:PVtePty; working_directory:Pchar; argv:PPchar; envv:PPchar; fds:Plongint; 
            n_fds:longint; map_fds:Plongint; n_map_fds:longint; spawn_flags:TGSpawnFlags; child_setup:TGSpawnChildSetupFunc; 
            child_setup_data:Tgpointer; child_setup_data_destroy:TGDestroyNotify; timeout:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; 
            user_data:Tgpointer);cdecl;external libvte_2_91_gtk4 ;
{ out  }function vte_pty_spawn_finish(pty:PVtePty; result:PGAsyncResult; child_pid:PGPid; error:PPGError):Tgboolean;cdecl;external libvte_2_91_gtk4 ;

// === Konventiert am: 3-5-25 17:06:29 ===


implementation

function VTE_TYPE_PTY : TGType;
  begin
    VTE_TYPE_PTY:=vte_pty_get_type;
  end;

function VTE_PTY(obj : Pointer) : PVtePty;
begin
  Result := PVtePty(g_type_check_instance_cast(obj, VTE_TYPE_PTY));
end;

function VTE_PTY_CLASS(klass : Pointer) : PVtePtyClass;
begin
  Result := PVtePtyClass(g_type_check_class_cast(klass, VTE_TYPE_PTY));
end;

function VTE_IS_PTY(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  VTE_TYPE_PTY);
end;

function VTE_IS_PTY_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  VTE_TYPE_PTY);
end;

function VTE_PTY_GET_CLASS(obj : Pointer) : PVtePtyClass;
begin
  Result := PVtePtyClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function VTE_PTY_ERROR : longint; { return type might be wrong }
  begin
    VTE_PTY_ERROR:=vte_pty_error_quark;
  end;




end.
