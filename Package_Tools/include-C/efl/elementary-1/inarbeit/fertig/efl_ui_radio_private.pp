
unit efl_ui_radio_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_radio_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_radio_private.h
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
PEfl_Ui_Radio_Data  = ^Efl_Ui_Radio_Data;
PEina_List  = ^Eina_List;
PGroup  = ^Group;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_RADIO_PRIVATE_H}
{$define EFL_UI_RADIO_PRIVATE_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-radio-class The Elementary Radio Class
 *
 * Elementary, besides having the @ref Radio widget, exposes its
 * foundation -- the Elementary Radio Class -- in order to create other
 * widgets which are a radio with some more logic on top.
  }
{*
 * Base layout smart data extended with radio instance data.
  }
type
  PGroup = ^TGroup;
  TGroup = record
      value : longint;
      valuep : Plongint;
      radios : PEina_List;
    end;

  PEfl_Ui_Radio_Data = ^TEfl_Ui_Radio_Data;
  TEfl_Ui_Radio_Data = record
      value : longint;
      group : PGroup;
    end;

{*
 * @
  }

implementation


end.
