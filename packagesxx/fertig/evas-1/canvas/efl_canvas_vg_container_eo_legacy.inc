{$IFDEF read_interface}


type
  PEvas_Vg_Container = ^TEvas_Vg_Container;
  TEvas_Vg_Container = TEo;

function evas_vg_container_child_get(obj: PEvas_Vg_Container; name: pchar): PEvas_Vg_Node; cdecl; external libevas;
function evas_vg_container_children_get(obj: PEvas_Vg_Container): PEina_Iterator; cdecl; external libevas;

// === Konventiert am: 11-5-25 15:16:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
