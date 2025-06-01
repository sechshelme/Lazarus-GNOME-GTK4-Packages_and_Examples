
unit elm_calendar_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_calendar_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_calendar_eo_legacy.h
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
PEfl_Time  = ^Efl_Time;
PEina_List  = ^Eina_List;
PElm_Calendar  = ^Elm_Calendar;
PElm_Calendar_Mark  = ^Elm_Calendar_Mark;
PElm_Calendar_Mark_Repeat_Type  = ^Elm_Calendar_Mark_Repeat_Type;
PElm_Calendar_Select_Mode  = ^Elm_Calendar_Select_Mode;
PElm_Calendar_Selectable  = ^Elm_Calendar_Selectable;
PElm_Calendar_Weekday  = ^Elm_Calendar_Weekday;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_CALENDAR_EO_LEGACY_H_}
{$define _ELM_CALENDAR_EO_LEGACY_H_}
{$ifndef _ELM_CALENDAR_EO_CLASS_TYPE}
{$define _ELM_CALENDAR_EO_CLASS_TYPE}
type
  PElm_Calendar = ^TElm_Calendar;
  TElm_Calendar = TEo;
{$endif}
{$ifndef _ELM_CALENDAR_EO_TYPES}
{$define _ELM_CALENDAR_EO_TYPES}
{*
 * @brief Event periodicity, used to define if a mark should be repeated beyond
 * event's day.
 *
 * It's set when a mark is added. So, for a mark added to 13th May with
 * periodicity set to WEEKLY, there will be marks every week after this date.
 * Marks will be displayed at 13th, 20th, 27th, 3rd June ...
 *
 * Values don't work as bitmask, only one can be chosen. See also
 * @ref elm_calendar_mark_add.
 *
 * @ingroup Elm_Calendar_Mark_Repeat
  }
{*< Default value. Marks will be displayed only on
                            * event day.  }
{*< Marks will be displayed every day after event day
                       * (inclusive).  }
{*< Marks will be displayed every week after event day
                        * (inclusive) - i.e. each seven days.  }
{*< Marks will be displayed every month day that
                         * coincides to event day. E.g.: if an event is set to
                         * 30th Jan, no marks will be displayed on Feb, but
                         * will be displayed on 30th Mar.  }
{*< Marks will be displayed every year that coincides
                          * to event day (and month). E.g. an event added to
                          * 30th Jan 2012 will be repeated on 30th Jan 2013.  }
{*< Marks will be displayed every last day of
                                   * month after event day (inclusive).
                                   *
                                   * @since 1.7  }
{*< Marks will be displayed every day before event
                              * day.
                              *
                              * @since 1.19  }
type
  PElm_Calendar_Mark_Repeat_Type = ^TElm_Calendar_Mark_Repeat_Type;
  TElm_Calendar_Mark_Repeat_Type =  Longint;
  Const
    ELM_CALENDAR_UNIQUE = 0;
    ELM_CALENDAR_DAILY = 1;
    ELM_CALENDAR_WEEKLY = 2;
    ELM_CALENDAR_MONTHLY = 3;
    ELM_CALENDAR_ANNUALLY = 4;
    ELM_CALENDAR_LAST_DAY_OF_MONTH = 5;
    ELM_CALENDAR_REVERSE_DAILY = 6;
;
{*
 * @brief A weekday
 *
 * See also @ref elm_calendar_first_day_of_week_set.
 *
 * @ingroup Elm_Calendar
  }
{*< Sunday weekday  }
{*< Monday weekday  }
{*< Tuesday weekday  }
{*< Wednesday weekday  }
{*< Thursday weekday  }
{*< Friday weekday  }
{*< Saturday weekday  }
{*< Sentinel value to indicate last enum field during iteration
                 }
