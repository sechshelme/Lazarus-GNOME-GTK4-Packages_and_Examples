unit elm_scroller_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Scroller_Policy = ^TElm_Scroller_Policy;
  TElm_Scroller_Policy = longint;

const
  ELM_SCROLLER_POLICY_AUTO = 0;
  ELM_SCROLLER_POLICY_ON = 1;
  ELM_SCROLLER_POLICY_OFF = 2;
  ELM_SCROLLER_POLICY_LAST = 3;

type
  PElm_Scroller_Single_Direction = ^TElm_Scroller_Single_Direction;
  TElm_Scroller_Single_Direction = longint;

const
  ELM_SCROLLER_SINGLE_DIRECTION_NONE = 0;
  ELM_SCROLLER_SINGLE_DIRECTION_SOFT = 1;
  ELM_SCROLLER_SINGLE_DIRECTION_HARD = 2;
  ELM_SCROLLER_SINGLE_DIRECTION_LAST = 3;

type
  PElm_Scroller_Movement_Block = ^TElm_Scroller_Movement_Block;
  TElm_Scroller_Movement_Block = longint;

const
  ELM_SCROLLER_MOVEMENT_NO_BLOCK = 1;
  ELM_SCROLLER_MOVEMENT_BLOCK_VERTICAL = 2;
  ELM_SCROLLER_MOVEMENT_BLOCK_HORIZONTAL = 4;

function elm_scroller_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_scroller_content_min_limit(obj: PEvas_Object; w: TEina_Bool; h: TEina_Bool); cdecl; external libelementary;
procedure elm_scroller_region_show(obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libelementary;
procedure elm_scroller_policy_set(obj: PEvas_Object; policy_h: TElm_Scroller_Policy; policy_v: TElm_Scroller_Policy); cdecl; external libelementary;
procedure elm_scroller_policy_get(obj: PEvas_Object; policy_h: PElm_Scroller_Policy; policy_v: PElm_Scroller_Policy); cdecl; external libelementary;
procedure elm_scroller_single_direction_set(obj: PEvas_Object; single_dir: TElm_Scroller_Single_Direction); cdecl; external libelementary;
function elm_scroller_single_direction_get(obj: PEvas_Object): TElm_Scroller_Single_Direction; cdecl; external libelementary;
procedure elm_scroller_region_get(obj: PEvas_Object; x: PEvas_Coord; y: PEvas_Coord; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libelementary;
procedure elm_scroller_child_size_get(obj: PEvas_Object; w: PEvas_Coord; h: PEvas_Coord); cdecl; external libelementary;
procedure elm_scroller_page_snap_set(obj: PEvas_Object; page_h_snap: TEina_Bool; page_v_snap: TEina_Bool); cdecl; external libelementary;
procedure elm_scroller_page_snap_get(obj: PEvas_Object; page_h_snap: PEina_Bool; page_v_snap: PEina_Bool); cdecl; external libelementary;
procedure elm_scroller_bounce_set(obj: PEvas_Object; h_bounce: TEina_Bool; v_bounce: TEina_Bool); cdecl; external libelementary;
procedure elm_scroller_bounce_get(obj: PEvas_Object; h_bounce: PEina_Bool; v_bounce: PEina_Bool); cdecl; external libelementary;
procedure elm_scroller_page_relative_set(obj: PEvas_Object; h_pagerel: double; v_pagerel: double); cdecl; external libelementary;
procedure elm_scroller_page_relative_get(obj: PEvas_Object; h_pagerel: Pdouble; v_pagerel: Pdouble); cdecl; external libelementary;
procedure elm_scroller_page_size_set(obj: PEvas_Object; h_pagesize: TEvas_Coord; v_pagesize: TEvas_Coord); cdecl; external libelementary;
procedure elm_scroller_page_size_get(obj: PEvas_Object; h_pagesize: PEvas_Coord; v_pagesize: PEvas_Coord); cdecl; external libelementary;
procedure elm_scroller_current_page_get(obj: PEvas_Object; h_pagenumber: Plongint; v_pagenumber: Plongint); cdecl; external libelementary;
procedure elm_scroller_last_page_get(obj: PEvas_Object; h_pagenumber: Plongint; v_pagenumber: Plongint); cdecl; external libelementary;
procedure elm_scroller_page_show(obj: PEvas_Object; h_pagenumber: longint; v_pagenumber: longint); cdecl; external libelementary;
procedure elm_scroller_page_bring_in(obj: PEvas_Object; h_pagenumber: longint; v_pagenumber: longint); cdecl; external libelementary;
procedure elm_scroller_region_bring_in(obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord; w: TEvas_Coord; h: TEvas_Coord); cdecl; external libelementary;
procedure elm_scroller_gravity_set(obj: PEvas_Object; x: double; y: double); cdecl; external libelementary;
procedure elm_scroller_gravity_get(obj: PEvas_Object; x: Pdouble; y: Pdouble); cdecl; external libelementary;
procedure elm_scroller_movement_block_set(obj: PEvas_Object; block: TElm_Scroller_Movement_Block); cdecl; external libelementary;
function elm_scroller_movement_block_get(obj: PEvas_Object): TElm_Scroller_Movement_Block; cdecl; external libelementary;
procedure elm_scroller_step_size_set(obj: PEvas_Object; x: TEvas_Coord; y: TEvas_Coord); cdecl; external libelementary;
procedure elm_scroller_step_size_get(obj: PEvas_Object; x: PEvas_Coord; y: PEvas_Coord); cdecl; external libelementary;
procedure elm_scroller_loop_set(obj: PEvas_Object; loop_h: TEina_Bool; loop_v: TEina_Bool); cdecl; external libelementary;
procedure elm_scroller_loop_get(obj: PEvas_Object; loop_h: PEina_Bool; loop_v: PEina_Bool); cdecl; external libelementary;
procedure elm_scroller_wheel_disabled_set(obj: PEvas_Object; disabled: TEina_Bool); cdecl; external libelementary;
function elm_scroller_wheel_disabled_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_scroller_propagate_events_set(obj: PEvas_Object; propagation: TEina_Bool); cdecl; external libelementary;
function elm_scroller_propagate_events_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 23-5-25 17:27:10 ===


implementation



end.
