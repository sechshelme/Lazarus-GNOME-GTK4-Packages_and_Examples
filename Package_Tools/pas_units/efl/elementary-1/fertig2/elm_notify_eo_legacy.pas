unit elm_notify_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Notify = ^TElm_Notify;
  TElm_Notify = TEo;

procedure elm_notify_align_set(obj: PElm_Notify; horizontal: double; vertical: double); cdecl; external libelementary;
procedure elm_notify_align_get(obj: PElm_Notify; horizontal: Pdouble; vertical: Pdouble); cdecl; external libelementary;
procedure elm_notify_allow_events_set(obj: PElm_Notify; allow: TEina_Bool); cdecl; external libelementary;
function elm_notify_allow_events_get(obj: PElm_Notify): TEina_Bool; cdecl; external libelementary;
procedure elm_notify_timeout_set(obj: PElm_Notify; timeout: double); cdecl; external libelementary;
function elm_notify_timeout_get(obj: PElm_Notify): double; cdecl; external libelementary;
procedure elm_notify_dismiss(obj: PElm_Notify); cdecl; external libelementary;

// === Konventiert am: 30-5-25 17:54:50 ===


implementation



end.
