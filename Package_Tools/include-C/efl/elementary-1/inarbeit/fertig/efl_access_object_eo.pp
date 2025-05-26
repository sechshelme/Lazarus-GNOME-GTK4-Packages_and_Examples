
unit efl_access_object_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_object_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_object_eo.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PEfl_Access_Attribute  = ^Efl_Access_Attribute;
PEfl_Access_Event_Children_Changed_Data  = ^Efl_Access_Event_Children_Changed_Data;
PEfl_Access_Event_Geometry_Changed_Data  = ^Efl_Access_Event_Geometry_Changed_Data;
PEfl_Access_Event_Handler  = ^Efl_Access_Event_Handler;
PEfl_Access_Event_State_Changed_Data  = ^Efl_Access_Event_State_Changed_Data;
PEfl_Access_Object  = ^Efl_Access_Object;
PEfl_Access_Reading_Info_Type  = ^Efl_Access_Reading_Info_Type;
PEfl_Access_Relation  = ^Efl_Access_Relation;
PEfl_Access_Relation_Type  = ^Efl_Access_Relation_Type;
PEfl_Access_Role  = ^Efl_Access_Role;
PEfl_Access_State_Set  = ^Efl_Access_State_Set;
PEfl_Access_State_Type  = ^Efl_Access_State_Type;
PEfl_Access_Type  = ^Efl_Access_Type;
PEfl_Class  = ^Efl_Class;
PEfl_Event_Description  = ^Efl_Event_Description;
PEfl_Object  = ^Efl_Object;
PEina_Iterator  = ^Eina_Iterator;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCESS_OBJECT_EO_H_}
{$define _EFL_ACCESS_OBJECT_EO_H_}
{$ifndef _EFL_ACCESS_OBJECT_EO_CLASS_TYPE}
{$define _EFL_ACCESS_OBJECT_EO_CLASS_TYPE}
type
  PEfl_Access_Object = ^TEfl_Access_Object;
  TEfl_Access_Object = TEo;
{$endif}
{$ifndef _EFL_ACCESS_OBJECT_EO_TYPES}
{$define _EFL_ACCESS_OBJECT_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Type of accessibility object
 *
 * @ingroup Efl_Access_Type
  }
{*< default accessible object  }
{*< skip object and its children in accessibility
                             * hierarchy  }
{*< skip object in accessibility hierarchy  }
type
  PEfl_Access_Type = ^TEfl_Access_Type;
  TEfl_Access_Type =  Longint;
  Const
    EFL_ACCESS_TYPE_REGULAR = 0;
    EFL_ACCESS_TYPE_DISABLED = 1;
    EFL_ACCESS_TYPE_SKIPPED = 2;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Describes the role of an object visible to Accessibility Clients.
 *
 * @ingroup Efl_Access_Role
  }
{*< Role: invalid  }
{*< Role: accelerator label  }
{*< Role: alert  }
{*< Role: animation  }
{*< Role: arrow  }
{*< Role: calendar  }
{*< Role: canvas  }
{*< Role: check box  }
{*< Role: check menu item  }
{*< Role: color chooser  }
{*< Role: column header  }
{*< Role: combo box  }
{*< Role: data editor  }
{*< Role: desktop icon  }
{*< Role: desktop frame  }
{*< Role: dial  }
{*< Role: dialog  }
{*< Role: directory pane  }
{*< Role: drawing area  }
{*< Role: file chooser  }
{*< Role: filler  }
{*< Role: focus traversable  }
{*< Role: font chooser  }
{*< Role: frame  }
{*< Role: glass pane  }
{*< Role: HTML container  }
{*< Role: icon  }
{*< Role: image  }
{*< Role: internal frame  }
{*< Role: label  }
{*< Role: layered pane  }
{*< Role: list  }
{*< Role: list item  }
{*< Role: menu  }
{*< Role: menu bar  }
{*< Role: menu item  }
{*< Role: option pane  }
{*< Role: page tab  }
{*< Role: page tab list  }
{*< Role: panel  }
{*< Role: password text  }
{*< Role: popup menu  }
{*< Role: progress bar  }
{*< Role: push button  }
{*< Role: radio button  }
{*< Role: radio menu item  }
{*< Role: root pane  }
{*< Role: row header  }
{*< Role: scroll bar  }
{*< Role: scroll pane  }
{*< Role: separator  }
{*< Role: slider  }
{*< Role: spin button  }
{*< Role: split pane  }
{*< Role: status bar  }
{*< Role: table  }
{*< Role: table cell  }
{*< Role: table column header  }
{*< Role: table row header  }
{*< Role: tearoff menu item  }
{*< Role: terminal  }
{*< Role: text  }
{*< Role: toggle button  }
{*< Role: too bar  }
{*< Role: tool tip  }
{*< Role: tree  }
{*< Role: tree table  }
{*< Role: unknown  }
{*< Role: viewport  }
{*< Role: window  }
{*< Role: extended  }
{*< Role: header  }
{*< Role: footer  }
{*< Role: paragraph  }
{*< Role: ruler  }
{*< Role: application  }
{*< Role: autocomplete  }
{*< Role: editbar  }
{*< Role: embedded  }
{*< Role: entry  }
{*< Role: chart  }
{*< Role: caption  }
{*< Role: document frame  }
{*< Role: heading  }
{*< Role: page  }
{*< Role: section  }
{*< Role: redundant object  }
{*< Role: form  }
{*< Role: link  }
{*< Role: input method window  }
{*< Role: table row  }
{*< Role: table item  }
{*< Role: document spreadsheet  }
{*< Role: document presentation  }
{*< Role: document text  }
{*< Role: document web  }
{*< Role: document email  }
{*< Role: comment  }
{*< Role: list box  }
{*< Role: grouping  }
{*< Role: image map  }
{*< Role: notification  }
{*< Role: info bar  }
{*< Last enum entry sentinel  }
type
  PEfl_Access_Role = ^TEfl_Access_Role;
  TEfl_Access_Role =  Longint;
  Const
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
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Describes the possible states for an object visible to accessibility
 * clients.
 *
 * @ingroup Efl_Access_State_Type
  }
{*< State: invalid  }
{*< State: active  }
{*< State: armed  }
{*< State: busy  }
{*< State: checked  }
{*< State: collapsed  }
{*< State: defunct  }
{*< State: editable  }
{*< State: enabled  }
{*< State: expandable  }
{*< State: expanded  }
{*< State: focusable  }
{*< State: focused  }
{*< State: has a tooltip  }
{*< State: horizontal  }
{*< State: minimized  }
{*< State: modal  }
{*< State: multi line  }
{*< State: multiselectable  }
{*< State: opaque  }
{*< State: pressed  }
{*< State: resizable  }
{*< State: selectable  }
{*< State: selected  }
{*< State: sensitive  }
{*< State: showing  }
{*< State: single line  }
{*< State: stale  }
{*< State: transient  }
{*< State: vertical  }
{*< State: visible  }
{*< State: manage descendants  }
{*< State: indeterminate  }
{*< State: required  }
{*< State: truncated  }
{*< State: animated  }
{*< State: invalid entry  }
{*< State: supports
                                                  * autocompletion  }
{*< State: selectable text  }
{*< State: is default  }
{*< State: visited  }
{*< Last enum entry sentinel  }
type
  PEfl_Access_State_Type = ^TEfl_Access_State_Type;
  TEfl_Access_State_Type =  Longint;
  Const
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
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Describes the relationship between two objects.
 *
 * @ingroup Efl_Access_Relation_Type
  }
{*< No relation  }
{*< Label for relation  }
{*< Labelled by relation  }
{*< Controller for relation  }
{*< Controlled by relation  }
{*< Member of relation  }
{*< Tooltip for relation  }
{*< Node child of relation  }
{*< Node parent of relation  }
{*< Extended relation  }
{*< Flows to relation  }
{*< Flows from relation  }
{*< Subwindow of relation  }
{*< Embeds relation  }
{*< Embedded by relation  }
{*< Popup for relation  }
{*< Parent window of relation  }
{*< Description for relation  }
{*< Described by relation  }
{*< Last enum entry sentinel  }
type
  PEfl_Access_Relation_Type = ^TEfl_Access_Relation_Type;
  TEfl_Access_Relation_Type =  Longint;
  Const
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
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* The accessible Reading information type that can be read.
 *
 * @ingroup Efl_Access_Reading_Info_Type
  }
{ 1 >> 0  }{*< Name should be read
                                                        }
{ 1 >> 1  }{*< Role should be read
                                                        }
{ 1 >> 2  }{*< description should be read.  }
{ 1 >> 3  }{*< State should be read.
                                                        }
