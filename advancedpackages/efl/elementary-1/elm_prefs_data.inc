{$IFDEF read_interface}


type
  PElm_Prefs_Reset_Mode = ^TElm_Prefs_Reset_Mode;
  TElm_Prefs_Reset_Mode = longint;

const
  ELM_PREFS_RESET_DEFAULTS = 0;
  ELM_PREFS_RESET_LAST = 1;

type
  PElm_Prefs_Item_Type = ^TElm_Prefs_Item_Type;
  TElm_Prefs_Item_Type = longint;

const
  ELM_PREFS_TYPE_UNKNOWN = 0;
  ELM_PREFS_TYPE_ACTION = 1;
  ELM_PREFS_TYPE_BOOL = 2;
  ELM_PREFS_TYPE_INT = 3;
  ELM_PREFS_TYPE_FLOAT = 4;
  ELM_PREFS_TYPE_LABEL = 5;
  ELM_PREFS_TYPE_DATE = 6;
  ELM_PREFS_TYPE_TEXT = 7;
  ELM_PREFS_TYPE_TEXTAREA = 8;
  ELM_PREFS_TYPE_PAGE = 9;
  ELM_PREFS_TYPE_RESET = 10;
  ELM_PREFS_TYPE_SAVE = 11;
  ELM_PREFS_TYPE_SEPARATOR = 12;
  ELM_PREFS_TYPE_SWALLOW = 13;

type
  PElm_Prefs_Data_Event_Type = ^TElm_Prefs_Data_Event_Type;
  TElm_Prefs_Data_Event_Type = longint;

const
  ELM_PREFS_DATA_EVENT_GROUP_AUTOSAVED = 0;
  ELM_PREFS_DATA_EVENT_ITEM_CHANGED = 1;
  ELM_PREFS_DATA_EVENT_LAST = 2;

type
  TElm_Prefs_Data = record
  end;
  PElm_Prefs_Data = ^TElm_Prefs_Data;

  TElm_Prefs_Data_Event_Cb = procedure(cb_data: pointer; _type: TElm_Prefs_Data_Event_Type; prefs_data: PElm_Prefs_Data; event_info: pointer); cdecl;

  TElm_Prefs_Data_Event_Changed = record
    key: pchar;
    value: PEina_Value;
  end;
  PElm_Prefs_Data_Event_Changed = ^TElm_Prefs_Data_Event_Changed;

function elm_prefs_data_new(data_file: pchar; key: pchar; mode: TEet_File_Mode): PElm_Prefs_Data; cdecl; external libelementary;
function elm_prefs_data_version_set(prefs_data: PElm_Prefs_Data; version: dword): TEina_Bool; cdecl; external libelementary;
function elm_prefs_data_version_get(prefs_data: PElm_Prefs_Data): dword; cdecl; external libelementary;
function elm_prefs_data_ref(prefs_data: PElm_Prefs_Data): PElm_Prefs_Data; cdecl; external libelementary;
procedure elm_prefs_data_unref(prefs_data: PElm_Prefs_Data); cdecl; external libelementary;
function elm_prefs_data_value_set(prefs_data: PElm_Prefs_Data; path: pchar; _type: TElm_Prefs_Item_Type; value: PEina_Value): TEina_Bool; cdecl; external libelementary;
function elm_prefs_data_value_get(prefs_data: PElm_Prefs_Data; path: pchar; _type: PElm_Prefs_Item_Type; value: PEina_Value): TEina_Bool; cdecl; external libelementary;
function elm_prefs_data_event_callback_add(prefs_data: PElm_Prefs_Data; _type: TElm_Prefs_Data_Event_Type; cb: TElm_Prefs_Data_Event_Cb; cb_data: pointer): TEina_Bool; cdecl; external libelementary;
function elm_prefs_data_event_callback_del(prefs_data: PElm_Prefs_Data; _type: TElm_Prefs_Data_Event_Type; cb: TElm_Prefs_Data_Event_Cb; cb_data: pointer): TEina_Bool; cdecl; external libelementary;
procedure elm_prefs_data_autosave_set(prefs_data: PElm_Prefs_Data; autosave: TEina_Bool); cdecl; external libelementary;
function elm_prefs_data_autosave_get(prefs_data: PElm_Prefs_Data): TEina_Bool; cdecl; external libelementary;
function elm_prefs_data_save(prefs_data: PElm_Prefs_Data; file_: pchar; key: pchar): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:44:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
