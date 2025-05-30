{$IFDEF read_interface}


type
  PEfl_Ui_Textbox = ^TEfl_Ui_Textbox;
  TEfl_Ui_Textbox = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Textbox_Cnp_Content = ^TEfl_Ui_Textbox_Cnp_Content;
  TEfl_Ui_Textbox_Cnp_Content = longint;

const
  EFL_UI_TEXTBOX_CNP_CONTENT_NOTHING = 0;
  EFL_UI_TEXTBOX_CNP_CONTENT_TEXT = 1;
  EFL_UI_TEXTBOX_CNP_CONTENT_MARKUP = 3;
  EFL_UI_TEXTBOX_CNP_CONTENT_IMAGE = 4;
  {$endif}

function EFL_UI_TEXTBOX_CLASS: PEfl_Config;

function efl_ui_textbox_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_textbox_scrollable_set(obj: PEo; scroll: TEina_Bool); cdecl; external libelementary;
function efl_ui_textbox_scrollable_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_textbox_context_menu_enabled_set(obj: PEo; enabled: TEina_Bool); cdecl; external libelementary;
function efl_ui_textbox_context_menu_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_textbox_cnp_dnd_mode_set(obj: PEo; allowed_formats: TEfl_Ui_Textbox_Cnp_Content); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_textbox_cnp_dnd_mode_get(obj: PEo): TEfl_Ui_Textbox_Cnp_Content; cdecl; external libelementary;
{$endif}

procedure efl_ui_textbox_selection_handles_enabled_set(obj: PEo; enabled: TEina_Bool); cdecl; external libelementary;
function efl_ui_textbox_selection_handles_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_textbox_item_factory_set(obj: PEo; item_factory: PEfl_Canvas_Textblock_Factory); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_textbox_item_factory_get(obj: PEo): PEfl_Canvas_Textblock_Factory; cdecl; external libelementary;
{$endif}

function efl_ui_textbox_cursor_create(obj: PEo): PEfl_Text_Cursor_Object; cdecl; external libelementary;
procedure efl_ui_textbox_selection_copy(obj: PEo); cdecl; external libelementary;
procedure efl_ui_textbox_selection_paste(obj: PEo); cdecl; external libelementary;
procedure efl_ui_textbox_selection_cut(obj: PEo); cdecl; external libelementary;

var
  _EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TEXTBOX_EVENT_SELECTION_COPY: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TEXTBOX_EVENT_SELECTION_CUT: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TEXTBOX_EVENT_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE: PEfl_Event_Description;
function EFL_UI_TEXTBOX_EVENT_SELECTION_COPY: PEfl_Event_Description;
function EFL_UI_TEXTBOX_EVENT_SELECTION_CUT: PEfl_Event_Description;
function EFL_UI_TEXTBOX_EVENT_CHANGED: PEfl_Event_Description;
function EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN: PEfl_Event_Description;


// === Konventiert am: 28-5-25 17:40:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_TEXTBOX_CLASS: PEfl_Config;
begin
  EFL_UI_TEXTBOX_CLASS := efl_ui_textbox_class_get;
end;

function EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE: PEfl_Event_Description;
begin
  EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE := @(_EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE);
end;

function EFL_UI_TEXTBOX_EVENT_SELECTION_COPY: PEfl_Event_Description;
begin
  EFL_UI_TEXTBOX_EVENT_SELECTION_COPY := @(_EFL_UI_TEXTBOX_EVENT_SELECTION_COPY);
end;

function EFL_UI_TEXTBOX_EVENT_SELECTION_CUT: PEfl_Event_Description;
begin
  EFL_UI_TEXTBOX_EVENT_SELECTION_CUT := @(_EFL_UI_TEXTBOX_EVENT_SELECTION_CUT);
end;

function EFL_UI_TEXTBOX_EVENT_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_TEXTBOX_EVENT_CHANGED := @(_EFL_UI_TEXTBOX_EVENT_CHANGED);
end;

function EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN: PEfl_Event_Description;
begin
  EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN := @(_EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN);
end;


{$ENDIF read_implementation}
