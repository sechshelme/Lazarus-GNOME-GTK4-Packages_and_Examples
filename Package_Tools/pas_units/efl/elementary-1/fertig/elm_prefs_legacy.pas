unit elm_prefs_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_prefs_page_widget_common_add(prefs: PEvas_Object; obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_prefs_file_set(obj: PEo; file_: pchar; page: pchar): TEina_Bool; cdecl; external libelementary;
function elm_prefs_file_get(obj: PEo; file_: PPchar; page: PPchar): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:37:35 ===


implementation



end.
