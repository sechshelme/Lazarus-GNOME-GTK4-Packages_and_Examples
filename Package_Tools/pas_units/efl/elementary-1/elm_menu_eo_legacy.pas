unit elm_menu_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Menu = ^TElm_Menu;
  TElm_Menu = TEo;

function elm_menu_selected_item_get(obj: PElm_Menu): PElm_Widget_Item; cdecl; external libelementary;
function elm_menu_first_item_get(obj: PElm_Menu): PElm_Widget_Item; cdecl; external libelementary;
function elm_menu_last_item_get(obj: PElm_Menu): PElm_Widget_Item; cdecl; external libelementary;
function elm_menu_items_get(obj: PElm_Menu): PEina_List; cdecl; external libelementary;
procedure elm_menu_move(obj: PElm_Menu; x: longint; y: longint); cdecl; external libelementary;
function elm_menu_item_add(obj: PElm_Menu; parent: PElm_Widget_Item; icon: pchar; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_menu_open(obj: PElm_Menu); cdecl; external libelementary;
procedure elm_menu_close(obj: PElm_Menu); cdecl; external libelementary;
function elm_menu_item_separator_add(obj: PElm_Menu; parent: PElm_Widget_Item): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:41:55 ===


implementation



end.
