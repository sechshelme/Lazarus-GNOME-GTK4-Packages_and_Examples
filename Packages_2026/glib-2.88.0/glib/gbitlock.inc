{$IFDEF read_interface}


procedure g_bit_lock(address: Pgint; lock_bit: Tgint); cdecl; external libglib2;
procedure g_bit_lock_and_get(address: Pgint; lock_bit: Tguint; out_val: Pgint); cdecl; external libglib2;
function g_bit_trylock(address: Pgint; lock_bit: Tgint): Tgboolean; cdecl; external libglib2;
procedure g_bit_unlock(address: Pgint; lock_bit: Tgint); cdecl; external libglib2;
procedure g_bit_unlock_and_set(address: Pgint; lock_bit: Tguint; new_val: Tgint; preserve_mask: Tgint); cdecl; external libglib2;
procedure g_pointer_bit_lock(address: pointer; lock_bit: Tgint); cdecl; external libglib2;
procedure g_pointer_bit_lock_and_get(address: Tgpointer; lock_bit: Tguint; out_ptr: Pguintptr); cdecl; external libglib2;
function g_pointer_bit_trylock(address: pointer; lock_bit: Tgint): Tgboolean; cdecl; external libglib2;
procedure g_pointer_bit_unlock(address: pointer; lock_bit: Tgint); cdecl; external libglib2;
function g_pointer_bit_lock_mask_ptr(ptr: Tgpointer; lock_bit: Tguint; set_: Tgboolean; preserve_mask: Tguintptr; preserve_ptr: Tgpointer): Tgpointer; cdecl; external libglib2;
procedure g_pointer_bit_unlock_and_set(address: pointer; lock_bit: Tguint; ptr: Tgpointer; preserve_mask: Tguintptr); cdecl; external libglib2;

// === Konventiert am: 22-6-26 16:00:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
