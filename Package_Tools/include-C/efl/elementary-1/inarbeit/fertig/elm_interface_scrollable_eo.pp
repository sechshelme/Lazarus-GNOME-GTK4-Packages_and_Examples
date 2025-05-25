
unit elm_interface_scrollable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_interface_scrollable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_interface_scrollable_eo.h
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
PEfl_Canvas_Object  = ^Efl_Canvas_Object;
PEfl_Class  = ^Efl_Class;
PEina_Bool  = ^Eina_Bool;
PElm_Interface_Scrollable  = ^Elm_Interface_Scrollable;
PElm_Scroller_Policy  = ^Elm_Scroller_Policy;
PElm_Scroller_Single_Direction  = ^Elm_Scroller_Single_Direction;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_INTERFACE_SCROLLABLE_EO_H_}
{$define _ELM_INTERFACE_SCROLLABLE_EO_H_}
{$ifndef _ELM_INTERFACE_SCROLLABLE_EO_CLASS_TYPE}
{$define _ELM_INTERFACE_SCROLLABLE_EO_CLASS_TYPE}
type
  PElm_Interface_Scrollable = ^TElm_Interface_Scrollable;
  TElm_Interface_Scrollable = TEo;
{$endif}
{$ifndef _ELM_INTERFACE_SCROLLABLE_EO_TYPES}
{$define _ELM_INTERFACE_SCROLLABLE_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Type that controls when scrollbars should appear.
 *
 * See also @ref elm_interface_scrollable_policy_set.
 *
 * @ingroup Elm_Scroller_Policy
  }
{*< Show scrollbars as needed.  }
{*< Always show scrollbars.  }
{*< Never show scrollbars.  }
{*< Internal. Sentinel value to indicate last enum
                            * field during iteration.  }
type
  PElm_Scroller_Policy = ^TElm_Scroller_Policy;
  TElm_Scroller_Policy =  Longint;
  Const
    ELM_SCROLLER_POLICY_AUTO = 0;
    ELM_SCROLLER_POLICY_ON = 1;
    ELM_SCROLLER_POLICY_OFF = 2;
    ELM_SCROLLER_POLICY_LAST = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Type that controls how the content is scrolled.
 *
 * See also @ref elm_interface_scrollable_single_direction_set.
 *
 * @ingroup Elm_Scroller_Single_Direction
  }
{*< Scroll every direction.  }
{*< Scroll single direction if the
                                       * direction is certain.  }
{*< Scroll only single direction.  }
{*< Internal. Sentinel value to indicate
                                      * last enum field during iteration.  }
type
  PElm_Scroller_Single_Direction = ^TElm_Scroller_Single_Direction;
  TElm_Scroller_Single_Direction =  Longint;
  Const
    ELM_SCROLLER_SINGLE_DIRECTION_NONE = 0;
    ELM_SCROLLER_SINGLE_DIRECTION_SOFT = 1;
    ELM_SCROLLER_SINGLE_DIRECTION_HARD = 2;
    ELM_SCROLLER_SINGLE_DIRECTION_LAST = 3;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elm scrollable mixin
 *
 * @ingroup Elm_Interface_Scrollable
  }

