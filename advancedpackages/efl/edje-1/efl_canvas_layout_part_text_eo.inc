{$IFDEF read_interface}


type
  PEfl_Canvas_Layout_Part_Text = ^TEfl_Canvas_Layout_Part_Text;
  TEfl_Canvas_Layout_Part_Text = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Canvas_Layout_Part_Text_Expand = ^TEfl_Canvas_Layout_Part_Text_Expand;
  TEfl_Canvas_Layout_Part_Text_Expand = longint;

const
  EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_NONE = 0;
  EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_MIN_X = 1;
  EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_MIN_Y = 2;
  EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_MAX_X = 4;
  EFL_CANVAS_LAYOUT_PART_TEXT_EXPAND_MAX_Y = 8;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_TEXT_CLASS: PEfl_Class;

function efl_canvas_layout_part_text_class_get: PEfl_Class; cdecl; external libedje;
procedure efl_canvas_layout_part_text_expand_set(obj: PEo; _type: TEfl_Canvas_Layout_Part_Text_Expand); cdecl; external libedje;
function efl_canvas_layout_part_text_expand_get(obj: PEo): TEfl_Canvas_Layout_Part_Text_Expand; cdecl; external libedje;
{$endif}

// === Konventiert am: 22-5-25 19:41:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_LAYOUT_PART_TEXT_CLASS: PEfl_Class;
begin
  EFL_CANVAS_LAYOUT_PART_TEXT_CLASS := efl_canvas_layout_part_text_class_get;
end;
{$endif}


{$ENDIF read_implementation}
