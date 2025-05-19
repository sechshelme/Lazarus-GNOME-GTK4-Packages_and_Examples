
unit efl_ui_scrollbar_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_scrollbar_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_scrollbar_eo.h
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
Pdouble  = ^double;
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Scrollbar  = ^Efl_Ui_Scrollbar;
PEfl_Ui_Scrollbar_Mode  = ^Efl_Ui_Scrollbar_Mode;
PEina_Bool  = ^Eina_Bool;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SCROLLBAR_EO_H_}
{$define _EFL_UI_SCROLLBAR_EO_H_}
{$ifndef _EFL_UI_SCROLLBAR_EO_CLASS_TYPE}
{$define _EFL_UI_SCROLLBAR_EO_CLASS_TYPE}
type
  PEfl_Ui_Scrollbar = ^TEfl_Ui_Scrollbar;
  TEfl_Ui_Scrollbar = TEo;
{$endif}
{$ifndef _EFL_UI_SCROLLBAR_EO_TYPES}
{$define _EFL_UI_SCROLLBAR_EO_TYPES}
{* When should the scrollbar be shown.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar_Mode
  }
{*< Visible if necessary.
                                   *
                                   * @since 1.23  }
{*< Always visible.
                             *
                             * @since 1.23  }
{*< Always invisible.
                              *
                              * @since 1.23  }
{*< For internal use only.
                              *
                              * @since 1.23  }
type
  PEfl_Ui_Scrollbar_Mode = ^TEfl_Ui_Scrollbar_Mode;
  TEfl_Ui_Scrollbar_Mode =  Longint;
  Const
    EFL_UI_SCROLLBAR_MODE_AUTO = 0;
    EFL_UI_SCROLLBAR_MODE_ON = 1;
    EFL_UI_SCROLLBAR_MODE_OFF = 2;
    EFL_UI_SCROLLBAR_MODE_LAST = 3;
;
{$endif}
{* Interface used by widgets which can display scrollbars, enabling them to
 * hold more content than actually visible through the viewport. A scrollbar
 * contains a draggable part (thumb) which allows the user to move the viewport
 * around the content. The size of the thumb relates to the size of the
 * viewport compared to the whole content.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_scrollbar_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Scrollbar visibility mode, for each of the scrollbars.
 *
 * @param[in] obj The object.
 * @param[in] hbar Horizontal scrollbar mode.
 * @param[in] vbar Vertical scrollbar mode.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }
procedure efl_ui_scrollbar_bar_mode_set(obj:PEo; hbar:TEfl_Ui_Scrollbar_Mode; vbar:TEfl_Ui_Scrollbar_Mode);cdecl;external;
{*
 * @brief Scrollbar visibility mode, for each of the scrollbars.
 *
 * @param[in] obj The object.
 * @param[out] hbar Horizontal scrollbar mode.
 * @param[out] vbar Vertical scrollbar mode.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }
(* Const before type ignored *)
procedure efl_ui_scrollbar_bar_mode_get(obj:PEo; hbar:PEfl_Ui_Scrollbar_Mode; vbar:PEfl_Ui_Scrollbar_Mode);cdecl;external;
{*
 * @brief This returns the relative size the thumb should have, given the
 * current size of the viewport and the content. <tt>0.0</tt> means the
 * viewport is much smaller than the content: the thumb will have its minimum
 * size. <tt>1.0</tt> means the viewport has the same size as the content
 * (or bigger): the thumb will have the same size as the scrollbar and cannot
 * move.
 *
 * @param[in] obj The object.
 * @param[out] width Value between <tt>0.0</tt> and <tt>1.0</tt>.
 * @param[out] height Value between <tt>0.0</tt> and <tt>1.0</tt>.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }
