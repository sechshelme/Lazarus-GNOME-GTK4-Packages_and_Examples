
unit efl_ui_clock_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_clock_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_clock_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Ui_Clock  = ^Efl_Ui_Clock;
PEfl_Ui_Clock_Type  = ^Efl_Ui_Clock_Type;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_CLOCK_EO_H_}
{$define _EFL_UI_CLOCK_EO_H_}
{$ifndef _EFL_UI_CLOCK_EO_CLASS_TYPE}
{$define _EFL_UI_CLOCK_EO_CLASS_TYPE}
type
  PEfl_Ui_Clock = ^TEfl_Ui_Clock;
  TEfl_Ui_Clock = TEo;
{$endif}
{$ifndef _EFL_UI_CLOCK_EO_TYPES}
{$define _EFL_UI_CLOCK_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Identifies a clock field, The widget supports 6 fields : Year, month, Date,
 * Hour, Minute, AM/PM
 *
 * @ingroup Efl_Ui_Clock_Type
  }
{*< Indicates Year field.  }
{*< Indicates Month field.  }
{*< Indicates Date field.  }
{*< Indicates Hour field.  }
{*< Indicates Minute field.  }
{*< Indicates Second field.  }
{*< Indicated Day field.  }
{*< Indicates AM/PM field .  }
type
  PEfl_Ui_Clock_Type = ^TEfl_Ui_Clock_Type;
  TEfl_Ui_Clock_Type =  Longint;
  Const
    EFL_UI_CLOCK_TYPE_YEAR = 0;
    EFL_UI_CLOCK_TYPE_MONTH = 1;
    EFL_UI_CLOCK_TYPE_DATE = 2;
    EFL_UI_CLOCK_TYPE_HOUR = 3;
    EFL_UI_CLOCK_TYPE_MINUTE = 4;
    EFL_UI_CLOCK_TYPE_SECOND = 5;
    EFL_UI_CLOCK_TYPE_DAY = 6;
    EFL_UI_CLOCK_TYPE_AMPM = 7;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl UI clock class
 *
 * @ingroup Efl_Ui_Clock
  }

{ was #define dname def_expr }
function EFL_UI_CLOCK_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_clock_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The current clock format. Format is a combination of allowed Libc
 * date format specifiers like: "%b %d, %Y %I : %M %p".
 *
 * Maximum allowed format length is 64 chars.
 *
 * Format can include separators for each individual clock field except for
 * AM/PM field.
 *
 * Each separator can be a maximum of 6 UTF-8 bytes. Space is also taken as a
 * separator.
 *
 * These specifiers can be arranged in any order and the widget will display
 * the fields accordingly.
 *
 * Default format is taken as per the system locale settings.
 *
 * @param[in] obj The object.
 * @param[in] fmt The clock format.
 *
 * @ingroup Efl_Ui_Clock
  }
(* Const before type ignored *)
procedure efl_ui_clock_format_set(obj:PEo; fmt:Pchar);cdecl;external;
{*
 * @brief The current clock format. Format is a combination of allowed Libc
 * date format specifiers like: "%b %d, %Y %I : %M %p".
 *
 * Maximum allowed format length is 64 chars.
 *
 * Format can include separators for each individual clock field except for
 * AM/PM field.
 *
 * Each separator can be a maximum of 6 UTF-8 bytes. Space is also taken as a
 * separator.
 *
 * These specifiers can be arranged in any order and the widget will display
 * the fields accordingly.
 *
 * Default format is taken as per the system locale settings.
 *
 * @param[in] obj The object.
 *
 * @return The clock format.
 *
 * @ingroup Efl_Ui_Clock
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_ui_clock_format_get(obj:PEo):Pchar;cdecl;external;
{*
 * @brief Whether the given clock widget should be paused or not.
 *
 * This function pauses or starts the clock widget.
 *
 * @param[in] obj The object.
 * @param[in] paused @c true to pause clock, @c false otherwise
 *
 * @ingroup Efl_Ui_Clock
  }
procedure efl_ui_clock_pause_set(obj:PEo; paused:TEina_Bool);cdecl;external;
{*
 * @brief Whether the given clock widget should be paused or not.
 *
 * This function pauses or starts the clock widget.
 *
 * @param[in] obj The object.
 *
 * @return @c true to pause clock, @c false otherwise
 *
 * @ingroup Efl_Ui_Clock
  }
(* Const before type ignored *)
function efl_ui_clock_pause_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Digits of the given clock widget should be editable when in editing
 * mode.
 *
 * @param[in] obj The object.
 * @param[in] value @c true to set edit mode, @c false otherwise
 *
 * @ingroup Efl_Ui_Clock
  }
