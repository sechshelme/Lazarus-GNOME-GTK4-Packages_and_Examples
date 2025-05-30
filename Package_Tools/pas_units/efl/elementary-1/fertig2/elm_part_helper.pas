unit elm_part_helper;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Part_Data = record
    obj: PEo;
    part: PEina_Tmpstr;
  end;
  PElm_Part_Data = ^TElm_Part_Data;


  // === Konventiert am: 28-5-25 15:57:18 ===


implementation



end.
