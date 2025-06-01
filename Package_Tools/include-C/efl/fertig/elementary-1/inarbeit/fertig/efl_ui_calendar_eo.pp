
unit efl_ui_calendar_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_calendar_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_calendar_eo.h
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
PEfl_Ui_Calendar  = ^Efl_Ui_Calendar;
PEfl_Ui_Calendar_Weekday  = ^Efl_Ui_Calendar_Weekday;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_CALENDAR_EO_H_}
{$define _EFL_UI_CALENDAR_EO_H_}
{$ifndef _EFL_UI_CALENDAR_EO_CLASS_TYPE}
{$define _EFL_UI_CALENDAR_EO_CLASS_TYPE}
type
  PEfl_Ui_Calendar = ^TEfl_Ui_Calendar;
  TEfl_Ui_Calendar = TEo;
{$endif}
{$ifndef _EFL_UI_CALENDAR_EO_TYPES}
{$define _EFL_UI_CALENDAR_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A weekday
 *
 * See also @ref efl_ui_calendar_first_day_of_week_set.
 *
 * @ingroup Efl_Ui_Calendar_Weekday
  }
{*< Sunday weekday  }
{*< Monday weekday  }
{*< Tuesday weekday  }
{*< Wednesday weekday  }
{*< Thursday weekday  }
{*< Friday weekday  }
{*< Saturday weekday  }
{*< Sentinel value to indicate last enum field
                                * during iteration  }
type
  PEfl_Ui_Calendar_Weekday = ^TEfl_Ui_Calendar_Weekday;
  TEfl_Ui_Calendar_Weekday =  Longint;
  Const
    EFL_UI_CALENDAR_WEEKDAY_SUNDAY = 0;
    EFL_UI_CALENDAR_WEEKDAY_MONDAY = 1;
    EFL_UI_CALENDAR_WEEKDAY_TUESDAY = 2;
    EFL_UI_CALENDAR_WEEKDAY_WEDNESDAY = 3;
    EFL_UI_CALENDAR_WEEKDAY_THURSDAY = 4;
    EFL_UI_CALENDAR_WEEKDAY_FRIDAY = 5;
    EFL_UI_CALENDAR_WEEKDAY_SATURDAY = 6;
    EFL_UI_CALENDAR_WEEKDAY_LAST = 7;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Calendar widget
 *
 * It helps applications to flexibly display a calendar with day of the week,
 * date, year and month. Applications are able to set specific dates to be
 * reported back, when selected, in the smart callbacks of the calendar widget.
 *
 * @ingroup Efl_Ui_Calendar
  }

{ was #define dname def_expr }
function EFL_UI_CALENDAR_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_calendar_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The first day of week to use on calendar widgets.
 *
 * This is the day that will appear in the left-most column (e.g. Monday in
 * France or Sunday in the US).
 *
 * @param[in] obj The object.
 * @param[in] day The first day of the week.
 *
 * @ingroup Efl_Ui_Calendar
  }
procedure efl_ui_calendar_first_day_of_week_set(obj:PEo; day:TEfl_Ui_Calendar_Weekday);cdecl;external;
{*
 * @brief The first day of week to use on calendar widgets.
 *
 * This is the day that will appear in the left-most column (e.g. Monday in
 * France or Sunday in the US).
 *
 * @param[in] obj The object.
 *
 * @return The first day of the week.
 *
 * @ingroup Efl_Ui_Calendar
  }
(* Const before type ignored *)
function efl_ui_calendar_first_day_of_week_get(obj:PEo):TEfl_Ui_Calendar_Weekday;cdecl;external;
{*
 * @brief Minimum date on calendar.
 *
 * Setting the minimum date changes the displayed month or year if needed.
 * Displayed days may also be disabled if they are smaller than minimum date.
 * If the minimum date is greater than @ref efl_ui_calendar_date_max_get date,
 * the minimum date will be changed to the maximum date returning @c false.
 *
 * @param[in] obj The object.
 * @param[in] min Time structure containing the minimum date.
 *
 * @return @c true on success.
 *
 * @ingroup Efl_Ui_Calendar
  }
function efl_ui_calendar_date_min_set(obj:PEo; min:TEfl_Time):TEina_Bool;cdecl;external;
{*
 * @brief Minimum date on calendar.
 *
 * Default value is 1 JAN,1902.
 *
 * @param[in] obj The object.
 *
 * @return Time structure containing the minimum date.
 *
 * @ingroup Efl_Ui_Calendar
  }
(* Const before type ignored *)
function efl_ui_calendar_date_min_get(obj:PEo):TEfl_Time;cdecl;external;
{*
 * @brief Maximum date on calendar.
 *
 * Setting the maximum date changes the displayed month or year if needed.
 * Displayed days may also be disabled if they are bigger than maximum date. If
 * the maximum date is less than @ref efl_ui_calendar_date_min_get, the maximum
 * date will be changed to the minimum date returning @c false.
 *
 * @param[in] obj The object.
 * @param[in] max Time structure containing the maximum date.
 *
 * @return @c true on success.
 *
 * @ingroup Efl_Ui_Calendar
  }
function efl_ui_calendar_date_max_set(obj:PEo; max:TEfl_Time):TEina_Bool;cdecl;external;
{*
 * @brief Maximum date on calendar.
 *
 * Default maximum year is -1. Default maximum day and month are 31 and DEC.
 *
 * If the maximum year is a negative value, it will be limited depending on the
 * platform architecture (year 2037 for 32 bits);
 *
 * @param[in] obj The object.
 *
 * @return Time structure containing the maximum date.
 *
 * @ingroup Efl_Ui_Calendar
  }
(* Const before type ignored *)
function efl_ui_calendar_date_max_get(obj:PEo):TEfl_Time;cdecl;external;
{*
 * @brief The selected date on calendar.
 *
 * Dates will be clamped between @ref efl_ui_calendar_date_min_get and
 * @ref efl_ui_calendar_date_max_get, returning @c false when trying to set
 * out-of-bounds values.
 *
 * @param[in] obj The object.
 * @param[in] date Time structure containing the selected date.
 *
 * @return @c true on success.
 *
 * @ingroup Efl_Ui_Calendar
  }
function efl_ui_calendar_date_set(obj:PEo; date:TEfl_Time):TEina_Bool;cdecl;external;
{*
 * @brief The selected date on calendar.
 *
 * @param[in] obj The object.
 *
 * @return Time structure containing the selected date.
 *
 * @ingroup Efl_Ui_Calendar
  }
(* Const before type ignored *)
function efl_ui_calendar_date_get(obj:PEo):TEfl_Time;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_CALENDAR_EVENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Emitted when the selected date in the calendar is changed
 *
 * @ingroup Efl_Ui_Calendar
  }

{ was #define dname def_expr }
function EFL_UI_CALENDAR_EVENT_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_CALENDAR_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_CALENDAR_CLASS:=efl_ui_calendar_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_CALENDAR_EVENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_CALENDAR_EVENT_CHANGED:=@(_EFL_UI_CALENDAR_EVENT_CHANGED);
  end;


end.
