{$IFDEF read_interface}


type
  PEfl_Layout_Group = ^TEfl_Layout_Group;
  TEfl_Layout_Group = TEo;

function EFL_LAYOUT_GROUP_INTERFACE: PEfl_Class;

function efl_layout_group_interface_get: PEfl_Class; cdecl; external libedje;
function efl_layout_group_size_min_get(obj: PEo): TEina_Size2D; cdecl; external libedje;
function efl_layout_group_size_max_get(obj: PEo): TEina_Size2D; cdecl; external libedje;
function efl_layout_group_data_get(obj: PEo; key: pchar): pchar; cdecl; external libedje;
function efl_layout_group_part_exist_get(obj: PEo; part: pchar): TEina_Bool; cdecl; external libedje;

// === Konventiert am: 22-5-25 19:41:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_LAYOUT_GROUP_INTERFACE: PEfl_Class;
begin
  EFL_LAYOUT_GROUP_INTERFACE := efl_layout_group_interface_get;
end;


{$ENDIF read_implementation}
