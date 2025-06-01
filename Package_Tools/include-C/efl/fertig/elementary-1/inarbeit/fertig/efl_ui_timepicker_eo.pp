
unit efl_ui_timepicker_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_timepicker_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_timepicker_eo.h
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
PEfl_Ui_Timepicker  = ^Efl_Ui_Timepicker;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_TIMEPICKER_EO_H_}
{$define _EFL_UI_TIMEPICKER_EO_H_}
{$ifndef _EFL_UI_TIMEPICKER_EO_CLASS_TYPE}
{$define _EFL_UI_TIMEPICKER_EO_CLASS_TYPE}
type
  PEfl_Ui_Timepicker = ^TEfl_Ui_Timepicker;
  TEfl_Ui_Timepicker = TEo;
{$endif}
{$ifndef _EFL_UI_TIMEPICKER_EO_TYPES}
{$define _EFL_UI_TIMEPICKER_EO_TYPES}
{$endif}
{*
 * @brief Timepicker widget
 *
 * This is a widget which allows the user to pick a time using internal
 * spinner. User can use the internal spinner to select hour, minute, AM/PM or
 * user can input value using internal entry.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Timepicker
  }

{ was #define dname def_expr }
function EFL_UI_TIMEPICKER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_timepicker_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The current value of time
 *
 * @c hour: Hour. The hour value is in terms of 24 hour format from 0 to 23.
 *
 * @c min: Minute. The minute range is from 0 to 59.
 *
 * @param[in] obj The object.
 * @param[in] hour The hour value from 0 to 23.
 * @param[in] min The minute value from 0 to 59.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Timepicker
  }
procedure efl_ui_timepicker_time_set(obj:PEo; hour:longint; min:longint);cdecl;external;
{*
 * @brief The current value of time
 *
 * @c hour: Hour. The hour value is in terms of 24 hour format from 0 to 23.
 *
 * @c min: Minute. The minute range is from 0 to 59.
 *
 * @param[in] obj The object.
 * @param[out] hour The hour value from 0 to 23.
 * @param[out] min The minute value from 0 to 59.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Timepicker
  }
(* Const before type ignored *)
procedure efl_ui_timepicker_time_get(obj:PEo; hour:Plongint; min:Plongint);cdecl;external;
{*
 * @brief Control if the Timepicker displays 24 hour time or 12 hour time
 * including AM/PM button.
 *
 * @param[in] obj The object.
 * @param[in] is_24hour @c true to display the 24 hour time, @c false to
 * display 12 hour time including AM/PM label.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Timepicker
  }
procedure efl_ui_timepicker_is_24hour_set(obj:PEo; is_24hour:TEina_Bool);cdecl;external;
{*
 * @brief Control if the Timepicker displays 24 hour time or 12 hour time
 * including AM/PM button.
 *
 * @param[in] obj The object.
 *
 * @return @c true to display the 24 hour time, @c false to display 12 hour
 * time including AM/PM label.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Timepicker
  }
(* Const before type ignored *)
function efl_ui_timepicker_is_24hour_get(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when time is changed
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Timepicker
  }

{ was #define dname def_expr }
function EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_TIMEPICKER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_TIMEPICKER_CLASS:=efl_ui_timepicker_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED:=@(_EFL_UI_TIMEPICKER_EVENT_TIME_CHANGED);
  end;


end.
