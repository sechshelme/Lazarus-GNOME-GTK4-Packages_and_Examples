
unit efl_canvas_group_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_group_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_group_eo_legacy.h
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
PEfl_Canvas_Group  = ^Efl_Canvas_Group;
PEina_Iterator  = ^Eina_Iterator;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_GROUP_EO_LEGACY_H_}
{$define _EFL_CANVAS_GROUP_EO_LEGACY_H_}
{$ifndef _EFL_CANVAS_GROUP_EO_CLASS_TYPE}
{$define _EFL_CANVAS_GROUP_EO_CLASS_TYPE}
type
  PEfl_Canvas_Group = ^TEfl_Canvas_Group;
  TEfl_Canvas_Group = TEo;
{$endif}
{$ifndef _EFL_CANVAS_GROUP_EO_TYPES}
{$define _EFL_CANVAS_GROUP_EO_TYPES}
{$endif}
{*
 * @brief Indicates that the group's layout needs to be recalculated.
 *
 * If this flag is set, then the @ref evas_object_smart_calculate function will
 * be called, during rendering phase of the canvas. After that, this flag will
 * be automatically unset.
 *
 * @note setting this flag alone will not make the canvas' whole scene dirty.
 * Using evas_render() will have no effect. To force this, use
 * @ref evas_object_smart_changed, which will also call this function
 * automatically, with the parameter set to @c true.
 *
 * See also @ref evas_object_smart_calculate.
 *
 * @param[in] obj The object.
 * @param[in] value @c true if the group layout needs to be recalculated,
 * @c false otherwise
 *
 * @ingroup Evas_Object_Smart_Group
  }

procedure evas_object_smart_need_recalculate_set(obj:PEfl_Canvas_Group; value:TEina_Bool);cdecl;external;
{*
 * @brief Indicates that the group's layout needs to be recalculated.
 *
 * If this flag is set, then the @ref evas_object_smart_calculate function will
 * be called, during rendering phase of the canvas. After that, this flag will
 * be automatically unset.
 *
 * @note setting this flag alone will not make the canvas' whole scene dirty.
 * Using evas_render() will have no effect. To force this, use
 * @ref evas_object_smart_changed, which will also call this function
 * automatically, with the parameter set to @c true.
 *
 * See also @ref evas_object_smart_calculate.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the group layout needs to be recalculated, @c false
 * otherwise
 *
 * @ingroup Evas_Object_Smart_Group
  }
(* Const before type ignored *)
function evas_object_smart_need_recalculate_get(obj:PEfl_Canvas_Group):TEina_Bool;cdecl;external;
{*
 * @brief Marks the object as dirty.
 *
 * This also forcefully marks the given object as needing recalculation. As an
 * effect, on the next rendering cycle its @ref evas_object_smart_calculate
 * method will be called.
 * @param[in] obj The object.
 *
 * @ingroup Evas_Object_Smart_Group
  }
procedure evas_object_smart_changed(obj:PEfl_Canvas_Group);cdecl;external;
{*
 * @brief Triggers an immediate recalculation of this object's geometry.
 *
 * This will also reset the flag @ref evas_object_smart_need_recalculate_get.
 * @param[in] obj The object.
 *
 * @ingroup Evas_Object_Smart_Group
  }
procedure evas_object_smart_calculate(obj:PEfl_Canvas_Group);cdecl;external;
{*
 * @brief Returns an iterator over the children of this object, which are
 * canvas objects.
 *
 * This returns the list of "smart" children. This might be different from both
 * the @ref Efl_Object children list as well as the @ref Efl_Container content
 * list.
 *
 * @param[in] obj The object.
 *
 * @return Iterator to object children
 *
 * @ingroup Evas_Object_Smart_Group
  }
(* Const before type ignored *)
function evas_object_smart_iterator_new(obj:PEfl_Canvas_Group):PEina_Iterator;cdecl;external;
{$endif}

implementation


end.
