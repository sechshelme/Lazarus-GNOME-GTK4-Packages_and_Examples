
unit eeze_scanner;
interface

{
  Automatically converted by H2Pas 1.0.0 from eeze_scanner.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eeze_scanner.h
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
PEcore_Poller  = ^Ecore_Poller;
PEeze_Scanner_Device  = ^Eeze_Scanner_Device;
PEeze_Scanner_Event  = ^Eeze_Scanner_Event;
PEeze_Scanner_Event_Type  = ^Eeze_Scanner_Event_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EEZE_SCANNER_H}
{$define EEZE_SCANNER_H}
{$include <Eeze.h>}
type
  PEeze_Scanner_Event_Type = ^TEeze_Scanner_Event_Type;
  TEeze_Scanner_Event_Type =  Longint;
  Const
    EEZE_SCANNER_EVENT_TYPE_NONE = 0;
    EEZE_SCANNER_EVENT_TYPE_ADD = EEZE_UDEV_EVENT_ADD;
    EEZE_SCANNER_EVENT_TYPE_REMOVE = EEZE_UDEV_EVENT_REMOVE;
    EEZE_SCANNER_EVENT_TYPE_CHANGE = EEZE_UDEV_EVENT_CHANGE;
;
(* Const before type ignored *)
type
  PEeze_Scanner_Event = ^TEeze_Scanner_Event;
  TEeze_Scanner_Event = record
      device : Pchar;
      _type : TEeze_Scanner_Event_Type;
      volume : TEina_Bool;
    end;
(* Const before type ignored *)

  PEeze_Scanner_Device = ^TEeze_Scanner_Device;
  TEeze_Scanner_Device = record
      poller : PEcore_Poller;
      device : Pchar;
      mounted : TEina_Bool;
    end;
{$endif}

implementation


end.
