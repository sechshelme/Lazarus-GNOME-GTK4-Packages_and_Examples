unit vtepty;

interface

uses
  fp_glib2, fp_GTK4, vte, vteenums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  VTE_SPAWN_NO_PARENT_ENVV = 1 shl 25;
  VTE_SPAWN_NO_SYSTEMD_SCOPE = 1 shl 26;
  VTE_SPAWN_REQUIRE_SYSTEMD_SCOPE = 1 shl 27;

function vte_pty_error_quark: TGQuark; cdecl; external libvte_2_91_gtk4;

type
  TVtePty = record
  end;
  PVtePty = ^TVtePty;

  TVtePtyClass = record
  end;
  PVtePtyClass = ^TVtePtyClass;

function vte_pty_get_type: TGType; cdecl; external libvte_2_91_gtk4;
function vte_pty_new_sync(flags: TVtePtyFlags; cancellable: PGCancellable; error: PPGError): PVtePty; cdecl; external libvte_2_91_gtk4;
function vte_pty_new_foreign_sync(fd: longint; cancellable: PGCancellable; error: PPGError): PVtePty; cdecl; external libvte_2_91_gtk4;
function vte_pty_get_fd(pty: PVtePty): longint; cdecl; external libvte_2_91_gtk4;
procedure vte_pty_child_setup(pty: PVtePty); cdecl; external libvte_2_91_gtk4;
function vte_pty_get_size(pty: PVtePty; rows: Plongint; columns: Plongint; error: PPGError): Tgboolean; cdecl; external libvte_2_91_gtk4;
function vte_pty_set_size(pty: PVtePty; rows: longint; columns: longint; error: PPGError): Tgboolean; cdecl; external libvte_2_91_gtk4;
function vte_pty_set_utf8(pty: PVtePty; utf8: Tgboolean; error: PPGError): Tgboolean; cdecl; external libvte_2_91_gtk4;
procedure vte_pty_spawn_async(pty: PVtePty; working_directory: pchar; argv: PPchar; envv: PPchar; spawn_flags: TGSpawnFlags;
  child_setup: TGSpawnChildSetupFunc; child_setup_data: Tgpointer; child_setup_data_destroy: TGDestroyNotify; timeout: longint; cancellable: PGCancellable;
  callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libvte_2_91_gtk4;
procedure vte_pty_spawn_with_fds_async(pty: PVtePty; working_directory: pchar; argv: PPchar; envv: PPchar; fds: Plongint;
  n_fds: longint; map_fds: Plongint; n_map_fds: longint; spawn_flags: TGSpawnFlags; child_setup: TGSpawnChildSetupFunc;
  child_setup_data: Tgpointer; child_setup_data_destroy: TGDestroyNotify; timeout: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libvte_2_91_gtk4;
function vte_pty_spawn_finish(pty: PVtePty; result: PGAsyncResult; child_pid: PGPid; error: PPGError): Tgboolean; cdecl; external libvte_2_91_gtk4;

function VTE_PTY_ERROR: TGQuark;


// === Konventiert am: 3-5-25 17:06:29 ===


implementation

function VTE_TYPE_PTY: TGType;
begin
  VTE_TYPE_PTY := vte_pty_get_type;
end;

function VTE_PTY(obj: Pointer): PVtePty;
begin
  Result := PVtePty(g_type_check_instance_cast(obj, VTE_TYPE_PTY));
end;

function VTE_PTY_CLASS(klass: Pointer): PVtePtyClass;
begin
  Result := PVtePtyClass(g_type_check_class_cast(klass, VTE_TYPE_PTY));
end;

function VTE_IS_PTY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, VTE_TYPE_PTY);
end;

function VTE_IS_PTY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, VTE_TYPE_PTY);
end;

function VTE_PTY_GET_CLASS(obj: Pointer): PVtePtyClass;
begin
  Result := PVtePtyClass(PGTypeInstance(obj)^.g_class);
end;


function VTE_PTY_ERROR: TGQuark;
begin
  VTE_PTY_ERROR := vte_pty_error_quark;
end;


end.
