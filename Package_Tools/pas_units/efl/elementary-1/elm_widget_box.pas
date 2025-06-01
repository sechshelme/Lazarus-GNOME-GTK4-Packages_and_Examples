unit elm_widget_box;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Box_Data = ^TElm_Box_Data;
  TElm_Box_Data = record
  end;

type
  PElm_Box_Transition = ^TElm_Box_Transition;
  TElm_Box_Transition = record
  end;


type
  TTransition_Animation_Data = record
    obj: PEvas_Object;
    start: record
      x: TEvas_Coord;
      y: TEvas_Coord;
      w: TEvas_Coord;
      h: TEvas_Coord;
      end;
    end_: record
      x: TEvas_Coord;
      y: TEvas_Coord;
      w: TEvas_Coord;
      h: TEvas_Coord;
      end;
  end;
  PTransition_Animation_Data = ^TTransition_Animation_Data;


  // === Konventiert am: 1-6-25 15:41:11 ===


implementation



end.
