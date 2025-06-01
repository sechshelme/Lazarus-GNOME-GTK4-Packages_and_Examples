
unit efl_ui_textbox_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_textbox_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_textbox_eo.h
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
PEfl_Canvas_Textblock_Factory  = ^Efl_Canvas_Textblock_Factory;
PEfl_Class  = ^Efl_Class;
PEfl_Text_Cursor_Object  = ^Efl_Text_Cursor_Object;
PEfl_Ui_Textbox  = ^Efl_Ui_Textbox;
PEfl_Ui_Textbox_Cnp_Content  = ^Efl_Ui_Textbox_Cnp_Content;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TEXTBOX_EO_H_}
{$define _EFL_UI_TEXTBOX_EO_H_}
{$ifndef _EFL_UI_TEXTBOX_EO_CLASS_TYPE}
{$define _EFL_UI_TEXTBOX_EO_CLASS_TYPE}
type
  PEfl_Ui_Textbox = ^TEfl_Ui_Textbox;
  TEfl_Ui_Textbox = TEo;
{$endif}
{$ifndef _EFL_UI_TEXTBOX_EO_TYPES}
{$define _EFL_UI_TEXTBOX_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief What kind of content can be pasted into this widget using Copy &
 * Paste or Drag & Drop functionality.
 *
 * Multiple options can be OR-ed together.
 *
 * @ingroup Efl_Ui_Textbox_Cnp_Content
  }
{*< Nothing can be pasted or dropped
                                           * into this widget.  }
{*< Plain text can be pasted or dropped
                                        * into this widget.  }
{*< Markup text can be pasted or
                                          * dropped into this widget (This
                                          * includes Plain text).  }
{*< Images can be pasted or dropped into
                                        * this widget.  }
