unit efl_ui_widget_flip;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Flip_Data = ^TEfl_Ui_Flip_Data;
  TEfl_Ui_Flip_Data = record
  end;

type
  TSlice = record
    obj: PEvas_Object;
    u: array[0..3] of double;
    v: array[0..3] of double;
    x: array[0..3] of double;
    y: array[0..3] of double;
    z: array[0..3] of double;
  end;
  PSlice = ^TSlice;

  TVertex2 = record
    x: double;
    y: double;
  end;
  PVertex2 = ^TVertex2;

  TVertex3 = record
    x: double;
    y: double;
    z: double;
  end;
  PVertex3 = ^TVertex3;


  // === Konventiert am: 30-5-25 17:54:47 ===


implementation


end.
