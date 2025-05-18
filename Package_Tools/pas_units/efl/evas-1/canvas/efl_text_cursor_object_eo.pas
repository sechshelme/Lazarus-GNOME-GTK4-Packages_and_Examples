unit efl_text_cursor_object_eo;

interface

uses
  ctypes, efl, fp_eina,fp_eo, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Text_Cursor_Object = ^TEfl_Text_Cursor_Object;
  TEfl_Text_Cursor_Object = TEo;

type
  PEfl_Text_Cursor_Type = ^TEfl_Text_Cursor_Type;
  TEfl_Text_Cursor_Type = longint;

const
  EFL_TEXT_CURSOR_TYPE_BEFORE = 0;
  EFL_TEXT_CURSOR_TYPE_UNDER = 1;

type
  PEfl_Text_Cursor_Move_Type = ^TEfl_Text_Cursor_Move_Type;
  TEfl_Text_Cursor_Move_Type = longint;

const
  EFL_TEXT_CURSOR_MOVE_TYPE_CHARACTER_NEXT = 0;
  EFL_TEXT_CURSOR_MOVE_TYPE_CHARACTER_PREVIOUS = 1;
  EFL_TEXT_CURSOR_MOVE_TYPE_CLUSTER_NEXT = 2;
  EFL_TEXT_CURSOR_MOVE_TYPE_CLUSTER_PREVIOUS = 3;
  EFL_TEXT_CURSOR_MOVE_TYPE_PARAGRAPH_START = 4;
  EFL_TEXT_CURSOR_MOVE_TYPE_PARAGRAPH_END = 5;
  EFL_TEXT_CURSOR_MOVE_TYPE_WORD_START = 6;
  EFL_TEXT_CURSOR_MOVE_TYPE_WORD_END = 7;
  EFL_TEXT_CURSOR_MOVE_TYPE_LINE_START = 8;
  EFL_TEXT_CURSOR_MOVE_TYPE_LINE_END = 9;
  EFL_TEXT_CURSOR_MOVE_TYPE_FIRST = 10;
  EFL_TEXT_CURSOR_MOVE_TYPE_LAST = 11;
  EFL_TEXT_CURSOR_MOVE_TYPE_PARAGRAPH_NEXT = 12;
  EFL_TEXT_CURSOR_MOVE_TYPE_PARAGRAPH_PREVIOUS = 13;

function EFL_TEXT_CURSOR_OBJECT_CLASS: PEfl_Class;

function efl_text_cursor_object_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_text_cursor_object_position_set(obj: PEo; position: longint); cdecl; external libevas;
function efl_text_cursor_object_position_get(obj: PEo): longint; cdecl; external libevas;
function efl_text_cursor_object_content_get(obj: PEo): TEina_Unicode; cdecl; external libevas;
function efl_text_cursor_object_content_geometry_get(obj: PEo): TEina_Rect; cdecl; external libevas;
procedure efl_text_cursor_object_line_number_set(obj: PEo; line_number: longint); cdecl; external libevas;
function efl_text_cursor_object_line_number_get(obj: PEo): longint; cdecl; external libevas;
function efl_text_cursor_object_cursor_geometry_get(obj: PEo; ctype: TEfl_Text_Cursor_Type): TEina_Rect; cdecl; external libevas;
function efl_text_cursor_object_lower_cursor_geometry_get(obj: PEo; geometry: PEina_Rect): TEina_Bool; cdecl; external libevas;
function efl_text_cursor_object_equal(obj: PEo; dst: PEfl_Text_Cursor_Object): TEina_Bool; cdecl; external libevas;
function efl_text_cursor_object_compare(obj: PEo; dst: PEfl_Text_Cursor_Object): longint; cdecl; external libevas;
function efl_text_cursor_object_move(obj: PEo; _type: TEfl_Text_Cursor_Move_Type): TEina_Bool; cdecl; external libevas;
procedure efl_text_cursor_object_char_delete(obj: PEo); cdecl; external libevas;
function efl_text_cursor_object_line_jump_by(obj: PEo; by: longint): TEina_Bool; cdecl; external libevas;
procedure efl_text_cursor_object_char_coord_set(obj: PEo; coord: TEina_Position2D); cdecl; external libevas;
procedure efl_text_cursor_object_cluster_coord_set(obj: PEo; coord: TEina_Position2D); cdecl; external libevas;
procedure efl_text_cursor_object_text_insert(obj: PEo; text: pchar); cdecl; external libevas;
procedure efl_text_cursor_object_markup_insert(obj: PEo; markup: pchar); cdecl; external libevas;
function efl_text_cursor_object_range_markup_get(obj: PEo; cur2: PEfl_Text_Cursor_Object): pchar; cdecl; external libevas;
function efl_text_cursor_object_range_text_get(obj: PEo; cur2: PEfl_Text_Cursor_Object): pchar; cdecl; external libevas;
function efl_text_cursor_object_range_geometry_get(obj: PEo; cur2: PEfl_Text_Cursor_Object): PEina_Iterator; cdecl; external libevas;
function efl_text_cursor_object_range_precise_geometry_get(obj: PEo; cur2: PEfl_Text_Cursor_Object): PEina_Iterator; cdecl; external libevas;
procedure efl_text_cursor_object_range_delete(obj: PEo; cur2: PEfl_Text_Cursor_Object); cdecl; external libevas;
function efl_text_cursor_object_text_object_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libevas;

var
  _EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED: TEfl_Event_Description; cvar;external libevas;

function EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED: PEfl_Event_Description;


// === Konventiert am: 13-5-25 15:36:41 ===


implementation


function EFL_TEXT_CURSOR_OBJECT_CLASS: PEfl_Class;
begin
  EFL_TEXT_CURSOR_OBJECT_CLASS := efl_text_cursor_object_class_get;
end;

function EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED: PEfl_Event_Description;
begin
  EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED := @_EFL_TEXT_CURSOR_OBJECT_EVENT_CHANGED;
end;


end.
