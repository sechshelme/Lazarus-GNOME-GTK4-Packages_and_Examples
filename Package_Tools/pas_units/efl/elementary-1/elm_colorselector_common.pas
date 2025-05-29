unit elm_colorselector_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

type
  TElm_Color_RGBA = record
    r: dword;
    g: dword;
    b: dword;
    a: dword;
  end;
  PElm_Color_RGBA = ^TElm_Color_RGBA;

  TElm_Custom_Palette = record
    palette_name: pchar;
    color_list: PEina_List;
  end;
  PElm_Custom_Palette = ^TElm_Custom_Palette;

procedure elm_colorselector_palette_item_color_get(it: PElm_Object_Item; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libelementary;
procedure elm_colorselector_palette_item_color_set(it: PElm_Object_Item; r: longint; g: longint; b: longint; a: longint); cdecl; external libelementary;
function elm_colorselector_palette_item_selected_get(it: PElm_Object_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_colorselector_palette_item_selected_set(it: PElm_Object_Item; selected: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 29-5-25 20:29:15 ===


implementation



end.
