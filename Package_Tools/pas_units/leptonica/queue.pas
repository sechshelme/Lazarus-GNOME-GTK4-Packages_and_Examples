unit queue;

interface

uses
  fp_lept, environ, stack;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TL_Queue = record
    nalloc: Tl_int32;
    nhead: Tl_int32;
    nelem: Tl_int32;
    arr: ^pointer;
    stack: PL_Stack;
  end;
  PL_Queue = ^TL_Queue;
  PPL_Queue = ^PL_Queue;

  // === Konventiert am: 17-8-25 13:40:26 ===


implementation



end.