(* Const before type ignored *)
procedure efl_ui_scrollbar_bar_size_get(obj:PEo; width:Pdouble; height:Pdouble);cdecl;external;
{*
 * @brief Position of the thumb (the draggable zone) inside the scrollbar. It
 * is calculated based on current position of the viewport inside the total
 * content.
 *
 * @param[in] obj The object.
 * @param[in] posx Value between <tt>0.0</tt> (the left side of the thumb
 * is touching the left edge of the widget) and <tt>1.0</tt> (the right
 * side of the thumb is touching the right edge of the widget).
 * @param[in] posy Value between <tt>0.0</tt> (the top side of the thumb
 * is touching the top edge of the widget) and <tt>1.0</tt> (the bottom
 * side of the thumb is touching the bottom edge of the widget).
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }
procedure efl_ui_scrollbar_bar_position_set(obj:PEo; posx:Tdouble; posy:Tdouble);cdecl;external;
{*
 * @brief Position of the thumb (the draggable zone) inside the scrollbar. It
 * is calculated based on current position of the viewport inside the total
 * content.
 *
 * @param[in] obj The object.
 * @param[out] posx Value between <tt>0.0</tt> (the left side of the thumb
 * is touching the left edge of the widget) and <tt>1.0</tt> (the right
 * side of the thumb is touching the right edge of the widget).
 * @param[out] posy Value between <tt>0.0</tt> (the top side of the thumb
 * is touching the top edge of the widget) and <tt>1.0</tt> (the bottom
 * side of the thumb is touching the bottom edge of the widget).
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }
(* Const before type ignored *)
procedure efl_ui_scrollbar_bar_position_get(obj:PEo; posx:Pdouble; posy:Pdouble);cdecl;external;
{*
 * @brief Current visibility state of the scrollbars. This is useful in
 * @ref EFL_UI_SCROLLBAR_MODE_AUTO mode where EFL decides if the scrollbars are
 * shown or hidden. See also the @[.bar,show] and @[.bar,hide] events.
 *
 * @param[in] obj The object.
 * @param[out] hbar Whether the horizontal scrollbar is currently visible.
 * @param[out] vbar Whether the vertical scrollbar is currently visible.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }
(* Const before type ignored *)
procedure efl_ui_scrollbar_bar_visibility_get(obj:PEo; hbar:PEina_Bool; vbar:PEina_Bool);cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_UI_SCROLLBAR_PROTECTED}
{*
 * @brief Update bar visibility.
 *
 * The object will call this function whenever the bar needs to be shown or
 * hidden.
 *
 * @param[in] obj The object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }
procedure efl_ui_scrollbar_bar_visibility_update(obj:PEo);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
(* Const before type ignored *)
  var
    _EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED : TEfl_Event_Description;cvar;external;
{* Emitted when thumb is pressed.
 * @return Efl_Ui_Layout_Orientation
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED : TEfl_Event_Description;cvar;external;
{* Emitted when thumb is unpressed.
 * @return Efl_Ui_Layout_Orientation
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED : TEfl_Event_Description;cvar;external;
{* Emitted when thumb is dragged.
 * @return Efl_Ui_Layout_Orientation
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when thumb size has changed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when thumb position has changed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_SCROLLBAR_EVENT_BAR_SHOW : TEfl_Event_Description;cvar;external;
{* Emitted when scrollbar is shown.
 * @return Efl_Ui_Layout_Orientation
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_SHOW : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_SCROLLBAR_EVENT_BAR_HIDE : TEfl_Event_Description;cvar;external;
{* Emitted when scrollbar is hidden.
 * @return Efl_Ui_Layout_Orientation
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollbar
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_HIDE : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLBAR_INTERFACE:=efl_ui_scrollbar_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED:=@(_EFL_UI_SCROLLBAR_EVENT_BAR_PRESSED);
  end;

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED:=@(_EFL_UI_SCROLLBAR_EVENT_BAR_UNPRESSED);
  end;

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED:=@(_EFL_UI_SCROLLBAR_EVENT_BAR_DRAGGED);
  end;

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED:=@(_EFL_UI_SCROLLBAR_EVENT_BAR_SIZE_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED:=@(_EFL_UI_SCROLLBAR_EVENT_BAR_POS_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_SHOW : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLBAR_EVENT_BAR_SHOW:=@(_EFL_UI_SCROLLBAR_EVENT_BAR_SHOW);
  end;

{ was #define dname def_expr }
function EFL_UI_SCROLLBAR_EVENT_BAR_HIDE : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLBAR_EVENT_BAR_HIDE:=@(_EFL_UI_SCROLLBAR_EVENT_BAR_HIDE);
  end;


end.