type
  PEfl_Access_Reading_Info_Type = ^TEfl_Access_Reading_Info_Type;
  TEfl_Access_Reading_Info_Type =  Longint;
  Const
    EFL_ACCESS_READING_INFO_TYPE_NAME = 1;
    EFL_ACCESS_READING_INFO_TYPE_ROLE = 2;
    EFL_ACCESS_READING_INFO_TYPE_DESCRIPTION = 4;
    EFL_ACCESS_READING_INFO_TYPE_STATE = 8;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessibility object state set.
 *
 * @ingroup Efl_Access_State_Set
  }
type
  PEfl_Access_State_Set = ^TEfl_Access_State_Set;
  TEfl_Access_State_Set = Tuint64_t;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessibility event listener
 *
 * @ingroup Efl_Access_Event_Handler
  }
type
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessibility state changed event data
 *
 * @ingroup Efl_Access_Event_State_Changed_Data
  }
{*< Type of the state changed event  }
{*< New value  }
type
  PEfl_Access_Event_State_Changed_Data = ^TEfl_Access_Event_State_Changed_Data;
  TEfl_Access_Event_State_Changed_Data = record
      _type : TEfl_Access_State_Type;
      new_value : TEina_Bool;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessibility geometry changed event data
 *
 * @ingroup Efl_Access_Event_Geometry_Changed_Data
  }
{*< X coordinate  }
{*< Y coordinate  }
{*< Width  }
{*< Height  }
type
  PEfl_Access_Event_Geometry_Changed_Data = ^TEfl_Access_Event_Geometry_Changed_Data;
  TEfl_Access_Event_Geometry_Changed_Data = record
      x : longint;
      y : longint;
      width : longint;
      height : longint;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessibility children changed event data
 *
 * @ingroup Efl_Access_Event_Children_Changed_Data
  }
{*< Child is added or not  }
{*< Child object  }
type
  PEfl_Access_Event_Children_Changed_Data = ^TEfl_Access_Event_Children_Changed_Data;
  TEfl_Access_Event_Children_Changed_Data = record
      is_added : TEina_Bool;
      child : PEfl_Object;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessibility Attribute
 *
 * @ingroup Efl_Access_Attribute
  }
