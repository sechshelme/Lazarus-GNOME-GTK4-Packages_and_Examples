unit elm_cnp;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_widget_item_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  ELM_CNP_EVENT_SELECTION_CHANGED: longint; cvar;external libelementary;

type
  PElm_Sel_Type = ^TElm_Sel_Type;
  TElm_Sel_Type = longint;

const
  ELM_SEL_TYPE_PRIMARY = 0;
  ELM_SEL_TYPE_SECONDARY = 1;
  ELM_SEL_TYPE_XDND = 2;
  ELM_SEL_TYPE_CLIPBOARD = 3;

type
  PElm_Sel_Format = ^TElm_Sel_Format;
  TElm_Sel_Format = longint;

const
  ELM_SEL_FORMAT_TARGETS = -(1);
  ELM_SEL_FORMAT_NONE = 0;
  ELM_SEL_FORMAT_TEXT = 1;
  ELM_SEL_FORMAT_MARKUP = 2;
  ELM_SEL_FORMAT_IMAGE = 4;
  ELM_SEL_FORMAT_VCARD = 8;
  ELM_SEL_FORMAT_HTML = 16;
  ELM_SEL_FORMAT_URILIST = 32;

type
  PElm_Xdnd_Action = ^TElm_Xdnd_Action;
  TElm_Xdnd_Action = longint;

const
  ELM_XDND_ACTION_UNKNOWN = 0;
  ELM_XDND_ACTION_COPY = 1;
  ELM_XDND_ACTION_MOVE = 2;
  ELM_XDND_ACTION_PRIVATE = 3;
  ELM_XDND_ACTION_ASK = 4;
  ELM_XDND_ACTION_LIST = 5;
  ELM_XDND_ACTION_LINK = 6;
  ELM_XDND_ACTION_DESCRIPTION = 7;

type
  TElm_Selection_Data = record
    x: TEvas_Coord;
    y: TEvas_Coord;
    format: TElm_Sel_Format;
    data: pointer;
    len: Tsize_t;
    action: TElm_Xdnd_Action;
  end;
  PElm_Selection_Data = ^TElm_Selection_Data;

  TElm_Cnp_Event_Selection_Changed = record
    _type: TElm_Sel_Type;
    seat_id: dword;
    display: pointer;
    exists: TEina_Bool;
  end;
  PElm_Cnp_Event_Selection_Changed = ^TElm_Cnp_Event_Selection_Changed;

  TElm_Drop_Cb = function(data: pointer; obj: PEvas_Object; ev: PElm_Selection_Data): TEina_Bool; cdecl;

  PElm_Xy_Item_Get_Cb = ^TElm_Xy_Item_Get_Cb;
  TElm_Xy_Item_Get_Cb = function(obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord; xposret: Plongint; yposret: Plongint): PElm_Object_Item; cdecl;

  TElm_Selection_Loss_Cb = procedure(data: pointer; selection: TElm_Sel_Type); cdecl;

  PElm_Drag_Icon_Create_Cb = ^TElm_Drag_Icon_Create_Cb;
  TElm_Drag_Icon_Create_Cb = function(data: pointer; win: PEvas_Object; xoff: PEvas_Coord; yoff: PEvas_Coord): PEvas_Object; cdecl;

  TElm_Drag_State = procedure(data: pointer; obj: PEvas_Object); cdecl;
  TElm_Drag_Done = procedure(data: pointer; obj: PEvas_Object; accepted: TEina_Bool); cdecl;
  TElm_Drag_Accept = procedure(data: pointer; obj: PEvas_Object; doaccept: TEina_Bool); cdecl;
  TElm_Drag_Pos = procedure(data: pointer; obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord; action: TElm_Xdnd_Action); cdecl;
  TElm_Drag_Start = procedure(data: pointer; obj: PEvas_Object); cdecl;

