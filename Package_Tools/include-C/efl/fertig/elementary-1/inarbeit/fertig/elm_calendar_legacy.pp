
unit elm_calendar_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_calendar_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_calendar_legacy.h
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
PElm_Calendar  = ^Elm_Calendar;
PElm_Calendar_Mark  = ^Elm_Calendar_Mark;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include "elm_calendar_eo.legacy.h"}
{*
 * Add a new calendar widget to the given parent Elementary
 * (container) object.
 *
 * @param parent The parent object.
 * @return a new calendar widget handle or @c NULL, on errors.
 *
 * This function inserts a new calendar widget on the canvas.
 *
 * @ref calendar_example_01
 *
 * @ingroup Elm_Calendar
  }

function elm_calendar_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * Delete mark from the calendar.
 *
 * @param mark The mark to be deleted.
 *
 * If deleting all calendar marks is required, elm_calendar_marks_clear()
 * should be used instead of getting marks list and deleting each one.
 *
 * @see elm_calendar_mark_add()
 *
 * @ref calendar_example_06
  }
procedure elm_calendar_mark_del(mark:PElm_Calendar_Mark);cdecl;external;
{*
 * Set the minimum and maximum values for the year.
 *
 * @param min The minimum year, greater than 1901.
 * @param max The maximum year.
 *
 * Maximum must be greater than minimum, except if you don't want to set maximum year.
 * Default values are 1902 and -1.
 * If the maximum year is a negative value, it will be limited depending on the platform architecture. (year 2037 for 32 bits)
 *
 * @see elm_calendar_min_max_year_get()
 *
 * @ref calendar_example_03
  }
procedure elm_calendar_min_max_year_set(obj:PElm_Calendar; min:longint; max:longint);cdecl;external;
{*
 * Get the minimum and maximum values for the year.
 *
 * @param[out] min The minimum year, greater than 1901.
 * @param[out] max The maximum year.
 *
 * Default values are 1902 and -1.
 *
 * @see elm_calendar_min_max_year_set()
 *
 * @ref calendar_example_05
  }
(* Const before type ignored *)
procedure elm_calendar_min_max_year_get(obj:PElm_Calendar; min:Plongint; max:Plongint);cdecl;external;

implementation


end.