type
  PEfl_Ui_Textbox_Cnp_Content = ^TEfl_Ui_Textbox_Cnp_Content;
  TEfl_Ui_Textbox_Cnp_Content =  Longint;
  Const
    EFL_UI_TEXTBOX_CNP_CONTENT_NOTHING = 0;
    EFL_UI_TEXTBOX_CNP_CONTENT_TEXT = 1;
    EFL_UI_TEXTBOX_CNP_CONTENT_MARKUP = 3;
    EFL_UI_TEXTBOX_CNP_CONTENT_IMAGE = 4;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{* A flexible text widget which can be static (as a label) or editable by the
 * user (as a text entry). It provides all sorts of editing facilities like
 * automatic scrollbars, virtual keyboard, clipboard, configurable context
 * menus or auto-capitalization, for example.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_textbox_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Enable or disable scrolling in the widget.
 *
 * When scrolling is enabled scrollbars will appear if the text does not fit
 * the widget size.
 *
 * Direct control of the scroll through the @ref Efl_Ui_Scrollable interface is
 * only possible when this property is enabled.
 *
 * @param[in] obj The object.
 * @param[in] scroll @c true to enable scrolling.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
procedure efl_ui_textbox_scrollable_set(obj:PEo; scroll:TEina_Bool);cdecl;external;
{*
 * @brief Enable or disable scrolling in the widget.
 *
 * When scrolling is enabled scrollbars will appear if the text does not fit
 * the widget size.
 *
 * Direct control of the scroll through the @ref Efl_Ui_Scrollable interface is
 * only possible when this property is enabled.
 *
 * @param[in] obj The object.
 *
 * @return @c true to enable scrolling.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
(* Const before type ignored *)
function efl_ui_textbox_scrollable_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief This enables or disables the widget's contextual menu, typically
 * accessible through a long-press or a right-button click.
 *
 * @param[in] obj The object.
 * @param[in] enabled @c true to enable the contextual menu.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
procedure efl_ui_textbox_context_menu_enabled_set(obj:PEo; enabled:TEina_Bool);cdecl;external;
{*
 * @brief This enables or disables the widget's contextual menu, typically
 * accessible through a long-press or a right-button click.
 *
 * @param[in] obj The object.
 *
 * @return @c true to enable the contextual menu.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
(* Const before type ignored *)
function efl_ui_textbox_context_menu_enabled_get(obj:PEo):TEina_Bool;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Controls the type of content which can be pasted into the widget.
 *
 * By default, both text and images are allowed..
 *
 * @param[in] obj The object.
 * @param[in] allowed_formats Allowed content types.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
procedure efl_ui_textbox_cnp_dnd_mode_set(obj:PEo; allowed_formats:TEfl_Ui_Textbox_Cnp_Content);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Controls the type of content which can be pasted into the widget.
 *
 * By default, both text and images are allowed..
 *
 * @param[in] obj The object.
 *
 * @return Allowed content types.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
(* Const before type ignored *)

function efl_ui_textbox_cnp_dnd_mode_get(obj:PEo):TEfl_Ui_Textbox_Cnp_Content;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief This enables or disables the visual handles around selected text, to
 * allow simpler modification on touch screens.
 *
 * @param[in] obj The object.
 * @param[in] enabled @c true to enable the selection handles.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }

procedure efl_ui_textbox_selection_handles_enabled_set(obj:PEo; enabled:TEina_Bool);cdecl;external;
{*
 * @brief This enables or disables the visual handles around selected text, to
 * allow simpler modification on touch screens.
 *
 * @param[in] obj The object.
 *
 * @return @c true to enable the selection handles.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
(* Const before type ignored *)
function efl_ui_textbox_selection_handles_enabled_get(obj:PEo):TEina_Bool;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The factory that provides item in the text e.g. "emoticon/happy" or
 * "href=file://image.jpg" etc.
 *
 * @param[in] obj The object.
 * @param[in] item_factory Factory to create items
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
procedure efl_ui_textbox_item_factory_set(obj:PEo; item_factory:PEfl_Canvas_Textblock_Factory);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The factory that provides item in the text e.g. "emoticon/happy" or
 * "href=file://image.jpg" etc.
 *
 * @param[in] obj The object.
 *
 * @return Factory to create items
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
(* Const before type ignored *)

function efl_ui_textbox_item_factory_get(obj:PEo):PEfl_Canvas_Textblock_Factory;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief Creates and returns a new cursor for the text.
 *
 * @param[in] obj The object.
 *
 * @return Text cursor.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }

function efl_ui_textbox_cursor_create(obj:PEo):PEfl_Text_Cursor_Object;cdecl;external;
{* This executes a "copy" action on the selected text in the widget.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
procedure efl_ui_textbox_selection_copy(obj:PEo);cdecl;external;
{* This executes a "paste" action in the widget.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
procedure efl_ui_textbox_selection_paste(obj:PEo);cdecl;external;
{* This executes a "cut" action on the selected text in the widget.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
procedure efl_ui_textbox_selection_cut(obj:PEo);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE : TEfl_Event_Description;cvar;external;
{* Called when selection is pasted.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
(* Const before type ignored *)
    _EFL_UI_TEXTBOX_EVENT_SELECTION_COPY : TEfl_Event_Description;cvar;external;
{* Called when selection is copied.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
(* Const before type ignored *)
    _EFL_UI_TEXTBOX_EVENT_SELECTION_CUT : TEfl_Event_Description;cvar;external;
{* Called when selection is cut.
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
(* Const before type ignored *)
    _EFL_UI_TEXTBOX_EVENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when entry changes
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }
(* Const before type ignored *)
    _EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN : TEfl_Event_Description;cvar;external;
{* Called when context menu was opened
 *
 * @since 1.24
 *
 * @ingroup Efl_Ui_Textbox
  }

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_SELECTION_COPY : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_SELECTION_CUT : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TEXTBOX_CLASS:=efl_ui_textbox_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE : longint; { return type might be wrong }
  begin
    EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE:=@(_EFL_UI_TEXTBOX_EVENT_SELECTION_PASTE);
  end;

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_SELECTION_COPY : longint; { return type might be wrong }
  begin
    EFL_UI_TEXTBOX_EVENT_SELECTION_COPY:=@(_EFL_UI_TEXTBOX_EVENT_SELECTION_COPY);
  end;

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_SELECTION_CUT : longint; { return type might be wrong }
  begin
    EFL_UI_TEXTBOX_EVENT_SELECTION_CUT:=@(_EFL_UI_TEXTBOX_EVENT_SELECTION_CUT);
  end;

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_TEXTBOX_EVENT_CHANGED:=@(_EFL_UI_TEXTBOX_EVENT_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN : longint; { return type might be wrong }
  begin
    EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN:=@(_EFL_UI_TEXTBOX_EVENT_CONTEXT_OPEN);
  end;


end.
