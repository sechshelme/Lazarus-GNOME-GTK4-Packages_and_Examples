unit ecore_con_eet_base_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, Ecore_Con, Ecore_Con_Eet;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEcore_Con_Eet_Base = ^TEcore_Con_Eet_Base;
  TEcore_Con_Eet_Base = TEo;

function ECORE_CON_EET_BASE_CLASS: PEfl_Class;

function ecore_con_eet_base_class_get: PEfl_Class; cdecl; external libecore_con;
procedure ecore_con_eet_base_server_set(obj: PEo; data: PEcore_Con_Server); cdecl; external libecore_con;
function ecore_con_eet_base_server_get(obj: PEo): PEcore_Con_Server; cdecl; external libecore_con;
procedure ecore_con_eet_base_data_callback_set(obj: PEo; name: pchar; func: TEcore_Con_Eet_Data_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_base_raw_data_callback_set(obj: PEo; name: pchar; func: TEcore_Con_Eet_Raw_Data_Cb; data: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_base_data_callback_del(obj: PEo; name: pchar); cdecl; external libecore_con;
procedure ecore_con_eet_base_raw_data_callback_del(obj: PEo; name: pchar); cdecl; external libecore_con;
procedure ecore_con_eet_base_register(obj: PEo; name: pchar; edd: PEet_Data_Descriptor); cdecl; external libecore_con;
procedure ecore_con_eet_base_send(obj: PEo; reply: PEcore_Con_Reply; name: pchar; value: pointer); cdecl; external libecore_con;
procedure ecore_con_eet_base_raw_send(obj: PEo; reply: PEcore_Con_Reply; protocol_name: pchar; section: pchar; section_data: PEina_Binbuf); cdecl; external libecore_con;

// === Konventiert am: 9-6-25 19:22:51 ===


implementation


function ECORE_CON_EET_BASE_CLASS: PEfl_Class;
begin
  ECORE_CON_EET_BASE_CLASS := ecore_con_eet_base_class_get;
end;


end.