procedure efl_ui_clock_edit_mode_set(obj:PEo; value:TEina_Bool);cdecl;external;
{*
 * @brief Digits of the given clock widget should be editable when in editing
 * mode.
 *
 * @param[in] obj The object.
 *
 * @return @c true to set edit mode, @c false otherwise
 *
 * @ingroup Efl_Ui_Clock
  }
(* Const before type ignored *)
function efl_ui_clock_edit_mode_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The lower boundary of a field.
 *
 * Year: years since 1900. Negative value represents year below 1900 (year
 * value -30 represents 1870). Year default range is from 70 to 137.
 *
 * Month: default value range is from 0 to 11.
 *
 * Date: default value range is from 1 to 31 according to the month value.
 *
 * Hour: default value will be in terms of 24 hr format (0~23)
 *
 * Minute: default value range is from 0 to 59.
 *
 * Compare with @ref efl_ui_clock_field_limit_get which allows setting limits
 * to each individual time field.
 *
 * @param[in] obj The object.
 * @param[in] mintime Time structure containing the minimum time value.
 *
 * @ingroup Efl_Ui_Clock
  }
procedure efl_ui_clock_time_min_set(obj:PEo; mintime:TEfl_Time);cdecl;external;
{*
 * @brief The lower boundary of a field.
 *
 * Year: years since 1900. Negative value represents year below 1900 (year
 * value -30 represents 1870). Year default range is from 70 to 137.
 *
 * Month: default value range is from 0 to 11.
 *
 * Date: default value range is from 1 to 31 according to the month value.
 *
 * Hour: default value will be in terms of 24 hr format (0~23)
 *
 * Minute: default value range is from 0 to 59.
 *
 * Compare with @ref efl_ui_clock_field_limit_get which allows setting limits
 * to each individual time field.
 *
 * @param[in] obj The object.
 *
 * @return Time structure containing the minimum time value.
 *
 * @ingroup Efl_Ui_Clock
  }
(* Const before type ignored *)
function efl_ui_clock_time_min_get(obj:PEo):TEfl_Time;cdecl;external;
{*
 * @brief The upper boundary of a field.
 *
 * Year: years since 1900. Negative value represents year below 1900 (year
 * value -30 represents 1870). Year default range is from 70 to 137.
 *
 * Month: default value range is from 0 to 11.
 *
 * Date: default value range is from 1 to 31 according to the month value.
 *
 * Hour: default value will be in terms of 24 hr format (0~23)
 *
 * Minute: default value range is from 0 to 59.
 *
 * Compare with @ref efl_ui_clock_field_limit_get which allows setting limits
 * to each individual time field.
 *
 * @param[in] obj The object.
 * @param[in] maxtime Time structure containing the maximum time value.
 *
 * @ingroup Efl_Ui_Clock
  }
procedure efl_ui_clock_time_max_set(obj:PEo; maxtime:TEfl_Time);cdecl;external;
{*
 * @brief The upper boundary of a field.
 *
 * Year: years since 1900. Negative value represents year below 1900 (year
 * value -30 represents 1870). Year default range is from 70 to 137.
 *
 * Month: default value range is from 0 to 11.
 *
 * Date: default value range is from 1 to 31 according to the month value.
 *
 * Hour: default value will be in terms of 24 hr format (0~23)
 *
 * Minute: default value range is from 0 to 59.
 *
 * Compare with @ref efl_ui_clock_field_limit_get which allows setting limits
 * to each individual time field.
 *
 * @param[in] obj The object.
 *
 * @return Time structure containing the maximum time value.
 *
 * @ingroup Efl_Ui_Clock
  }
(* Const before type ignored *)
function efl_ui_clock_time_max_get(obj:PEo):TEfl_Time;cdecl;external;
{*
 * @brief The current value of a clock object.
 *
 * Year: years since 1900. Negative value represents year below 1900 (year
 * value -30 represents 1870). Year default range is from 70 to 137.
 *
 * Month: default value range is from 0 to 11.
 *
 * Date: default value range is from 1 to 31 according to the month value.
 *
 * Hour: default value will be in terms of 24 hr format (0~23)
 *
 * Minute: default value range is from 0 to 59.
 *
 * @param[in] obj The object.
 * @param[in] curtime Time structure containing the time value.
 *
 * @ingroup Efl_Ui_Clock
  }
procedure efl_ui_clock_time_set(obj:PEo; curtime:TEfl_Time);cdecl;external;
{*
 * @brief The current value of a clock object.
 *
 * Year: years since 1900. Negative value represents year below 1900 (year
 * value -30 represents 1870). Year default range is from 70 to 137.
 *
 * Month: default value range is from 0 to 11.
 *
 * Date: default value range is from 1 to 31 according to the month value.
 *
 * Hour: default value will be in terms of 24 hr format (0~23)
 *
 * Minute: default value range is from 0 to 59.
 *
 * @param[in] obj The object.
 *
 * @return Time structure containing the time value.
 *
 * @ingroup Efl_Ui_Clock
  }
