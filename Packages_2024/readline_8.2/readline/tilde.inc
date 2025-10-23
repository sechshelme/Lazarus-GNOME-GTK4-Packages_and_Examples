{$IFDEF read_interface}


type
  Ttilde_hook_func_t = function(para1: pchar): pchar; cdecl;

var
  tilde_expansion_preexpansion_hook: Ttilde_hook_func_t; cvar;external libreadline;
  tilde_expansion_failure_hook: Ttilde_hook_func_t; cvar;external libreadline;
  tilde_additional_prefixes: ppchar; cvar;external libreadline;
  tilde_additional_suffixes: ppchar; cvar;external libreadline;

function tilde_expand(para1: pchar): pchar; cdecl; external libreadline;
function tilde_expand_word(para1: pchar): pchar; cdecl; external libreadline;
function tilde_find_word(para1: pchar; para2: longint; para3: Plongint): pchar; cdecl; external libreadline;

// === Konventiert am: 27-8-25 16:55:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
