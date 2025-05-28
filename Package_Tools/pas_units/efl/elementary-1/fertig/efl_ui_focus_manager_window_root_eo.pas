unit efl_ui_focus_manager_window_root_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Focus_Manager_Window_Root = ^TEfl_Ui_Focus_Manager_Window_Root;
  TEfl_Ui_Focus_Manager_Window_Root = TEo;

function EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_INTERFACE: PEfl_Class;

function efl_ui_focus_manager_window_root_interface_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:16:31 ===


implementation


function EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_INTERFACE: PEfl_Class;
begin
  EFL_UI_FOCUS_MANAGER_WINDOW_ROOT_INTERFACE := efl_ui_focus_manager_window_root_interface_get;
end;


end.