(* Const before type ignored *)
{*< Attribute key  }
(* Const before type ignored *)
{*< Attribute value  }
type
  PEfl_Access_Attribute = ^TEfl_Access_Attribute;
  TEfl_Access_Attribute = record
      key : Pchar;
      value : Pchar;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessibility Relation
 *
 * @ingroup Efl_Access_Relation
  }
{*< Relation type  }
{*< List with relation objects  }
type
  PEfl_Access_Relation = ^TEfl_Access_Relation;
  TEfl_Access_Relation = record
      _type : TEfl_Access_Relation_Type;
      objects : PEina_List;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Accessibility accessible mixin
 *
 * @ingroup Efl_Access_Object
  }

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_access_object_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Gets an localized string describing accessible object role name.
 *
 * @param[in] obj The object.
 *
 * @return Localized accessible object role name
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_access_object_localized_role_name_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Accessible name of the object.
 *
 * @param[in] obj The object.
 * @param[in] i18n_name Accessible name
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

procedure efl_access_object_i18n_name_set(obj:PEo; i18n_name:Pchar);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Accessible name of the object.
 *
 * @param[in] obj The object.
 *
 * @return Accessible name
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_access_object_i18n_name_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Gets an all relations between accessible object and other accessible
 * objects.
 *
 * @param[in] obj The object.
 *
 * @return Accessible relation set
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

function efl_access_object_relations_get(obj:PEo):PEina_Iterator;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The role of the object in accessibility domain.
 *
 * @param[in] obj The object.
 * @param[in] role Accessible role
 *
 * @ingroup Efl_Access_Object
  }

procedure efl_access_object_role_set(obj:PEo; role:TEfl_Access_Role);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The role of the object in accessibility domain.
 *
 * @param[in] obj The object.
 *
 * @return Accessible role
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

function efl_access_object_role_get(obj:PEo):TEfl_Access_Role;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Gets object's accessible children.
 *
 * @param[in] obj The object.
 *
 * @return List of widget's children
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

function efl_access_object_access_children_get(obj:PEo):PEina_List;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Gets human-readable string identifying object accessibility role.
 *
 * @param[in] obj The object.
 *
 * @return Accessible role name
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_access_object_role_name_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Gets key-value pairs identifying object extra attributes. Must be
 * free by a user.
 *
 * @param[in] obj The object.
 *
 * @return List of object attributes. Must be freed by the user
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

