unit sokol_args;

interface

uses
  fp_sokol;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tsargs_allocator = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psargs_allocator = ^Tsargs_allocator;

  Tsargs_desc = record
    argc: longint;
    argv: ^pchar;
    max_args: longint;
    buf_size: longint;
    allocator: Tsargs_allocator;
  end;
  Psargs_desc = ^Tsargs_desc;

procedure sargs_setup(desc: Psargs_desc); cdecl; external libsokol;
procedure sargs_shutdown; cdecl; external libsokol;
function sargs_isvalid: boolean; cdecl; external libsokol;
function sargs_exists(key: pchar): boolean; cdecl; external libsokol;
function sargs_value(key: pchar): pchar; cdecl; external libsokol;
function sargs_value_def(key: pchar; def: pchar): pchar; cdecl; external libsokol;
function sargs_equals(key: pchar; val: pchar): boolean; cdecl; external libsokol;
function sargs_boolean(key: pchar): boolean; cdecl; external libsokol;
function sargs_find(key: pchar): longint; cdecl; external libsokol;
function sargs_num_args: longint; cdecl; external libsokol;
function sargs_key_at(index: longint): pchar; cdecl; external libsokol;
function sargs_value_at(index: longint): pchar; cdecl; external libsokol;

// === Konventiert am: 22-3-26 16:22:37 ===


implementation



end.
