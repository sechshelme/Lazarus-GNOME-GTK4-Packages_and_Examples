{$IFDEF read_interface}

type
  PEfl_Input_Key = ^TEfl_Input_Key;
  TEfl_Input_Key = TEo;

function EFL_INPUT_KEY_CLASS: PEfl_Class;

function efl_input_key_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_input_key_pressed_set(obj: PEo; val: TEina_Bool); cdecl; external libevas;
function efl_input_key_pressed_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_input_key_name_set(obj: PEo; val: pchar); cdecl; external libevas;
function efl_input_key_name_get(obj: PEo): pchar; cdecl; external libevas;
procedure efl_input_key_sym_set(obj: PEo; val: pchar); cdecl; external libevas;
function efl_input_key_sym_get(obj: PEo): pchar; cdecl; external libevas;
procedure efl_input_key_string_set(obj: PEo; val: pchar); cdecl; external libevas;
function efl_input_key_string_get(obj: PEo): pchar; cdecl; external libevas;
procedure efl_input_key_compose_string_set(obj: PEo; val: pchar); cdecl; external libevas;
function efl_input_key_compose_string_get(obj: PEo): pchar; cdecl; external libevas;
procedure efl_input_key_code_set(obj: PEo; val: longint); cdecl; external libevas;
function efl_input_key_code_get(obj: PEo): longint; cdecl; external libevas;

// === Konventiert am: 13-5-25 19:18:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_INPUT_KEY_CLASS: PEfl_Class;
begin
  EFL_INPUT_KEY_CLASS := efl_input_key_class_get;
end;


{$ENDIF read_implementation}
