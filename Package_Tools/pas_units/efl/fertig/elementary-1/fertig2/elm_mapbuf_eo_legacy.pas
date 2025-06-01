unit elm_mapbuf_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Mapbuf = ^TElm_Mapbuf;
  TElm_Mapbuf = TEo;

procedure elm_mapbuf_auto_set(obj: PElm_Mapbuf; on: TEina_Bool); cdecl; external libelementary;
function elm_mapbuf_auto_get(obj: PElm_Mapbuf): TEina_Bool; cdecl; external libelementary;
procedure elm_mapbuf_smooth_set(obj: PElm_Mapbuf; smooth: TEina_Bool); cdecl; external libelementary;
function elm_mapbuf_smooth_get(obj: PElm_Mapbuf): TEina_Bool; cdecl; external libelementary;
procedure elm_mapbuf_alpha_set(obj: PElm_Mapbuf; alpha: TEina_Bool); cdecl; external libelementary;
function elm_mapbuf_alpha_get(obj: PElm_Mapbuf): TEina_Bool; cdecl; external libelementary;
procedure elm_mapbuf_enabled_set(obj: PElm_Mapbuf; enabled: TEina_Bool); cdecl; external libelementary;
function elm_mapbuf_enabled_get(obj: PElm_Mapbuf): TEina_Bool; cdecl; external libelementary;
procedure elm_mapbuf_point_color_set(obj: PElm_Mapbuf; idx: longint; r: longint; g: longint; b: longint;
  a: longint); cdecl; external libelementary;
procedure elm_mapbuf_point_color_get(obj: PElm_Mapbuf; idx: longint; r: Plongint; g: Plongint; b: Plongint;
  a: Plongint); cdecl; external libelementary;

// === Konventiert am: 28-5-25 19:48:44 ===


implementation



end.