function elm_cnp_selection_set(obj: PEvas_Object; selection: TElm_Sel_Type; format: TElm_Sel_Format; buf: pointer; buflen: Tsize_t): TEina_Bool; cdecl; external libelementary;
function elm_cnp_selection_get(obj: PEvas_Object; selection: TElm_Sel_Type; format: TElm_Sel_Format; datacb: TElm_Drop_Cb; udata: pointer): TEina_Bool; cdecl; external libelementary;
function elm_object_cnp_selection_clear(obj: PEvas_Object; selection: TElm_Sel_Type): TEina_Bool; cdecl; external libelementary;
procedure elm_cnp_selection_loss_callback_set(obj: PEvas_Object; selection: TElm_Sel_Type; func: TElm_Selection_Loss_Cb; data: pointer); cdecl; external libelementary;
function elm_cnp_clipboard_selection_has_owner(win: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_drop_target_add(obj: PEvas_Object; format: TElm_Sel_Format; entercb: TElm_Drag_State; enterdata: pointer; leavecb: TElm_Drag_State;
  leavedata: pointer; poscb: TElm_Drag_Pos; posdata: pointer; dropcb: TElm_Drop_Cb; dropdata: pointer): TEina_Bool; cdecl; external libelementary;
function elm_drop_target_del(obj: PEvas_Object; format: TElm_Sel_Format; entercb: TElm_Drag_State; enterdata: pointer; leavecb: TElm_Drag_State;
  leavedata: pointer; poscb: TElm_Drag_Pos; posdata: pointer; dropcb: TElm_Drop_Cb; dropdata: pointer): TEina_Bool; cdecl; external libelementary;
function elm_drag_start(obj: PEvas_Object; format: TElm_Sel_Format; data: pchar; action: TElm_Xdnd_Action; createicon: TElm_Drag_Icon_Create_Cb;
  createdata: pointer; dragpos: TElm_Drag_Pos; dragdata: pointer; acceptcb: TElm_Drag_Accept; acceptdata: pointer;
  dragdone: TElm_Drag_State; donecbdata: pointer): TEina_Bool; cdecl; external libelementary;
function elm_drag_cancel(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_drag_action_set(obj: PEvas_Object; action: TElm_Xdnd_Action): TEina_Bool; cdecl; external libelementary;

type
  TElm_Drag_Item_Container_Pos = procedure(data: pointer; cont: PEvas_Object; it: PElm_Object_Item; x: TEvas_Coord; y: TEvas_Coord;
    xposret: longint; yposret: longint; action: TElm_Xdnd_Action); cdecl;
  TElm_Drop_Item_Container_Cb = function(data: pointer; obj: PEvas_Object; it: PElm_Object_Item; ev: PElm_Selection_Data; xposret: longint;
    yposret: longint): TEina_Bool; cdecl;

  TElm_Drag_User_Info = record
    format: TElm_Sel_Format;
    data: pchar;
    icons: PEina_List;
    action: TElm_Xdnd_Action;
    createicon: TElm_Drag_Icon_Create_Cb;
    createdata: pointer;
    dragstart: TElm_Drag_Start;
    startcbdata: pointer;
    dragpos: TElm_Drag_Pos;
    dragdata: pointer;
    acceptcb: TElm_Drag_Accept;
    acceptdata: pointer;
    dragdone: TElm_Drag_Done;
    donecbdata: pointer;
  end;
  PElm_Drag_User_Info = ^TElm_Drag_User_Info;

  TElm_Item_Container_Data_Get_Cb = function(obj: PEvas_Object; it: PElm_Object_Item; info: PElm_Drag_User_Info): TEina_Bool; cdecl;

function elm_drag_item_container_add(obj: PEvas_Object; tm_to_anim: double; tm_to_drag: double; itemgetcb: TElm_Xy_Item_Get_Cb; data_get: TElm_Item_Container_Data_Get_Cb): TEina_Bool; cdecl; external libelementary;
function elm_drag_item_container_del(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_drop_item_container_add(obj: PEvas_Object; format: TElm_Sel_Format; itemgetcb: TElm_Xy_Item_Get_Cb; entercb: TElm_Drag_State; enterdata: pointer;
  leavecb: TElm_Drag_State; leavedata: pointer; poscb: TElm_Drag_Item_Container_Pos; posdata: pointer; dropcb: TElm_Drop_Item_Container_Cb;
  dropdata: pointer): TEina_Bool; cdecl; external libelementary;
function elm_drop_item_container_del(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 26-5-25 13:35:39 ===


implementation



end.
