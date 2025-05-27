
unit elm_interfaces;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_interfaces.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_interfaces.h
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


{$include "efl_access_object.h"}
{$include "efl_access_text.h"}
{$include "efl_access_widget_action.h"}
{$include "efl_access_window.h"}
{$ifdef EFL_BETA_API_SUPPORT}
{$include "efl_access_action.eo.h"}
{$include "efl_access_component.eo.h"}
{$include "efl_access_editable_text.eo.h"}
{$include "efl_access_selection.eo.h"}
{$include "efl_access_value.eo.h"}
{$include "efl_ui_legacy.eo.h"}
{$endif}
(* error 
#endif

implementation


end.
