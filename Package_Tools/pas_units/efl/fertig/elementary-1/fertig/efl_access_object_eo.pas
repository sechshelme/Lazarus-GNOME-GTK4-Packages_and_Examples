unit efl_access_object_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Access_Object = ^TEfl_Access_Object;
  TEfl_Access_Object = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Access_Type = ^TEfl_Access_Type;
  TEfl_Access_Type = longint;

const
  EFL_ACCESS_TYPE_REGULAR = 0;
  EFL_ACCESS_TYPE_DISABLED = 1;
  EFL_ACCESS_TYPE_SKIPPED = 2;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Access_Role = ^TEfl_Access_Role;
  TEfl_Access_Role = longint;

const
  EFL_ACCESS_ROLE_INVALID = 0;
  EFL_ACCESS_ROLE_ACCELERATOR_LABEL = 1;
  EFL_ACCESS_ROLE_ALERT = 2;
  EFL_ACCESS_ROLE_ANIMATION = 3;
  EFL_ACCESS_ROLE_ARROW = 4;
  EFL_ACCESS_ROLE_CALENDAR = 5;
  EFL_ACCESS_ROLE_CANVAS = 6;
  EFL_ACCESS_ROLE_CHECK_BOX = 7;
  EFL_ACCESS_ROLE_CHECK_MENU_ITEM = 8;
  EFL_ACCESS_ROLE_COLOR_CHOOSER = 9;
  EFL_ACCESS_ROLE_COLUMN_HEADER = 10;
  EFL_ACCESS_ROLE_COMBO_BOX = 11;
  EFL_ACCESS_ROLE_DATE_EDITOR = 12;
  EFL_ACCESS_ROLE_DESKTOP_ICON = 13;
  EFL_ACCESS_ROLE_DESKTOP_FRAME = 14;
  EFL_ACCESS_ROLE_DIAL = 15;
  EFL_ACCESS_ROLE_DIALOG = 16;
  EFL_ACCESS_ROLE_DIRECTORY_PANE = 17;
  EFL_ACCESS_ROLE_DRAWING_AREA = 18;
  EFL_ACCESS_ROLE_FILE_CHOOSER = 19;
  EFL_ACCESS_ROLE_FILLER = 20;
  EFL_ACCESS_ROLE_FOCUS_TRAVERSABLE = 21;
  EFL_ACCESS_ROLE_FONT_CHOOSER = 22;
  EFL_ACCESS_ROLE_FRAME = 23;
  EFL_ACCESS_ROLE_GLASS_PANE = 24;
  EFL_ACCESS_ROLE_HTML_CONTAINER = 25;
  EFL_ACCESS_ROLE_ICON = 26;
  EFL_ACCESS_ROLE_IMAGE = 27;
  EFL_ACCESS_ROLE_INTERNAL_FRAME = 28;
  EFL_ACCESS_ROLE_LABEL = 29;
  EFL_ACCESS_ROLE_LAYERED_PANE = 30;
  EFL_ACCESS_ROLE_LIST = 31;
  EFL_ACCESS_ROLE_LIST_ITEM = 32;
  EFL_ACCESS_ROLE_MENU = 33;
  EFL_ACCESS_ROLE_MENU_BAR = 34;
  EFL_ACCESS_ROLE_MENU_ITEM = 35;
  EFL_ACCESS_ROLE_OPTION_PANE = 36;
  EFL_ACCESS_ROLE_PAGE_TAB = 37;
  EFL_ACCESS_ROLE_PAGE_TAB_LIST = 38;
  EFL_ACCESS_ROLE_PANEL = 39;
  EFL_ACCESS_ROLE_PASSWORD_TEXT = 40;
  EFL_ACCESS_ROLE_POPUP_MENU = 41;
  EFL_ACCESS_ROLE_PROGRESS_BAR = 42;
  EFL_ACCESS_ROLE_PUSH_BUTTON = 43;
  EFL_ACCESS_ROLE_RADIO_BUTTON = 44;
  EFL_ACCESS_ROLE_RADIO_MENU_ITEM = 45;
  EFL_ACCESS_ROLE_ROOT_PANE = 46;
  EFL_ACCESS_ROLE_ROW_HEADER = 47;
  EFL_ACCESS_ROLE_SCROLL_BAR = 48;
  EFL_ACCESS_ROLE_SCROLL_PANE = 49;
  EFL_ACCESS_ROLE_SEPARATOR = 50;
  EFL_ACCESS_ROLE_SLIDER = 51;
  EFL_ACCESS_ROLE_SPIN_BUTTON = 52;
  EFL_ACCESS_ROLE_SPLIT_PANE = 53;
  EFL_ACCESS_ROLE_STATUS_BAR = 54;
  EFL_ACCESS_ROLE_TABLE = 55;
  EFL_ACCESS_ROLE_TABLE_CELL = 56;
  EFL_ACCESS_ROLE_TABLE_COLUMN_HEADER = 57;
  EFL_ACCESS_ROLE_TABLE_ROW_HEADER = 58;
  EFL_ACCESS_ROLE_TEAROFF_MENU_ITEM = 59;
  EFL_ACCESS_ROLE_TERMINAL = 60;
  EFL_ACCESS_ROLE_TEXT = 61;
  EFL_ACCESS_ROLE_TOGGLE_BUTTON = 62;
  EFL_ACCESS_ROLE_TOOL_BAR = 63;
  EFL_ACCESS_ROLE_TOOL_TIP = 64;
  EFL_ACCESS_ROLE_TREE = 65;
  EFL_ACCESS_ROLE_TREE_TABLE = 66;
  EFL_ACCESS_ROLE_UNKNOWN = 67;
  EFL_ACCESS_ROLE_VIEWPORT = 68;
  EFL_ACCESS_ROLE_WINDOW = 69;
  EFL_ACCESS_ROLE_EXTENDED = 70;
  EFL_ACCESS_ROLE_HEADER = 71;
  EFL_ACCESS_ROLE_FOOTER = 72;
  EFL_ACCESS_ROLE_PARAGRAPH = 73;
  EFL_ACCESS_ROLE_RULER = 74;
  EFL_ACCESS_ROLE_APPLICATION = 75;
  EFL_ACCESS_ROLE_AUTOCOMPLETE = 76;
  EFL_ACCESS_ROLE_EDITBAR = 77;
  EFL_ACCESS_ROLE_EMBEDDED = 78;
  EFL_ACCESS_ROLE_ENTRY = 79;
  EFL_ACCESS_ROLE_CHART = 80;
  EFL_ACCESS_ROLE_CAPTION = 81;
  EFL_ACCESS_ROLE_DOCUMENT_FRAME = 82;
  EFL_ACCESS_ROLE_HEADING = 83;
  EFL_ACCESS_ROLE_PAGE = 84;
  EFL_ACCESS_ROLE_SECTION = 85;
  EFL_ACCESS_ROLE_REDUNDANT_OBJECT = 86;
  EFL_ACCESS_ROLE_FORM = 87;
  EFL_ACCESS_ROLE_LINK = 88;
  EFL_ACCESS_ROLE_INPUT_METHOD_WINDOW = 89;
  EFL_ACCESS_ROLE_TABLE_ROW = 90;
  EFL_ACCESS_ROLE_TREE_ITEM = 91;
  EFL_ACCESS_ROLE_DOCUMENT_SPREADSHEET = 92;
  EFL_ACCESS_ROLE_DOCUMENT_PRESENTATION = 93;
  EFL_ACCESS_ROLE_DOCUMENT_TEXT = 94;
  EFL_ACCESS_ROLE_DOCUMENT_WEB = 95;
  EFL_ACCESS_ROLE_DOCUMENT_EMAIL = 96;
  EFL_ACCESS_ROLE_COMMENT = 97;
  EFL_ACCESS_ROLE_LIST_BOX = 98;
  EFL_ACCESS_ROLE_GROUPING = 99;
  EFL_ACCESS_ROLE_IMAGE_MAP = 100;
  EFL_ACCESS_ROLE_NOTIFICATION = 101;
  EFL_ACCESS_ROLE_INFO_BAR = 102;
  EFL_ACCESS_ROLE_LAST_DEFINED = 103;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Access_State_Type = ^TEfl_Access_State_Type;
  TEfl_Access_State_Type = longint;

