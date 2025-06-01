unit elm_hoversel_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Hoversel = ^TElm_Hoversel;
  TElm_Hoversel = TEo;

procedure elm_hoversel_horizontal_set(obj: PElm_Hoversel; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_hoversel_horizontal_get(obj: PElm_Hoversel): TEina_Bool; cdecl; external libelementary;
procedure elm_hoversel_hover_parent_set(obj: PElm_Hoversel; parent: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_hoversel_hover_parent_get(obj: PElm_Hoversel): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_hoversel_expanded_get(obj: PElm_Hoversel): TEina_Bool; cdecl; external libelementary;
function elm_hoversel_items_get(obj: PElm_Hoversel): PEina_List; cdecl; external libelementary;
procedure elm_hoversel_auto_update_set(obj: PElm_Hoversel; auto_update: TEina_Bool); cdecl; external libelementary;
function elm_hoversel_auto_update_get(obj: PElm_Hoversel): TEina_Bool; cdecl; external libelementary;
procedure elm_hoversel_hover_begin(obj: PElm_Hoversel); cdecl; external libelementary;
procedure elm_hoversel_clear(obj: PElm_Hoversel); cdecl; external libelementary;
procedure elm_hoversel_hover_end(obj: PElm_Hoversel); cdecl; external libelementary;
function elm_hoversel_item_add(obj: PElm_Hoversel; _label: pchar; icon_file: pchar; icon_type: TElm_Icon_Type; func: TEvas_Smart_Cb;
  data: pointer): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 29-5-25 19:47:12 ===


implementation



end.
