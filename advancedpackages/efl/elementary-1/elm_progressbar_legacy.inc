{$IFDEF read_interface}


type
  PElm_Progressbar = ^TElm_Progressbar;
  TElm_Progressbar = TEo;

function elm_progressbar_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_progressbar_span_size_set(obj: PEvas_Object; size: TEvas_Coord); cdecl; external libelementary;
function elm_progressbar_span_size_get(obj: PEvas_Object): TEvas_Coord; cdecl; external libelementary;
procedure elm_progressbar_value_set(obj: PEvas_Object; val: double); cdecl; external libelementary;
function elm_progressbar_value_get(obj: PEvas_Object): double; cdecl; external libelementary;
procedure elm_progressbar_inverted_set(obj: PEvas_Object; inverted: TEina_Bool); cdecl; external libelementary;
function elm_progressbar_inverted_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_progressbar_horizontal_set(obj: PEvas_Object; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_progressbar_horizontal_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_progressbar_unit_format_set(obj: PEvas_Object; units: pchar); cdecl; external libelementary;
function elm_progressbar_unit_format_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_progressbar_unit_format_function_set(obj: PEvas_Object; func: Tprogressbar_func_type; free_func: Tprogressbar_freefunc_type); cdecl; external libelementary;
procedure elm_progressbar_unit_format_function_set_full(obj: PEvas_Object; func: Tprogressbar_func_full_type; free_func: Tprogressbar_freefunc_type; data: pointer); cdecl; external libelementary;
procedure elm_progressbar_pulse_set(obj: PEvas_Object; pulse: TEina_Bool); cdecl; external libelementary;
function elm_progressbar_pulse_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_progressbar_pulse(obj: PEvas_Object; state: TEina_Bool); cdecl; external libelementary;
function elm_progressbar_is_pulsing_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_progressbar_part_value_set(obj: PEvas_Object; part: pchar; val: double); cdecl; external libelementary;
function elm_progressbar_part_value_get(obj: PEvas_Object; part: pchar): double; cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:31:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
