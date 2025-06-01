unit elm_systray;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, elm_sys_notify;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

function elm_systray_add(win: PEvas_Object): PElm_Systray; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:10:29 ===


implementation



end.
