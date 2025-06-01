
unit efl_ui_tags_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_tags_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_tags_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Tags  = ^Efl_Ui_Tags;
PEina_Array  = ^Eina_Array;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TAGS_EO_H_}
{$define _EFL_UI_TAGS_EO_H_}
{$ifndef _EFL_UI_TAGS_EO_CLASS_TYPE}
{$define _EFL_UI_TAGS_EO_CLASS_TYPE}
type
  PEfl_Ui_Tags = ^TEfl_Ui_Tags;
  TEfl_Ui_Tags = TEo;
{$endif}
{$ifndef _EFL_UI_TAGS_EO_TYPES}
{$define _EFL_UI_TAGS_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* A widget displaying a list of tags. The user can remove tags by clicking on
 * each tag "close" button and add new tags by typing text in the text entry at
 * the end of the list.
 *
 * @ingroup Efl_Ui_Tags
  }

{ was #define dname def_expr }
function EFL_UI_TAGS_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_tags_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Control if the tag list is to be editable by the user or not.
 *
 * @param[in] obj The object.
 * @param[in] editable If @c true, the user can add/delete tags to the tag
 * list, if not, the tag list is non-editable.
 *
 * @ingroup Efl_Ui_Tags
  }
procedure efl_ui_tags_editable_set(obj:PEo; editable:TEina_Bool);cdecl;external;
{*
 * @brief Control if the tag list is to be editable by the user or not.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, the user can add/delete tags to the tag list, if not,
 * the tag list is non-editable.
 *
 * @ingroup Efl_Ui_Tags
  }
(* Const before type ignored *)
function efl_ui_tags_editable_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Control whether the tag list is expanded or not.
 *
 * In the expanded state, all tags will be displayed. Otherwise, only a single
 * line of tags will be displayed with a marker to indicate that there is more
 * content.
 *
 * @param[in] obj The object.
 * @param[in] expanded The expanded state. Set this to @c true to allow
 * multiple lines of tags. Set to @c false for a single line.
 *
 * @ingroup Efl_Ui_Tags
  }
procedure efl_ui_tags_expanded_set(obj:PEo; expanded:TEina_Bool);cdecl;external;
{*
 * @brief Control whether the tag list is expanded or not.
 *
 * In the expanded state, all tags will be displayed. Otherwise, only a single
 * line of tags will be displayed with a marker to indicate that there is more
 * content.
 *
 * @param[in] obj The object.
 *
 * @return The expanded state. Set this to @c true to allow multiple lines of
 * tags. Set to @c false for a single line.
 *
 * @ingroup Efl_Ui_Tags
  }
(* Const before type ignored *)
function efl_ui_tags_expanded_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief List of tags in the tag list. Tags can be added and removed by the
 * user using the UI, and by the program by modifying this property.
 *
 * @param[in] obj The object.
 * @param[in] items The array of items, or @c NULL if none.
 *
 * @ingroup Efl_Ui_Tags
  }
(* Const before type ignored *)
procedure efl_ui_tags_items_set(obj:PEo; items:PEina_Array);cdecl;external;
{*
 * @brief List of tags in the tag list. Tags can be added and removed by the
 * user using the UI, and by the program by modifying this property.
 *
 * @param[in] obj The object.
 *
 * @return The array of items, or @c NULL if none.
 *
 * @ingroup Efl_Ui_Tags
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_tags_items_get(obj:PEo):PEina_Array;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_TAGS_EVENT_ITEM_SELECTED : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_TAGS_EVENT_ITEM_ADDED : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_TAGS_EVENT_ITEM_DELETED : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_TAGS_EVENT_ITEM_CLICKED : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_TAGS_EVENT_EXPANDED : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_TAGS_EVENT_CONTRACTED : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED : TEfl_Event_Description;cvar;external;

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_SELECTED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_ADDED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_DELETED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_CLICKED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_EXPANDED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_CONTRACTED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TAGS_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TAGS_CLASS:=efl_ui_tags_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_SELECTED : longint; { return type might be wrong }
  begin
    EFL_UI_TAGS_EVENT_ITEM_SELECTED:=@(_EFL_UI_TAGS_EVENT_ITEM_SELECTED);
  end;

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_ADDED : longint; { return type might be wrong }
  begin
    EFL_UI_TAGS_EVENT_ITEM_ADDED:=@(_EFL_UI_TAGS_EVENT_ITEM_ADDED);
  end;

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_DELETED : longint; { return type might be wrong }
  begin
    EFL_UI_TAGS_EVENT_ITEM_DELETED:=@(_EFL_UI_TAGS_EVENT_ITEM_DELETED);
  end;

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_CLICKED : longint; { return type might be wrong }
  begin
    EFL_UI_TAGS_EVENT_ITEM_CLICKED:=@(_EFL_UI_TAGS_EVENT_ITEM_CLICKED);
  end;

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED : longint; { return type might be wrong }
  begin
    EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED:=@(_EFL_UI_TAGS_EVENT_ITEM_LONGPRESSED);
  end;

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_EXPANDED : longint; { return type might be wrong }
  begin
    EFL_UI_TAGS_EVENT_EXPANDED:=@(_EFL_UI_TAGS_EVENT_EXPANDED);
  end;

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_CONTRACTED : longint; { return type might be wrong }
  begin
    EFL_UI_TAGS_EVENT_CONTRACTED:=@(_EFL_UI_TAGS_EVENT_CONTRACTED);
  end;

{ was #define dname def_expr }
function EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED:=@(_EFL_UI_TAGS_EVENT_EXPAND_STATE_CHANGED);
  end;


end.
