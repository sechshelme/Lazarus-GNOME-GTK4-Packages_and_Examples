unit elm_gesture_layer_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_gesture_layer_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_gesture_layer_tap_longpress_cb_add(obj: PEvas_Object; state: TElm_Gesture_State; cb: TElm_Gesture_Event_Cb; data: pointer); cdecl; external libelementary;
procedure elm_gesture_layer_tap_longpress_cb_del(obj: PEvas_Object; state: TElm_Gesture_State; cb: TElm_Gesture_Event_Cb; data: pointer); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:22:32 ===


implementation



end.
