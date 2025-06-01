unit elm_map_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Map_Zoom_Mode = ^TElm_Map_Zoom_Mode;
  TElm_Map_Zoom_Mode = longint;

const
  ELM_MAP_ZOOM_MODE_MANUAL = 0;
  ELM_MAP_ZOOM_MODE_AUTO_FIT = 1;
  ELM_MAP_ZOOM_MODE_AUTO_FILL = 2;
  ELM_MAP_ZOOM_MODE_LAST = 3;

function elm_map_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_map_zoom_set(obj: PEvas_Object; zoom: longint); cdecl; external libelementary;
function elm_map_zoom_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_map_zoom_mode_set(obj: PEvas_Object; mode: TElm_Map_Zoom_Mode); cdecl; external libelementary;
function elm_map_zoom_mode_get(obj: PEvas_Object): TElm_Map_Zoom_Mode; cdecl; external libelementary;
procedure elm_map_wheel_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libelementary;
function elm_map_wheel_disabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_map_paused_set(obj: PEvas_Object; paused: TEina_Bool); cdecl; external libelementary;
function elm_map_paused_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 26-5-25 17:45:48 ===


implementation



end.
