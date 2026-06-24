unit gtrashstack;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PPGTrashStack = ^PGTrashStack;
  PGTrashStack = ^TGTrashStack;
  TGTrashStack = record
    next: PGTrashStack;
  end;

procedure g_trash_stack_push(stack_p: PPGTrashStack; data_p: Tgpointer); cdecl; external libglib2; deprecated;
function g_trash_stack_pop(stack_p: PPGTrashStack): Tgpointer; cdecl; external libglib2; deprecated;
function g_trash_stack_peek(stack_p: PPGTrashStack): Tgpointer; cdecl; external libglib2; deprecated;
function g_trash_stack_height(stack_p: PPGTrashStack): Tguint; cdecl; external libglib2; deprecated;

// === Konventiert am: 22-6-26 19:40:31 ===


implementation



end.
