{$IFDEF read_interface}


type
  TEina_Content = record
  end;
  PEina_Content = ^TEina_Content;

  PEina_Content_Conversion_Callback = ^TEina_Content_Conversion_Callback;
  TEina_Content_Conversion_Callback = function(from: PEina_Content; to_type: pchar): PEina_Content; cdecl;

function eina_content_as_file(content: PEina_Content): pchar; cdecl; external libeina;
function eina_content_convert(content: PEina_Content; new_type: pchar): PEina_Content; cdecl; external libeina;
function eina_content_type_get(content: PEina_Content): pchar; cdecl; external libeina;
function eina_content_data_get(content: PEina_Content): TEina_Slice; cdecl; external libeina;
function eina_content_new(data: TEina_Slice; _type: pchar): PEina_Content; cdecl; external libeina;
procedure eina_content_free(content: PEina_Content); cdecl; external libeina;
function eina_content_converter_conversion_register(from: pchar; to_: pchar; convertion: TEina_Content_Conversion_Callback): TEina_Bool; cdecl; external libeina;
function eina_content_converter_convert_can(from: pchar; to_: pchar): TEina_Bool; cdecl; external libeina;
function eina_content_converter_possible_conversions(from: pchar): PEina_Iterator; cdecl; external libeina;

var
  EINA_VALUE_TYPE_CONTENT: PEina_Value_Type; cvar;external libeina;

function eina_value_content_new(content: PEina_Content): PEina_Value; cdecl; external libeina;
function eina_value_content_init(content: PEina_Content): TEina_Value; cdecl; external libeina;
function eina_value_to_content(value: PEina_Value): PEina_Content; cdecl; external libeina;

function eina_content_possible_conversions(content: PEina_Content): PEina_Iterator;

// === Konventiert am: 17-5-25 13:52:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function eina_content_possible_conversions(content: PEina_Content): PEina_Iterator;
begin
  Result := eina_content_converter_possible_conversions(eina_content_type_get(content));
end;



{$ENDIF read_implementation}
