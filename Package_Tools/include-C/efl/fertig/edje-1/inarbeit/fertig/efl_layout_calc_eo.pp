
unit efl_layout_calc_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_layout_calc_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_layout_calc_eo.h
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
PEfl_Layout_Calc  = ^Efl_Layout_Calc;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_LAYOUT_CALC_EO_H_}
{$define _EFL_LAYOUT_CALC_EO_H_}
{$ifndef _EFL_LAYOUT_CALC_EO_CLASS_TYPE}
{$define _EFL_LAYOUT_CALC_EO_CLASS_TYPE}
type
  PEfl_Layout_Calc = ^TEfl_Layout_Calc;
  TEfl_Layout_Calc = TEo;
{$endif}
{$ifndef _EFL_LAYOUT_CALC_EO_TYPES}
{$define _EFL_LAYOUT_CALC_EO_TYPES}
{$endif}
{*
 * @brief This interface defines a common set of APIs used to trigger
 * calculations with layout objects.
 *
 * This defines all the APIs supported by legacy "Edje" object, known in EO API
 * as Efl.Canvas.Layout.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }

{ was #define dname def_expr }
function EFL_LAYOUT_CALC_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_layout_calc_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Whether this object updates its size hints automatically.
 *
 * By default edje doesn't set size hints on itself. If this property is set to
 * @c true, size hints will be updated after recalculation. Be careful, as
 * recalculation may happen often, enabling this property may have a
 * considerable performance impact as other widgets will be notified of the
 * size hints changes.
 *
 * A layout recalculation can be triggered by @ref efl_layout_calc_size_min(),
 * @ref efl_layout_calc_size_min(), @ref efl_layout_calc_parts_extends() or
 * even any other internal event.
 *
 * @param[in] obj The object.
 * @param[in] update Whether or not update the size hints.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }
procedure efl_layout_calc_auto_update_hints_set(obj:PEo; update:TEina_Bool);cdecl;external;
{*
 * @brief Whether this object updates its size hints automatically.
 *
 * By default edje doesn't set size hints on itself. If this property is set to
 * @c true, size hints will be updated after recalculation. Be careful, as
 * recalculation may happen often, enabling this property may have a
 * considerable performance impact as other widgets will be notified of the
 * size hints changes.
 *
 * A layout recalculation can be triggered by @ref efl_layout_calc_size_min(),
 * @ref efl_layout_calc_size_min(), @ref efl_layout_calc_parts_extends() or
 * even any other internal event.
 *
 * @param[in] obj The object.
 *
 * @return Whether or not update the size hints.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }
(* Const before type ignored *)
function efl_layout_calc_auto_update_hints_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Calculates the minimum required size for a given layout object.
 *
 * This call will trigger an internal recalculation of all parts of the object,
 * in order to return its minimum required dimensions for width and height. The
 * user might choose to impose those minimum sizes, making the resulting
 * calculation to get to values greater or equal than @c restricted in both
 * directions.
 *
 * @note At the end of this call, the object won't be automatically resized to
 * the new dimensions, but just return the calculated sizes. The caller is the
 * one up to change its geometry or not.
 *
 * @warning Be advised that invisible parts in the object will be taken into
 * account in this calculation.
 *
 * @param[in] obj The object.
 * @param[in] restricted The minimum size constraint as input, the returned
 * size can not be lower than this (in both directions).
 *
 * @return The minimum required size.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }
function efl_layout_calc_size_min(obj:PEo; restricted:TEina_Size2D):TEina_Size2D;cdecl;external;
{*
 * @brief Calculates the geometry of the region, relative to a given layout
 * object's area, occupied by all parts in the object.
 *
 * This function gets the geometry of the rectangle equal to the area required
 * to group all parts in obj's group/collection. The x and y coordinates are
 * relative to the top left corner of the whole obj object's area. Parts placed
 * out of the group's boundaries will also be taken in account, so that x and y
 * may be negative.
 *
 * @note On failure, this function will make all non-$null geometry pointers'
 * pointed variables be set to zero.
 *
 * @param[in] obj The object.
 *
 * @return The calculated region.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }
function efl_layout_calc_parts_extends(obj:PEo):TEina_Rect;cdecl;external;
{*
 * @brief Freezes the layout object.
 *
 * This function puts all changes on hold. Successive freezes will nest,
 * requiring an equal number of thaws.
 *
 * See also @ref efl_layout_calc_thaw.
 *
 * @param[in] obj The object.
 *
 * @return The frozen state or 0 on error
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }
function efl_layout_calc_freeze(obj:PEo):longint;cdecl;external;
{*
 * @brief Thaws the layout object.
 *
 * This function thaws (in other words "unfreezes") the given layout object.
 *
 * @note If successive freezes were done, an equal number of thaws will be
 * required.
 *
 * See also @ref efl_layout_calc_freeze.
 *
 * @param[in] obj The object.
 *
 * @return The frozen state or 0 if the object is not frozen or on error.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }
function efl_layout_calc_thaw(obj:PEo):longint;cdecl;external;
{$ifdef EFL_LAYOUT_CALC_PROTECTED}
{*
 * @brief Forces a Size/Geometry calculation.
 *
 * Forces the object to recalculate its layout regardless of freeze/thaw. This
 * API should be used carefully.
 *
 * See also @ref efl_layout_calc_freeze and @ref efl_layout_calc_thaw.
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }
procedure efl_layout_calc_force(obj:PEo);cdecl;external;
{$endif}
(* Const before type ignored *)
  var
    _EFL_LAYOUT_EVENT_RECALC : TEfl_Event_Description;cvar;external;
{* The layout was recalculated.
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }
(* Const before type ignored *)
    _EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY : TEfl_Event_Description;cvar;external;
{* A circular dependency between parts of the object was found.
 * @return const Eina_Array *
 *
 * @since 1.22
 *
 * @ingroup Efl_Layout_Calc
  }

{ was #define dname def_expr }
function EFL_LAYOUT_EVENT_RECALC : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_LAYOUT_CALC_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_LAYOUT_CALC_INTERFACE:=efl_layout_calc_interface_get;
  end;

{ was #define dname def_expr }
function EFL_LAYOUT_EVENT_RECALC : longint; { return type might be wrong }
  begin
    EFL_LAYOUT_EVENT_RECALC:=@(_EFL_LAYOUT_EVENT_RECALC);
  end;

{ was #define dname def_expr }
function EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY : longint; { return type might be wrong }
  begin
    EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY:=@(_EFL_LAYOUT_EVENT_CIRCULAR_DEPENDENCY);
  end;


end.
