unit elm_systray_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


var
  ELM_EVENT_SYSTRAY_READY: longint; cvar;external libelementary;

  // === Konventiert am: 1-6-25 15:10:31 ===


implementation



end.
