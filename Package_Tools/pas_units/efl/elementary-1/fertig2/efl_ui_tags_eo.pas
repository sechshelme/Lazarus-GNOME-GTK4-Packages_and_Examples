unit efl_ui_tags_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Tags = ^TEfl_Ui_Tags;
  TEfl_Ui_Tags = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TAGS_CLASS: PEfl_Class;

function efl_ui_tags_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_tags_editable_set(obj: PEo; editable: TEina_Bool); cdecl; external libelementary;
function efl_ui_tags_editable_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_tags_expanded_set(obj: PEo; expanded: TEina_Bool); cdecl; external libelementary;
function efl_ui_tags_expanded_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_tags_items_set(obj: PEo; items: PEina_Array); cdecl; external libelementary;
function efl_ui_tags_items_get(obj: PEo): PEina_Array; cdecl; external libelementary;

var
  _EFL_UI_TAGS_EVENT_ITEM_SELECTED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TAGS_EVENT_ITEM_ADDED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TAGS_EVENT_ITEM_DELETED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TAGS_EVENT_ITEM_CLICKED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TAGS_EVENT_EXPANDED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TAGS_EVENT_CONTRACTED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_TAGS_EVENT_ITEM_SELECTED: PEfl_Event_Description;
function EFL_UI_TAGS_EVENT_ITEM_ADDED: PEfl_Event_Description;
function EFL_UI_TAGS_EVENT_ITEM_DELETED: PEfl_Event_Description;
function EFL_UI_TAGS_EVENT_ITEM_CLICKED: PEfl_Event_Description;
function EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED: PEfl_Event_Description;
function EFL_UI_TAGS_EVENT_EXPANDED: PEfl_Event_Description;
function EFL_UI_TAGS_EVENT_CONTRACTED: PEfl_Event_Description;
function EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 29-5-25 19:47:09 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TAGS_CLASS: PEfl_Class;
begin
  EFL_UI_TAGS_CLASS := efl_ui_tags_class_get;
end;

function EFL_UI_TAGS_EVENT_ITEM_SELECTED: PEfl_Event_Description;
begin
  EFL_UI_TAGS_EVENT_ITEM_SELECTED := @(_EFL_UI_TAGS_EVENT_ITEM_SELECTED);
end;

function EFL_UI_TAGS_EVENT_ITEM_ADDED: PEfl_Event_Description;
begin
  EFL_UI_TAGS_EVENT_ITEM_ADDED := @(_EFL_UI_TAGS_EVENT_ITEM_ADDED);
end;

function EFL_UI_TAGS_EVENT_ITEM_DELETED: PEfl_Event_Description;
begin
  EFL_UI_TAGS_EVENT_ITEM_DELETED := @(_EFL_UI_TAGS_EVENT_ITEM_DELETED);
end;

function EFL_UI_TAGS_EVENT_ITEM_CLICKED: PEfl_Event_Description;
begin
  EFL_UI_TAGS_EVENT_ITEM_CLICKED := @(_EFL_UI_TAGS_EVENT_ITEM_CLICKED);
end;

function EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED: PEfl_Event_Description;
begin
  EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED := @(_EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED);
end;

function EFL_UI_TAGS_EVENT_EXPANDED: PEfl_Event_Description;
begin
  EFL_UI_TAGS_EVENT_EXPANDED := @(_EFL_UI_TAGS_EVENT_EXPANDED);
end;

function EFL_UI_TAGS_EVENT_CONTRACTED: PEfl_Event_Description;
begin
  EFL_UI_TAGS_EVENT_CONTRACTED := @(_EFL_UI_TAGS_EVENT_CONTRACTED);
end;

function EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED := @(_EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED);
end;
{$endif}


end.
