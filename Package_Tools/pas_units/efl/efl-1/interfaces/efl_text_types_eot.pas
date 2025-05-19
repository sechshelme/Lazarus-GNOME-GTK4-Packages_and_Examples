unit efl_text_types_eot;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Text_Bidirectional_Type = ^TEfl_Text_Bidirectional_Type;
  TEfl_Text_Bidirectional_Type = longint;

const
  EFL_TEXT_BIDIRECTIONAL_TYPE_NATURAL = 0;
  EFL_TEXT_BIDIRECTIONAL_TYPE_NEUTRAL = 0;
  EFL_TEXT_BIDIRECTIONAL_TYPE_LTR = 1;
  EFL_TEXT_BIDIRECTIONAL_TYPE_RTL = 2;
  EFL_TEXT_BIDIRECTIONAL_TYPE_INHERIT = 3;

type
  PEfl_Text_Change_Type = ^TEfl_Text_Change_Type;
  TEfl_Text_Change_Type = longint;

const
  EFL_TEXT_CHANGE_TYPE_INSERT = 0;
  EFL_TEXT_CHANGE_TYPE_REMOVE = 1;

type
  PEfl_Text_Change_Info = ^TEfl_Text_Change_Info;

  TEfl_Text_Change_Info = record
    content: pchar;
    position: Tsize_t;
    length: Tsize_t;
    _type: TEfl_Text_Change_Type;
    mergeable: TEina_Bool;
  end;

  // === Konventiert am: 19-5-25 17:22:13 ===


implementation



end.
