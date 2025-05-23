{$IFDEF read_interface}


type
  PEfl_Layout_Calc = ^TEfl_Layout_Calc;
  TEfl_Layout_Calc = TEo;

function EFL_LAYOUT_CALC_INTERFACE: PEfl_Class;

function efl_layout_calc_interface_get: PEfl_Class; cdecl; external libedje;
procedure efl_layout_calc_auto_update_hints_set(obj: PEo; update: TEina_Bool); cdecl; external libedje;
function efl_layout_calc_auto_update_hints_get(obj: PEo): TEina_Bool; cdecl; external libedje;
function efl_layout_calc_size_min(obj: PEo; restricted: TEina_Size2D): TEina_Size2D; cdecl; external libedje;
function efl_layout_calc_parts_extends(obj: PEo): TEina_Rect; cdecl; external libedje;
function efl_layout_calc_freeze(obj: PEo): longint; cdecl; external libedje;
function efl_layout_calc_thaw(obj: PEo): longint; cdecl; external libedje;
procedure efl_layout_calc_force(obj: PEo); cdecl; external libedje;

var
  _EFL_LAYOUT_EVENT_RECALC: TEfl_Event_Description; cvar;external libedje;
  _EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY: TEfl_Event_Description; cvar;external libedje;

function EFL_LAYOUT_EVENT_RECALC: PEfl_Event_Description;
function EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY: PEfl_Event_Description;

// === Konventiert am: 22-5-25 19:41:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_LAYOUT_CALC_INTERFACE: PEfl_Class;
begin
  EFL_LAYOUT_CALC_INTERFACE := efl_layout_calc_interface_get;
end;

function EFL_LAYOUT_EVENT_RECALC: PEfl_Event_Description;
begin
  EFL_LAYOUT_EVENT_RECALC := @(_EFL_LAYOUT_EVENT_RECALC);
end;

function EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY: PEfl_Event_Description;
begin
  EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY := @(_EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY);
end;


{$ENDIF read_implementation}