const
  EFL_ACCESS_STATE_TYPE_INVALID = 0;
  EFL_ACCESS_STATE_TYPE_ACTIVE = 1;
  EFL_ACCESS_STATE_TYPE_ARMED = 2;
  EFL_ACCESS_STATE_TYPE_BUSY = 3;
  EFL_ACCESS_STATE_TYPE_CHECKED = 4;
  EFL_ACCESS_STATE_TYPE_COLLAPSED = 5;
  EFL_ACCESS_STATE_TYPE_DEFUNCT = 6;
  EFL_ACCESS_STATE_TYPE_EDITABLE = 7;
  EFL_ACCESS_STATE_TYPE_ENABLED = 8;
  EFL_ACCESS_STATE_TYPE_EXPANDABLE = 9;
  EFL_ACCESS_STATE_TYPE_EXPANDED = 10;
  EFL_ACCESS_STATE_TYPE_FOCUSABLE = 11;
  EFL_ACCESS_STATE_TYPE_FOCUSED = 12;
  EFL_ACCESS_STATE_TYPE_HAS_TOOLTIP = 13;
  EFL_ACCESS_STATE_TYPE_HORIZONTAL = 14;
  EFL_ACCESS_STATE_TYPE_MINIMIZED = 15;
  EFL_ACCESS_STATE_TYPE_MODAL = 16;
  EFL_ACCESS_STATE_TYPE_MULTI_LINE = 17;
  EFL_ACCESS_STATE_TYPE_MULTISELECTABLE = 18;
  EFL_ACCESS_STATE_TYPE_OPAQUE = 19;
  EFL_ACCESS_STATE_TYPE_PRESSED = 20;
  EFL_ACCESS_STATE_TYPE_RESIZABLE = 21;
  EFL_ACCESS_STATE_TYPE_SELECTABLE = 22;
  EFL_ACCESS_STATE_TYPE_SELECTED = 23;
  EFL_ACCESS_STATE_TYPE_SENSITIVE = 24;
  EFL_ACCESS_STATE_TYPE_SHOWING = 25;
  EFL_ACCESS_STATE_TYPE_SINGLE_LINE = 26;
  EFL_ACCESS_STATE_TYPE_STALE = 27;
  EFL_ACCESS_STATE_TYPE_TRANSIENT = 28;
  EFL_ACCESS_STATE_TYPE_VERTICAL = 29;
  EFL_ACCESS_STATE_TYPE_VISIBLE = 30;
  EFL_ACCESS_STATE_TYPE_MANAGES_DESCENDANTS = 31;
  EFL_ACCESS_STATE_TYPE_INDETERMINATE = 32;
  EFL_ACCESS_STATE_TYPE_REQUIRED = 33;
  EFL_ACCESS_STATE_TYPE_TRUNCATED = 34;
  EFL_ACCESS_STATE_TYPE_ANIMATED = 35;
  EFL_ACCESS_STATE_TYPE_INVALID_ENTRY = 36;
  EFL_ACCESS_STATE_TYPE_SUPPORTS_AUTOCOMPLETION = 37;
  EFL_ACCESS_STATE_TYPE_SELECTABLE_TEXT = 38;
  EFL_ACCESS_STATE_TYPE_IS_DEFAULT = 39;
  EFL_ACCESS_STATE_TYPE_VISITED = 40;
  EFL_ACCESS_STATE_TYPE_LAST_DEFINED = 41;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Access_Relation_Type = ^TEfl_Access_Relation_Type;
  TEfl_Access_Relation_Type = longint;