function efl_access_object_attributes_get(obj:PEo):PEina_List;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief Add key-value pair identifying object extra attributes
 *
 * @param[in] obj The object.
 * @param[in] key The string key to give extra information
 * @param[in] value The string value to give extra information
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure efl_access_object_attribute_append(obj:PEo; key:Pchar; value:Pchar);cdecl;external;
{*
 * @brief delete key-value pair identifying object extra attributes when key is
 * given
 *
 * @param[in] obj The object.
 * @param[in] key The string key to identify the key-value pair
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
procedure efl_access_object_attribute_del(obj:PEo; key:Pchar);cdecl;external;
{* Removes all attributes in accessible object.
 *
 * @ingroup Efl_Access_Object
  }
procedure efl_access_object_attributes_clear(obj:PEo);cdecl;external;
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Reading information of an accessible object.
 *
 * If no reading information is set, 0 is returned which means all four reading
 * information types will be read from object highlight. If set to 0, existing
 * reading info will be deleted.
 *
 * @param[in] obj The object.
 * @param[in] reading_info Reading information types
 *
 * @ingroup Efl_Access_Object
  }
procedure efl_access_object_reading_info_type_set(obj:PEo; reading_info:TEfl_Access_Reading_Info_Type);cdecl;external;
{$endif}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Reading information of an accessible object.
 *
 * If no reading information is set, 0 is returned which means all four reading
 * information types will be read from object highlight. If set to 0, existing
 * reading info will be deleted.
 *
 * @param[in] obj The object.
 *
 * @return Reading information types
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

function efl_access_object_reading_info_type_get(obj:PEo):TEfl_Access_Reading_Info_Type;cdecl;external;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Gets index of the child in parent's children list.
 *
 * @param[in] obj The object.
 *
 * @return Index in children list
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

function efl_access_object_index_in_parent_get(obj:PEo):longint;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Contextual information about object.
 *
 * @param[in] obj The object.
 * @param[in] description Accessible contextual information
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

procedure efl_access_object_description_set(obj:PEo; description:Pchar);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Contextual information about object.
 *
 * @param[in] obj The object.
 *
 * @return Accessible contextual information
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_access_object_description_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Gets set describing object accessible states.
 *
 * @param[in] obj The object.
 *
 * @return Accessible state set
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

function efl_access_object_state_set_get(obj:PEo):TEfl_Access_State_Set;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Register accessibility event listener
 *
 * @param[in] cb Callback
 * @param[in] data Data
 *
 * @return Event handler
 *
 * @ingroup Efl_Access_Object
  }

function efl_access_object_event_handler_add(cb:TEfl_Event_Cb; data:pointer):PEfl_Access_Event_Handler;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Deregister accessibility event listener
 *
 * @param[in] handler Event handler
 *
 * @ingroup Efl_Access_Object
  }

procedure efl_access_object_event_handler_del(handler:PEfl_Access_Event_Handler);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_OBJECT_PROTECTED}
{*
 * @brief Emit event
 *
 * @param[in] accessible Accessibility object.
 * @param[in] event Accessibility event type.
 * @param[in] event_info Accessibility event details.
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

procedure efl_access_object_event_emit(accessible:PEfl_Access_Object; event:PEfl_Event_Description; event_info:pointer);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The translation domain of "name" and "description" properties.
 *
 * Translation domain should be set if the application wants to support i18n
 * for accessibility "name" and "description" properties.
 *
 * When translation domain is set, values of "name" and "description"
 * properties will be translated with the dgettext function using the current
 * translation domain as the "domainname" parameter.
 *
 * It is the application developer's responsibility to ensure that translation
 * files are loaded and bound to the translation domain when accessibility is
 * enabled.
 *
 * @param[in] obj The object.
 * @param[in] domain Translation domain
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

procedure efl_access_object_translation_domain_set(obj:PEo; domain:Pchar);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The translation domain of "name" and "description" properties.
 *
 * Translation domain should be set if the application wants to support i18n
 * for accessibility "name" and "description" properties.
 *
 * When translation domain is set, values of "name" and "description"
 * properties will be translated with the dgettext function using the current
 * translation domain as the "domainname" parameter.
 *
 * It is the application developer's responsibility to ensure that translation
 * files are loaded and bound to the translation domain when accessibility is
 * enabled.
 *
 * @param[in] obj The object.
 *
 * @return Translation domain
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_access_object_translation_domain_get(obj:PEo):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Type of accessibility object
 *
 * @param[in] obj The object.
 * @param[in] type Object type
 *
 * @ingroup Efl_Access_Object
  }

