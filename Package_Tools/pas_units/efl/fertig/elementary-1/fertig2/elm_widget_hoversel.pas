unit elm_widget_hoversel;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Hoversel_Data = ^TElm_Hoversel_Data;
  TElm_Hoversel_Data = record
  end;

type
  TElm_Hoversel_Item_Data = record
    base: PElm_Widget_Item_Data;
    _label: pchar;
    icon_file: pchar;
    icon_group: pchar;
    icon_type: TElm_Icon_Type;
    func: TEvas_Smart_Cb;
  end;
  PElm_Hoversel_Item_Data = ^TElm_Hoversel_Item_Data;


  // === Konventiert am: 30-5-25 17:54:59 ===


implementation



end.
