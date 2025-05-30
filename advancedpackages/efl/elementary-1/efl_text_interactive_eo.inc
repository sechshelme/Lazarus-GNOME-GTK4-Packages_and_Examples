{$IFDEF read_interface}


type
  PEfl_Text_Interactive = ^TEfl_Text_Interactive;
  TEfl_Text_Interactive = TEo;

function EFL_TEXT_INTERACTIVE_INTERFACE: PEfl_Class;

function efl_text_interactive_interface_get: PEfl_Class; cdecl; external libelementary;
function efl_text_interactive_main_cursor_get(obj: PEo): PEfl_Text_Cursor_Object; cdecl; external libelementary;
procedure efl_text_interactive_selection_allowed_set(obj: PEo; allowed: TEina_Bool); cdecl; external libelementary;
function efl_text_interactive_selection_allowed_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_text_interactive_selection_cursors_set(obj: PEo; start: PEfl_Text_Cursor_Object; end_: PEfl_Text_Cursor_Object); cdecl; external libelementary;
procedure efl_text_interactive_selection_cursors_get(obj: PEo; start: PPEfl_Text_Cursor_Object; end_: PPEfl_Text_Cursor_Object); cdecl; external libelementary;
procedure efl_text_interactive_editable_set(obj: PEo; editable: TEina_Bool); cdecl; external libelementary;
function efl_text_interactive_editable_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_text_interactive_all_unselect(obj: PEo); cdecl; external libelementary;
procedure efl_text_interactive_all_select(obj: PEo); cdecl; external libelementary;
function efl_text_interactive_have_selection_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

var
  _EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST: TEfl_Event_Description; cvar;external libelementary;
  _EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST: TEfl_Event_Description; cvar;external libelementary;
  _EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER: TEfl_Event_Description; cvar;external libelementary;

function EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED: PEfl_Event_Description;
function EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED: PEfl_Event_Description;
function EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED: PEfl_Event_Description;
function EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST: PEfl_Event_Description;
function EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST: PEfl_Event_Description;
function EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER: PEfl_Event_Description;

// === Konventiert am: 28-5-25 19:25:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_TEXT_INTERACTIVE_INTERFACE: PEfl_Class;
begin
  EFL_TEXT_INTERACTIVE_INTERFACE := efl_text_interactive_interface_get;
end;

function EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED: PEfl_Event_Description;
begin
  EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED := @(_EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED);
end;

function EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED: PEfl_Event_Description;
begin
  EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED := @(_EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED);
end;

function EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED: PEfl_Event_Description;
begin
  EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED := @(_EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED);
end;

function EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST: PEfl_Event_Description;
begin
  EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST := @(_EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST);
end;

function EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST: PEfl_Event_Description;
begin
  EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST := @(_EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST);
end;

function EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER: PEfl_Event_Description;
begin
  EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER := @(_EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER);
end;


{$ENDIF read_implementation}
