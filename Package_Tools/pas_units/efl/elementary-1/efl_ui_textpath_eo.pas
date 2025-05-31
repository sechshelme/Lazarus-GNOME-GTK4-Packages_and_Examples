unit efl_ui_textpath_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Textpath = ^TEfl_Ui_Textpath;
  TEfl_Ui_Textpath = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Textpath_Direction = ^TEfl_Ui_Textpath_Direction;
  TEfl_Ui_Textpath_Direction = longint;

const
  EFL_UI_TEXTPATH_DIRECTION_CW = 0;
  EFL_UI_TEXTPATH_DIRECTION_CCW = 1;
  EFL_UI_TEXTPATH_DIRECTION_CW_CENTER = 2;
  EFL_UI_TEXTPATH_DIRECTION_CCW_CENTER = 3;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXTPATH_CLASS: PEfl_Class;

function efl_ui_textpath_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_textpath_circular_set(obj: PEo; radius: double; start_angle: double; direction: TEfl_Ui_Textpath_Direction); cdecl; external libelementary;
procedure efl_ui_textpath_slice_number_set(obj: PEo; slice_no: longint); cdecl; external libelementary;
function efl_ui_textpath_slice_number_get(obj: PEo): longint; cdecl; external libelementary;
procedure efl_ui_textpath_ellipsis_set(obj: PEo; ellipsis: TEina_Bool); cdecl; external libelementary;
function efl_ui_textpath_ellipsis_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:14:14 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXTPATH_CLASS: PEfl_Class;
begin
  EFL_UI_TEXTPATH_CLASS := efl_ui_textpath_class_get;
end;
{$endif}


end.
