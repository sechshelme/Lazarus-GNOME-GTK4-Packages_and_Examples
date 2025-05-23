
unit elm_scroller_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_scroller_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_scroller_legacy.h
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
PEina_Bool  = ^Eina_Bool;
PElm_Scroller_Movement_Block  = ^Elm_Scroller_Movement_Block;
PElm_Scroller_Policy  = ^Elm_Scroller_Policy;
PElm_Scroller_Single_Direction  = ^Elm_Scroller_Single_Direction;
PEvas_Coord  = ^Evas_Coord;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_SCROLLER_LEGACY_H}
{$define _ELM_SCROLLER_LEGACY_H}
{$ifndef _ELM_INTERFACE_SCROLLABLE_EO_TYPES}
{$define _ELM_INTERFACE_SCROLLABLE_EO_TYPES}
{*
 * @brief Type that controls when scrollbars should appear.
 *
 * See also @ref elm_interface_scrollable_policy_set.
 *
 * @ingroup Elm_Scroller_Group
  }
{*< Show scrollbars as needed  }
{*< Always show scrollbars  }
{*< Never show scrollbars  }
{*< Sentinel value to indicate last enum field
                            * during iteration  }
type
  PElm_Scroller_Policy = ^TElm_Scroller_Policy;
  TElm_Scroller_Policy =  Longint;
  Const
    ELM_SCROLLER_POLICY_AUTO = 0;
    ELM_SCROLLER_POLICY_ON = 1;
    ELM_SCROLLER_POLICY_OFF = 2;
    ELM_SCROLLER_POLICY_LAST = 3;
;
{*
 * @brief Type that controls how the content is scrolled.
 *
 * See also @ref elm_interface_scrollable_single_direction_set.
 *
 * @ingroup Elm_Scroller_Group
  }
{*< Scroll every direction  }
{*< Scroll single direction if the
                                       * direction is certain  }
{*< Scroll only single direction  }
{*< Sentinel value to indicate last enum
                                      * field during iteration  }
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
{$include "elm_scroller_eo.legacy.h"}
{*
 * Type that blocks the scroll movement in one or more direction.
 *
 * @since 1.8
 *
 * @ingroup Elm_Scroller_Group
  }
{*< Do not block movements  }
{*< Block vertical movements  }
{*< Block horizontal movements  }
type
  PElm_Scroller_Movement_Block = ^TElm_Scroller_Movement_Block;
  TElm_Scroller_Movement_Block =  Longint;
  Const
    ELM_SCROLLER_MOVEMENT_NO_BLOCK = 1;
    ELM_SCROLLER_MOVEMENT_BLOCK_VERTICAL = 2;
    ELM_SCROLLER_MOVEMENT_BLOCK_HORIZONTAL = 4;
;
{*
 * @brief Add a new scroller to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Scroller_Group
  }

