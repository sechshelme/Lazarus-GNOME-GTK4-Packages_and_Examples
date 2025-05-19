unit efl_ui_drag_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_ui_drag_types_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Drag = ^TEfl_Ui_Drag;
  TEfl_Ui_Drag = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_DRAG_INTERFACE: PEfl_Class;

function efl_ui_drag_interface_get: PEfl_Class; cdecl; external libefl;
function efl_ui_drag_value_set(obj: PEo; dx: double; dy: double): TEina_Bool; cdecl; external libefl;
function efl_ui_drag_value_get(obj: PEo; dx: Pdouble; dy: Pdouble): TEina_Bool; cdecl; external libefl;
function efl_ui_drag_size_set(obj: PEo; dw: double; dh: double): TEina_Bool; cdecl; external libefl;
function efl_ui_drag_size_get(obj: PEo; dw: Pdouble; dh: Pdouble): TEina_Bool; cdecl; external libefl;
function efl_ui_drag_dir_get(obj: PEo): TEfl_Ui_Drag_Dir; cdecl; external libefl;
function efl_ui_drag_step_set(obj: PEo; dx: double; dy: double): TEina_Bool; cdecl; external libefl;
function efl_ui_drag_step_get(obj: PEo; dx: Pdouble; dy: Pdouble): TEina_Bool; cdecl; external libefl;
function efl_ui_drag_step_move(obj: PEo; dx: double; dy: double): TEina_Bool; cdecl; external libefl;
function efl_ui_drag_page_set(obj: PEo; dx: double; dy: double): TEina_Bool; cdecl; external libefl;
function efl_ui_drag_page_get(obj: PEo; dx: Pdouble; dy: Pdouble): TEina_Bool; cdecl; external libefl;
function efl_ui_drag_page_move(obj: PEo; dx: double; dy: double): TEina_Bool; cdecl; external libefl;
{$endif}

// === Konventiert am: 19-5-25 17:35:13 ===


implementation


function EFL_UI_DRAG_INTERFACE: PEfl_Class;
begin
  EFL_UI_DRAG_INTERFACE := efl_ui_drag_interface_get;
end;


end.
