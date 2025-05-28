unit efl_ui_relative_container_private;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Relative_Container_Calc_State = ^TEfl_Ui_Relative_Container_Calc_State;
  TEfl_Ui_Relative_Container_Calc_State = longint;

const
  RELATIVE_CALC_NONE = 0;
  RELATIVE_CALC_DONE = 1;
  RELATIVE_CALC_ON = 2;

type
  PEfl_Ui_Relative_Container_Child = ^TEfl_Ui_Relative_Container_Child;

  TEfl_Ui_Relative_Container_Calc = record
    __in_list: TEina_Inlist;
    max: array[0..1] of longint;
    min: array[0..1] of longint;
    aspect: array[0..1] of longint;
    margin: array[0..3] of longint;
    aspect_type: TEfl_Gfx_Hint_Aspect;
    fill: array[0..1] of TEina_Bool;
    weight: array[0..1] of double;
    align: array[0..1] of double;
    comp_factor: double;
    m0: array[0..1] of double;
    mi: array[0..1] of double;
    mj: array[0..1] of double;
    space: array[0..1] of record
      position: longint;
      length: double;
      end;
    want: array[0..1] of record
      position: longint;
      length: double;
      end;
    state: array[0..1] of TEfl_Ui_Relative_Container_Calc_State;
    chain_state: array[0..1] of TEfl_Ui_Relative_Container_Calc_State;
    to_: array[0..3] of PEfl_Ui_Relative_Container_Child;
  end;
  PEfl_Ui_Relative_Container_Calc = ^TEfl_Ui_Relative_Container_Calc;

  TEfl_Ui_Relative_Container_Data = record
    obj: PEo;
    clipper: PEo;
    children: PEina_Hash;
    base: PEfl_Ui_Relative_Container_Child;
  end;
  PEfl_Ui_Relative_Container_Data = ^TEfl_Ui_Relative_Container_Data;

  TEfl_Ui_Relative_Container_Relation = record
    to_: PEfl_Object;
    relative_position: double;
  end;
  PEfl_Ui_Relative_Container_Relation = ^TEfl_Ui_Relative_Container_Relation;

  TEfl_Ui_Relative_Container_Child = record
    obj: PEo;
    layout: PEo;
    rel: array[0..3] of TEfl_Ui_Relative_Container_Relation;
    calc: TEfl_Ui_Relative_Container_Calc;
  end;

  TEfl_Ui_Relative_Container_Content_Iterator = record
    iterator: TEina_Iterator;
    real_iterator: PEina_Iterator;
    relative_container: PEo;
  end;
  PEfl_Ui_Relative_Container_Content_Iterator = ^TEfl_Ui_Relative_Container_Content_Iterator;


  // === Konventiert am: 28-5-25 19:48:34 ===


implementation



end.
