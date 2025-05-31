
unit efl_ui_button_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_button_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_button_private.h
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
PEcore_Timer  = ^Ecore_Timer;
PEfl_Ui_button_Data  = ^Efl_Ui_button_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_BUTTON_PRIVATE_H}
{$define EFL_UI_BUTTON_PRIVATE_H}
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
 * @section elm-button-class The Elementary Button Class
 *
 * Elementary, besides having the @ref Button widget, exposes its
 * foundation -- the Elementary Button Class -- in order to create
 * other widgets which are, basically, a button with some more logic
 * on top.
  }
{*
 * Base widget smart data extended with button instance data.
  }
{ auto-repeat stuff  }
{*< Time to wait until first auto-repeated click is generated  }
{*< Time frame for subsequent auto-repeated clicks, after the first automatic one is triggerred  }
{*< Internal timer object for auto-repeat behavior  }
{*< Whether auto-repetition of clicks is enabled or not (bound to _Elm_Button_Smart_Class::admits_autorepeat)  }
{*< Whether auto-repetition is going on  }
type
  PEfl_Ui_button_Data = ^TEfl_Ui_button_Data;
  TEfl_Ui_button_Data = record
      ar_initial_timeout : Tdouble;
      ar_gap_timeout : Tdouble;
      timer : PEcore_Timer;
      flag0 : word;
    end;

const
  bm__Efl_Ui_button_Data_autorepeat = $1;
  bp__Efl_Ui_button_Data_autorepeat = 0;
  bm__Efl_Ui_button_Data_repeating = $2;
  bp__Efl_Ui_button_Data_repeating = 1;

function autorepeat(var a : _Efl_Ui_button_Data) : TEina_Bool;
procedure set_autorepeat(var a : _Efl_Ui_button_Data; __autorepeat : TEina_Bool);
function repeating(var a : _Efl_Ui_button_Data) : TEina_Bool;
procedure set_repeating(var a : _Efl_Ui_button_Data; __repeating : TEina_Bool);
{*
 * @
  }

implementation

function autorepeat(var a : _Efl_Ui_button_Data) : TEina_Bool;
begin
  autorepeat:=(a.flag0 and bm__Efl_Ui_button_Data_autorepeat) shr bp__Efl_Ui_button_Data_autorepeat;
end;

procedure set_autorepeat(var a : _Efl_Ui_button_Data; __autorepeat : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__autorepeat shl bp__Efl_Ui_button_Data_autorepeat) and bm__Efl_Ui_button_Data_autorepeat);
end;

function repeating(var a : _Efl_Ui_button_Data) : TEina_Bool;
begin
  repeating:=(a.flag0 and bm__Efl_Ui_button_Data_repeating) shr bp__Efl_Ui_button_Data_repeating;
end;

procedure set_repeating(var a : _Efl_Ui_button_Data; __repeating : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__repeating shl bp__Efl_Ui_button_Data_repeating) and bm__Efl_Ui_button_Data_repeating);
end;


end.
