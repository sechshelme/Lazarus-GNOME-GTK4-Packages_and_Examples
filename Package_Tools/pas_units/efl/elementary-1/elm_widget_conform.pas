unit elm_widget_conform;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Conformant_Data = record
  end;
  PElm_Conformant_Data = ^TElm_Conformant_Data;

type
  PConformant_Part_Type = ^TConformant_Part_Type;
  TConformant_Part_Type = longint;

const
  ELM_CONFORMANT_INDICATOR_PART = 1;
  ELM_CONFORMANT_SOFTKEY_PART = 2;
  ELM_CONFORMANT_VIRTUAL_KEYPAD_PART = 4;
  ELM_CONFORMANT_CLIPBOARD_PART = 8;


  // === Konventiert am: 30-5-25 17:16:47 ===


implementation



end.
