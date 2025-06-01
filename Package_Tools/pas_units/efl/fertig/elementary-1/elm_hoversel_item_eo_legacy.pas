unit elm_hoversel_item_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Hoversel_Item = ^TElm_Hoversel_Item;
  TElm_Hoversel_Item = TEo;

procedure elm_hoversel_item_icon_set(obj: PElm_Hoversel_Item; icon_file: pchar; icon_group: pchar; icon_type: TElm_Icon_Type); cdecl; external libelementary;
procedure elm_hoversel_item_icon_get(obj: PElm_Hoversel_Item; icon_file: PPchar; icon_group: PPchar; icon_type: PElm_Icon_Type); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:18 ===


implementation



end.
