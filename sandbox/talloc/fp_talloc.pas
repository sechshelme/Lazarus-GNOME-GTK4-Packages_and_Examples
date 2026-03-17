unit fp_talloc;

interface

const
  {$IFDEF Linux}
  libtalloc = 'talloc';
  {$ENDIF}

  {$IFDEF Windows}
  libtalloc = 'talloc.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  PFILE = type Pointer;
  Tva_list = type Pointer; // ?????
  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  TALLOC_VERSION_MAJOR_ = 2;
  TALLOC_VERSION_MINOR_ = 4;

function talloc_version_major: longint; cdecl; external libtalloc;
function talloc_version_minor: longint; cdecl; external libtalloc;
function talloc_test_get_magic: longint; cdecl; external libtalloc;

type
  PTALLOC_CTX = ^TTALLOC_CTX;
  TTALLOC_CTX = pointer;

function _talloc(context: pointer; size: Tsize_t): pointer; cdecl; external libtalloc;
function talloc_init(fmt: pchar): pointer; varargs; cdecl; external libtalloc;
function _talloc_free(ptr: pointer; location: pchar): longint; cdecl; external libtalloc;
procedure talloc_free_children(ptr: pointer); cdecl; external libtalloc;

type
  TFreefunc = function(para1: pointer): longint; cdecl;

procedure _talloc_set_destructor(ptr: pointer; _destructor: TFreefunc); cdecl; external libtalloc;
function _talloc_steal_loc(new_ctx: pointer; ptr: pointer; location: pchar): pointer; cdecl; external libtalloc;
function talloc_set_name(ptr: pointer; fmt: pchar): pchar; varargs; cdecl; external libtalloc;
function _talloc_move(new_ctx: pointer; pptr: pointer): pointer; cdecl; external libtalloc;
procedure talloc_set_name_const(ptr: pointer; name: pchar); cdecl; external libtalloc;
function talloc_named(context: pointer; size: Tsize_t; fmt: pchar): pointer; varargs; cdecl; external libtalloc;
function talloc_named_const(context: pointer; size: Tsize_t; name: pchar): pointer; cdecl; external libtalloc;
function _talloc_zero(ctx: pointer; size: Tsize_t; name: pchar): pointer; cdecl; external libtalloc;
function talloc_get_name(ptr: pointer): pchar; cdecl; external libtalloc;
function talloc_check_name(ptr: pointer; name: pchar): pointer; cdecl; external libtalloc;
function talloc_parent(ptr: pointer): pointer; cdecl; external libtalloc;
function talloc_parent_name(ptr: pointer): pchar; cdecl; external libtalloc;
function talloc_get_size(ctx: pointer): Tsize_t; cdecl; external libtalloc;
function talloc_total_size(ptr: pointer): Tsize_t; cdecl; external libtalloc;
function talloc_total_blocks(ptr: pointer): Tsize_t; cdecl; external libtalloc;
function _talloc_memdup(t: pointer; p: pointer; size: Tsize_t; name: pchar): pointer; cdecl; external libtalloc;
function _talloc_get_type_abort(ptr: pointer; name: pchar; location: pchar): pointer; cdecl; external libtalloc;
function talloc_find_parent_byname(ctx: pointer; name: pchar): pointer; cdecl; external libtalloc;
function talloc_pool(context: pointer; size: Tsize_t): pointer; cdecl; external libtalloc;
function _talloc_pooled_object(ctx: pointer; type_size: Tsize_t; type_name: pchar; num_subobjects: dword; total_subobjects_size: Tsize_t): pointer; cdecl; external libtalloc;
function talloc_increase_ref_count(ptr: pointer): longint; cdecl; external libtalloc;
function talloc_reference_count(ptr: pointer): Tsize_t; cdecl; external libtalloc;
function _talloc_reference_loc(context: pointer; ptr: pointer; location: pchar): pointer; cdecl; external libtalloc;
function talloc_unlink(context: pointer; ptr: pointer): longint; cdecl; external libtalloc;
function talloc_autofree_context: pointer; cdecl; external libtalloc;
procedure talloc_show_parents(context: pointer; file_: PFILE); cdecl; external libtalloc;
function talloc_is_parent(context: pointer; ptr: pointer): longint; cdecl; external libtalloc;
function talloc_reparent(old_parent: pointer; new_parent: pointer; ptr: pointer): pointer; cdecl; external libtalloc;
function _talloc_array(ctx: pointer; el_size: Tsize_t; count: dword; name: pchar): pointer; cdecl; external libtalloc;
function _talloc_realloc_array(ctx: pointer; ptr: pointer; el_size: Tsize_t; count: dword; name: pchar): pointer; cdecl; external libtalloc;
function _talloc_realloc(context: pointer; ptr: pointer; size: Tsize_t; name: pchar): pointer; cdecl; external libtalloc;
function talloc_realloc_fn(context: pointer; ptr: pointer; size: Tsize_t): pointer; cdecl; external libtalloc;
function talloc_strdup(t: pointer; p: pchar): pchar; cdecl; external libtalloc;
function talloc_strdup_append(s: pchar; a: pchar): pchar; cdecl; external libtalloc;
function talloc_strdup_append_buffer(s: pchar; a: pchar): pchar; cdecl; external libtalloc;
function talloc_strndup(t: pointer; p: pchar; n: Tsize_t): pchar; cdecl; external libtalloc;
function talloc_strndup_append(s: pchar; a: pchar; n: Tsize_t): pchar; cdecl; external libtalloc;
function talloc_strndup_append_buffer(s: pchar; a: pchar; n: Tsize_t): pchar; cdecl; external libtalloc;
function talloc_vasprintf(t: pointer; fmt: pchar; ap: Tva_list): pchar; cdecl; external libtalloc;
function talloc_vasprintf_append(s: pchar; fmt: pchar; ap: Tva_list): pchar; cdecl; external libtalloc;
function talloc_vasprintf_append_buffer(s: pchar; fmt: pchar; ap: Tva_list): pchar; cdecl; external libtalloc;
procedure talloc_asprintf_addbuf(ps: PPchar; fmt: pchar); varargs; cdecl; external libtalloc;
function talloc_asprintf(t: pointer; fmt: pchar): pchar; varargs; cdecl; external libtalloc;
function talloc_asprintf_append(s: pchar; fmt: pchar): pchar; varargs; cdecl; external libtalloc;
function talloc_asprintf_append_buffer(s: pchar; fmt: pchar): pchar; varargs; cdecl; external libtalloc;

