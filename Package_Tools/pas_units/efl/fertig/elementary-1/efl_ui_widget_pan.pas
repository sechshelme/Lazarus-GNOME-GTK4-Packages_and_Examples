unit efl_ui_widget_pan;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEfl_Ui_Pan_Data = record
    content: PEvas_Object;
    x: TEvas_Coord;
    y: TEvas_Coord;
    w: TEvas_Coord;
    h: TEvas_Coord;
    content_w: TEvas_Coord;
    content_h: TEvas_Coord;
    px: TEvas_Coord;
    py: TEvas_Coord;
  end;
  PEfl_Ui_Pan_Data = ^TEfl_Ui_Pan_Data;


  // === Konventiert am: 31-5-25 19:32:48 ===


implementation



end.