(* Const before type ignored *)
function efl_ui_clock_time_get(obj:PEo):TEfl_Time;cdecl;external;
{*
 * @brief Visibility of each field.
 *
 * Allows, for example, hiding the year field by setting
 * @ref EFL_UI_CLOCK_TYPE_YEAR's visibility to @c false.
 *
 * Setting this API to @c true in itself doesn't ensure that the field is
 * visible. The field's format also must be present in the overall clock
 * format.  If a field's visibility is set to @c false then it won't appear
 * even though its format is present. In summary, if this API is set to true
 * and the corresponding field's format is present in clock format, the field
 * is visible.
 *
 * By default the field visibility is set to @c true.
 *
 * @param[in] obj The object.
 * @param[in] fieldtype Type of the field.
 * @param[in] visible @c true field can be visible, @c false otherwise.
 *
 * @ingroup Efl_Ui_Clock
  }
procedure efl_ui_clock_field_visible_set(obj:PEo; fieldtype:TEfl_Ui_Clock_Type; visible:TEina_Bool);cdecl;external;
{*
 * @brief Visibility of each field.
 *
 * Allows, for example, hiding the year field by setting
 * @ref EFL_UI_CLOCK_TYPE_YEAR's visibility to @c false.
 *
 * Setting this API to @c true in itself doesn't ensure that the field is
 * visible. The field's format also must be present in the overall clock
 * format.  If a field's visibility is set to @c false then it won't appear
 * even though its format is present. In summary, if this API is set to true
 * and the corresponding field's format is present in clock format, the field
 * is visible.
 *
 * By default the field visibility is set to @c true.
 *
 * @param[in] obj The object.
 * @param[in] fieldtype Type of the field.
 *
 * @return @c true field can be visible, @c false otherwise.
 *
 * @ingroup Efl_Ui_Clock
  }
(* Const before type ignored *)
function efl_ui_clock_field_visible_get(obj:PEo; fieldtype:TEfl_Ui_Clock_Type):TEina_Bool;cdecl;external;
{*
 * @brief Numerical limits of each field.
 *
 * Limits can be set to individual fields, independently, except for the AM/PM
 * field. Any field can display the values only in between these minimum and
 * maximum limits unless the corresponding time value is restricted from
 * MinTime to MaxTime. That is, min/max field limits always work under the
 * limitations of mintime/maxtime.
 *
 * There is no provision to set the limits of AM/PM field.
 *
 * Compare with @ref efl_ui_clock_time_min_get and
 * @ref efl_ui_clock_time_max_get which set a global limit to the acceptable
 * dates instead of to each individual field.
 *
 * @param[in] obj The object.
 * @param[in] fieldtype Type of the field.
 * @param[in] min Acceptable minimum value for this field.
 * @param[in] max Acceptable maximum value for this field.
 *
 * @ingroup Efl_Ui_Clock
  }
procedure efl_ui_clock_field_limit_set(obj:PEo; fieldtype:TEfl_Ui_Clock_Type; min:longint; max:longint);cdecl;external;
{*
 * @brief Numerical limits of each field.
 *
 * Limits can be set to individual fields, independently, except for the AM/PM
 * field. Any field can display the values only in between these minimum and
 * maximum limits unless the corresponding time value is restricted from
 * MinTime to MaxTime. That is, min/max field limits always work under the
 * limitations of mintime/maxtime.
 *
 * There is no provision to set the limits of AM/PM field.
 *
 * Compare with @ref efl_ui_clock_time_min_get and
 * @ref efl_ui_clock_time_max_get which set a global limit to the acceptable
 * dates instead of to each individual field.
 *
 * @param[in] obj The object.
 * @param[in] fieldtype Type of the field.
 * @param[out] min Acceptable minimum value for this field.
 * @param[out] max Acceptable maximum value for this field.
 *
 * @ingroup Efl_Ui_Clock
  }
(* Const before type ignored *)
procedure efl_ui_clock_field_limit_get(obj:PEo; fieldtype:TEfl_Ui_Clock_Type; min:Plongint; max:Plongint);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_CLOCK_EVENT_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when clock changed
 *
 * @ingroup Efl_Ui_Clock
  }

{ was #define dname def_expr }
function EFL_UI_CLOCK_EVENT_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_CLOCK_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_CLOCK_CLASS:=efl_ui_clock_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_CLOCK_EVENT_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_CLOCK_EVENT_CHANGED:=@(_EFL_UI_CLOCK_EVENT_CHANGED);
  end;


end.
