
unit elm_systray_watcher;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_systray_watcher.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_systray_watcher.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_SYSTRAY_WATCHER_H}
{$define ELM_SYSTRAY_WATCHER_H}
(* Const before type ignored *)

function _elm_systray_watcher_status_notifier_item_register(obj:Pchar):TEina_Bool;cdecl;external;
function _elm_systray_watcher_init:TEina_Bool;cdecl;external;
procedure _elm_systray_watcher_shutdown;cdecl;external;
{$endif}

implementation


end.
