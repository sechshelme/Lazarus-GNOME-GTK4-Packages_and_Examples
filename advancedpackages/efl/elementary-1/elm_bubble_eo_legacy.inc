{$IFDEF read_interface}


type
  PElm_Bubble = ^TElm_Bubble;
  TElm_Bubble = TEo;

type
  PElm_Bubble_Pos = ^TElm_Bubble_Pos;
  TElm_Bubble_Pos = longint;

const
  ELM_BUBBLE_POS_INVALID = -(1);
  ELM_BUBBLE_POS_TOP_LEFT = (-(1)) + 1;
  ELM_BUBBLE_POS_TOP_RIGHT = (-(1)) + 2;
  ELM_BUBBLE_POS_BOTTOM_LEFT = (-(1)) + 3;
  ELM_BUBBLE_POS_BOTTOM_RIGHT = (-(1)) + 4;

procedure elm_bubble_pos_set(obj: PElm_Bubble; pos: TElm_Bubble_Pos); cdecl; external libelementary;
function elm_bubble_pos_get(obj: PElm_Bubble): TElm_Bubble_Pos; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:53:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
