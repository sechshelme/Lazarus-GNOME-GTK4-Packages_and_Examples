
unit elm_spinner_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_spinner_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_spinner_legacy.h
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
Pchar  = ^char;
Pdouble  = ^double;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Add a new spinner widget to the given parent Elementary
 * (container) object.
 *
 * @param parent The parent object.
 * @return a new spinner widget handle or @c NULL, on errors.
 *
 * This function inserts a new spinner widget on the canvas.
 *
 * @ingroup Elm_Spinner_Group
 *
  }

function elm_spinner_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Delete the special string display in the place of the numerical value.
 *
 * @param obj The spinner object.
 * @param value The replaced value.
 *
 * It will remove a previously added special value. After this, the spinner
 * will display the value itself instead of a label.
 *
 * @see elm_spinner_special_value_add() for more details.
 *
 * @ingroup Elm_Spinner_Group
 * @since 1.8
  }
procedure elm_spinner_special_value_del(obj:PEvas_Object; value:Tdouble);cdecl;external;
{*
 * Get the special string display in the place of the numerical value.
 *
 * @param obj The spinner object.
 * @param value The replaced value.
 * @return The used label.
 *
 * @see elm_spinner_special_value_add() for more details.
 *
 * @ingroup Elm_Spinner_Group
 * @since 1.8
  }
(* Const before type ignored *)
function elm_spinner_special_value_get(obj:PEvas_Object; value:Tdouble):Pchar;cdecl;external;
{*
 * @brief Control the minimum and maximum values for the spinner.
 *
 * Define the allowed range of values to be selected by the user.
 *
 * If actual value is less than @c min, it will be updated to @c min. If it is
 * bigger then @c max, will be updated to @c max. Actual value can be get with
 * @ref elm_obj_spinner_value_get.
 *
 * By default, min is equal to 0, and max is equal to 100.
 *
 * @warning Maximum must be greater than minimum.
 *
 * @param[in] min The minimum value.
 * @param[in] max The maximum value.
 *
 * @ingroup Elm_Spinner_Group
  }
procedure elm_spinner_min_max_set(obj:PEvas_Object; min:Tdouble; max:Tdouble);cdecl;external;
{*
 * @brief Control the minimum and maximum values for the spinner.
 *
 * Define the allowed range of values to be selected by the user.
 *
 * If actual value is less than @c min, it will be updated to @c min. If it is
 * bigger then @c max, will be updated to @c max. Actual value can be get with
 * @ref elm_obj_spinner_value_get.
 *
 * By default, min is equal to 0, and max is equal to 100.
 *
 * @warning Maximum must be greater than minimum.
 *
 * @param[out] min The minimum value.
 * @param[out] max The maximum value.
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
procedure elm_spinner_min_max_get(obj:PEvas_Object; min:Pdouble; max:Pdouble);cdecl;external;
{*
 * @brief Control the step used to increment or decrement the spinner value.
 *
 * This value will be incremented or decremented to the displayed value. It
 * will be incremented while the user keep right or top arrow pressed, and will
 * be decremented while the user keep left or bottom arrow pressed.
 *
 * The interval to increment / decrement can be set with
 * @ref elm_obj_spinner_interval_set.
 *
 * By default step value is equal to 1.
 *
 * @param[in] step The step value.
 *
 * @ingroup Elm_Spinner_Group
  }
procedure elm_spinner_step_set(obj:PEvas_Object; step:Tdouble);cdecl;external;
{*
 * @brief Control the step used to increment or decrement the spinner value.
 *
 * This value will be incremented or decremented to the displayed value. It
 * will be incremented while the user keep right or top arrow pressed, and will
 * be decremented while the user keep left or bottom arrow pressed.
 *
 * The interval to increment / decrement can be set with
 * @ref elm_obj_spinner_interval_set.
 *
 * By default step value is equal to 1.
 *
 * @return The step value.
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
function elm_spinner_step_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Control the value the spinner displays.
 *
 * Value will be presented on the label following format specified with
 * elm_spinner_format_set().
 *
 * Warning The value must to be between min and max values. This values are set
 * by elm_spinner_min_max_set().
 *
 * @param[in] val The value to be displayed.
 *
 * @ingroup Elm_Spinner_Group
  }
procedure elm_spinner_value_set(obj:PEvas_Object; val:Tdouble);cdecl;external;
{*
 * @brief Control the value the spinner displays.
 *
 * Value will be presented on the label following format specified with
 * elm_spinner_format_set().
 *
 * Warning The value must to be between min and max values. This values are set
 * by elm_spinner_min_max_set().
 *
 * @return The value to be displayed.
 *
 * @ingroup Elm_Spinner_Group
  }
(* Const before type ignored *)
function elm_spinner_value_get(obj:PEvas_Object):Tdouble;cdecl;external;
{$include "elm_spinner_eo.legacy.h"}

implementation


end.
