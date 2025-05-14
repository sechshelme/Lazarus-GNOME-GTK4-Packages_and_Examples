unit efl_canvas_pointer_eo;

interface

uses
  ctypes, efl, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Pointer = ^TEfl_Canvas_Pointer;
  TEfl_Canvas_Pointer = TEo;

function EFL_CANVAS_POINTER_INTERFACE: PEfl_Class;

function efl_canvas_pointer_interface_get: PEfl_Class; cdecl; external libevas;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_pointer_inside_get(obj: PEo; seat: PEfl_Input_Device): TEina_Bool; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 15:08:44 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_POINTER_INTERFACE: PEfl_Class;
begin
  EFL_CANVAS_POINTER_INTERFACE := efl_canvas_pointer_interface_get;
end;
{$endif}


end.
