{$IFDEF read_interface}


type
  PEfl_Text_Format = ^TEfl_Text_Format;
  TEfl_Text_Format = TEo;

type
  PEfl_Text_Format_Wrap = ^TEfl_Text_Format_Wrap;
  TEfl_Text_Format_Wrap = longint;

const
  EFL_TEXT_FORMAT_WRAP_NONE = 0;
  EFL_TEXT_FORMAT_WRAP_CHAR = 1;
  EFL_TEXT_FORMAT_WRAP_WORD = 2;
  EFL_TEXT_FORMAT_WRAP_MIXED = 3;
  EFL_TEXT_FORMAT_WRAP_HYPHENATION = 4;

type
  PEfl_Text_Format_Horizontal_Alignment_Auto_Type = ^TEfl_Text_Format_Horizontal_Alignment_Auto_Type;
  TEfl_Text_Format_Horizontal_Alignment_Auto_Type = longint;

const
  EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_NONE = 0;
  EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_AUTO = 1;
  EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_LOCALE = 2;
  EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_OPPOSITE = 3;

function EFL_TEXT_FORMAT_INTERFACE: PEfl_Class;

function efl_text_format_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_text_ellipsis_set(obj: PEo; value: double); cdecl; external libefl;
function efl_text_ellipsis_get(obj: PEo): double; cdecl; external libefl;
procedure efl_text_wrap_set(obj: PEo; wrap: TEfl_Text_Format_Wrap); cdecl; external libefl;
function efl_text_wrap_get(obj: PEo): TEfl_Text_Format_Wrap; cdecl; external libefl;
procedure efl_text_multiline_set(obj: PEo; enabled: TEina_Bool); cdecl; external libefl;
function efl_text_multiline_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_text_horizontal_align_auto_type_set(obj: PEo; value: TEfl_Text_Format_Horizontal_Alignment_Auto_Type); cdecl; external libefl;
function efl_text_horizontal_align_auto_type_get(obj: PEo): TEfl_Text_Format_Horizontal_Alignment_Auto_Type; cdecl; external libefl;
procedure efl_text_horizontal_align_set(obj: PEo; value: double); cdecl; external libefl;
function efl_text_horizontal_align_get(obj: PEo): double; cdecl; external libefl;
procedure efl_text_vertical_align_set(obj: PEo; value: double); cdecl; external libefl;
function efl_text_vertical_align_get(obj: PEo): double; cdecl; external libefl;
procedure efl_text_line_gap_set(obj: PEo; value: double); cdecl; external libefl;
function efl_text_line_gap_get(obj: PEo): double; cdecl; external libefl;
procedure efl_text_line_rel_gap_set(obj: PEo; value: double); cdecl; external libefl;
function efl_text_line_rel_gap_get(obj: PEo): double; cdecl; external libefl;
procedure efl_text_tab_stops_set(obj: PEo; value: longint); cdecl; external libefl;
function efl_text_tab_stops_get(obj: PEo): longint; cdecl; external libefl;
procedure efl_text_password_set(obj: PEo; enabled: TEina_Bool); cdecl; external libefl;
function efl_text_password_get(obj: PEo): TEina_Bool; cdecl; external libefl;
procedure efl_text_replacement_char_set(obj: PEo; repch: pchar); cdecl; external libefl;
function efl_text_replacement_char_get(obj: PEo): pchar; cdecl; external libefl;

// === Konventiert am: 18-5-25 19:36:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_TEXT_FORMAT_INTERFACE: PEfl_Class;
begin
  EFL_TEXT_FORMAT_INTERFACE := efl_text_format_interface_get;
end;


{$ENDIF read_implementation}
