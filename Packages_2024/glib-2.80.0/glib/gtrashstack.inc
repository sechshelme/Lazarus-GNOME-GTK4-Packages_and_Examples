
{$IFDEF read_interface}

type // GLIB_DEPRECATED_TYPE_IN_2_48;
  PGTrashStack = ^TGTrashStack;
  TGTrashStack = record
    Next: PGTrashStack;
  end;
  PPGTrashStack = ^PGTrashStack;

procedure g_trash_stack_push(stack_p: PPGTrashStack; data_p: Tgpointer); cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_IN_2_48';
function g_trash_stack_pop(stack_p: PPGTrashStack): Tgpointer; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_IN_2_48';
function g_trash_stack_peek(stack_p: PPGTrashStack): Tgpointer; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_IN_2_48';
function g_trash_stack_height(stack_p: PPGTrashStack): Tguint; cdecl; external libglib2; deprecated 'GLIB_DEPRECATED_IN_2_48';

// === Konventiert am: 11-8-24 19:28:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
