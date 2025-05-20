{$IFDEF read_interface}

type
  PEfl_Text_Formatter = ^TEfl_Text_Formatter;
  TEfl_Text_Formatter = TEo;

function EFL_TEXT_FORMATTER_CLASS: PEfl_Class;

function efl_text_formatter_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_text_formatter_attribute_insert(start: PEfl_Text_Cursor_Object; end_: PEfl_Text_Cursor_Object; format: pchar); cdecl; external libevas;
function efl_text_formatter_attribute_clear(start: PEfl_Text_Cursor_Object; end_: PEfl_Text_Cursor_Object): dword; cdecl; external libevas;

// === Konventiert am: 14-5-25 14:53:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_TEXT_FORMATTER_CLASS: PEfl_Class;
begin
  EFL_TEXT_FORMATTER_CLASS := efl_text_formatter_class_get;
end;


{$ENDIF read_implementation}
