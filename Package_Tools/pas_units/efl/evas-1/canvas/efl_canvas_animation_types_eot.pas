unit efl_canvas_animation_types_eot;

interface

uses
  ctypes, elf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Animation_Repeat_Mode = ^TEfl_Canvas_Animation_Repeat_Mode;
  TEfl_Canvas_Animation_Repeat_Mode = longint;

const
  EFL_CANVAS_ANIMATION_REPEAT_MODE_RESTART = 0;
  EFL_CANVAS_ANIMATION_REPEAT_MODE_REVERSE = 1;
  EFL_CANVAS_ANIMATION_REPEAT_MODE_LAST = 2;

  // === Konventiert am: 13-5-25 17:08:22 ===


implementation



end.
