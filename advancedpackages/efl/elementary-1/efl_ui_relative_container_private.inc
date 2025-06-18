{$IFDEF read_interface}


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


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
