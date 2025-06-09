{$IFDEF read_interface}


type
  PEcore_Con_Eet_Server_Obj = ^TEcore_Con_Eet_Server_Obj;
  TEcore_Con_Eet_Server_Obj = TEo;

function ECORE_CON_EET_SERVER_OBJ_CLASS: PEfl_Class;

function ecore_con_eet_server_obj_class_get: PEfl_Class; cdecl; external libecore_con;

// === Konventiert am: 9-6-25 19:23:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ECORE_CON_EET_SERVER_OBJ_CLASS: PEfl_Class;
begin
  ECORE_CON_EET_SERVER_OBJ_CLASS := ecore_con_eet_server_obj_class_get;
end;


{$ENDIF read_implementation}
