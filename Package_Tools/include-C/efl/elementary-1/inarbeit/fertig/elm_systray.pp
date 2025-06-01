
unit elm_systray;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_systray.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_systray.h
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
PElm_Systray  = ^Elm_Systray;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include "elm_systray_common.h"}
{$ifdef EFL_BETA_API_SUPPORT}
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "elm_systray_eo.legacy.h"}
{$endif}
{*
 * Add a new systray element
 *
 * @param parent The parent object
 * @return A new systray object which will be displayed on a window manager that provides appindicator support.
 *
 * @ingroup Elm_Systray
  }

function elm_systray_add(win:PEvas_Object):PElm_Systray;cdecl;external;
{$endif}

implementation


end.
