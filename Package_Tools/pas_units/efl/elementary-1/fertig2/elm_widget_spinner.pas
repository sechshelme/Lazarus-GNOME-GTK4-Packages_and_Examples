unit elm_widget_spinner;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Spinner_Format_Type = ^TElm_Spinner_Format_Type;
  TElm_Spinner_Format_Type = longint;

const
  SPINNER_FORMAT_FLOAT = 0;
  SPINNER_FORMAT_INT = 1;
  SPINNER_FORMAT_INVALID = 2;

type
  PElm_Spinner_Data = ^TElm_Spinner_Data;
  TElm_Spinner_Data = record
  end;

type
  TElm_Spinner_Special_Value = record
    value: double;
    _label: pchar;
  end;
  PElm_Spinner_Special_Value = ^TElm_Spinner_Special_Value;


  // === Konventiert am: 30-5-25 17:16:52 ===


implementation




end.
