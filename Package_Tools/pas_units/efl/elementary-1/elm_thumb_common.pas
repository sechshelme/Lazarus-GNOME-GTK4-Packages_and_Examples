unit elm_thumb_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_thumb_ethumb_client_get: pointer; cdecl; external libelementary;
function elm_thumb_ethumb_client_connected_get: TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:28:35 ===


implementation



end.