type
  Tdepth_func = procedure(ptr: pointer; depth: longint; max_depth: longint; is_ref: longint; private_data: pointer); cdecl;

procedure talloc_report_depth_cb(ptr: pointer; depth: longint; max_depth: longint; callback: Tdepth_func; private_data: pointer); cdecl; external libtalloc;
procedure talloc_report_depth_file(ptr: pointer; depth: longint; max_depth: longint; f: PFILE); cdecl; external libtalloc;
procedure talloc_report_full(ptr: pointer; f: PFILE); cdecl; external libtalloc;
procedure talloc_report(ptr: pointer; f: PFILE); cdecl; external libtalloc;
procedure talloc_enable_null_tracking; cdecl; external libtalloc;
procedure talloc_enable_null_tracking_no_autofree; cdecl; external libtalloc;
procedure talloc_disable_null_tracking; cdecl; external libtalloc;
procedure talloc_enable_leak_report; cdecl; external libtalloc;
procedure talloc_enable_leak_report_full; cdecl; external libtalloc;

type
  taport_func = procedure(reason: pchar); cdecl;
  tlog_func = procedure(reason: pchar); cdecl;

procedure talloc_set_abort_fn(abort_fn: taport_func); cdecl; external libtalloc;
procedure talloc_set_log_fn(log_fn: tlog_func); cdecl; external libtalloc;
procedure talloc_set_log_stderr; cdecl; external libtalloc;
function talloc_set_memlimit(ctx: pointer; max_size: Tsize_t): longint; cdecl; external libtalloc;

// === Konventiert am: 17-3-26 19:31:29 ===


implementation



end.