type
  PElm_Calendar_Weekday = ^TElm_Calendar_Weekday;
  TElm_Calendar_Weekday =  Longint;
  Const
    ELM_DAY_SUNDAY = 0;
    ELM_DAY_MONDAY = 1;
    ELM_DAY_TUESDAY = 2;
    ELM_DAY_WEDNESDAY = 3;
    ELM_DAY_THURSDAY = 4;
    ELM_DAY_FRIDAY = 5;
    ELM_DAY_SATURDAY = 6;
    ELM_DAY_LAST = 7;
;
{*
 * @brief The mode, who determine how user could select a day
 *
 * See also @ref elm_calendar_select_mode_set()
 *
 * @ingroup Elm_Calendar_Select
  }
{*< Default value. A day is always
                                         * selected.  }
{*< A day is always selected.  }
{*< None of the days can be selected.  }
{*< User may have selected a day or not.  }
type
  PElm_Calendar_Select_Mode = ^TElm_Calendar_Select_Mode;
  TElm_Calendar_Select_Mode =  Longint;
  Const
    ELM_CALENDAR_SELECT_MODE_DEFAULT = 0;
    ELM_CALENDAR_SELECT_MODE_ALWAYS = 1;
    ELM_CALENDAR_SELECT_MODE_NONE = 2;
    ELM_CALENDAR_SELECT_MODE_ONDEMAND = 3;
;
{*
 * @brief A bitmask used to define which fields of a @c tm struct will be taken
 * into account, when elm_calendar_selected_time_set() is invoked.
 *
 * See also @ref elm_calendar_selectable_set,
 * @ref elm_calendar_selected_time_set.
 *
 * @since 1.8
 *
 * @ingroup Elm_Calendar
  }
{*< Take no field into account  }
{ 1 >> 0  }{*< Take year field into
                                                  * account  }
{ 1 >> 1  }{*< Take month field into
                                                   * account  }
{ 1 >> 2  }{*< Take day field into account
                                                 }
type
  PElm_Calendar_Selectable = ^TElm_Calendar_Selectable;
  TElm_Calendar_Selectable =  Longint;
  Const
    ELM_CALENDAR_SELECTABLE_NONE = 0;
    ELM_CALENDAR_SELECTABLE_YEAR = 1;
    ELM_CALENDAR_SELECTABLE_MONTH = 2;
    ELM_CALENDAR_SELECTABLE_DAY = 4;
;
{* Item handle for a calendar mark. Created with @ref elm_calendar_mark_add
 * and deleted with @ref Elm.Calendar.mark_del.
 *
 * @ingroup Elm_Calendar
  }
type
{$endif}
{*
 * @brief The first day of week to use on calendar widgets'.
 *
 * @param[in] obj The object.
 * @param[in] day Weekday enum value, see @ref Elm_Calendar_Weekday
 *
 * @ingroup Elm_Calendar_Group
  }

