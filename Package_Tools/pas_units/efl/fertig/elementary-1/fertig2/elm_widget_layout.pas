unit elm_widget_layout;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Layout_Data = ^TEfl_Ui_Layout_Data;
  TEfl_Ui_Layout_Data = record
  end;

type
  TElm_Layout_Data = bitpacked record
    needs_size_calc: 0..1;
    restricted_calc_w: 0..1;
    restricted_calc_h: 0..1;
    in_calc: 0..1;
    user_min_sz: 0..1;
  end;
  PElm_Layout_Data = ^TElm_Layout_Data;

procedure _efl_ui_layout_subobjs_calc_set(obj: PEo; set_: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 29-5-25 19:47:21 ===


implementation


end.
