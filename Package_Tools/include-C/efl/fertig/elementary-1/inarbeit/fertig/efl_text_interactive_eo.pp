
unit efl_text_interactive_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_interactive_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_interactive_eo.h
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
PEfl_Text_Cursor_Object  = ^Efl_Text_Cursor_Object;
PEfl_Text_Interactive  = ^Efl_Text_Interactive;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_INTERACTIVE_EO_H_}
{$define _EFL_TEXT_INTERACTIVE_EO_H_}
{$ifndef _EFL_TEXT_INTERACTIVE_EO_CLASS_TYPE}
{$define _EFL_TEXT_INTERACTIVE_EO_CLASS_TYPE}
type
  PEfl_Text_Interactive = ^TEfl_Text_Interactive;
  TEfl_Text_Interactive = TEo;
{$endif}
{$ifndef _EFL_TEXT_INTERACTIVE_EO_TYPES}
{$define _EFL_TEXT_INTERACTIVE_EO_TYPES}
{$endif}
{*
 * @brief Interface for interactive (editable) text inputs (text entries).
 *
 * It handles cursors, edition and selection.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_text_interactive_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The cursor used to insert new text, the one that's visible to the
 * user.
 *
 * @param[in] obj The object.
 *
 * @return The cursor visible to the user.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
function efl_text_interactive_main_cursor_get(obj:PEo):PEfl_Text_Cursor_Object;cdecl;external;
{*
 * @brief Whether or not text selection is allowed on this object.
 *
 * @param[in] obj The object.
 * @param[in] allowed @c true if enabled.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
procedure efl_text_interactive_selection_allowed_set(obj:PEo; allowed:TEina_Bool);cdecl;external;
{*
 * @brief Whether or not text selection is allowed on this object.
 *
 * @param[in] obj The object.
 *
 * @return @c true if enabled.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
function efl_text_interactive_selection_allowed_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The cursors used for selection handling. If the cursors are equal
 * there's no selection.
 *
 * The positions of passed cursors will be used to set selection cursors
 * positions. Further modification for passed @ref Efl_Text_Cursor_Object
 * objects, will not affect selection. Setter is recommended to set new range
 * for selection.
 *
 * @param[in] obj The object.
 * @param[in] start The start of the selection.
 * @param[in] end The end of the selection.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
procedure efl_text_interactive_selection_cursors_set(obj:PEo; start:PEfl_Text_Cursor_Object; end:PEfl_Text_Cursor_Object);cdecl;external;
{*
 * @brief The cursors used for selection handling. If the cursors are equal
 * there's no selection.
 *
 * You are allowed to retain and modify them. Modifying them modifies the
 * selection of the object (recommended to extend selection range).
 *
 * @param[in] obj The object.
 * @param[out] start The start of the selection.
 * @param[out] end The end of the selection.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
procedure efl_text_interactive_selection_cursors_get(obj:PEo; start:PPEfl_Text_Cursor_Object; end:PPEfl_Text_Cursor_Object);cdecl;external;
{*
 * @brief Whether the entry is editable.
 *
 * By default interactive text objects are editable. Setting this property to
 * @c false will disregard all keyboard input.
 *
 * @param[in] obj The object.
 * @param[in] editable If @c true, user input can modify the text. Otherwise,
 * the entry is read-only and no user input is allowed.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
procedure efl_text_interactive_editable_set(obj:PEo; editable:TEina_Bool);cdecl;external;
{*
 * @brief Whether the entry is editable.
 *
 * By default interactive text objects are editable. Setting this property to
 * @c false will disregard all keyboard input.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, user input can modify the text. Otherwise, the entry is
 * read-only and no user input is allowed.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
function efl_text_interactive_editable_get(obj:PEo):TEina_Bool;cdecl;external;
{* Clears the selection.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
procedure efl_text_interactive_all_unselect(obj:PEo);cdecl;external;
{* Select all the content.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
procedure efl_text_interactive_all_select(obj:PEo);cdecl;external;
{*
 * @brief Whether the entry has a selected text.
 *
 * @param[in] obj The object.
 *
 * @return If @c true, entry has selected text.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
function efl_text_interactive_have_selection_get(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when key presses do not result in a new character being added.
 * Multiple key presses are needed to produce a character in some languages
 * like Korean, for example. Each of these key presses will emit a
 * @[.preedit,changed] event but only the last one will emit a @[.changed,user]
 * event.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
    _EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when the @ref efl_text_interactive_have_selection_get property
 * value changes.
 * @return Eina_Bool
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
    _EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when selection has changed. Query using
 * @ref efl_text_interactive_selection_cursors_get.
 * @return Eina_Range
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
    _EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST : TEfl_Event_Description;cvar;external;
{* Emitted when a redo operation is requested.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
    _EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST : TEfl_Event_Description;cvar;external;
{* Emitted when a undo operation is requested.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }
(* Const before type ignored *)
    _EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER : TEfl_Event_Description;cvar;external;
{* Emitted when the text content has changed due to user interaction.
 * @return Efl_Text_Change_Info
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Interactive
  }

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_TEXT_INTERACTIVE_INTERFACE:=efl_text_interactive_interface_get;
  end;

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED:=@(_EFL_TEXT_INTERACTIVE_EVENT_PREEDIT_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED:=@(_EFL_TEXT_INTERACTIVE_EVENT_HAVE_SELECTION_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED : longint; { return type might be wrong }
  begin
    EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED:=@(_EFL_TEXT_INTERACTIVE_EVENT_SELECTION_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST : longint; { return type might be wrong }
  begin
    EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST:=@(_EFL_TEXT_INTERACTIVE_EVENT_REDO_REQUEST);
  end;

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST : longint; { return type might be wrong }
  begin
    EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST:=@(_EFL_TEXT_INTERACTIVE_EVENT_UNDO_REQUEST);
  end;

{ was #define dname def_expr }
function EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER : longint; { return type might be wrong }
  begin
    EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER:=@(_EFL_TEXT_INTERACTIVE_EVENT_CHANGED_USER);
  end;


end.