const
  EFL_ACCESS_RELATION_TYPE_NULL = 0;
  EFL_ACCESS_RELATION_TYPE_LABEL_FOR = 1;
  EFL_ACCESS_RELATION_TYPE_LABELLED_BY = 2;
  EFL_ACCESS_RELATION_TYPE_CONTROLLER_FOR = 3;
  EFL_ACCESS_RELATION_TYPE_CONTROLLED_BY = 4;
  EFL_ACCESS_RELATION_TYPE_MEMBER_OF = 5;
  EFL_ACCESS_RELATION_TYPE_TOOLTIP_FOR = 6;
  EFL_ACCESS_RELATION_TYPE_NODE_CHILD_OF = 7;
  EFL_ACCESS_RELATION_TYPE_NODE_PARENT_OF = 8;
  EFL_ACCESS_RELATION_TYPE_EXTENDED = 9;
  EFL_ACCESS_RELATION_TYPE_FLOWS_TO = 10;
  EFL_ACCESS_RELATION_TYPE_FLOWS_FROM = 11;
  EFL_ACCESS_RELATION_TYPE_SUBWINDOW_OF = 12;
  EFL_ACCESS_RELATION_TYPE_EMBEDS = 13;
  EFL_ACCESS_RELATION_TYPE_EMBEDDED_BY = 14;
  EFL_ACCESS_RELATION_TYPE_POPUP_FOR = 15;
  EFL_ACCESS_RELATION_TYPE_PARENT_WINDOW_OF = 16;
  EFL_ACCESS_RELATION_TYPE_DESCRIPTION_FOR = 17;
  EFL_ACCESS_RELATION_TYPE_DESCRIBED_BY = 18;
  EFL_ACCESS_RELATION_TYPE_LAST_DEFINED = 19;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Access_Reading_Info_Type = ^TEfl_Access_Reading_Info_Type;
  TEfl_Access_Reading_Info_Type = longint;

