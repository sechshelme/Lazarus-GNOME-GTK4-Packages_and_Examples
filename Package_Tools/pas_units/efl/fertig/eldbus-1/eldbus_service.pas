unit eldbus_service;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore, Eldbus;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ELDBUS_SERVICE_H = 1;

  ELDBUS_METHOD_FLAG_DEPRECATED = 1;
  ELDBUS_METHOD_FLAG_NOREPLY = 1 shl 1;
  ELDBUS_METHOD_FLAG_HAS_DATA = 1 shl 2;
  ELDBUS_SIGNAL_FLAG_DEPRECATED = 1;
  ELDBUS_PROPERTY_FLAG_DEPRECATED = 1;
  ELDBUS_INTERFACE_DESCRIPTOR_VERSION = 2;

type
  TEldbus_Arg_Info = record
    signature: pchar;
    name: pchar;
  end;
  PEldbus_Arg_Info = ^TEldbus_Arg_Info;

  TEldbus_Service_Interface = record
  end;
  PEldbus_Service_Interface = ^TEldbus_Service_Interface;

  PEldbus_Method_Cb = ^TEldbus_Method_Cb;
  TEldbus_Method_Cb = function(iface: PEldbus_Service_Interface; message: PEldbus_Message): PEldbus_Message; cdecl;

  PEldbus_Method_Data_Cb = ^TEldbus_Method_Data_Cb;
  TEldbus_Method_Data_Cb = function(data: pointer; iface: PEldbus_Service_Interface; message: PEldbus_Message): PEldbus_Message; cdecl;

  TEldbus_Property_Get_Cb = function(iface: PEldbus_Service_Interface; propname: pchar; iter: PEldbus_Message_Iter; request_msg: PEldbus_Message; error: PPEldbus_Message): TEina_Bool; cdecl;

  PEldbus_Property_Set_Cb = ^TEldbus_Property_Set_Cb;
  TEldbus_Property_Set_Cb = function(iface: PEldbus_Service_Interface; propname: pchar; iter: PEldbus_Message_Iter; input_msg: PEldbus_Message): PEldbus_Message; cdecl;

  TEldbus_Method = record
    member: pchar;
    in_: PEldbus_Arg_Info;
    out_: PEldbus_Arg_Info;
    cb: TEldbus_Method_Cb;
    flags: dword;
  end;
  PEldbus_Method = ^TEldbus_Method;

  TEldbus_Method2 = record
    method: TEldbus_Method;
    data: pointer;
  end;
  PEldbus_Method2 = ^TEldbus_Method2;

  TEldbus_Signal = record
    name: pchar;
    args: PEldbus_Arg_Info;
    flags: dword;
  end;
  PEldbus_Signal = ^TEldbus_Signal;

  TEldbus_Property = record
    name: pchar;
    _type: pchar;
    get_func: TEldbus_Property_Get_Cb;
    set_func: TEldbus_Property_Set_Cb;
    flags: dword;
  end;
  PEldbus_Property = ^TEldbus_Property;

  TEldbus_Service_Interface_Desc = record
    iface: pchar;
    methods: PEldbus_Method;
    signals: PEldbus_Signal;
    properties: PEldbus_Property;
    default_get: TEldbus_Property_Get_Cb;
    default_set: TEldbus_Property_Set_Cb;
  end;
  PEldbus_Service_Interface_Desc = ^TEldbus_Service_Interface_Desc;

  TEldbus_Service_Interface_Desc2 = record
    description: TEldbus_Service_Interface_Desc;
    version: longint;
    methods2: PEldbus_Method2;
  end;
  PEldbus_Service_Interface_Desc2 = ^TEldbus_Service_Interface_Desc2;

function eldbus_service_interface_register(conn: PEldbus_Connection; path: pchar; desc: PEldbus_Service_Interface_Desc): PEldbus_Service_Interface; cdecl; external libeldbus;
function eldbus_service_interface_fallback_register(conn: PEldbus_Connection; path: pchar; desc: PEldbus_Service_Interface_Desc): PEldbus_Service_Interface; cdecl; external libeldbus;
function eldbus_service_interface_register2(conn: PEldbus_Connection; path: pchar; desc: PEldbus_Service_Interface_Desc2): PEldbus_Service_Interface; cdecl; external libeldbus;
function eldbus_service_interface_fallback_register2(conn: PEldbus_Connection; path: pchar; desc: PEldbus_Service_Interface_Desc2): PEldbus_Service_Interface; cdecl; external libeldbus;
procedure eldbus_service_interface_unregister(iface: PEldbus_Service_Interface); cdecl; external libeldbus;
procedure eldbus_service_object_unregister(iface: PEldbus_Service_Interface); cdecl; external libeldbus;
function eldbus_service_connection_get(iface: PEldbus_Service_Interface): PEldbus_Connection; cdecl; external libeldbus;
function eldbus_service_object_path_get(iface: PEldbus_Service_Interface): pchar; cdecl; external libeldbus;
function eldbus_service_signal_emit(iface: PEldbus_Service_Interface; signal_id: dword; args: array of const): TEina_Bool; cdecl; external libeldbus;
function eldbus_service_signal_emit(iface: PEldbus_Service_Interface; signal_id: dword): TEina_Bool; cdecl; external libeldbus;
function eldbus_service_signal_new(iface: PEldbus_Service_Interface; signal_id: dword): PEldbus_Message; cdecl; external libeldbus;
function eldbus_service_signal_send(iface: PEldbus_Service_Interface; signal_msg: PEldbus_Message): TEina_Bool; cdecl; external libeldbus;
procedure eldbus_service_object_data_set(iface: PEldbus_Service_Interface; key: pchar; data: pointer); cdecl; external libeldbus;
function eldbus_service_object_data_get(iface: PEldbus_Service_Interface; key: pchar): pointer; cdecl; external libeldbus;
function eldbus_service_object_data_del(iface: PEldbus_Service_Interface; key: pchar): pointer; cdecl; external libeldbus;
function eldbus_service_property_changed(iface: PEldbus_Service_Interface; name: pchar): TEina_Bool; cdecl; external libeldbus;
function eldbus_service_property_invalidate_set(iface: PEldbus_Service_Interface; name: pchar; is_invalidate: TEina_Bool): TEina_Bool; cdecl; external libeldbus;
function eldbus_service_object_manager_attach(iface: PEldbus_Service_Interface): TEina_Bool; cdecl; external libeldbus;
function eldbus_service_object_manager_detach(iface: PEldbus_Service_Interface): TEina_Bool; cdecl; external libeldbus;

// === Konventiert am: 11-6-25 13:09:37 ===


implementation



end.
