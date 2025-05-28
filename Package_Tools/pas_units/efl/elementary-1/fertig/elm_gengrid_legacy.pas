unit elm_gengrid_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_widget_item_eo_legacy, elm_scroller_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_gengrid_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_gengrid_nth_item_get(obj: PEvas_Object; nth: dword): PElm_Object_Item; cdecl; external libelementary;
procedure elm_gengrid_page_show(obj: PEvas_Object; h_pagenumber: longint; v_pagenumber: longint); cdecl; external libelementary; deprecated;
procedure elm_gengrid_scroller_policy_set(obj: PEvas_Object; policy_h: TElm_Scroller_Policy; policy_v: TElm_Scroller_Policy); cdecl; external libelementary; deprecated;
procedure elm_gengrid_scroller_policy_get(obj: PEvas_Object; policy_h: PElm_Scroller_Policy; policy_v: PElm_Scroller_Policy); cdecl; external libelementary; deprecated;
procedure elm_gengrid_bounce_set(obj: PEvas_Object; h_bounce: TEina_Bool; v_bounce: TEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_gengrid_bounce_get(obj: PEvas_Object; h_bounce: PEina_Bool; v_bounce: PEina_Bool); cdecl; external libelementary; deprecated;
procedure elm_gengrid_current_page_get(obj: PEvas_Object; h_pagenumber: Plongint; v_pagenumber: Plongint); cdecl; external libelementary; deprecated;
procedure elm_gengrid_last_page_get(obj: PEvas_Object; h_pagenumber: Plongint; v_pagenumber: Plongint); cdecl; external libelementary; deprecated;
procedure elm_gengrid_page_bring_in(obj: PEvas_Object; h_pagenumber: longint; v_pagenumber: longint); cdecl; external libelementary; deprecated;
procedure elm_gengrid_page_size_set(obj: PEvas_Object; h_pagesize: longint; v_pagesize: longint); cdecl; external libelementary;
procedure elm_gengrid_page_relative_set(obj: PEvas_Object; h_pagerel: double; v_pagerel: double); cdecl; external libelementary;
procedure elm_gengrid_page_relative_get(obj: PEvas_Object; h_pagerel: Pdouble; v_pagerel: Pdouble); cdecl; external libelementary;
procedure elm_gengrid_wheel_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libelementary;
function elm_gengrid_wheel_disabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:34:47 ===


implementation



end.
