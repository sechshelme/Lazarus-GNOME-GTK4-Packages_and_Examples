unit stack;

interface

uses
  fp_lept, environ;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PL_Stack = ^TL_Stack;
  TL_Stack = record
    nalloc: Tl_int32;
    n: Tl_int32;
    arr: ^pointer;
    auxstack: PL_Stack;
  end;

  // === Konventiert am: 17-8-25 13:40:37 ===


implementation



end.