procedure elm_calendar_first_day_of_week_set(obj:PElm_Calendar; day:TElm_Calendar_Weekday);cdecl;external;
{*
 * @brief The first day of week to use on calendar widgets'.
 *
 * @param[in] obj The object.
 *
 * @return Weekday enum value, see @ref Elm_Calendar_Weekday
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
function elm_calendar_first_day_of_week_get(obj:PElm_Calendar):TElm_Calendar_Weekday;cdecl;external;
{*
 * @brief Define which fields of a tm struct will be taken into account, when
 * Elm.Calendar.selected_time.set is invoked.
 *
 * By Default the bitmask is set to use all fields of a tm struct (year, month
 * and day of the month).
 *
 * See also @ref elm_calendar_selected_time_set.
 *
 * @param[in] obj The object.
 * @param[in] selectable A bitmask of Elm_Calendar_Selectable
 *
 * @since 1.8
 *
 * @ingroup Elm_Calendar_Group
  }
procedure elm_calendar_selectable_set(obj:PElm_Calendar; selectable:TElm_Calendar_Selectable);cdecl;external;
{*
 * @brief Define which fields of a tm struct will be taken into account, when
 * Elm.Calendar.selected_time.set is invoked.
 *
 * By Default the bitmask is set to use all fields of a tm struct (year, month
 * and day of the month).
 *
 * See also @ref elm_calendar_selected_time_set.
 *
 * @param[in] obj The object.
 *
 * @return A bitmask of Elm_Calendar_Selectable
 *
 * @since 1.8
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
function elm_calendar_selectable_get(obj:PElm_Calendar):TElm_Calendar_Selectable;cdecl;external;
{*
 * @brief The interval on time updates for a user mouse button hold on
 * calendar widgets' month/year selection.
 *
 * This interval value is decreased while the user holds the mouse pointer
 * either selecting next or previous month/year.
 *
 * This helps the user to get to a given month distant from the current one
 * easier/faster, as it will start to change quicker and quicker on mouse
 * button holds.
 *
 * The calculation for the next change interval value, starting from the one
 * set with this call, is the previous interval divided by 1.05, so it
 * decreases a little bit.
 *
 * The default starting interval value for automatic changes is 0.85 seconds.
 *
 * @param[in] obj The object.
 * @param[in] interval The (first) interval value in seconds
 *
 * @ingroup Elm_Calendar_Group
  }
procedure elm_calendar_interval_set(obj:PElm_Calendar; interval:Tdouble);cdecl;external;
{*
 * @brief The interval on time updates for a user mouse button hold on
 * calendar widgets' month/year selection.
 *
 * This interval value is decreased while the user holds the mouse pointer
 * either selecting next or previous month/year.
 *
 * This helps the user to get to a given month distant from the current one
 * easier/faster, as it will start to change quicker and quicker on mouse
 * button holds.
 *
 * The calculation for the next change interval value, starting from the one
 * set with this call, is the previous interval divided by 1.05, so it
 * decreases a little bit.
 *
 * The default starting interval value for automatic changes is 0.85 seconds.
 *
 * @param[in] obj The object.
 *
 * @return The (first) interval value in seconds
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
function elm_calendar_interval_get(obj:PElm_Calendar):Tdouble;cdecl;external;
{*
 * @brief Weekdays names to be displayed by the calendar.
 *
 * By default, weekdays abbreviations get from system are displayed: E.g. for
 * an en_US locale: "Sun, Mon, Tue, Wed, Thu, Fri, Sat"
 *
 * The first string should be related to Sunday, the second to Monday...
 *
 * See also @ref elm_calendar_weekdays_names_get.
 *
 * @ref calendar_example_02. @ref calendar_example_05.
 *
 * @param[in] obj The object.
 * @param[in] weekdays Array of seven strings to be used as weekday names.
 * Warning: It must have 7 elements, or it will access invalid memory. Warning:
 * The strings must be @c null terminated ('@\0').
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
procedure elm_calendar_weekdays_names_set(obj:PElm_Calendar; weekdays:PPchar);cdecl;external;
{*
 * @brief Weekdays names to be displayed by the calendar.
 *
 * By default, weekdays abbreviations get from system are displayed: E.g. for
 * an en_US locale: "Sun, Mon, Tue, Wed, Thu, Fri, Sat"
 *
 * The first string should be related to Sunday, the second to Monday...
 *
 * See also @ref elm_calendar_weekdays_names_get.
 *
 * @ref calendar_example_02. @ref calendar_example_05.
 *
 * @param[in] obj The object.
 *
 * @return Array of seven strings to be used as weekday names. Warning: It must
 * have 7 elements, or it will access invalid memory. Warning: The strings must
 * be @c null terminated ('@\0').
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_calendar_weekdays_names_get(obj:PElm_Calendar):^Pchar;cdecl;external;
{*
 * @brief Select day mode to use.
 *
 * The day selection mode used.
 *
 * @param[in] obj The object.
 * @param[in] mode The select mode to use.
 *
 * @ingroup Elm_Calendar_Group
  }
procedure elm_calendar_select_mode_set(obj:PElm_Calendar; mode:TElm_Calendar_Select_Mode);cdecl;external;
{*
 * @brief Select day mode to use.
 *
 * The day selection mode used.
 *
 * @param[in] obj The object.
 *
 * @return The select mode to use.
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
function elm_calendar_select_mode_get(obj:PElm_Calendar):TElm_Calendar_Select_Mode;cdecl;external;
{*
 * @brief Set a function to format the string that will be used to display
 * month and year;
 *
 * By default it uses strftime with "%B %Y" format string. It should allocate
 * the memory that will be used by the string, that will be freed by the widget
 * after usage. A pointer to the string and a pointer to the time struct will
 * be provided.
 *
 * @ref calendar_example_02.
 *
 * @param[in] obj The object.
 * @param[in] format_function Function to set the month-year string given the
 * selected date.
 *
 * @ingroup Elm_Calendar_Group
  }
procedure elm_calendar_format_function_set(obj:PElm_Calendar; format_function:TElm_Calendar_Format_Cb);cdecl;external;
{*
 * @brief Get a list of all the calendar marks.
 *
 * See also @ref elm_calendar_mark_add, @ref Elm.Calendar.mark_del(),
 * @ref elm_calendar_marks_clear.
 *
 * @param[in] obj The object.
 *
 * @return List with all calendar marks
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_calendar_marks_get(obj:PElm_Calendar):PEina_List;cdecl;external;
{*
 * @brief Minimum date on calendar.
 *
 * See also @ref elm_calendar_date_max_set, @ref elm_calendar_date_max_get
 *
 * Set minimum date on calendar.
 *
 * Set the minimum date, changing the displayed month or year if needed.
 * Displayed day also to be disabled if it is smaller than minimum date.
 *
 * @param[in] obj The object.
 * @param[in] min A tm struct to point to minimum date.
 *
 * @since 1.19
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
procedure elm_calendar_date_min_set(obj:PElm_Calendar; min:PEfl_Time);cdecl;external;
{*
 * @brief Minimum date on calendar.
 *
 * See also @ref elm_calendar_date_max_set, @ref elm_calendar_date_max_get
 *
 * Get minimum date.
 *
 * Default value is 1 JAN,1902.
 *
 * @param[in] obj The object.
 *
 * @return A tm struct to point to minimum date.
 *
 * @since 1.19
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_calendar_date_min_get(obj:PElm_Calendar):PEfl_Time;cdecl;external;
{*
 * @brief Maximum date on calendar.
 *
 * See also @ref elm_calendar_date_min_set, @ref elm_calendar_date_min_get
 *
 * Set maximum date on calendar.
 *
 * Set the maximum date, changing the displayed month or year if needed.
 * Displayed day also to be disabled if it is bigger than maximum date.
 *
 * @param[in] obj The object.
 * @param[in] max A tm struct to point to maximum date.
 *
 * @since 1.19
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
procedure elm_calendar_date_max_set(obj:PElm_Calendar; max:PEfl_Time);cdecl;external;
{*
 * @brief Maximum date on calendar.
 *
 * See also @ref elm_calendar_date_min_set, @ref elm_calendar_date_min_get
 *
 * Get maximum date.
 *
 * Default maximum year is -1. Default maximum day and month are 31 and DEC.
 *
 * If the maximum year is a negative value, it will be limited depending on the
 * platform architecture (year 2037 for 32 bits);
 *
 * @param[in] obj The object.
 *
 * @return A tm struct to point to maximum date.
 *
 * @since 1.19
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_calendar_date_max_get(obj:PElm_Calendar):PEfl_Time;cdecl;external;
{*
 * @brief Set selected date to be highlighted on calendar.
 *
 * Set the selected date, changing the displayed month if needed. Selected date
 * changes when the user goes to next/previous month or select a day pressing
 * over it on calendar.
 *
 * See also @ref elm_calendar_selected_time_get.
 *
 * @ref calendar_example_04
 *
 * @param[in] obj The object.
 * @param[in] selected_time A tm struct to represent the selected date.
 *
 * @ingroup Elm_Calendar_Group
  }
procedure elm_calendar_selected_time_set(obj:PElm_Calendar; selected_time:PEfl_Time);cdecl;external;
{*
 * @brief Get selected date.
 *
 * Get date selected by the user or set by function
 * @ref elm_calendar_selected_time_set(). Selected date changes when the user
 * goes to next/previous month or select a day pressing over it on calendar.
 *
 * See also @ref elm_calendar_selected_time_get.
 *
 * @ref calendar_example_05.
 *
 * @param[in] obj The object.
 * @param[in,out] selected_time A tm struct to point to selected date.
 *
 * @return @c true if the method succeeded, @c false otherwise
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
function elm_calendar_selected_time_get(obj:PElm_Calendar; selected_time:PEfl_Time):TEina_Bool;cdecl;external;
{*
 * @brief Add a new mark to the calendar
 *
 * Add a mark that will be drawn in the calendar respecting the insertion time
 * and periodicity. It will emit the type as signal to the widget theme.
 * Default theme supports "holiday" and "checked", but it can be extended.
 *
 * It won't immediately update the calendar, drawing the marks. For this,
 * @ref elm_calendar_marks_draw(). However, when user selects next or previous
 * month calendar forces marks drawn.
 *
 * Marks created with this method can be deleted with
 * @ref Elm.Calendar.mark_del().
 *
 * See also @ref elm_calendar_marks_draw, @ref Elm.Calendar.mark_del().
 *
 * @ref calendar_example_06
 *
 * @param[in] obj The object.
 * @param[in] mark_type A string used to define the type of mark. It will be
 * emitted to the theme, that should display a related modification on these
 * days representation.
 * @param[in] mark_time A time struct to represent the date of inclusion of the
 * mark. For marks that repeats it will just be displayed after the inclusion
 * date in the calendar.
 * @param[in] repeat Repeat the event following this periodicity. Can be a
 * unique mark (that don't repeat), daily, weekly, monthly or annually.
 *
 * @return The newly added calendar mark
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
function elm_calendar_mark_add(obj:PElm_Calendar; mark_type:Pchar; mark_time:PEfl_Time; _repeat:TElm_Calendar_Mark_Repeat_Type):PElm_Calendar_Mark;cdecl;external;
{*
 * @brief Remove all calendar's marks
 *
 * See also  @ref elm_calendar_mark_add, @ref Elm.Calendar.mark_del().
 * @param[in] obj The object.
 *
 * @ingroup Elm_Calendar_Group
  }
procedure elm_calendar_marks_clear(obj:PElm_Calendar);cdecl;external;
{*
 * @brief Draw calendar marks.
 *
 * Should be used after adding, removing or clearing marks. It will go through
 * the entire marks list updating the calendar. If lots of marks will be added,
 * add all the marks and then call this function.
 *
 * When the month is changed, i.e. user selects next or previous month, marks
 * will be drawn.
 *
 * See also  @ref elm_calendar_mark_add, @ref Elm.Calendar.mark_del(),
 * @ref elm_calendar_marks_clear.
 *
 * @ref calendar_example_06
 * @param[in] obj The object.
 *
 * @ingroup Elm_Calendar_Group
  }
procedure elm_calendar_marks_draw(obj:PElm_Calendar);cdecl;external;
{*
 * @brief Get the current time displayed in the widget
 *
 * @param[in] obj The object.
 * @param[in,out] displayed_time A tm struct to point to displayed date.
 *
 * @return @c true if the method succeeded, @c false otherwise
 *
 * @since 1.8
 *
 * @ingroup Elm_Calendar_Group
  }
(* Const before type ignored *)
function elm_calendar_displayed_time_get(obj:PElm_Calendar; displayed_time:PEfl_Time):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