function elm_scroller_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Make the scroller minimum size limited to the minimum size of the content
 *
 * @param obj The scroller object
 * @param w Enable limiting minimum size horizontally
 * @param h Enable limiting minimum size vertically
 *
 * By default the scroller will be as small as its design allows,
 * irrespective of its content. This will make the scroller minimum size the
 * right size horizontally and/or vertically to perfectly fit its content in
 * that direction.
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_content_min_limit(obj:PEvas_Object; w:TEina_Bool; h:TEina_Bool);cdecl;external;
{*
 * @brief Show a specific virtual region within the scroller content object
 *
 * @param obj The scroller object
 * @param x X coordinate of the region
 * @param y Y coordinate of the region
 * @param w Width of the region
 * @param h Height of the region
 *
 * This will ensure all (or part if it does not fit) of the designated
 * region in the virtual content object (0, 0 starting at the top-left of the
 * virtual content object) is shown within the scroller.
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_region_show(obj:PEvas_Object; x:TEvas_Coord; y:TEvas_Coord; w:TEvas_Coord; h:TEvas_Coord);cdecl;external;
{*
 * @brief Set the scrollbar visibility policy
 *
 * @param obj The scroller object
 * @param policy_h Horizontal scrollbar policy
 * @param policy_v Vertical scrollbar policy
 *
 * This sets the scrollbar visibility policy for the given scroller.
 * #ELM_SCROLLER_POLICY_AUTO means the scrollbar is made visible if it is
 * needed, and otherwise kept hidden. #ELM_SCROLLER_POLICY_ON turns it on all
 * the time, and #ELM_SCROLLER_POLICY_OFF always keeps it off. This applies
 * respectively for the horizontal and vertical scrollbars.
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_policy_set(obj:PEvas_Object; policy_h:TElm_Scroller_Policy; policy_v:TElm_Scroller_Policy);cdecl;external;
{*
 * @brief Get scrollbar visibility policy
 *
 * @param obj The scroller object
 * @param policy_h Horizontal scrollbar policy
 * @param policy_v Vertical scrollbar policy
 *
 * @see elm_scroller_policy_set()
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_policy_get(obj:PEvas_Object; policy_h:PElm_Scroller_Policy; policy_v:PElm_Scroller_Policy);cdecl;external;
{*
 * @brief Set the type of single direction scroll
 *
 * @param obj The scroller object
 * @param single_dir The type of single direction
 *
 * @see elm_scroller_single_direction_get()
 *
 * @since 1.8
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_single_direction_set(obj:PEvas_Object; single_dir:TElm_Scroller_Single_Direction);cdecl;external;
{*
 * @brief Get the type of single direction scroll
 *
 * @param obj The scroller object
 * @return the type of single direction
 *
 * @see elm_scroller_single_direction_get()
 *
 * @since 1.8
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
function elm_scroller_single_direction_get(obj:PEvas_Object):TElm_Scroller_Single_Direction;cdecl;external;
{*
 * @brief Get the currently visible content region
 *
 * @param obj The scroller object
 * @param x X coordinate of the region
 * @param y Y coordinate of the region
 * @param w Width of the region
 * @param h Height of the region
 *
 * This gets the current region in the content object that is visible through
 * the scroller. The region co-ordinates are returned in the @p x, @p y, @p
 * w, @p h values pointed to.
 *
 * @note All coordinates are relative to the content.
 *
 * @see elm_scroller_region_show()
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_region_get(obj:PEvas_Object; x:PEvas_Coord; y:PEvas_Coord; w:PEvas_Coord; h:PEvas_Coord);cdecl;external;
{*
 * @brief Get the size of the content object
 *
 * @param obj The scroller object
 * @param w Width of the content object.
 * @param h Height of the content object.
 *
 * This gets the size of the content object of the scroller.
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_child_size_get(obj:PEvas_Object; w:PEvas_Coord; h:PEvas_Coord);cdecl;external;
{*
 * @brief Set page snapping behavior of a scroller
 *
 * @param obj The scroller object
 * @param page_h_snap Allow snap horizontally
 * @param page_v_snap Allow snap vertically
 *
 * When scrolling, if a scroller is paged (see
 * elm_scroller_page_size_set() and elm_scroller_page_relative_set()),
 * the scroller may snap to pages when being scrolled, i.e., even if
 * it had momentum to scroll further, it will stop at the next page
 * boundaries. This is @b disabled, by default, for both axis. This
 * function will set if it that is enabled or not, for each axis.
 *
 * @note If @a obj is not set to have pages, nothing will happen after
 * this call.
 *
 * @since 1.8
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_page_snap_set(obj:PEvas_Object; page_h_snap:TEina_Bool; page_v_snap:TEina_Bool);cdecl;external;
{*
 * @brief Get the page snap behaviour of a scroller
 *
 * @param obj The Scroller object
 * @param page_h_snap Will the scroller snap horizontally or not
 * @param page_v_snap Will the scroller snap vertically or not
 *
 * @see elm_scroller_page_snap_set() for more details
 *
 * @since 1.8
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_page_snap_get(obj:PEvas_Object; page_h_snap:PEina_Bool; page_v_snap:PEina_Bool);cdecl;external;
{*
 * @brief Set bouncing behavior
 *
 * @param obj The scroller object
 * @param h_bounce Allow bounce horizontally
 * @param v_bounce Allow bounce vertically
 *
 * When scrolling, the scroller may "bounce" when reaching an edge of the
 * content object. This is a visual way to indicate the end has been reached.
 * This is enabled by default for both axis. This API will set if it is enabled
 * for the given axis with the boolean parameters for each axis.
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_bounce_set(obj:PEvas_Object; h_bounce:TEina_Bool; v_bounce:TEina_Bool);cdecl;external;
{*
 * @brief Get the bounce behaviour
 *
 * @param obj The Scroller object
 * @param h_bounce Will the scroller bounce horizontally or not
 * @param v_bounce Will the scroller bounce vertically or not
 *
 * @see elm_scroller_bounce_set()
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_bounce_get(obj:PEvas_Object; h_bounce:PEina_Bool; v_bounce:PEina_Bool);cdecl;external;
{*
 * @brief Set scroll page size relative to viewport size.
 *
 * @param obj The scroller object
 * @param h_pagerel The horizontal page relative size
 * @param v_pagerel The vertical page relative size
 *
 * The scroller is capable of limiting scrolling by the user to "pages". That
 * is to jump by and only show a "whole page" at a time as if the continuous
 * area of the scroller content is split into page sized pieces. This sets
 * the size of a page relative to the viewport of the scroller. 1.0 is "1
 * viewport" is size (horizontally or vertically). 0.0 turns it off in that
 * axis. This is mutually exclusive with page size
 * (see elm_scroller_page_size_set()  for more information). Likewise 0.5
 * is "half a viewport". Sane usable values are normally between 0.0 and 1.0
 * including 1.0. If you only want 1 axis to be page "limited", use 0.0 for
 * the other axis.
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_page_relative_set(obj:PEvas_Object; h_pagerel:Tdouble; v_pagerel:Tdouble);cdecl;external;
{*
 * Get a given scroller widget's scrolling page size, relative to
 * its viewport size.
 *
 * @param obj The scroller object
 * @param h_pagerel Pointer to a variable where to store the
 * horizontal page (relative) size
 * @param v_pagerel Pointer to a variable where to store the
 * vertical page (relative) size
 *
 * @see elm_scroller_page_relative_set() for more details
 *
 * @since 1.7
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_page_relative_get(obj:PEvas_Object; h_pagerel:Pdouble; v_pagerel:Pdouble);cdecl;external;
{*
 * @brief Set scroll page size.
 *
 * @param obj The scroller object
 * @param h_pagesize The horizontal page size
 * @param v_pagesize The vertical page size
 *
 * This sets the page size to an absolute fixed value, with 0 turning it off
 * for that axis.
 *
 * @see elm_scroller_page_relative_set()
 * @see elm_scroller_page_size_get()
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_page_size_set(obj:PEvas_Object; h_pagesize:TEvas_Coord; v_pagesize:TEvas_Coord);cdecl;external;
{*
 * @brief Get a scroller widget's current page size.
 *
 * @param obj The scroller object
 * @param h_pagesize Where to store its horizontal page size
 * @param v_pagesize Where to store its vertical page size
 *
 * @see elm_scroller_page_size_set() for more details
 * @see elm_scroller_page_relative_set()
 *
 * @since 1.7
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_page_size_get(obj:PEvas_Object; h_pagesize:PEvas_Coord; v_pagesize:PEvas_Coord);cdecl;external;
{*
 * @brief Get scroll current page number.
 *
 * @param obj The scroller object
 * @param h_pagenumber The horizontal page number
 * @param v_pagenumber The vertical page number
 *
 * The page number starts from 0. 0 is the first page.
 * Current page means the page which meets the top-left of the viewport.
 * If there are two or more pages in the viewport, it returns the number of the page
 * which meets the top-left of the viewport.
 *
 * @see elm_scroller_last_page_get()
 * @see elm_scroller_page_show()
 * @see elm_scroller_page_bring_in()
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_current_page_get(obj:PEvas_Object; h_pagenumber:Plongint; v_pagenumber:Plongint);cdecl;external;
{*
 * @brief Get scroll last page number.
 *
 * @param obj The scroller object
 * @param h_pagenumber The horizontal page number
 * @param v_pagenumber The vertical page number
 *
 * The page number starts from 0. 0 is the first page.
 * This returns the last page number among the pages.
 *
 * @see elm_scroller_current_page_get()
 * @see elm_scroller_page_show()
 * @see elm_scroller_page_bring_in()
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_last_page_get(obj:PEvas_Object; h_pagenumber:Plongint; v_pagenumber:Plongint);cdecl;external;
{*
 * Show a specific virtual region within the scroller content object by page number.
 *
 * @param obj The scroller object
 * @param h_pagenumber The horizontal page number
 * @param v_pagenumber The vertical page number
 *
 * 0, 0 of the indicated page is located at the top-left of the viewport.
 * This will jump to the page directly without animation.
 *
 * Example of usage:
 *
 * @code
 * sc = elm_scroller_add(win);
 * elm_object_content_set(sc, content);
 * elm_scroller_page_relative_set(sc, 1, 0);
 * elm_scroller_current_page_get(sc, &h_page, &v_page);
 * elm_scroller_page_show(sc, h_page + 1, v_page);
 * @endcode
 *
 * @see elm_scroller_page_bring_in()
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_page_show(obj:PEvas_Object; h_pagenumber:longint; v_pagenumber:longint);cdecl;external;
{*
 * Show a specific virtual region within the scroller content object by page number.
 *
 * @param obj The scroller object
 * @param h_pagenumber The horizontal page number
 * @param v_pagenumber The vertical page number
 *
 * 0, 0 of the indicated page is located at the top-left of the viewport.
 * This will slide to the page with animation.
 *
 * Example of usage:
 *
 * @code
 * sc = elm_scroller_add(win);
 * elm_object_content_set(sc, content);
 * elm_scroller_page_relative_set(sc, 1, 0);
 * elm_scroller_last_page_get(sc, &h_page, &v_page);
 * elm_scroller_page_bring_in(sc, h_page, v_page);
 * @endcode
 *
 * @see elm_scroller_page_show()
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_page_bring_in(obj:PEvas_Object; h_pagenumber:longint; v_pagenumber:longint);cdecl;external;
{*
 * @brief Show a specific virtual region within the scroller content object.
 *
 * @param obj The scroller object
 * @param x X coordinate of the region
 * @param y Y coordinate of the region
 * @param w Width of the region
 * @param h Height of the region
 *
 * This will ensure all (or part if it does not fit) of the designated
 * region in the virtual content object (0, 0 starting at the top-left of the
 * virtual content object) is shown within the scroller. Unlike
 * elm_scroller_region_show(), this allow the scroller to "smoothly slide"
 * to this location (if configuration in general calls for transitions). It
 * may not jump immediately to the new location and make take a while and
 * show other content along the way.
 *
 * @see elm_scroller_region_show()
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_region_bring_in(obj:PEvas_Object; x:TEvas_Coord; y:TEvas_Coord; w:TEvas_Coord; h:TEvas_Coord);cdecl;external;
{*
 * @brief Set scrolling gravity on a scroller
 *
 * @param obj The scroller object
 * @param x The scrolling horizontal gravity
 * @param y The scrolling vertical gravity
 *
 * The gravity, defines how the scroller will adjust its view
 * when the size of the scroller contents increase.
 *
 * The scroller will adjust the view to glue itself as follows.
 *
 *  x=0.0, for staying where it is relative to the left edge of the content
 *  x=1.0, for staying where it is relative to the right edge of the content
 *  y=0.0, for staying where it is relative to the top edge of the content
 *  y=1.0, for staying where it is relative to the bottom edge of the content
 *
 * Default values for x and y are 0.0
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_gravity_set(obj:PEvas_Object; x:Tdouble; y:Tdouble);cdecl;external;
{*
 * @brief Get scrolling gravity values for a scroller
 *
 * @param obj The scroller object
 * @param x The scrolling horizontal gravity
 * @param y The scrolling vertical gravity
 *
 * This gets gravity values for a scroller.
 *
 * @see elm_scroller_gravity_set()
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_gravity_get(obj:PEvas_Object; x:Pdouble; y:Pdouble);cdecl;external;
{*
 * @brief Set blocking of scrolling (per axis) on a given scroller
 *
 * @param obj The scroller object
 * @param block The axis to block
 *
 * This function will block scrolling movement (by input of a user) in
 * a given direction. One can disable movements in the X axis, the Y
 * axis or both. The default value is #ELM_SCROLLER_MOVEMENT_NO_BLOCK,
 * where movements are allowed in both directions.
 *
 * What makes this function different from
 * elm_object_scroll_freeze_push(), elm_object_scroll_hold_push() and
 * elm_object_scroll_lock_x_set() (or elm_object_scroll_lock_y_set())
 * is that it @b doesn't propagate its effects to any parent or child
 * widget of @a obj. Only the target scrollable widget will be locked
 * with regard to scrolling.
 *
 * @since 1.8
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_movement_block_set(obj:PEvas_Object; block:TElm_Scroller_Movement_Block);cdecl;external;
{*
 * @brief Get a scroller's scroll blocking state
 *
 * @param obj The scroller object
 * @return The blocking state
 *
 * @since 1.8
 *
 * @see elm_scroller_movement_block_set() for more details
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
function elm_scroller_movement_block_get(obj:PEvas_Object):TElm_Scroller_Movement_Block;cdecl;external;
{*
 * @brief Set scroll step size.
 *
 * @param obj The scroller object
 * @param x The horizontal step size
 * @param y The vertical step size
 *
 * This sets the step size to move scroller by key event.
 *
 * @see elm_scroller_step_size_get() for more details
 *
 * @since 1.13
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_step_size_set(obj:PEvas_Object; x:TEvas_Coord; y:TEvas_Coord);cdecl;external;
{*
 * @brief Get the current step size of the scroller object.
 *
 * @param obj The scroller object
 * @param x Where to store its x axis step size
 * @param y Where to store its y axis step size
 *
 * @see elm_scroller_step_size_set() for more details
 *
 * @since 1.13
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_step_size_get(obj:PEvas_Object; x:PEvas_Coord; y:PEvas_Coord);cdecl;external;
{*
 * @brief Set an infinite loop_ for a scroller
 *
 * @param obj The scroller object
 * @param loop_h The scrolling horizontal loop
 * @param loop_v The scrolling vertical loop
 *
 * This function sets the infinite loop horizontally or vertically.
 * If the content is set, it will be shown repeatedly.
 *
 * @since 1.14
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_loop_set(obj:PEvas_Object; loop_h:TEina_Bool; loop_v:TEina_Bool);cdecl;external;
{*
 * @brief Get an infinite loop_ for a scroller
 *
 * @param obj The scroller object
 * @param loop_h The scrolling horizontal loop
 * @param loop_v The scrolling vertical loop
 *
 * @since 1.14
 *
 * @see elm_scroller_loop_set() for more details
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
procedure elm_scroller_loop_get(obj:PEvas_Object; loop_h:PEina_Bool; loop_v:PEina_Bool);cdecl;external;
{*
 * @brief Enable or disable mouse wheel to be used to scroll the scroller.
 *
 * @param obj The scroller object
 * @param disabled The mouse wheel disabled over the scroller.
 *
 * Mouse wheel can be used to scroll up and down the scroller.
 * Wheel is enabled by default.
 *
 * @since 1.15
 *
 * @see elm_scroller_wheel_disabled_get()
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_wheel_disabled_set(obj:PEvas_Object; disabled:TEina_Bool);cdecl;external;
{*
 * @brief Get a value whether mouse wheel is enabled or not over the scroller.
 *
 * @param obj The scroller object
 * @return @c EINA_TRUE means scroller wheel is disabled. @c EINA_FALSE indicates it is enabled.
 *
 * Mouse wheel can be used to scroll up and down the scroller.
 *
 * @since 1.15
 *
 * @see elm_scroller_wheel_disabled_set()
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
function elm_scroller_wheel_disabled_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set event propagation on a scroller
 *
 * This enables or disables event propagation from the scroller content to the
 * scroller and its parent. By default event propagation is enabled.
 *
 * @param[in] obj The scroller object
 * @param[in] propagation The propagation state
 *
 * @ingroup Elm_Scroller_Group
  }
procedure elm_scroller_propagate_events_set(obj:PEvas_Object; propagation:TEina_Bool);cdecl;external;
{*
 * @brief Get event propagation for a scroller
 *
 * This gets the event propagation for a scroller.
 *
 * @param[in] obj The scroller object
 * @return The propagation state
 *
 * @ingroup Elm_Scroller_Group
  }
(* Const before type ignored *)
function elm_scroller_propagate_events_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
