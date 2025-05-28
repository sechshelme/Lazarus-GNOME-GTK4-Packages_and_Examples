unit elm_slideshow_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_widget_item_eo_legacy, elm_slideshow_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Slideshow = ^TElm_Slideshow;
  TElm_Slideshow = TEo;

procedure elm_slideshow_cache_after_set(obj: PElm_Slideshow; count: longint); cdecl; external libelementary;
function elm_slideshow_cache_after_get(obj: PElm_Slideshow): longint; cdecl; external libelementary;
procedure elm_slideshow_cache_before_set(obj: PElm_Slideshow; count: longint); cdecl; external libelementary;
function elm_slideshow_cache_before_get(obj: PElm_Slideshow): longint; cdecl; external libelementary;
procedure elm_slideshow_layout_set(obj: PElm_Slideshow; layout: pchar); cdecl; external libelementary;
function elm_slideshow_layout_get(obj: PElm_Slideshow): pchar; cdecl; external libelementary;
procedure elm_slideshow_transition_set(obj: PElm_Slideshow; transition: pchar); cdecl; external libelementary;
function elm_slideshow_transition_get(obj: PElm_Slideshow): pchar; cdecl; external libelementary;
procedure elm_slideshow_loop_set(obj: PElm_Slideshow; loop: TEina_Bool); cdecl; external libelementary;
function elm_slideshow_loop_get(obj: PElm_Slideshow): TEina_Bool; cdecl; external libelementary;
procedure elm_slideshow_timeout_set(obj: PElm_Slideshow; timeout: double); cdecl; external libelementary;
function elm_slideshow_timeout_get(obj: PElm_Slideshow): double; cdecl; external libelementary;
function elm_slideshow_items_get(obj: PElm_Slideshow): PEina_List; cdecl; external libelementary;
function elm_slideshow_transitions_get(obj: PElm_Slideshow): PEina_List; cdecl; external libelementary;
function elm_slideshow_count_get(obj: PElm_Slideshow): dword; cdecl; external libelementary;
function elm_slideshow_item_current_get(obj: PElm_Slideshow): PElm_Widget_Item; cdecl; external libelementary;
function elm_slideshow_layouts_get(obj: PElm_Slideshow): PEina_List; cdecl; external libelementary;
procedure elm_slideshow_previous(obj: PElm_Slideshow); cdecl; external libelementary;
function elm_slideshow_item_nth_get(obj: PElm_Slideshow; nth: dword): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_slideshow_next(obj: PElm_Slideshow); cdecl; external libelementary;
procedure elm_slideshow_clear(obj: PElm_Slideshow); cdecl; external libelementary;
function elm_slideshow_item_add(obj: PElm_Slideshow; itc: PElm_Slideshow_Item_Class; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_slideshow_item_sorted_insert(obj: PElm_Slideshow; itc: PElm_Slideshow_Item_Class; data: pointer; func: TEina_Compare_Cb): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:44:39 ===


implementation



end.
