unit elm_fileselector_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Fileselector = ^TElm_Fileselector;
  TElm_Fileselector = TEo;

procedure elm_fileselector_buttons_ok_cancel_set(obj: PElm_Fileselector; visible: TEina_Bool); cdecl; external libelementary;
function elm_fileselector_buttons_ok_cancel_get(obj: PElm_Fileselector): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:01:53 ===


implementation



end.
