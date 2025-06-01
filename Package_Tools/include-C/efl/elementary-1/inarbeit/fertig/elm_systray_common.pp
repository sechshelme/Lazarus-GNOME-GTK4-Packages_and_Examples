
unit elm_systray_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_systray_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_systray_common.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Emitted when the systray is ready to be used by the application.
  }
  var
    ELM_EVENT_SYSTRAY_READY : longint;cvar;external;

implementation


end.
