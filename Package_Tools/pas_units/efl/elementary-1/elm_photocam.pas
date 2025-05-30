unit elm_photocam;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Photocam_Progress = record
    now: double;
    total: double;
  end;
  PElm_Photocam_Progress = ^TElm_Photocam_Progress;

  TElm_Photocam_Error = record
    status: longint;
    open_error: TEina_Bool;
  end;
  PElm_Photocam_Error = ^TElm_Photocam_Error;


  // === Konventiert am: 30-5-25 17:16:40 ===


implementation



end.
