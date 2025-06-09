unit ecore_con_eet_server_obj_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEcore_Con_Eet_Server_Obj = ^TEcore_Con_Eet_Server_Obj;
  TEcore_Con_Eet_Server_Obj = TEo;

function ECORE_CON_EET_SERVER_OBJ_CLASS: PEfl_Class;

function ecore_con_eet_server_obj_class_get: PEfl_Class; cdecl; external libecore_con;

// === Konventiert am: 9-6-25 19:23:01 ===


implementation


function ECORE_CON_EET_SERVER_OBJ_CLASS: PEfl_Class;
begin
  ECORE_CON_EET_SERVER_OBJ_CLASS := ecore_con_eet_server_obj_class_get;
end;


end.
