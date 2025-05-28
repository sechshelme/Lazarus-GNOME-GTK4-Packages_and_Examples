{$IFDEF read_interface}


type
  PElm_Access_Info_Type = ^TElm_Access_Info_Type;
  TElm_Access_Info_Type = longint;

const
  ELM_ACCESS_INFO_FIRST = -(1);
  ELM_ACCESS_INFO = (-(1)) + 1;
  ELM_ACCESS_TYPE = (-(1)) + 2;
  ELM_ACCESS_STATE = (-(1)) + 3;
  ELM_ACCESS_CONTEXT_INFO = (-(1)) + 4;
  ELM_ACCESS_INFO_LAST = (-(1)) + 5;

type
  PElm_Access_Action_Type = ^TElm_Access_Action_Type;
  TElm_Access_Action_Type = longint;

const
  ELM_ACCESS_ACTION_FIRST = -(1);
  ELM_ACCESS_ACTION_HIGHLIGHT = (-(1)) + 1;
  ELM_ACCESS_ACTION_UNHIGHLIGHT = (-(1)) + 2;
  ELM_ACCESS_ACTION_HIGHLIGHT_NEXT = (-(1)) + 3;
  ELM_ACCESS_ACTION_HIGHLIGHT_PREV = (-(1)) + 4;
  ELM_ACCESS_ACTION_ACTIVATE = (-(1)) + 5;
  ELM_ACCESS_ACTION_SCROLL = (-(1)) + 6;
  ELM_ACCESS_ACTION_UP = (-(1)) + 7;
  ELM_ACCESS_ACTION_DOWN = (-(1)) + 8;
  ELM_ACCESS_ACTION_BACK = (-(1)) + 9;
  ELM_ACCESS_ACTION_READ = (-(1)) + 10;
  ELM_ACCESS_ACTION_LAST = (-(1)) + 11;

type
  PElm_Access_Action_Info = ^TElm_Access_Action_Info;

  TElm_Access_Action_Info = bitpacked record
    x: TEvas_Coord;
    y: TEvas_Coord;
    mouse_type: dword;
    action_type: TElm_Access_Action_Type;
    action_by: TElm_Access_Action_Type;
    highlight_cycle: 0..1;
  end;

type
  TElm_Highlight_Direction = longint;

const
  ELM_HIGHLIGHT_DIR_FIRST = -(1);
  ELM_HIGHLIGHT_DIR_NEXT = (-(1)) + 1;
  ELM_HIGHLIGHT_DIR_PREVIOUS = (-(1)) + 2;

type
  PElm_Highlight_Direction = ^TElm_Highlight_Direction;

  TElm_Access_Action_Cb = function(data: pointer; obj: PEvas_Object; action_info: PElm_Access_Action_Info): TEina_Bool; cdecl;

  PElm_Access_Info_Cb = ^TElm_Access_Info_Cb;
  TElm_Access_Info_Cb = function(data: pointer; obj: PEvas_Object): pchar; cdecl;

  TElm_Access_Activate_Cb = procedure(data: pointer; part_obj: PEvas_Object; item: PElm_Object_Item); cdecl;

function elm_access_object_register(obj: PEvas_Object; parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_access_object_unregister(obj: PEvas_Object); cdecl; external libelementary;
function elm_access_object_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_access_info_set(obj: PEvas_Object; _type: longint; text: pchar); cdecl; external libelementary;
function elm_access_info_get(obj: PEvas_Object; _type: longint): pchar; cdecl; external libelementary;
procedure elm_access_info_cb_set(obj: PEvas_Object; _type: longint; func: TElm_Access_Info_Cb; data: pointer); cdecl; external libelementary;
procedure elm_access_activate_cb_set(obj: PEvas_Object; func: TElm_Access_Activate_Cb; data: pointer); cdecl; external libelementary;
procedure elm_access_say(text: pchar); cdecl; external libelementary;
procedure elm_access_highlight_set(obj: PEvas_Object); cdecl; external libelementary;
function elm_access_action(obj: PEvas_Object; _type: TElm_Access_Action_Type; action_info: PElm_Access_Action_Info): TEina_Bool; cdecl; external libelementary;
procedure elm_access_action_cb_set(obj: PEvas_Object; _type: TElm_Access_Action_Type; cb: TElm_Access_Action_Cb; data: pointer); cdecl; external libelementary;
procedure elm_access_highlight_next_set(obj: PEvas_Object; dir: TElm_Highlight_Direction; next: PEvas_Object); cdecl; external libelementary;

// === Konventiert am: 25-5-25 19:08:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
