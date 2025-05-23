{$IFDEF read_interface}


type
  PEfl_Canvas_Layout_Part_Type_Provider = ^TEfl_Canvas_Layout_Part_Type_Provider;
  TEfl_Canvas_Layout_Part_Type_Provider = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_INTERFACE: PEfl_Class;

function efl_canvas_layout_part_type_provider_interface_get: PEfl_Class; cdecl; external libedje;
function efl_canvas_layout_part_type_get(obj: PEo): TEfl_Canvas_Layout_Part_Type; cdecl; external libedje;
{$endif}

// === Konventiert am: 22-5-25 19:56:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_INTERFACE: PEfl_Class;
begin
  EFL_CANVAS_LAYOUT_PART_TYPE_PROVIDER_INTERFACE := efl_canvas_layout_part_type_provider_interface_get;
end;
{$endif}


{$ENDIF read_implementation}
