unit elm_colorselector_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Colorselector = ^TElm_Colorselector;
  TElm_Colorselector = TEo;

type
  PElm_Colorselector_Mode = ^TElm_Colorselector_Mode;
  TElm_Colorselector_Mode = longint;

const
  ELM_COLORSELECTOR_PALETTE = 0;
  ELM_COLORSELECTOR_COMPONENTS = 1;
  ELM_COLORSELECTOR_BOTH = 2;
  ELM_COLORSELECTOR_PICKER = 3;
  ELM_COLORSELECTOR_ALL = 4;

procedure elm_colorselector_color_set(obj: PElm_Colorselector; r: longint; g: longint; b: longint; a: longint); cdecl; external libelementary;
procedure elm_colorselector_color_get(obj: PElm_Colorselector; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libelementary;
procedure elm_colorselector_palette_name_set(obj: PElm_Colorselector; palette_name: pchar); cdecl; external libelementary;
function elm_colorselector_palette_name_get(obj: PElm_Colorselector): pchar; cdecl; external libelementary;
procedure elm_colorselector_mode_set(obj: PElm_Colorselector; mode: TElm_Colorselector_Mode); cdecl; external libelementary;
function elm_colorselector_mode_get(obj: PElm_Colorselector): TElm_Colorselector_Mode; cdecl; external libelementary;
function elm_colorselector_palette_items_get(obj: PElm_Colorselector): PEina_List; cdecl; external libelementary;
function elm_colorselector_palette_selected_item_get(obj: PElm_Colorselector): PElm_Widget_Item; cdecl; external libelementary;
function elm_colorselector_palette_color_add(obj: PElm_Colorselector; r: longint; g: longint; b: longint; a: longint): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_colorselector_palette_clear(obj: PElm_Colorselector); cdecl; external libelementary;

// === Konventiert am: 29-5-25 20:23:45 ===


implementation



end.
