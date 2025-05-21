unit Ecore;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function _ecore_main_loop_wakeup_time_get: double; cdecl; external libecore;

// === Konventiert am: 21-5-25 15:25:34 ===


implementation



end.
