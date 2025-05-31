unit elm_bubble_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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


implementation



end.
