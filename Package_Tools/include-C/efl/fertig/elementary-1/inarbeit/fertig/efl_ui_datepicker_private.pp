
unit efl_ui_datepicker_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_datepicker_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_datepicker_private.h
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
PEfl_Ui_Datepicker_Data  = ^Efl_Ui_Datepicker_Data;
PEfl_Ui_Datepicker_Field_Type  = ^Efl_Ui_Datepicker_Field_Type;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_DATEPICKER_PRIVATE_H}
{$define EFL_UI_DATEPICKER_PRIVATE_H}

const
  EFL_UI_DATEPICKER_TYPE_COUNT = 3;  
type
  PEfl_Ui_Datepicker_Field_Type = ^TEfl_Ui_Datepicker_Field_Type;
  TEfl_Ui_Datepicker_Field_Type =  Longint;
  Const
    DATEPICKER_YEAR = 0;
    DATEPICKER_MONTH = 1;
    DATEPICKER_DAY = 2;
;
type
  PEfl_Ui_Datepicker_Data = ^TEfl_Ui_Datepicker_Data;
  TEfl_Ui_Datepicker_Data = record
      dt_manager : PEo;
      year : PEo;
      month : PEo;
      day : PEo;
      cur_date : array[0..(EFL_UI_DATEPICKER_TYPE_COUNT)-1] of longint;
      min_date : array[0..(EFL_UI_DATEPICKER_TYPE_COUNT)-1] of longint;
      max_date : array[0..(EFL_UI_DATEPICKER_TYPE_COUNT)-1] of longint;
    end;

{$endif}

implementation


end.