procedure efl_access_object_access_type_set(obj:PEo; _type:TEfl_Access_Type);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Type of accessibility object
 *
 * @param[in] obj The object.
 *
 * @return Object type
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

function efl_access_object_access_type_get(obj:PEo):TEfl_Access_Type;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Defines the relationship between two accessible objects.
 *
 * Adds a unique relationship between source object and relation_object of a
 * given type.
 *
 * Relationships can be queried by Assistive Technology clients to provide
 * customized feedback, improving overall user experience.
 *
 * Relationship_append API is asymmetric, which means that appending, for
 * example, relation EFL_ACCESS_RELATION_TYPE_FLOWS_TO from object A to B, do
 * NOT append relation EFL_ACCESS_RELATION_TYPE_FLOWS_FROM from object B to
 * object A.
 *
 * @param[in] obj The object.
 * @param[in] type Relation type
 * @param[in] relation_object Object to relate to
 *
 * @return @c true if relationship was successfully appended, @c false
 * otherwise
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

function efl_access_object_relationship_append(obj:PEo; _type:TEfl_Access_Relation_Type; relation_object:PEfl_Access_Object):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Removes the relationship between two accessible objects.
 *
 * If relation_object is @c NULL function removes all relations of the given
 * type.
 *
 * @param[in] obj The object.
 * @param[in] type Relation type
 * @param[in] relation_object Object to remove relation from
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)

procedure efl_access_object_relationship_remove(obj:PEo; _type:TEfl_Access_Relation_Type; relation_object:PEfl_Access_Object);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Removes all relationships in accessible object.
 *
 * @ingroup Efl_Access_Object
  }

procedure efl_access_object_relationships_clear(obj:PEo);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Root object of accessible object hierarchy
 *
 * @return Root object
 *
 * @ingroup Efl_Access_Object
  }

function efl_access_object_access_root_get:PEfl_Object;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
(* Const before type ignored *)
  var
    _EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when property has changed
 * @return const char *
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
    _EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when children have changed
 * @return Efl_Access_Event_Children_Changed_Data
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
    _EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when state has changed
 * @return Efl_Access_Event_State_Changed_Data
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
    _EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when boundaries have changed
 * @return Efl_Access_Event_Geometry_Changed_Data
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
    _EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when visibility has changed
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
    _EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when active state of descendant has changed
 * @return Efl_Object *
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
    _EFL_ACCESS_OBJECT_EVENT_ADDED : TEfl_Event_Description;cvar;external;
{* Called when item is added
 *
 * @ingroup Efl_Access_Object
  }
(* Const before type ignored *)
    _EFL_ACCESS_OBJECT_EVENT_REMOVED : TEfl_Event_Description;cvar;external;
{* Called when item is removed
 *
 * @ingroup Efl_Access_Object
  }

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_ADDED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_REMOVED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_MIXIN : longint; { return type might be wrong }
  begin
    EFL_ACCESS_OBJECT_MIXIN:=efl_access_object_mixin_get;
  end;

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED:=@(_EFL_ACCESS_OBJECT_EVENT_PROPERTY_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED:=@(_EFL_ACCESS_OBJECT_EVENT_CHILDREN_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED:=@(_EFL_ACCESS_OBJECT_EVENT_STATE_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED:=@(_EFL_ACCESS_OBJECT_EVENT_BOUNDS_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED:=@(_EFL_ACCESS_OBJECT_EVENT_VISIBLE_DATA_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED:=@(_EFL_ACCESS_OBJECT_EVENT_ACTIVE_DESCENDANT_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_ADDED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_OBJECT_EVENT_ADDED:=@(_EFL_ACCESS_OBJECT_EVENT_ADDED);
  end;

{ was #define dname def_expr }
function EFL_ACCESS_OBJECT_EVENT_REMOVED : longint; { return type might be wrong }
  begin
    EFL_ACCESS_OBJECT_EVENT_REMOVED:=@(_EFL_ACCESS_OBJECT_EVENT_REMOVED);
  end;


end.
