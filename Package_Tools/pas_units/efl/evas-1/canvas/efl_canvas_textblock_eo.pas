unit efl_canvas_textblock_eo;

interface

uses
  ctypes, efl, eina_rectangle, eina_types, Evas_Common, efl_text_cursor_object_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Textblock = ^TEfl_Canvas_Textblock;
  TEfl_Canvas_Textblock = TEo;

function EFL_CANVAS_TEXTBLOCK_CLASS: PEfl_Class;

function efl_canvas_textblock_class_get: PEfl_Class; cdecl; external libevas;
function efl_canvas_textblock_is_empty_get(obj: PEo): TEina_Bool; cdecl; external libevas;
function efl_canvas_textblock_cursor_create(obj: PEo): PEfl_Text_Cursor_Object; cdecl; external libevas;
function efl_canvas_textblock_visible_range_get(obj: PEo; start: PEfl_Text_Cursor_Object; end_: PEfl_Text_Cursor_Object): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_textblock_style_insets_get(obj: PEo; l: Plongint; r: Plongint; t: Plongint; b: Plongint); cdecl; external libevas;
procedure efl_canvas_textblock_bidi_delimiters_set(obj: PEo; delim: pchar); cdecl; external libevas;
function efl_canvas_textblock_bidi_delimiters_get(obj: PEo): pchar; cdecl; external libevas;
procedure efl_canvas_textblock_newline_as_paragraph_separator_set(obj: PEo; mode: TEina_Bool); cdecl; external libevas;
function efl_canvas_textblock_newline_as_paragraph_separator_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_textblock_style_apply(obj: PEo; style: pchar); cdecl; external libevas;
function efl_canvas_textblock_all_styles_get(obj: PEo): pchar; cdecl; external libevas;
function efl_canvas_textblock_size_formatted_get(obj: PEo): TEina_Size2D; cdecl; external libevas;
function efl_canvas_textblock_size_native_get(obj: PEo): TEina_Size2D; cdecl; external libevas;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_textblock_obstacle_add(obj: PEo; eo_obs: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_canvas_textblock_obstacle_del(obj: PEo; eo_obs: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_canvas_textblock_obstacles_update(obj: PEo); cdecl; external libevas;
{$endif}
function efl_canvas_textblock_async_layout(obj: PEo): PEina_Future; cdecl; external libevas;

var
  _EFL_CANVAS_TEXTBLOCK_EVENT_CHANGED: TEfl_Event_Description; cvar;external libevas;
  _EFL_CANVAS_TEXTBLOCK_EVENT_LAYOUT_FINISHED: TEfl_Event_Description; cvar;external libevas;
  _EFL_CANVAS_TEXTBLOCK_EVENT_STYLE_INSETS_CHANGED: TEfl_Event_Description; cvar;external libevas;


function EFL_CANVAS_TEXTBLOCK_EVENT_CHANGED: PEfl_Event_Description;
function EFL_CANVAS_TEXTBLOCK_EVENT_LAYOUT_FINISHED: PEfl_Event_Description;
function EFL_CANVAS_TEXTBLOCK_EVENT_STYLE_INSETS_CHANGED: PEfl_Event_Description;

// === Konventiert am: 13-5-25 15:13:43 ===


implementation


function EFL_CANVAS_TEXTBLOCK_CLASS: PEfl_Class;
begin
  EFL_CANVAS_TEXTBLOCK_CLASS := efl_canvas_textblock_class_get;
end;


function EFL_CANVAS_TEXTBLOCK_EVENT_CHANGED: PEfl_Event_Description;
begin
  EFL_CANVAS_TEXTBLOCK_EVENT_CHANGED := @(_EFL_CANVAS_TEXTBLOCK_EVENT_CHANGED);
end;


function EFL_CANVAS_TEXTBLOCK_EVENT_LAYOUT_FINISHED: PEfl_Event_Description;
begin
  EFL_CANVAS_TEXTBLOCK_EVENT_LAYOUT_FINISHED := @(_EFL_CANVAS_TEXTBLOCK_EVENT_LAYOUT_FINISHED);
end;


function EFL_CANVAS_TEXTBLOCK_EVENT_STYLE_INSETS_CHANGED: PEfl_Event_Description;
begin
  EFL_CANVAS_TEXTBLOCK_EVENT_STYLE_INSETS_CHANGED := @(_EFL_CANVAS_TEXTBLOCK_EVENT_STYLE_INSETS_CHANGED);
end;


end.
