unit elm_scroll;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure elm_object_scroll_hold_push(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_object_scroll_hold_pop(obj: PEvas_Object); cdecl; external libelementary;
function elm_object_scroll_hold_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_object_scroll_freeze_push(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_object_scroll_freeze_pop(obj: PEvas_Object); cdecl; external libelementary;
function elm_object_scroll_freeze_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_object_scroll_lock_x_set(obj: PEvas_Object; lock: TEina_Bool); cdecl; external libelementary;
procedure elm_object_scroll_lock_y_set(obj: PEvas_Object; lock: TEina_Bool); cdecl; external libelementary;
function elm_object_scroll_lock_x_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_object_scroll_lock_y_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_object_scroll_item_loop_enabled_set(obj: PEvas_Object; enable: TEina_Bool); cdecl; external libelementary;
function elm_object_scroll_item_loop_enabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 29-5-25 19:47:15 ===


implementation



end.
