
unit efl_ui_timepicker_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_timepicker_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_timepicker_private.h
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
PEfl_Ui_Timepicker_Data  = ^Efl_Ui_Timepicker_Data;
PEfl_Ui_Timepicker_Field_Type  = ^Efl_Ui_Timepicker_Field_Type;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_TIMEPICKER_PRIVATE_H}
{$define EFL_UI_TIMEPICKER_PRIVATE_H}

const
  EFL_UI_TIMEPICKER_TYPE_COUNT = 3;  
type
  PEfl_Ui_Timepicker_Field_Type = ^TEfl_Ui_Timepicker_Field_Type;
  TEfl_Ui_Timepicker_Field_Type =  Longint;
  Const
    TIMEPICKER_HOUR = 0;
    TIMEPICKER_MIN = 1;
    TIMEPICKER_AMPM = 2;
;
type
  PEfl_Ui_Timepicker_Data = ^TEfl_Ui_Timepicker_Data;
  TEfl_Ui_Timepicker_Data = record
      dt_manager : PEo;
      hour : PEo;
      min : PEo;
      ampm : PEo;
      cur_time : array[0..(EFL_UI_TIMEPICKER_TYPE_COUNT)-1] of longint;
      is_24hour : TEina_Bool;
    end;

{$endif}

implementation


end.
