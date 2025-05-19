unit efl_ui_drag_types_eot;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Drag_Dir = ^TEfl_Ui_Drag_Dir;
  TEfl_Ui_Drag_Dir = longint;

const
  EFL_UI_DRAG_DIR_NONE = 0;
  EFL_UI_DRAG_DIR_X = 1;
  EFL_UI_DRAG_DIR_Y = 2;
  EFL_UI_DRAG_DIR_XY = 3;
  {$endif}

  // === Konventiert am: 19-5-25 17:40:02 ===


implementation



end.
