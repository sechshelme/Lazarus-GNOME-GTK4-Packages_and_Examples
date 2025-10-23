{$IFDEF read_interface}


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



// === Konventiert am: 27-8-25 16:55:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
