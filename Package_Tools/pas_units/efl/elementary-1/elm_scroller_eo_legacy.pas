unit elm_scroller_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Scroller = ^TElm_Scroller;
  TElm_Scroller = TEo;

procedure elm_scroller_custom_widget_base_theme_set(obj: PElm_Scroller; klass: pchar; group: pchar); cdecl; external libelementary;
procedure elm_scroller_page_scroll_limit_set(obj: PElm_Scroller; page_limit_h: longint; page_limit_v: longint); cdecl; external libelementary;
procedure elm_scroller_page_scroll_limit_get(obj: PElm_Scroller; page_limit_h: Plongint; page_limit_v: Plongint); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:10:05 ===


implementation



end.
