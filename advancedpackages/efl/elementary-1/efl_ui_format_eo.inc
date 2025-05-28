{$IFDEF read_interface}


type
  PEfl_Ui_Format = ^TEfl_Ui_Format;
  TEfl_Ui_Format = TEo;

type
  TEfl_Ui_Format_Func = function(data: pointer; str: PEina_Strbuf; value: TEina_Value): TEina_Bool; cdecl;

  TEfl_Ui_Format_Value = record
    value: longint;
    text: pchar;
  end;
  PEfl_Ui_Format_Value = ^TEfl_Ui_Format_Value;

  PEfl_Ui_Format_String_Type = ^TEfl_Ui_Format_String_Type;
  TEfl_Ui_Format_String_Type = (EFL_UI_FORMAT_STRING_TYPE_SIMPLE := 0,
    EFL_UI_FORMAT_STRING_TYPE_TIME);

function EFL_UI_FORMAT_MIXIN: PEfl_Config;

function efl_ui_format_mixin_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_format_func_set(obj: PEo; func_data: pointer; func: TEfl_Ui_Format_Func; func_free_cb: TEina_Free_Cb); cdecl; external libelementary;
function efl_ui_format_func_get(obj: PEo): TEfl_Ui_Format_Func; cdecl; external libelementary;
procedure efl_ui_format_values_set(obj: PEo; values: PEina_Accessor); cdecl; external libelementary;
function efl_ui_format_values_get(obj: PEo): PEina_Accessor; cdecl; external libelementary;
procedure efl_ui_format_string_set(obj: PEo; _string: pchar; _type: TEfl_Ui_Format_String_Type); cdecl; external libelementary;
procedure efl_ui_format_string_get(obj: PEo; _string: PPchar; _type: PEfl_Ui_Format_String_Type); cdecl; external libelementary;
procedure efl_ui_format_formatted_value_get(obj: PEo; str: PEina_Strbuf; value: TEina_Value); cdecl; external libelementary;
function efl_ui_format_decimal_places_get(obj: PEo): longint; cdecl; external libelementary;
procedure efl_ui_format_apply_formatted_value(obj: PEo); cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:31:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_FORMAT_MIXIN: PEfl_Config;
begin
  EFL_UI_FORMAT_MIXIN := efl_ui_format_mixin_get;
end;


{$ENDIF read_implementation}
