unit heap;

interface

uses
  fp_lept, environ;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TL_Heap = record
    nalloc: Tl_int32;
    n: Tl_int32;
    arr: ^pointer;
    direction: Tl_int32;
  end;
  PL_Heap = ^TL_Heap;
  PPL_Heap = ^PL_Heap;

  // === Konventiert am: 17-8-25 13:40:10 ===


implementation



end.
