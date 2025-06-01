unit efl_ui_flip_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Flip = ^TElm_Flip;
  TElm_Flip = TEo;

  PElm_Flip_Mode = ^TElm_Flip_Mode;
  TElm_Flip_Mode = longint;

const
  ELM_FLIP_ROTATE_Y_CENTER_AXIS = 0;
  ELM_FLIP_ROTATE_X_CENTER_AXIS = 1;
  ELM_FLIP_ROTATE_XZ_CENTER_AXIS = 2;
  ELM_FLIP_ROTATE_YZ_CENTER_AXIS = 3;
  ELM_FLIP_CUBE_LEFT = 4;
  ELM_FLIP_CUBE_RIGHT = 5;
  ELM_FLIP_CUBE_UP = 6;
  ELM_FLIP_CUBE_DOWN = 7;
  ELM_FLIP_PAGE_LEFT = 8;
  ELM_FLIP_PAGE_RIGHT = 9;
  ELM_FLIP_PAGE_UP = 10;
  ELM_FLIP_PAGE_DOWN = 11;
  ELM_FLIP_CROSS_FADE = 12;

type
  PElm_Flip_Interaction = ^TElm_Flip_Interaction;
  TElm_Flip_Interaction = longint;

const
  ELM_FLIP_INTERACTION_NONE = 0;
  ELM_FLIP_INTERACTION_ROTATE = 1;
  ELM_FLIP_INTERACTION_CUBE = 2;
  ELM_FLIP_INTERACTION_PAGE = 3;

type
  PElm_Flip_Direction = ^TElm_Flip_Direction;
  TElm_Flip_Direction = longint;

const
  ELM_FLIP_DIRECTION_UP = 0;
  ELM_FLIP_DIRECTION_DOWN = 1;
  ELM_FLIP_DIRECTION_LEFT = 2;
  ELM_FLIP_DIRECTION_RIGHT = 3;

procedure elm_flip_interaction_direction_hitsize_set(obj: PElm_Flip; dir: TElm_Flip_Direction; hitsize: double); cdecl; external libelementary;
function elm_flip_interaction_direction_hitsize_get(obj: PElm_Flip; dir: TElm_Flip_Direction): double; cdecl; external libelementary;
procedure elm_flip_interaction_direction_enabled_set(obj: PElm_Flip; dir: TElm_Flip_Direction; enabled: TEina_Bool); cdecl; external libelementary;
function elm_flip_interaction_direction_enabled_get(obj: PElm_Flip; dir: TElm_Flip_Direction): TEina_Bool; cdecl; external libelementary;
function elm_flip_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_flip_perspective_set(obj: PEvas_Object; foc: TEvas_Coord; x: TEvas_Coord; y: TEvas_Coord); cdecl; external libelementary;

// === Konventiert am: 28-5-25 19:37:13 ===


implementation



end.
