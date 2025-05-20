
unit efl_ui_scrollable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_scrollable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_scrollable_eo.h
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
PEfl_Ui_Scrollable  = ^Efl_Ui_Scrollable;
PEina_Bool  = ^Eina_Bool;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_SCROLLABLE_EO_H_}
{$define _EFL_UI_SCROLLABLE_EO_H_}
{$ifndef _EFL_UI_SCROLLABLE_EO_CLASS_TYPE}
{$define _EFL_UI_SCROLLABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Scrollable = ^TEfl_Ui_Scrollable;
  TEfl_Ui_Scrollable = TEo;
{$endif}
{$ifndef _EFL_UI_SCROLLABLE_EO_TYPES}
{$define _EFL_UI_SCROLLABLE_EO_TYPES}
{$endif}
{*
 * @brief Interface for widgets capable of displaying content through a
 * viewport, which might be smaller than the actual content. This interface
 * does not control how the content is added. This is typically done through
 * @ref Efl_Content.
 *
 * When the content does not fit inside the viewport, typically
 * @ref Efl_Ui_Scrollbar widgets will be used, but this is beyond the scope of
 * this interface.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_SCROLLABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_scrollable_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Position of the content inside the scroller.
 *
 * @param[in] obj The object.
 * @param[in] pos The position is a virtual value, where <tt>0,0</tt>
 * means the top-left corner.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_content_pos_set(obj:PEo; pos:TEina_Position2D);cdecl;external;
{*
 * @brief Position of the content inside the scroller.
 *
 * @param[in] obj The object.
 *
 * @return The position is a virtual value, where <tt>0,0</tt> means the
 * top-left corner.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
function efl_ui_scrollable_content_pos_get(obj:PEo):TEina_Position2D;cdecl;external;
{*
 * @brief Current size of the content, for convenience.
 *
 * @param[in] obj The object.
 *
 * @return The content size in pixels.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
function efl_ui_scrollable_content_size_get(obj:PEo):TEina_Size2D;cdecl;external;
{*
 * @brief Current position and size of the viewport (or scroller window), for
 * convenience.
 *
 * This is the viewport through which the content is displayed.
 *
 * @param[in] obj The object.
 *
 * @return It is absolute geometry.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
function efl_ui_scrollable_viewport_geometry_get(obj:PEo):TEina_Rect;cdecl;external;
{*
 * @brief When scrolling, the scroller may "bounce" when reaching the edge of
 * the content object. This is a visual way to indicate the end has been
 * reached. This is enabled by default for both axes. This property determines
 * if bouncing is enabled in each axis. When bouncing is disabled, scrolling
 * just stops upon reaching the end of the content.
 *
 * @param[in] obj The object.
 * @param[in] horiz Horizontal bouncing is enabled.
 * @param[in] vert Vertical bouncing is enabled.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_bounce_enabled_set(obj:PEo; horiz:TEina_Bool; vert:TEina_Bool);cdecl;external;
{*
 * @brief When scrolling, the scroller may "bounce" when reaching the edge of
 * the content object. This is a visual way to indicate the end has been
 * reached. This is enabled by default for both axes. This property determines
 * if bouncing is enabled in each axis. When bouncing is disabled, scrolling
 * just stops upon reaching the end of the content.
 *
 * @param[in] obj The object.
 * @param[out] horiz Horizontal bouncing is enabled.
 * @param[out] vert Vertical bouncing is enabled.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
procedure efl_ui_scrollable_bounce_enabled_get(obj:PEo; horiz:PEina_Bool; vert:PEina_Bool);cdecl;external;
{*
 * @brief Freezes scrolling movement (by input of a user). Unlike
 * @ref efl_ui_scrollable_movement_block_get, this property freezes
 * bidirectionally. If you want to freeze in only one direction, see
 * @ref efl_ui_scrollable_movement_block_get.
 *
 * @param[in] obj The object.
 * @param[in] freeze @c true if freeze.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_scroll_freeze_set(obj:PEo; freeze:TEina_Bool);cdecl;external;
{*
 * @brief Freezes scrolling movement (by input of a user). Unlike
 * @ref efl_ui_scrollable_movement_block_get, this property freezes
 * bidirectionally. If you want to freeze in only one direction, see
 * @ref efl_ui_scrollable_movement_block_get.
 *
 * @param[in] obj The object.
 *
 * @return @c true if freeze.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
function efl_ui_scrollable_scroll_freeze_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief When hold turns on, it only scrolls by holding action.
 *
 * @param[in] obj The object.
 * @param[in] hold @c true if hold.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_scroll_hold_set(obj:PEo; hold:TEina_Bool);cdecl;external;
{*
 * @brief When hold turns on, it only scrolls by holding action.
 *
 * @param[in] obj The object.
 *
 * @return @c true if hold.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
function efl_ui_scrollable_scroll_hold_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Controls infinite looping for a scroller.
 *
 * @param[in] obj The object.
 * @param[in] loop_h Scroll horizontal looping is enabled.
 * @param[in] loop_v Scroll vertical looping is enabled.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_looping_set(obj:PEo; loop_h:TEina_Bool; loop_v:TEina_Bool);cdecl;external;
{*
 * @brief Controls infinite looping for a scroller.
 *
 * @param[in] obj The object.
 * @param[out] loop_h Scroll horizontal looping is enabled.
 * @param[out] loop_v Scroll vertical looping is enabled.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
procedure efl_ui_scrollable_looping_get(obj:PEo; loop_h:PEina_Bool; loop_v:PEina_Bool);cdecl;external;
{*
 * @brief Blocking of scrolling (per axis).
 *
 * This function will block scrolling movement (by input of a user) in a given
 * direction. You can disable movements in the X axis, the Y axis or both. The
 * default value is @ref EFL_UI_LAYOUT_ORIENTATION_DEFAULT meaning that
 * movements are allowed in both directions.
 *
 * @param[in] obj The object.
 * @param[in] block Which axis (or axes) to block.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_movement_block_set(obj:PEo; block:TEfl_Ui_Layout_Orientation);cdecl;external;
{*
 * @brief Blocking of scrolling (per axis).
 *
 * This function will block scrolling movement (by input of a user) in a given
 * direction. You can disable movements in the X axis, the Y axis or both. The
 * default value is @ref EFL_UI_LAYOUT_ORIENTATION_DEFAULT meaning that
 * movements are allowed in both directions.
 *
 * @param[in] obj The object.
 *
 * @return Which axis (or axes) to block.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
function efl_ui_scrollable_movement_block_get(obj:PEo):TEfl_Ui_Layout_Orientation;cdecl;external;
{*
 * @brief Control scrolling gravity on the scrollable.
 *
 * The gravity defines how the scroller will adjust its view when the size of
 * the scroller contents increases.
 *
 * The scroller will adjust the view to glue itself as follows:
 * <tt>x=0.0</tt> to stay where it is relative to the left edge of the content.
 * <tt>x=1.0</tt> to stay where it is relative to the right edge of the
 * content. <tt>y=0.0</tt> to stay where it is relative to the top edge of
 * the content. <tt>y=1.0</tt> to stay where it is relative to the bottom
 * edge of the content.
 *
 * @param[in] obj The object.
 * @param[in] x Horizontal scrolling gravity.
 * @param[in] y Vertical scrolling gravity.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_gravity_set(obj:PEo; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * @brief Control scrolling gravity on the scrollable.
 *
 * The gravity defines how the scroller will adjust its view when the size of
 * the scroller contents increases.
 *
 * The scroller will adjust the view to glue itself as follows:
 * <tt>x=0.0</tt> to stay where it is relative to the left edge of the content.
 * <tt>x=1.0</tt> to stay where it is relative to the right edge of the
 * content. <tt>y=0.0</tt> to stay where it is relative to the top edge of
 * the content. <tt>y=1.0</tt> to stay where it is relative to the bottom
 * edge of the content.
 *
 * @param[in] obj The object.
 * @param[out] x Horizontal scrolling gravity.
 * @param[out] y Vertical scrolling gravity.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
procedure efl_ui_scrollable_gravity_get(obj:PEo; x:Pdouble; y:Pdouble);cdecl;external;
{*
 * @brief Prevent the scrollable from being smaller than the minimum size of
 * the content.
 *
 * By default the scroller will be as small as its design allows, irrespective
 * of its content. This will make the scroller minimum size the right size
 * horizontally and/or vertically to perfectly fit its content in that
 * direction.
 *
 * @param[in] obj The object.
 * @param[in] w Whether to limit the minimum horizontal size.
 * @param[in] h Whether to limit the minimum vertical size.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_match_content_set(obj:PEo; w:TEina_Bool; h:TEina_Bool);cdecl;external;
{*
 * @brief Amount to scroll in response to cursor key presses.
 *
 * @param[in] obj The object.
 * @param[in] step The step size in pixels.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_step_size_set(obj:PEo; step:TEina_Position2D);cdecl;external;
{*
 * @brief Amount to scroll in response to cursor key presses.
 *
 * @param[in] obj The object.
 *
 * @return The step size in pixels.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
(* Const before type ignored *)
function efl_ui_scrollable_step_size_get(obj:PEo):TEina_Position2D;cdecl;external;
{*
 * @brief Show a specific virtual region within the scroller content object.
 *
 * This will ensure all (or part if it does not fit) of the designated region
 * in the virtual content object ($[0,0] starting at the top-left of the
 * virtual content object) is shown within the scroller. This allows the
 * scroller to "smoothly slide" to this location (if configuration in general
 * calls for transitions). It may not jump immediately to the new location and
 * make take a while and show other content along the way.
 *
 * @param[in] obj The object.
 * @param[in] rect The position where to scroll and the size user want to see.
 * @param[in] animation Whether to scroll with animation or not.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }
procedure efl_ui_scrollable_scroll(obj:PEo; rect:TEina_Rect; animation:TEina_Bool);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_STARTED : TEfl_Event_Description;cvar;external;
{* Called when scroll operation starts.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_STARTED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when scrolling.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_CHANGED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_FINISHED : TEfl_Event_Description;cvar;external;
{* Called when scroll operation finishes.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_FINISHED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_UP : TEfl_Event_Description;cvar;external;
{* Called when scrolling upwards.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_UP : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_DOWN : TEfl_Event_Description;cvar;external;
{* Called when scrolling downwards.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_DOWN : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_LEFT : TEfl_Event_Description;cvar;external;
{* Called when scrolling left.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_LEFT : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_RIGHT : TEfl_Event_Description;cvar;external;
{* Called when scrolling right.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_RIGHT : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_EDGE_UP : TEfl_Event_Description;cvar;external;
{* Called when hitting the top edge.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_EDGE_UP : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_EDGE_DOWN : TEfl_Event_Description;cvar;external;
{* Called when hitting the bottom edge.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_EDGE_DOWN : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_EDGE_LEFT : TEfl_Event_Description;cvar;external;
{* Called when hitting the left edge.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_EDGE_LEFT : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_EDGE_RIGHT : TEfl_Event_Description;cvar;external;
{* Called when hitting the right edge.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_EDGE_RIGHT : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_ANIM_STARTED : TEfl_Event_Description;cvar;external;
{* Called when scroll animation starts.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_ANIM_STARTED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_ANIM_FINISHED : TEfl_Event_Description;cvar;external;
{* Called when scroll animation finishes.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_ANIM_FINISHED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_DRAG_STARTED : TEfl_Event_Description;cvar;external;
{* Called when scroll drag starts.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_DRAG_STARTED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_UI_EVENT_SCROLL_DRAG_FINISHED : TEfl_Event_Description;cvar;external;
{* Called when scroll drag finishes.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Scrollable
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_DRAG_FINISHED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_SCROLLABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_SCROLLABLE_INTERFACE:=efl_ui_scrollable_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_STARTED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_STARTED:=@(_EFL_UI_EVENT_SCROLL_STARTED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_CHANGED:=@(_EFL_UI_EVENT_SCROLL_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_FINISHED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_FINISHED:=@(_EFL_UI_EVENT_SCROLL_FINISHED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_UP : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_UP:=@(_EFL_UI_EVENT_SCROLL_UP);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_DOWN : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_DOWN:=@(_EFL_UI_EVENT_SCROLL_DOWN);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_LEFT : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_LEFT:=@(_EFL_UI_EVENT_SCROLL_LEFT);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_RIGHT : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_RIGHT:=@(_EFL_UI_EVENT_SCROLL_RIGHT);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_EDGE_UP : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_EDGE_UP:=@(_EFL_UI_EVENT_EDGE_UP);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_EDGE_DOWN : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_EDGE_DOWN:=@(_EFL_UI_EVENT_EDGE_DOWN);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_EDGE_LEFT : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_EDGE_LEFT:=@(_EFL_UI_EVENT_EDGE_LEFT);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_EDGE_RIGHT : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_EDGE_RIGHT:=@(_EFL_UI_EVENT_EDGE_RIGHT);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_ANIM_STARTED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_ANIM_STARTED:=@(_EFL_UI_EVENT_SCROLL_ANIM_STARTED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_ANIM_FINISHED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_ANIM_FINISHED:=@(_EFL_UI_EVENT_SCROLL_ANIM_FINISHED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_DRAG_STARTED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_DRAG_STARTED:=@(_EFL_UI_EVENT_SCROLL_DRAG_STARTED);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_SCROLL_DRAG_FINISHED : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_SCROLL_DRAG_FINISHED:=@(_EFL_UI_EVENT_SCROLL_DRAG_FINISHED);
  end;


end.
