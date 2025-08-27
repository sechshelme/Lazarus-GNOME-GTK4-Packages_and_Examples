unit keymaps;

interface

uses
  fp_readline, rltypedefs;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tkeymap_entry = record
    _type: char;
    _function: Trl_command_func_t;
  end;
  Pkeymap_entry = ^Tkeymap_entry;

const
  KEYMAP_SIZE = 257;
  ANYOTHERKEY = KEYMAP_SIZE - 1;

type
  PKEYMAP_ENTRY_ARRAY = ^TKEYMAP_ENTRY_ARRAY;
  TKEYMAP_ENTRY_ARRAY = array[0..(KEYMAP_SIZE) - 1] of TKEYMAP_ENTRY;

  PKeymap = ^TKeymap;
  TKeymap = PKEYMAP_ENTRY;

const
  ISFUNC = 0;
  ISKMAP = 1;
  ISMACR = 2;

var
  emacs_standard_keymap: TKEYMAP_ENTRY_ARRAY; cvar;external libreadline;
  vi_insertion_keymap: TKEYMAP_ENTRY_ARRAY; cvar;external libreadline;

function rl_make_bare_keymap: TKeymap; cdecl; external libreadline;
function rl_copy_keymap(para1: TKeymap): TKeymap; cdecl; external libreadline;
function rl_make_keymap: TKeymap; cdecl; external libreadline;
procedure rl_discard_keymap(para1: TKeymap); cdecl; external libreadline;
function rl_get_keymap_by_name(para1: pchar): TKeymap; cdecl; external libreadline;
function rl_get_keymap: TKeymap; cdecl; external libreadline;
procedure rl_set_keymap(para1: TKeymap); cdecl; external libreadline;
function rl_set_keymap_name(para1: pchar; para2: TKeymap): longint; cdecl; external libreadline;

// === Konventiert am: 27-8-25 16:55:17 ===


implementation



end.
