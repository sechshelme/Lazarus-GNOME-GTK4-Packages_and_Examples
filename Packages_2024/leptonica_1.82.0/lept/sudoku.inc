{$IFDEF read_interface}


type
  TL_Sudoku = record
    num: Tl_int32;
    locs: Pl_int32;
    current: Tl_int32;
    init: Pl_int32;
    state: Pl_int32;
    nguess: Tl_int32;
    finished: Tl_int32;
    failure: Tl_int32;
  end;
  PL_SUDOKU = ^TL_Sudoku;
  PPL_SUDOKU = ^PL_SUDOKU;

const
  L_SUDOKU_INIT = 0;
  L_SUDOKU_STATE = 1;


  // === Konventiert am: 17-8-25 13:40:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
