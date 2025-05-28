{$IFDEF read_interface}


type
  PElm_Datetime_Field_Type = ^TElm_Datetime_Field_Type;
  TElm_Datetime_Field_Type = longint;

const
  ELM_DATETIME_YEAR = 0;
  ELM_DATETIME_MONTH = 1;
  ELM_DATETIME_DATE = 2;
  ELM_DATETIME_HOUR = 3;
  ELM_DATETIME_MINUTE = 4;
  ELM_DATETIME_AMPM = 5;

type
  PElm_Datetime = ^TElm_Datetime;
  TElm_Datetime = TEo;

function elm_datetime_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_datetime_format_set(obj: PEvas_Object; fmt: pchar); cdecl; external libelementary;
function elm_datetime_format_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_datetime_field_limit_set(obj: PEvas_Object; _type: TElm_Datetime_Field_Type; min: longint; max: longint); cdecl; external libelementary;
procedure elm_datetime_field_limit_get(obj: PEvas_Object; fieldtype: TElm_Datetime_Field_Type; min: Plongint; max: Plongint); cdecl; external libelementary;
function elm_datetime_value_min_set(obj: PEvas_Object; mintime: PEfl_Time): TEina_Bool; cdecl; external libelementary;
function elm_datetime_value_min_get(obj: PEvas_Object; mintime: PEfl_Time): TEina_Bool; cdecl; external libelementary;
function elm_datetime_value_set(obj: PEvas_Object; newtime: PEfl_Time): TEina_Bool; cdecl; external libelementary;
function elm_datetime_value_get(obj: PEvas_Object; currtime: PEfl_Time): TEina_Bool; cdecl; external libelementary;
procedure elm_datetime_field_visible_set(obj: PEvas_Object; fieldtype: TElm_Datetime_Field_Type; visible: TEina_Bool); cdecl; external libelementary;
function elm_datetime_field_visible_get(obj: PEvas_Object; fieldtype: TElm_Datetime_Field_Type): TEina_Bool; cdecl; external libelementary;
function elm_datetime_value_max_set(obj: PEvas_Object; maxtime: PEfl_Time): TEina_Bool; cdecl; external libelementary;
function elm_datetime_value_max_get(obj: PEvas_Object; maxtime: PEfl_Time): TEina_Bool; cdecl; external libelementary;

function ELM_DATETIME_EVENT_CHANGED: PEfl_Event_Description;


// === Konventiert am: 26-5-25 17:31:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function ELM_DATETIME_EVENT_CHANGED: PEfl_Event_Description;
begin
  Result := ELM_CLOCK_EVENT_CHANGED;
end;

{$ENDIF read_implementation}
