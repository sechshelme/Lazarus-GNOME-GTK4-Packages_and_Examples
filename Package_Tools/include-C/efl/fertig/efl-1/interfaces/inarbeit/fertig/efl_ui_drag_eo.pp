
unit efl_ui_drag_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_drag_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_drag_eo.h
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
PEfl_Ui_Drag  = ^Efl_Ui_Drag;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_DRAG_EO_H_}
{$define _EFL_UI_DRAG_EO_H_}
{$ifndef _EFL_UI_DRAG_EO_CLASS_TYPE}
{$define _EFL_UI_DRAG_EO_CLASS_TYPE}
type
  PEfl_Ui_Drag = ^TEfl_Ui_Drag;
  TEfl_Ui_Drag = TEo;
{$endif}
{$ifndef _EFL_UI_DRAG_EO_TYPES}
{$define _EFL_UI_DRAG_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Common interface for draggable objects and parts.
 *
 * @ingroup Efl_Ui_Drag
  }

{ was #define dname def_expr }
function EFL_UI_DRAG_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_drag_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The draggable object relative location.
 *
 * Some parts in Edje can be dragged along the X/Y axes, if the part contains a
 * "draggable" section (in EDC). For instance, scroll bars can be draggable
 * objects.
 *
 * @c dx and @c dy are real numbers that range from 0 to 1, representing the
 * relative position to the draggable area on that axis.
 *
 * This value means, for the vertical axis, that 0.0 will be at the top if the
 * first parameter of @c y in the draggable part theme is 1 and at the bottom
 * if it is -1.
 *
 * For the horizontal axis, 0.0 means left if the first parameter of @c x in
 * the draggable part theme is 1, and right if it is -1.
 *
 * @param[in] obj The object.
 * @param[in] dx The x relative position, from 0 to 1.
 * @param[in] dy The y relative position, from 0 to 1.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
function efl_ui_drag_value_set(obj:PEo; dx:Tdouble; dy:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief The draggable object relative location.
 *
 * Some parts in Edje can be dragged along the X/Y axes, if the part contains a
 * "draggable" section (in EDC). For instance, scroll bars can be draggable
 * objects.
 *
 * @c dx and @c dy are real numbers that range from 0 to 1, representing the
 * relative position to the draggable area on that axis.
 *
 * This value means, for the vertical axis, that 0.0 will be at the top if the
 * first parameter of @c y in the draggable part theme is 1 and at the bottom
 * if it is -1.
 *
 * For the horizontal axis, 0.0 means left if the first parameter of @c x in
 * the draggable part theme is 1, and right if it is -1.
 *
 * @param[in] obj The object.
 * @param[out] dx The x relative position, from 0 to 1.
 * @param[out] dy The y relative position, from 0 to 1.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
(* Const before type ignored *)
function efl_ui_drag_value_get(obj:PEo; dx:Pdouble; dy:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief The draggable object relative size.
 *
 * Values for @c dw and @c dh are real numbers that range from 0 to 1,
 * representing the relative size of the draggable area on that axis.
 *
 * For instance a scroll bar handle size may depend on the size of the
 * scroller's content.
 *
 * @param[in] obj The object.
 * @param[in] dw The drag relative width, from 0 to 1.
 * @param[in] dh The drag relative height, from 0 to 1.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
function efl_ui_drag_size_set(obj:PEo; dw:Tdouble; dh:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief The draggable object relative size.
 *
 * Values for @c dw and @c dh are real numbers that range from 0 to 1,
 * representing the relative size of the draggable area on that axis.
 *
 * For instance a scroll bar handle size may depend on the size of the
 * scroller's content.
 *
 * @param[in] obj The object.
 * @param[out] dw The drag relative width, from 0 to 1.
 * @param[out] dh The drag relative height, from 0 to 1.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
(* Const before type ignored *)
function efl_ui_drag_size_get(obj:PEo; dw:Pdouble; dh:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief Determines the draggable directions (read-only).
 *
 * The draggable directions are defined in the EDC file, inside the "draggable"
 * section, by the attributes @c x and @c y. See the EDC reference
 * documentation for more information.
 *
 * @param[in] obj The object.
 *
 * @return The direction(s) premitted for drag.
 *
 * @ingroup Efl_Ui_Drag
  }
(* Const before type ignored *)
function efl_ui_drag_dir_get(obj:PEo):TEfl_Ui_Drag_Dir;cdecl;external;
{*
 * @brief The drag step increment.
 *
 * Values for @c dx and @c dy are real numbers that range from 0 to 1,
 * representing the relative size of the draggable area on that axis by which
 * the part will be moved.
 *
 * This differs from @ref efl_ui_drag_page_get in that this is meant to
 * represent a unit increment, like a single line for example.
 *
 * See also @ref efl_ui_drag_page_get.
 *
 * @param[in] obj The object.
 * @param[in] dx The x step relative amount, from 0 to 1.
 * @param[in] dy The y step relative amount, from 0 to 1.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
function efl_ui_drag_step_set(obj:PEo; dx:Tdouble; dy:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief The drag step increment.
 *
 * Values for @c dx and @c dy are real numbers that range from 0 to 1,
 * representing the relative size of the draggable area on that axis by which
 * the part will be moved.
 *
 * This differs from @ref efl_ui_drag_page_get in that this is meant to
 * represent a unit increment, like a single line for example.
 *
 * See also @ref efl_ui_drag_page_get.
 *
 * @param[in] obj The object.
 * @param[out] dx The x step relative amount, from 0 to 1.
 * @param[out] dy The y step relative amount, from 0 to 1.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
(* Const before type ignored *)
function efl_ui_drag_step_get(obj:PEo; dx:Pdouble; dy:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief Moves the draggable by @c dx,$dy steps.
 *
 * This moves the draggable part by @c dx,$dy steps where the step increment is
 * the amount set by @ref efl_ui_drag_step_set().
 *
 * @c dx and @c dy can be positive or negative numbers, integer values are
 * recommended.
 *
 * @param[in] obj The object.
 * @param[in] dx The number of steps horizontally.
 * @param[in] dy The number of steps vertically.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
function efl_ui_drag_step_move(obj:PEo; dx:Tdouble; dy:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief The page step increments.
 *
 * Values for @c dx and @c dy are real numbers that range from 0 to 1,
 * representing the relative size of the draggable area on that axis by which
 * the part will be moved.
 *
 * This differs from @ref efl_ui_drag_step_get in that this is meant to be a
 * larger step size, basically an entire page as opposed to a single or couple
 * of lines.
 *
 * See also @ref efl_ui_drag_step_get.
 *
 * @param[in] obj The object.
 * @param[in] dx The x page step increment
 * @param[in] dy The y page step increment
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
function efl_ui_drag_page_set(obj:PEo; dx:Tdouble; dy:Tdouble):TEina_Bool;cdecl;external;
{*
 * @brief The page step increments.
 *
 * Values for @c dx and @c dy are real numbers that range from 0 to 1,
 * representing the relative size of the draggable area on that axis by which
 * the part will be moved.
 *
 * This differs from @ref efl_ui_drag_step_get in that this is meant to be a
 * larger step size, basically an entire page as opposed to a single or couple
 * of lines.
 *
 * See also @ref efl_ui_drag_step_get.
 *
 * @param[in] obj The object.
 * @param[out] dx The x page step increment
 * @param[out] dy The y page step increment
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
(* Const before type ignored *)
function efl_ui_drag_page_get(obj:PEo; dx:Pdouble; dy:Pdouble):TEina_Bool;cdecl;external;
{*
 * @brief Moves the draggable by @c dx,$dy pages.
 *
 * This moves the draggable by @c dx,$dy pages. The increment is defined by
 * @ref efl_ui_drag_page_set().
 *
 * @c dx and @c dy can be positive or negative numbers, integer values are
 * recommended.
 *
 * @warning Paging is bugged!
 *
 * @param[in] obj The object.
 * @param[in] dx The number of pages horizontally.
 * @param[in] dy The number of pages vertically.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Ui_Drag
  }
function efl_ui_drag_page_move(obj:PEo; dx:Tdouble; dy:Tdouble):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_DRAG_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_DRAG_INTERFACE:=efl_ui_drag_interface_get;
  end;


end.
