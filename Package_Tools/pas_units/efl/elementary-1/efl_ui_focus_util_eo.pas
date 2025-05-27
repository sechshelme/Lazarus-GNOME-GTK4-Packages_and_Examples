unit efl_ui_focus_util_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, efl_ui_focus_object_eo, efl_ui_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Focus_Util = ^TEfl_Ui_Focus_Util;
  TEfl_Ui_Focus_Util = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_UTIL_CLASS: PEfl_Class;

function efl_ui_focus_util_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_focus_util_focus(focus_elem: PEfl_Ui_Focus_Object); cdecl; external libelementary;
function efl_ui_focus_util_active_manager(manager: PEfl_Ui_Focus_Manager): PEfl_Ui_Focus_Manager; cdecl; external libelementary;
function efl_ui_focus_util_direction_complement(dir: TEfl_Ui_Focus_Direction): TEfl_Ui_Focus_Direction; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 17:16:34 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_UTIL_CLASS: PEfl_Class;
begin
  EFL_UI_FOCUS_UTIL_CLASS := efl_ui_focus_util_class_get;
end;
{$endif}


end.
