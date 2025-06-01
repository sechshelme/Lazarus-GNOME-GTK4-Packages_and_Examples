unit elm_need;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_need_efreet: TEina_Bool; cdecl; external libelementary;
function elm_need_systray: TEina_Bool; cdecl; external libelementary;
function elm_need_sys_notify: TEina_Bool; cdecl; external libelementary;
function elm_need_e_dbus: TEina_Bool; cdecl; external libelementary; deprecated;
function elm_need_eldbus: TEina_Bool; cdecl; external libelementary;
function elm_need_ethumb: TEina_Bool; cdecl; external libelementary;
function elm_need_web: TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:54:39 ===


implementation



end.
