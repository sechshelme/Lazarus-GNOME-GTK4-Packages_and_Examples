{$IFDEF read_interface}


type
  PEfl_Canvas_Layout_Part_External = ^TEfl_Canvas_Layout_Part_External;
  TEfl_Canvas_Layout_Part_External = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_EXTERNAL_CLASS: PEfl_Class;

function efl_canvas_layout_part_external_class_get: PEfl_Class; cdecl; external libedje;
{$endif}

// === Konventiert am: 22-5-25 19:41:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_EXTERNAL_CLASS: PEfl_Class;
begin
  EFL_CANVAS_LAYOUT_PART_EXTERNAL_CLASS := efl_canvas_layout_part_external_class_get;
end;
{$endif}


{$ENDIF read_implementation}
