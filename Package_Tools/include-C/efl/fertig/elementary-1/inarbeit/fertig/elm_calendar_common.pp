
unit elm_calendar_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_calendar_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_calendar_common.h
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
PElm_Calendar_Format_Cb  = ^Elm_Calendar_Format_Cb;
Ptm  = ^tm;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * @addtogroup Elm_Calendar
 *
 * @
  }
{*
 * This callback type is used to format the string that will be used
 * to display month and year.
 *
 * @param stime Struct representing time.
 * @return String representing time that will be set to calendar's text.
 *
 * @see elm_calendar_format_function_set()
  }
type
  PElm_Calendar_Format_Cb = ^TElm_Calendar_Format_Cb;
  TElm_Calendar_Format_Cb = function (stime:Ptm):Pchar;cdecl;
{*
 * @
  }

implementation


end.
