unit elm_widget_colorselector;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, elm_colorselector_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Colorselector_Data = ^TElm_Colorselector_Data;
  TElm_Colorselector_Data = record
  end;

type
  PColor_Type = ^TColor_Type;
  TColor_Type = longint;

const
  HUE = 0;
  SATURATION = 1;
  LIGHTNESS = 2;
  ALPHA = 3;

type
  TColor_Bar_Data = record
    parent: PEvas_Object;
    colorbar: PEvas_Object;
    bar: PEvas_Object;
    lbt: PEvas_Object;
    rbt: PEvas_Object;
    bg_rect: PEvas_Object;
    arrow: PEvas_Object;
    touch_area: PEvas_Object;
    access_obj: PEvas_Object;
    color_type: TColor_Type;
  end;
  PColor_Bar_Data = ^TColor_Bar_Data;

  PElm_Color_Item_Data = ^TElm_Color_Item_Data;
  TElm_Color_Item_Data = record
  end;

type
  TElm_Color_Name = record
    color: TElm_Color_RGBA;
    name: pchar;
  end;
  PElm_Color_Name = ^TElm_Color_Name;

  // === Konventiert am: 29-5-25 20:23:48 ===


implementation



end.