{ was #define dname def_expr }
function ELM_INTERFACE_SCROLLABLE_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function elm_interface_scrollable_mixin_get:PEfl_Class;cdecl;external;
{*
 * @brief Control scrolling gravity on the scrollable
 *
 * The gravity defines how the scroller will adjust its view when the size of
 * the scroller contents increases.
 *
 * The scroller will adjust the view to glue itself as follows.
 *
 * x=0.0, for staying where it is relative to the left edge of the content
 * x=1.0, for staying where it is relative to the right edge of the content
 * y=0.0, for staying where it is relative to the top edge of the content
 * y=1.0, for staying where it is relative to the bottom edge of the content
 *
 * Default values for x and y are 0.0
 *
 * @param[in] obj The object.
 * @param[in] x Horizontal scrolling gravity
 * @param[in] y Vertical scrolling gravity
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_gravity_set(obj:PEo; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * @brief Control scrolling gravity on the scrollable
 *
 * The gravity defines how the scroller will adjust its view when the size of
 * the scroller contents increases.
 *
 * The scroller will adjust the view to glue itself as follows.
 *
 * x=0.0, for staying where it is relative to the left edge of the content
 * x=1.0, for staying where it is relative to the right edge of the content
 * y=0.0, for staying where it is relative to the top edge of the content
 * y=1.0, for staying where it is relative to the bottom edge of the content
 *
 * Default values for x and y are 0.0
 *
 * @param[in] obj The object.
 * @param[out] x Horizontal scrolling gravity
 * @param[out] y Vertical scrolling gravity
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_gravity_get(obj:PEo; x:Pdouble; y:Pdouble);cdecl;external;
{*
 * @brief Bouncing behavior
 *
 * When scrolling, the scroller may "bounce" when reaching an edge of the
 * content object. This is a visual way to indicate the end has been reached.
 * This is enabled by default for both axis. This API will set if it is enabled
 * for the given axis with the boolean parameters for each axis.
 *
 * @param[in] obj The object.
 * @param[in] horiz Horizontal bounce policy.
 * @param[in] vert Vertical bounce policy.
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_bounce_allow_set(obj:PEo; horiz:TEina_Bool; vert:TEina_Bool);cdecl;external;
{*
 * @brief Bouncing behavior
 *
 * When scrolling, the scroller may "bounce" when reaching an edge of the
 * content object. This is a visual way to indicate the end has been reached.
 * This is enabled by default for both axis. This API will set if it is enabled
 * for the given axis with the boolean parameters for each axis.
 *
 * @param[in] obj The object.
 * @param[out] horiz Horizontal bounce policy.
 * @param[out] vert Vertical bounce policy.
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_bounce_allow_get(obj:PEo; horiz:PEina_Bool; vert:PEina_Bool);cdecl;external;
{*
 * @brief Control Wheel disable Enable or disable mouse wheel to be used to
 * scroll the scroller content. heel is enabled by default.
 *
 * @param[in] obj The object.
 * @param[in] disabled @c true if wheel is disabled, @c false otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_wheel_disabled_set(obj:PEo; disabled:TEina_Bool);cdecl;external;
{*
 * @brief Control Wheel disable Enable or disable mouse wheel to be used to
 * scroll the scroller content. heel is enabled by default.
 *
 * @param[in] obj The object.
 *
 * @return @c true if wheel is disabled, @c false otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
function elm_interface_scrollable_wheel_disabled_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Blocking of scrolling (per axis)
 *
 * This function will block scrolling movement (by input of a user) in a given
 * direction. One can disable movements in the X axis, the Y axis or both. The
 * default value is @c none, where movements are allowed in both directions.
 *
 * What makes this function different from freeze_push(), hold_push() and
 * lock_x_set() (or lock_y_set()) is that it doesn't propagate its effects to
 * any parent or child widget of @c obj. Only the target scrollable widget will
 * be locked with regard to scrolling.
 *
 * @param[in] obj The object.
 * @param[in] block Which axis (or axes) to block
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_movement_block_set(obj:PEo; block:TEfl_Ui_Layout_Orientation);cdecl;external;
{*
 * @brief Blocking of scrolling (per axis)
 *
 * This function will block scrolling movement (by input of a user) in a given
 * direction. One can disable movements in the X axis, the Y axis or both. The
 * default value is @c none, where movements are allowed in both directions.
 *
 * What makes this function different from freeze_push(), hold_push() and
 * lock_x_set() (or lock_y_set()) is that it doesn't propagate its effects to
 * any parent or child widget of @c obj. Only the target scrollable widget will
 * be locked with regard to scrolling.
 *
 * @param[in] obj The object.
 *
 * @return Which axis (or axes) to block
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
function elm_interface_scrollable_movement_block_get(obj:PEo):TEfl_Ui_Layout_Orientation;cdecl;external;
{*
 * @brief Momentum animator
 *
 * @param[in] obj The object.
 * @param[in] disabled @c true if disabled, @c false otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_momentum_animator_disabled_set(obj:PEo; disabled:TEina_Bool);cdecl;external;
{*
 * @brief Momentum animator
 *
 * @param[in] obj The object.
 *
 * @return @c true if disabled, @c false otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
function elm_interface_scrollable_momentum_animator_disabled_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Scrollbar visibility policy
 *
 * @param[in] obj The object.
 * @param[in] hbar Horizontal scrollbar policy
 * @param[in] vbar Vertical scrollbar policy
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_policy_set(obj:PEo; hbar:TElm_Scroller_Policy; vbar:TElm_Scroller_Policy);cdecl;external;
{*
 * @brief Scrollbar visibility policy
 *
 * @param[in] obj The object.
 * @param[out] hbar Horizontal scrollbar policy
 * @param[out] vbar Vertical scrollbar policy
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_policy_get(obj:PEo; hbar:PElm_Scroller_Policy; vbar:PElm_Scroller_Policy);cdecl;external;
{*
 * @brief Currently visible content region
 *
 * This gets the current region in the content object that is visible through
 * the scroller. The region co-ordinates are returned in the @c x, @c y, @c w,
 * @c h values pointed to.
 *
 * @note All coordinates are relative to the content.
 *
 * See: @ref elm_interface_scrollable_content_region_show.
 *
 * @param[in] obj The object.
 * @param[in] x X coordinate of the region
 * @param[in] y Y coordinate of the region
 * @param[in] w Width of the region
 * @param[in] h Height of the region
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_content_region_set(obj:PEo; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * @brief Currently visible content region
 *
 * This gets the current region in the content object that is visible through
 * the scroller. The region co-ordinates are returned in the @c x, @c y, @c w,
 * @c h values pointed to.
 *
 * @note All coordinates are relative to the content.
 *
 * See: @ref elm_interface_scrollable_content_region_show.
 *
 * @param[in] obj The object.
 * @param[out] x X coordinate of the region
 * @param[out] y Y coordinate of the region
 * @param[out] w Width of the region
 * @param[out] h Height of the region
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_content_region_get(obj:PEo; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief It decides whether the scrollable object propagates the events to
 * content object or not.
 *
 * @param[in] obj The object.
 * @param[in] repeat_events @c true if events are propagated, @c false
 * otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_content_events_set(obj:PEo; repeat_events:TEina_Bool);cdecl;external;
{*
 * @brief It decides whether the scrollable object propagates the events to
 * content object or not.
 *
 * @param[in] obj The object.
 *
 * @return @c true if events are propagated, @c false otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
function elm_interface_scrollable_content_events_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Scroll page size relative to viewport size.
 *
 * The scroller is capable of limiting scrolling by the user to "pages". That
 * is to jump by and only show a "whole page" at a time as if the continuous
 * area of the scroller content is split into page sized pieces. This sets the
 * size of a page relative to the viewport of the scroller. 1.0 is "1 viewport"
 * is size (horizontally or vertically). 0.0 turns it off in that axis. This is
 * mutually exclusive with page size (see
 * @ref elm_interface_scrollable_page_size_get for more information). Likewise
 * 0.5 is "half a viewport". Sane usable values are normally between 0.0 and
 * 1.0 including 1.0. If you only want 1 axis to be page "limited", use 0.0 for
 * the other axis.
 *
 * @param[in] obj The object.
 * @param[in] x The horizontal page relative size
 * @param[in] y The vertical page relative size
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_page_size_set(obj:PEo; x:longint; y:longint);cdecl;external;
{*
 * @brief Scroll page size relative to viewport size.
 *
 * The scroller is capable of limiting scrolling by the user to "pages". That
 * is to jump by and only show a "whole page" at a time as if the continuous
 * area of the scroller content is split into page sized pieces. This sets the
 * size of a page relative to the viewport of the scroller. 1.0 is "1 viewport"
 * is size (horizontally or vertically). 0.0 turns it off in that axis. This is
 * mutually exclusive with page size (see
 * @ref elm_interface_scrollable_page_size_get for more information). Likewise
 * 0.5 is "half a viewport". Sane usable values are normally between 0.0 and
 * 1.0 including 1.0. If you only want 1 axis to be page "limited", use 0.0 for
 * the other axis.
 *
 * @param[in] obj The object.
 * @param[out] x The horizontal page relative size
 * @param[out] y The vertical page relative size
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_page_size_get(obj:PEo; x:Plongint; y:Plongint);cdecl;external;
{*
 * @brief Bounce animator
 *
 * @param[in] obj The object.
 * @param[in] disabled @c true if bounce animation is disabled, @c false
 * otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_bounce_animator_disabled_set(obj:PEo; disabled:TEina_Bool);cdecl;external;
{*
 * @brief Bounce animator
 *
 * @param[in] obj The object.
 *
 * @return @c true if bounce animation is disabled, @c false otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
function elm_interface_scrollable_bounce_animator_disabled_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Page scroll limit
 *
 * @param[in] obj The object.
 * @param[in] page_limit_h Page limit horizontal
 * @param[in] page_limit_v Page limit vertical
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_page_scroll_limit_set(obj:PEo; page_limit_h:longint; page_limit_v:longint);cdecl;external;
{*
 * @brief Page scroll limit
 *
 * @param[in] obj The object.
 * @param[out] page_limit_h Page limit horizontal
 * @param[out] page_limit_v Page limit vertical
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_page_scroll_limit_get(obj:PEo; page_limit_h:Plongint; page_limit_v:Plongint);cdecl;external;
{*
 * @brief Page snapping behavior
 *
 * When scrolling, if a scroller is paged (see elm_scroller_page_size_set() and
 * elm_scroller_page_relative_set()), the scroller may snap to pages when being
 * scrolled, i.e., even if it had momentum to scroll further, it will stop at
 * the next page boundaries. This is disabled, by default, for both axis. This
 * function will set if it that is enabled or not, for each axis.
 *
 * @note If @c obj is not set to have pages, nothing will happen after this
 * call.
 *
 * @param[in] obj The object.
 * @param[in] horiz Allow snap horizontally
 * @param[in] vert Allow snap vertically
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_page_snap_allow_set(obj:PEo; horiz:TEina_Bool; vert:TEina_Bool);cdecl;external;
{*
 * @brief Page snapping behavior
 *
 * When scrolling, if a scroller is paged (see elm_scroller_page_size_set() and
 * elm_scroller_page_relative_set()), the scroller may snap to pages when being
 * scrolled, i.e., even if it had momentum to scroll further, it will stop at
 * the next page boundaries. This is disabled, by default, for both axis. This
 * function will set if it that is enabled or not, for each axis.
 *
 * @note If @c obj is not set to have pages, nothing will happen after this
 * call.
 *
 * @param[in] obj The object.
 * @param[out] horiz Allow snap horizontally
 * @param[out] vert Allow snap vertically
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_page_snap_allow_get(obj:PEo; horiz:PEina_Bool; vert:PEina_Bool);cdecl;external;
{*
 * @brief Paging property
 *
 * @param[in] obj The object.
 * @param[in] pagerel_h Page relation horizontal
 * @param[in] pagerel_v Page relation vertical
 * @param[in] pagesize_h Page size horizontal
 * @param[in] pagesize_v Page size vertical
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_paging_set(obj:PEo; pagerel_h:Tdouble; pagerel_v:Tdouble; pagesize_h:longint; pagesize_v:longint);cdecl;external;
{*
 * @brief Paging property
 *
 * @param[in] obj The object.
 * @param[out] pagerel_h Page relation horizontal
 * @param[out] pagerel_v Page relation vertical
 * @param[out] pagesize_h Page size horizontal
 * @param[out] pagesize_v Page size vertical
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_paging_get(obj:PEo; pagerel_h:Pdouble; pagerel_v:Pdouble; pagesize_h:Plongint; pagesize_v:Plongint);cdecl;external;
{*
 * @brief Single direction scroll configuration
 *
 * This makes it possible to restrict scrolling to a single direction, with a
 * "soft" or "hard" behavior.
 *
 * The hard behavior restricts the scrolling to a single direction all of the
 * time while the soft one will restrict depending on factors such as the
 * movement angle. If the user scrolls roughly in one direction only, it will
 * only move according to it while if the move was clearly wanted on both axes,
 * it will happen on both of them.
 *
 * @param[in] obj The object.
 * @param[in] single_dir The single direction scroll policy
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_single_direction_set(obj:PEo; single_dir:TElm_Scroller_Single_Direction);cdecl;external;
{*
 * @brief Single direction scroll configuration
 *
 * This makes it possible to restrict scrolling to a single direction, with a
 * "soft" or "hard" behavior.
 *
 * The hard behavior restricts the scrolling to a single direction all of the
 * time while the soft one will restrict depending on factors such as the
 * movement angle. If the user scrolls roughly in one direction only, it will
 * only move according to it while if the move was clearly wanted on both axes,
 * it will happen on both of them.
 *
 * @param[in] obj The object.
 *
 * @return The single direction scroll policy
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
function elm_interface_scrollable_single_direction_get(obj:PEo):TElm_Scroller_Single_Direction;cdecl;external;
{*
 * @brief Step size
 *
 * @param[in] obj The object.
 * @param[in] x X coordinate
 * @param[in] y Y coordinate
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_step_size_set(obj:PEo; x:longint; y:longint);cdecl;external;
{*
 * @brief Step size
 *
 * @param[in] obj The object.
 * @param[out] x X coordinate
 * @param[out] y Y coordinate
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_step_size_get(obj:PEo; x:Plongint; y:Plongint);cdecl;external;
{*
 * @brief Controls an infinite loop for a scroller.
 *
 * @param[in] obj The object.
 * @param[in] loop_h The scrolling horizontal loop
 * @param[in] loop_v The scrolling vertical loop
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_content_loop_set(obj:PEo; loop_h:TEina_Bool; loop_v:TEina_Bool);cdecl;external;
{*
 * @brief Controls an infinite loop for a scroller.
 *
 * @param[in] obj The object.
 * @param[out] loop_h The scrolling horizontal loop
 * @param[out] loop_v The scrolling vertical loop
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_content_loop_get(obj:PEo; loop_h:PEina_Bool; loop_v:PEina_Bool);cdecl;external;
{*
 * @brief Set the callback to run when the content has been moved up.
 *
 * @param[in] obj The object.
 * @param[in] scroll_up_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_scroll_up_cb_set(obj:PEo; scroll_up_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the horizontal scrollbar is dragged.
 *
 * @param[in] obj The object.
 * @param[in] hbar_drag_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_hbar_drag_cb_set(obj:PEo; hbar_drag_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when dragging of the contents has started.
 *
 * @param[in] obj The object.
 * @param[in] drag_start_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_drag_start_cb_set(obj:PEo; drag_start_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Freeze property
 *
 * @param[in] obj The object.
 * @param[in] freeze @c true if freeze, @c false otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_freeze_set(obj:PEo; freeze:TEina_Bool);cdecl;external;
{*
 * @brief When the viewport is resized, the callback is called.
 *
 * @param[in] obj The object.
 * @param[in] viewport_resize_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_content_viewport_resize_cb_set(obj:PEo; viewport_resize_cb:TElm_Interface_Scrollable_Resize_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the content has been moved to the left
 *
 * @param[in] obj The object.
 * @param[in] scroll_left_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_scroll_left_cb_set(obj:PEo; scroll_left_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the vertical scrollbar is pressed.
 *
 * @param[in] obj The object.
 * @param[in] vbar_press_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_vbar_press_cb_set(obj:PEo; vbar_press_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the horizontal scrollbar is pressed.
 *
 * @param[in] obj The object.
 * @param[in] hbar_press_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_hbar_press_cb_set(obj:PEo; hbar_press_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the horizontal scrollbar is unpressed.
 *
 * @param[in] obj The object.
 * @param[in] hbar_unpress_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_hbar_unpress_cb_set(obj:PEo; hbar_unpress_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when dragging of the contents has stopped.
 *
 * @param[in] obj The object.
 * @param[in] drag_stop_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_drag_stop_cb_set(obj:PEo; drag_stop_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Extern pan
 *
 * @param[in] obj The object.
 * @param[in] pan Pan object
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_extern_pan_set(obj:PEo; pan:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Set the callback to run when the visible page changes.
 *
 * @param[in] obj The object.
 * @param[in] page_change_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_page_change_cb_set(obj:PEo; page_change_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Hold property
 *
 * @param[in] obj The object.
 * @param[in] hold @c true if hold, @c false otherwise
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_hold_set(obj:PEo; hold:TEina_Bool);cdecl;external;
{*
 * @brief Set the callback to run when the scrolling animation has started.
 *
 * @param[in] obj The object.
 * @param[in] animate_start_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_animate_start_cb_set(obj:PEo; animate_start_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the content has been moved down.
 *
 * @param[in] obj The object.
 * @param[in] scroll_down_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_scroll_down_cb_set(obj:PEo; scroll_down_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set scroll page size relative to viewport size.
 *
 * @param[in] obj The object.
 * @param[in] h_pagerel Page relation horizontal
 * @param[in] v_pagerel Page relation vertical
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_page_relative_set(obj:PEo; h_pagerel:Tdouble; v_pagerel:Tdouble);cdecl;external;
{*
 * @brief Set the callback to run when the content has been moved.
 *
 * @param[in] obj The object.
 * @param[in] scroll_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_scroll_cb_set(obj:PEo; scroll_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the scrolling animation has stopped.
 *
 * @param[in] obj The object.
 * @param[in] animate_stop_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_animate_stop_cb_set(obj:PEo; animate_stop_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief set the callback to run on minimal limit content
 *
 * @param[in] obj The object.
 * @param[in] min_limit_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_content_min_limit_cb_set(obj:PEo; min_limit_cb:TElm_Interface_Scrollable_Min_Limit_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the content has been moved to the right.
 *
 * @param[in] obj The object.
 * @param[in] scroll_right_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_scroll_right_cb_set(obj:PEo; scroll_right_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Content property
 *
 * @param[in] obj The object.
 * @param[in] content Content object
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_content_set(obj:PEo; content:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Set the callback to run when the left edge of the content has been
 * reached.
 *
 * @param[in] obj The object.
 * @param[in] edge_left_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_edge_left_cb_set(obj:PEo; edge_left_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the horizontal scrollbar is dragged.
 *
 * @param[in] obj The object.
 * @param[in] vbar_drag_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_vbar_drag_cb_set(obj:PEo; vbar_drag_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the horizontal scrollbar is unpressed.
 *
 * @param[in] obj The object.
 * @param[in] vbar_unpress_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_vbar_unpress_cb_set(obj:PEo; vbar_unpress_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the bottom edge of the content has been
 * reached.
 *
 * @param[in] obj The object.
 * @param[in] edge_bottom_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_edge_bottom_cb_set(obj:PEo; edge_bottom_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the right edge of the content has been
 * reached.
 *
 * @param[in] obj The object.
 * @param[in] edge_right_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_edge_right_cb_set(obj:PEo; edge_right_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Set the callback to run when the top edge of the content has been
 * reached.
 *
 * @param[in] obj The object.
 * @param[in] edge_top_cb The callback
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_edge_top_cb_set(obj:PEo; edge_top_cb:TElm_Interface_Scrollable_Cb);cdecl;external;
{*
 * @brief Object property
 *
 * @param[in] obj The object.
 * @param[in] edje_object Edje object
 * @param[in] hit_rectangle Evas object
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_objects_set(obj:PEo; edje_object:PEfl_Canvas_Object; hit_rectangle:PEfl_Canvas_Object);cdecl;external;
{*
 * @brief Scroll last page number.
 *
 * The page number starts from 0. 0 is the first page. This returns the last
 * page number among the pages.
 *
 * See: @ref elm_interface_scrollable_current_page_get,
 * @ref elm_interface_scrollable_page_show and
 * @ref elm_interface_scrollable_page_bring_in.
 *
 * @param[in] obj The object.
 * @param[out] pagenumber_h The horizontal page number
 * @param[out] pagenumber_v The vertical page number
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_last_page_get(obj:PEo; pagenumber_h:Plongint; pagenumber_v:Plongint);cdecl;external;
{*
 * @brief Scroll current page number.
 *
 * The page number starts from 0. 0 is the first page. Current page means the
 * page which meets the top-left of the viewport. If there are two or more
 * pages in the viewport, it returns the number of the page which meets the
 * top-left of the viewport.
 *
 * See: @ref elm_interface_scrollable_last_page_get,
 * @ref elm_interface_scrollable_page_show and
 * @ref elm_interface_scrollable_page_bring_in.
 *
 * @param[in] obj The object.
 * @param[out] pagenumber_h The horizontal page number
 * @param[out] pagenumber_v The vertical page number
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_current_page_get(obj:PEo; pagenumber_h:Plongint; pagenumber_v:Plongint);cdecl;external;
{*
 * @brief Content viewport geometry
 *
 * @param[in] obj The object.
 * @param[out] x X coordinate
 * @param[out] y Y coordinate
 * @param[out] w Width
 * @param[out] h Height
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_content_viewport_geometry_get(obj:PEo; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Get the size of the content object
 *
 * This gets the size of the content object of the scroller.
 *
 * @param[in] obj The object.
 * @param[out] w Width of the content object.
 * @param[out] h Height of the content object.
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_content_size_get(obj:PEo; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Set the content position
 *
 * @param[in] obj The object.
 * @param[in] x X coordinate
 * @param[in] y Y coordinate
 * @param[in] sig Send signals to the theme corresponding to the scroll
 * direction, or if an edge was reached.
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_content_pos_set(obj:PEo; x:longint; y:longint; sig:TEina_Bool);cdecl;external;
{*
 * @brief Get content position
 *
 * @param[in] obj The object.
 * @param[out] x X coordinate
 * @param[out] y Y coordinate
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
procedure elm_interface_scrollable_content_pos_get(obj:PEo; x:Plongint; y:Plongint);cdecl;external;
{*
 * @brief Show a specific virtual region within the scroller content object by
 * page number.
 *
 * 0, 0 of the indicated page is located at the top-left of the viewport. This
 * will jump to the page directly without animation.
 *
 * See @ref elm_interface_scrollable_page_bring_in.
 *
 * @param[in] obj The object.
 * @param[in] pagenumber_h The horizontal page number
 * @param[in] pagenumber_v The vertical page number
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_page_show(obj:PEo; pagenumber_h:longint; pagenumber_v:longint);cdecl;external;
{*
 * @brief Show a specific virtual region within the scroller content object.
 *
 * This will ensure all (or part if it does not fit) of the designated region
 * in the virtual content object (0, 0 starting at the top-left of the virtual
 * content object) is shown within the scroller. Unlike
 * elm_scroller_region_show(), this allows the scroller to "smoothly slide" to
 * this location (if configuration in general calls for transitions). It may
 * not jump immediately to the new location and make take a while and show
 * other content along the way.
 *
 * See @ref elm_interface_scrollable_content_region_show
 *
 * @param[in] obj The object.
 * @param[in] x X coordinate of the region
 * @param[in] y Y coordinate of the region
 * @param[in] w Width of the region
 * @param[in] h Height of the region
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_region_bring_in(obj:PEo; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * @brief Show a specific virtual region within the scroller content object by
 * page number.
 *
 * 0, 0 of the indicated page is located at the top-left of the viewport. This
 * will slide to the page with animation.
 *
 * @ref elm_interface_scrollable_page_show
 *
 * @param[in] obj The object.
 * @param[in] pagenumber_h The horizontal page number
 * @param[in] pagenumber_v The vertical page number
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_page_bring_in(obj:PEo; pagenumber_h:longint; pagenumber_v:longint);cdecl;external;
{*
 * @brief Show a specific virtual region within the scroller content object
 *
 * This will ensure all (or part if it does not fit) of the designated region
 * in the virtual content object (0, 0 starting at the top-left of the virtual
 * content object) is shown within the scroller.
 *
 * @param[in] obj The object.
 * @param[in] x X coordinate of the region
 * @param[in] y Y coordinate of the region
 * @param[in] w Width of the region
 * @param[in] h Height of the region
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_content_region_show(obj:PEo; x:longint; y:longint; w:longint; h:longint);cdecl;external;
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
 * @param[in] w Whether to limit the minimum horizontal size
 * @param[in] h Whether to limit the minimum vertical size
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_content_min_limit(obj:PEo; w:TEina_Bool; h:TEina_Bool);cdecl;external;
{*
 * @brief Whether scrolling should loop around.
 *
 * @param[in] obj The object.
 * @param[in] enable True to enable looping.
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_item_loop_enabled_set(obj:PEo; enable:TEina_Bool);cdecl;external;
{*
 * @brief Whether scrolling should loop around.
 *
 * @param[in] obj The object.
 *
 * @return True to enable looping.
 *
 * @ingroup Elm_Interface_Scrollable
  }
(* Const before type ignored *)
function elm_interface_scrollable_item_loop_enabled_get(obj:PEo):TEina_Bool;cdecl;external;
{* Call this if you have changed the group of the object passed to
 * @ref elm_interface_scrollable_objects_set
 *
 * @ingroup Elm_Interface_Scrollable
  }
procedure elm_interface_scrollable_reset_signals(obj:PEo);cdecl;external;
(* Const before type ignored *)
  var
    _ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when content changed
 *
 * @ingroup Elm_Interface_Scrollable
  }

{ was #define dname def_expr }
function ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELM_INTERFACE_SCROLLABLE_MIXIN : longint; { return type might be wrong }
  begin
    ELM_INTERFACE_SCROLLABLE_MIXIN:=elm_interface_scrollable_mixin_get;
  end;

{ was #define dname def_expr }
function ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED : longint; { return type might be wrong }
  begin
    ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED:=@(_ELM_INTERFACE_SCROLLABLE_EVENT_CHANGED);
  end;


end.
