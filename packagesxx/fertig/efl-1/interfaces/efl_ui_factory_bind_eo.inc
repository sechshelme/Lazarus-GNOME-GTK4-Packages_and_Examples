{$IFDEF read_interface}


type
  PEfl_Ui_Factory_Bind = ^TEfl_Ui_Factory_Bind;
  TEfl_Ui_Factory_Bind = TEo;

function EFL_UI_FACTORY_BIND_INTERFACE: PEfl_Class;

function efl_ui_factory_bind_interface_get: PEfl_Class; cdecl; external libefl;
function efl_ui_factory_bind(obj: PEo; key: pchar; factory: PEfl_Ui_Factory): TEina_Error; cdecl; external libefl;

// === Konventiert am: 20-5-25 14:43:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_FACTORY_BIND_INTERFACE: PEfl_Class;
begin
  EFL_UI_FACTORY_BIND_INTERFACE := efl_ui_factory_bind_interface_get;
end;


{$ENDIF read_implementation}
