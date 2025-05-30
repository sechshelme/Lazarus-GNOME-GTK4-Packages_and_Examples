
unit efl_ui_datepicker_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_datepicker_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_datepicker_eo.h
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
PEfl_Ui_Datepicker  = ^Efl_Ui_Datepicker;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_DATEPICKER_EO_H_}
{$define _EFL_UI_DATEPICKER_EO_H_}
{$ifndef _EFL_UI_DATEPICKER_EO_CLASS_TYPE}
{$define _EFL_UI_DATEPICKER_EO_CLASS_TYPE}
type
  PEfl_Ui_Datepicker = ^TEfl_Ui_Datepicker;
  TEfl_Ui_Datepicker = TEo;
{$endif}
{$ifndef _EFL_UI_DATEPICKER_EO_TYPES}
{$define _EFL_UI_DATEPICKER_EO_TYPES}
{$endif}
{*
 * @brief Datepicker widget
 *
 * This is a widget which allows the user to pick a date using internal
 * spinner. User can use the internal spinner to select year, month, day or
 * user can input value using internal entry.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Datepicker
  }

{ was #define dname def_expr }
function EFL_UI_DATEPICKER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_datepicker_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The lower boundary of date.
 *
 * @c year: Year. The year range is from 1900 to 2137.
 *
 * @c month: Month. The month range is from 1 to 12.
 *
 * @c day: Day. The day range is from 1 to 31 according to @c month.
 *
 * @param[in] obj The object.
 * @param[in] year The year value.
 * @param[in] month The month value from 1 to 12.
 * @param[in] day The day value from 1 to 31.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Datepicker
  }
procedure efl_ui_datepicker_date_min_set(obj:PEo; year:longint; month:longint; day:longint);cdecl;external;
{*
 * @brief The lower boundary of date.
 *
 * @c year: Year. The year range is from 1900 to 2137.
 *
 * @c month: Month. The month range is from 1 to 12.
 *
 * @c day: Day. The day range is from 1 to 31 according to @c month.
 *
 * @param[in] obj The object.
 * @param[out] year The year value.
 * @param[out] month The month value from 1 to 12.
 * @param[out] day The day value from 1 to 31.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Datepicker
  }
(* Const before type ignored *)
procedure efl_ui_datepicker_date_min_get(obj:PEo; year:Plongint; month:Plongint; day:Plongint);cdecl;external;
{*
 * @brief The upper boundary of date.
 *
 * @c year: Year. The year range is from 1900 to 2137.
 *
 * @c month: Month. The month range is from 1 to 12.
 *
 * @c day: Day. The day range is from 1 to 31 according to @c month.
 *
 * @param[in] obj The object.
 * @param[in] year The year value.
 * @param[in] month The month value from 1 to 12.
 * @param[in] day The day value from 1 to 31.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Datepicker
  }
procedure efl_ui_datepicker_date_max_set(obj:PEo; year:longint; month:longint; day:longint);cdecl;external;
{*
 * @brief The upper boundary of date.
 *
 * @c year: Year. The year range is from 1900 to 2137.
 *
 * @c month: Month. The month range is from 1 to 12.
 *
 * @c day: Day. The day range is from 1 to 31 according to @c month.
 *
 * @param[in] obj The object.
 * @param[out] year The year value.
 * @param[out] month The month value from 1 to 12.
 * @param[out] day The day value from 1 to 31.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Datepicker
  }
(* Const before type ignored *)
procedure efl_ui_datepicker_date_max_get(obj:PEo; year:Plongint; month:Plongint; day:Plongint);cdecl;external;
{*
 * @brief The current value of date.
 *
 * @c year: Year. The year range is from 1900 to 2137.
 *
 * @c month: Month. The month range is from 0 to 11.
 *
 * @c day: Day. The day range is from 1 to 31 according to @c month.
 *
 * @param[in] obj The object.
 * @param[in] year The year value.
 * @param[in] month The month value from 1 to 12.
 * @param[in] day The day value from 1 to 31.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Datepicker
  }
procedure efl_ui_datepicker_date_set(obj:PEo; year:longint; month:longint; day:longint);cdecl;external;
{*
 * @brief The current value of date.
 *
 * @c year: Year. The year range is from 1900 to 2137.
 *
 * @c month: Month. The month range is from 0 to 11.
 *
 * @c day: Day. The day range is from 1 to 31 according to @c month.
 *
 * @param[in] obj The object.
 * @param[out] year The year value.
 * @param[out] month The month value from 1 to 12.
 * @param[out] day The day value from 1 to 31.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Datepicker
  }
(* Const before type ignored *)
procedure efl_ui_datepicker_date_get(obj:PEo; year:Plongint; month:Plongint; day:Plongint);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_DATEPICKER_EVENT_DATE_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when date value is changed
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Datepicker
  }

{ was #define dname def_expr }
function EFL_UI_DATEPICKER_EVENT_DATE_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_DATEPICKER_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_DATEPICKER_CLASS:=efl_ui_datepicker_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_DATEPICKER_EVENT_DATE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_UI_DATEPICKER_EVENT_DATE_CHANGED:=@(_EFL_UI_DATEPICKER_EVENT_DATE_CHANGED);
  end;


end.
