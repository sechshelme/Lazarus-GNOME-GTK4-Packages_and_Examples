{$IFDEF read_interface}


type
  PEfl_Pack = ^TEfl_Pack;
  TEfl_Pack = TEo;

  function EFL_PACK_INTERFACE : PEfl_Class;

function efl_pack_interface_get:PEfl_Class;cdecl;external libefl;
function efl_pack_clear(obj:PEo):TEina_Bool;cdecl;external libefl;
function efl_pack_unpack_all(obj:PEo):TEina_Bool;cdecl;external libefl;
function efl_pack_unpack(obj:PEo; subobj:PEfl_Gfx_Entity):TEina_Bool;cdecl;external libefl;
function efl_pack(obj:PEo; subobj:PEfl_Gfx_Entity):TEina_Bool;cdecl;external libefl;

// === Konventiert am: 20-5-25 13:48:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_PACK_INTERFACE: PEfl_Class;
  begin
    EFL_PACK_INTERFACE:=efl_pack_interface_get;
  end;


{$ENDIF read_implementation}