const
  EFL_ACCESS_READING_INFO_TYPE_NAME = 1;
  EFL_ACCESS_READING_INFO_TYPE_ROLE = 2;
  EFL_ACCESS_READING_INFO_TYPE_DESCRIPTION = 4;
  EFL_ACCESS_READING_INFO_TYPE_STATE = 8;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Access_State_Set = ^TEfl_Access_State_Set;
  TEfl_Access_State_Set = uint64;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Event_Handler = record
  end;
  PEfl_Access_Event_Handler = ^TEfl_Access_Event_Handler;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Event_State_Changed_Data = record
    _type: TEfl_Access_State_Type;
    new_value: TEina_Bool;
  end;
  PEfl_Access_Event_State_Changed_Data = ^TEfl_Access_Event_State_Changed_Data;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Event_Geometry_Changed_Data = record
    x: longint;
    y: longint;
    width: longint;
    height: longint;
  end;
  PEfl_Access_Event_Geometry_Changed_Data = ^TEfl_Access_Event_Geometry_Changed_Data;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Event_Children_Changed_Data = record
    is_added: TEina_Bool;
    child: PEfl_Object;
  end;
  PEfl_Access_Event_Children_Changed_Data = ^TEfl_Access_Event_Children_Changed_Data;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Attribute = record
    key: pchar;
    value: pchar;
  end;
  PEfl_Access_Attribute = ^TEfl_Access_Attribute;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  TEfl_Access_Relation = record
    _type: TEfl_Access_Relation_Type;
    objects: PEina_List;
  end;
  PEfl_Access_Relation = ^TEfl_Access_Relation;
  {$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_OBJECT_MIXIN: PEfl_Class;

function efl_access_object_mixin_get: PEfl_Class; cdecl; external libelementary;
function efl_access_object_localized_role_name_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_object_i18n_name_set(obj: PEo; i18n_name: pchar); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_i18n_name_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_relations_get(obj: PEo): PEina_Iterator; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_object_role_set(obj: PEo; role: TEfl_Access_Role); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_role_get(obj: PEo): TEfl_Access_Role; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_access_children_get(obj: PEo): PEina_List; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_role_name_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_attributes_get(obj: PEo): PEina_List; cdecl; external libelementary;
{$endif}

procedure efl_access_object_attribute_append(obj: PEo; key: pchar; value: pchar); cdecl; external libelementary;
procedure efl_access_object_attribute_del(obj: PEo; key: pchar); cdecl; external libelementary;
procedure efl_access_object_attributes_clear(obj: PEo); cdecl; external libelementary;
procedure efl_access_object_reading_info_type_set(obj: PEo; reading_info: TEfl_Access_Reading_Info_Type); cdecl; external libelementary;
function efl_access_object_reading_info_type_get(obj: PEo): TEfl_Access_Reading_Info_Type; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_index_in_parent_get(obj: PEo): longint; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_object_description_set(obj: PEo; description: pchar); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_description_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_state_set_get(obj: PEo): TEfl_Access_State_Set; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_event_handler_add(cb: TEfl_Event_Cb; data: pointer): PEfl_Access_Event_Handler; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_object_event_handler_del(handler: PEfl_Access_Event_Handler); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_object_event_emit(accessible: PEfl_Access_Object; event: PEfl_Event_Description; event_info: pointer); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_object_translation_domain_set(obj: PEo; domain: pchar); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_translation_domain_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_object_access_type_set(obj: PEo; _type: TEfl_Access_Type); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_access_type_get(obj: PEo): TEfl_Access_Type; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_relationship_append(obj: PEo; _type: TEfl_Access_Relation_Type; relation_object: PEfl_Access_Object): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_object_relationship_remove(obj: PEo; _type: TEfl_Access_Relation_Type; relation_object: PEfl_Access_Object); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_access_object_relationships_clear(obj: PEo); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_access_object_access_root_get: PEfl_Object; cdecl; external libelementary;
{$endif}

var
  _EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_OBJECT_EVENT_ADDED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_ACCESS_OBJECT_EVENT_REMOVED: TEfl_Event_Description; cvar;external libelementary;

function EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED: PEfl_Event_Description;
function EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED: PEfl_Event_Description;
function EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED: PEfl_Event_Description;
function EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED: PEfl_Event_Description;
function EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED: PEfl_Event_Description;
function EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED: PEfl_Event_Description;
function EFL_ACCESS_OBJECT_EVENT_ADDED: PEfl_Event_Description;
function EFL_ACCESS_OBJECT_EVENT_REMOVED: PEfl_Event_Description;

// === Konventiert am: 26-5-25 13:09:46 ===


implementation


function EFL_ACCESS_OBJECT_MIXIN: PEfl_Class;
begin
  EFL_ACCESS_OBJECT_MIXIN := efl_access_object_mixin_get;
end;

function EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED: PEfl_Event_Description;
begin
  EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED := @(_EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED);
end;

function EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED: PEfl_Event_Description;
begin
  EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED := @(_EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED);
end;

function EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED: PEfl_Event_Description;
begin
  EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED := @(_EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED);
end;

function EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED: PEfl_Event_Description;
begin
  EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED := @(_EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED);
end;

function EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED: PEfl_Event_Description;
begin
  EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED := @(_EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED);
end;

function EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED: PEfl_Event_Description;
begin
  EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED := @(_EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED);
end;

function EFL_ACCESS_OBJECT_EVENT_ADDED: PEfl_Event_Description;
begin
  EFL_ACCESS_OBJECT_EVENT_ADDED := @(_EFL_ACCESS_OBJECT_EVENT_ADDED);
end;

function EFL_ACCESS_OBJECT_EVENT_REMOVED: PEfl_Event_Description;
begin
  EFL_ACCESS_OBJECT_EVENT_REMOVED := @(_EFL_ACCESS_OBJECT_EVENT_REMOVED);
end;


end.
