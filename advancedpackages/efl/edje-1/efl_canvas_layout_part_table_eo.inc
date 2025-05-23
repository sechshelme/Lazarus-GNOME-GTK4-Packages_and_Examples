{$IFDEF read_interface}


type
  PEfl_Canvas_Layout_Part_Table = ^TEfl_Canvas_Layout_Part_Table;
  TEfl_Canvas_Layout_Part_Table = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_TABLE_CLASS: PEfl_Class;

function efl_canvas_layout_part_table_class_get: PEfl_Class; cdecl; external libedje;
{$endif}

// === Konventiert am: 22-5-25 19:56:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_TABLE_CLASS: PEfl_Class;
begin
  EFL_CANVAS_LAYOUT_PART_TABLE_CLASS := efl_canvas_layout_part_table_class_get;
end;
{$endif}


{$ENDIF read_implementation}
