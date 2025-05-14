unit elm_box_eo_legacy;

interface

uses
  ctypes, efl, eina_types, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PElm_Box = ^TElm_Box;
  TElm_Box = TEo;

procedure elm_box_homogeneous_set(obj: PElm_Box; homogeneous: TEina_Bool); cdecl; external libevas;
function elm_box_homogeneous_get(obj: PElm_Box): TEina_Bool; cdecl; external libevas;
procedure elm_box_align_set(obj: PElm_Box; horizontal: double; vertical: double); cdecl; external libevas;
procedure elm_box_align_get(obj: PElm_Box; horizontal: Pdouble; vertical: Pdouble); cdecl; external libevas;
procedure elm_box_horizontal_set(obj: PElm_Box; horizontal: TEina_Bool); cdecl; external libevas;
function elm_box_horizontal_get(obj: PElm_Box): TEina_Bool; cdecl; external libevas;
procedure elm_box_padding_set(obj: PElm_Box; horizontal: longint; vertical: longint); cdecl; external libevas;
procedure elm_box_padding_get(obj: PElm_Box; horizontal: Plongint; vertical: Plongint); cdecl; external libevas;
function elm_box_children_get(obj: PElm_Box): PEina_List; cdecl; external libevas;
procedure elm_box_pack_end(obj: PElm_Box; subobj: PEfl_Canvas_Object); cdecl; external libevas;
procedure elm_box_unpack_all(obj: PElm_Box); cdecl; external libevas;
procedure elm_box_unpack(obj: PElm_Box; subobj: PEfl_Canvas_Object); cdecl; external libevas;
procedure elm_box_pack_after(obj: PElm_Box; subobj: PEfl_Canvas_Object; after: PEfl_Canvas_Object); cdecl; external libevas;
procedure elm_box_pack_start(obj: PElm_Box; subobj: PEfl_Canvas_Object); cdecl; external libevas;
procedure elm_box_recalculate(obj: PElm_Box); cdecl; external libevas;
procedure elm_box_pack_before(obj: PElm_Box; subobj: PEfl_Canvas_Object; before: PEfl_Canvas_Object); cdecl; external libevas;
procedure elm_box_clear(obj: PElm_Box); cdecl; external libevas;

// === Konventiert am: 11-5-25 17:27:53 ===


implementation



end.
