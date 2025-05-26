unit elm_calendar_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Calendar_Format_Cb = ^TElm_Calendar_Format_Cb;
  TElm_Calendar_Format_Cb = function(stime: Ptm): pchar; cdecl;

  // === Konventiert am: 26-5-25 19:44:17 ===


implementation



end.
