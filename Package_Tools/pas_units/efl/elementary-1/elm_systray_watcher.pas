unit elm_systray_watcher;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function _elm_systray_watcher_status_notifier_item_register(obj: pchar): TEina_Bool; cdecl; external libelementary;
function _elm_systray_watcher_init: TEina_Bool; cdecl; external libelementary;
procedure _elm_systray_watcher_shutdown; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:10:34 ===


implementation



end.
