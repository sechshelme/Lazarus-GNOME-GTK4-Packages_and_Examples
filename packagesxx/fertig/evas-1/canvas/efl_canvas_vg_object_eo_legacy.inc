{$IFDEF read_interface}

type
  PEvas_Object_Vg_Fill_Mode = ^TEvas_Object_Vg_Fill_Mode;
  TEvas_Object_Vg_Fill_Mode = longint;

const
  EVAS_OBJECT_VG_FILL_MODE_NONE = 0;
  EVAS_OBJECT_VG_FILL_MODE_STRETCH = 1;
  EVAS_OBJECT_VG_FILL_MODE_MEET = 2;
  EVAS_OBJECT_VG_FILL_MODE_SLICE = 3;

procedure evas_object_vg_fill_mode_set(obj: PEvas_Object; fill_mode: TEvas_Object_Vg_Fill_Mode); cdecl; external libevas;
function evas_object_vg_fill_mode_get(obj: PEvas_Object): TEvas_Object_Vg_Fill_Mode; cdecl; external libevas;
procedure evas_object_vg_viewbox_set(obj: PEvas_Object; viewbox: TEina_Rect); cdecl; external libevas;
function evas_object_vg_viewbox_get(obj: PEvas_Object): TEina_Rect; cdecl; external libevas;
procedure evas_object_vg_viewbox_align_set(obj: PEvas_Object; align_x: double; align_y: double); cdecl; external libevas;
procedure evas_object_vg_viewbox_align_get(obj: PEvas_Object; align_x: Pdouble; align_y: Pdouble); cdecl; external libevas;
procedure evas_object_vg_root_node_set(obj: PEvas_Object; root: PEvas_Vg_Node); cdecl; external libevas;
function evas_object_vg_root_node_get(obj: PEvas_Object): PEvas_Vg_Node; cdecl; external libevas;

// === Konventiert am: 11-5-25 19:50:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
