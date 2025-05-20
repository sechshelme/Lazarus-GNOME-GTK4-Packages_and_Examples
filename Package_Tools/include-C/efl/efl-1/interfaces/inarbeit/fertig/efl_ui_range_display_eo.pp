
unit efl_ui_range_display_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_range_display_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_range_display_eo.h
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
PEfl_Ui_Range_Display  = ^Efl_Ui_Range_Display;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_RANGE_DISPLAY_EO_H_}
{$define _EFL_UI_RANGE_DISPLAY_EO_H_}
{$ifndef _EFL_UI_RANGE_DISPLAY_EO_CLASS_TYPE}
{$define _EFL_UI_RANGE_DISPLAY_EO_CLASS_TYPE}
type
  PEfl_Ui_Range_Display = ^TEfl_Ui_Range_Display;
  TEfl_Ui_Range_Display = TEo;
{$endif}
{$ifndef _EFL_UI_RANGE_DISPLAY_EO_TYPES}
{$define _EFL_UI_RANGE_DISPLAY_EO_TYPES}
{$endif}
{*
 * @brief Interface that contains properties regarding the displaying of a
 * value within a range.
 *
 * A value range contains a value restricted between specified minimum and
 * maximum limits at all times. This can be used for progress bars, sliders or
 * spinners, for example.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Display
  }

{ was #define dname def_expr }
function EFL_UI_RANGE_DISPLAY_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_range_display_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Control the value (position) of the widget within its valid range.
 *
 * Values outside the limits defined in @ref efl_ui_range_limits_get are
 * ignored and an error is printed.
 *
 * @param[in] obj The object.
 * @param[in] val The range value (must be within the bounds of
 * @ref efl_ui_range_limits_get).
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Display
  }
procedure efl_ui_range_value_set(obj:PEo; val:Tdouble);cdecl;external;
{*
 * @brief Control the value (position) of the widget within its valid range.
 *
 * Values outside the limits defined in @ref efl_ui_range_limits_get are
 * ignored and an error is printed.
 *
 * @param[in] obj The object.
 *
 * @return The range value (must be within the bounds of
 * @ref efl_ui_range_limits_get).
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Display
  }
(* Const before type ignored *)
function efl_ui_range_value_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Set the minimum and maximum values for given range widget.
 *
 * If the current value is less than @c min, it will be updated to @c min. If
 * it is bigger then @c max, will be updated to @c max. The resulting value can
 * be obtained with @ref efl_ui_range_value_get.
 *
 * The default minimum and maximum values may be different for each class.
 *
 * @note maximum must be greater than minimum, otherwise behavior is undefined.
 *
 * @param[in] obj The object.
 * @param[in] min The minimum value.
 * @param[in] max The maximum value.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Display
  }
procedure efl_ui_range_limits_set(obj:PEo; min:Tdouble; max:Tdouble);cdecl;external;
{*
 * @brief Set the minimum and maximum values for given range widget.
 *
 * If the current value is less than @c min, it will be updated to @c min. If
 * it is bigger then @c max, will be updated to @c max. The resulting value can
 * be obtained with @ref efl_ui_range_value_get.
 *
 * The default minimum and maximum values may be different for each class.
 *
 * @note maximum must be greater than minimum, otherwise behavior is undefined.
 *
 * @param[in] obj The object.
 * @param[out] min The minimum value.
 * @param[out] max The maximum value.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Display
  }
(* Const before type ignored *)
procedure efl_ui_range_limits_get(obj:PEo; min:Pdouble; max:Pdouble);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_RANGE_EVENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when the @ref efl_ui_range_value_get is getting changed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Display
  }
(* Const before type ignored *)
    _EFL_UI_RANGE_EVENT_MIN_REACHED : TEfl_Event_Description;cvar;external;
{* Emitted when the @ref efl_ui_range_value_get has reached the minimum of
 * @ref efl_ui_range_limits_get.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Display
  }
(* Const before type ignored *)
    _EFL_UI_RANGE_EVENT_MAX_REACHED : TEfl_Event_Description;cvar;external;
{* Emitted when the @c range_value has reached the maximum of
 * @ref efl_ui_range_limits_get.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Display
  }

{ was #define dname def_expr }
function EFL_UI_RANGE_EVENT_CHANGED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_RANGE_EVENT_MIN_REACHED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_RANGE_EVENT_MAX_REACHED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_RANGE_DISPLAY_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_RANGE_DISPLAY_INTERFACE:=efl_ui_range_display_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_RANGE_EVENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_RANGE_EVENT_CHANGED:=@(_EFL_UI_RANGE_EVENT_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_UI_RANGE_EVENT_MIN_REACHED : longint; { return type might be wrong }
  begin
    EFL_UI_RANGE_EVENT_MIN_REACHED:=@(_EFL_UI_RANGE_EVENT_MIN_REACHED);
  end;

{ was #define dname def_expr }
function EFL_UI_RANGE_EVENT_MAX_REACHED : longint; { return type might be wrong }
  begin
    EFL_UI_RANGE_EVENT_MAX_REACHED:=@(_EFL_UI_RANGE_EVENT_MAX_REACHED);
  end;


end.
