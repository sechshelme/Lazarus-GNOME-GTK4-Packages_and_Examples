
unit eldbus_service;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_service.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_service.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PEldbus_Arg_Info  = ^Eldbus_Arg_Info;
PEldbus_Connection  = ^Eldbus_Connection;
PEldbus_Message  = ^Eldbus_Message;
PEldbus_Message_Iter  = ^Eldbus_Message_Iter;
PEldbus_Method  = ^Eldbus_Method;
PEldbus_Method2  = ^Eldbus_Method2;
PEldbus_Method_Cb  = ^Eldbus_Method_Cb;
PEldbus_Method_Data_Cb  = ^Eldbus_Method_Data_Cb;
PEldbus_Property  = ^Eldbus_Property;
PEldbus_Property_Set_Cb  = ^Eldbus_Property_Set_Cb;
PEldbus_Service_Interface  = ^Eldbus_Service_Interface;
PEldbus_Service_Interface_Desc  = ^Eldbus_Service_Interface_Desc;
PEldbus_Service_Interface_Desc2  = ^Eldbus_Service_Interface_Desc2;
PEldbus_Signal  = ^Eldbus_Signal;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELDBUS_SERVICE_H}

const
  ELDBUS_SERVICE_H = 1;  
{*
 * @defgroup Eldbus_Service Service
 * @ingroup Eldbus
 *
 * @
  }
  ELDBUS_METHOD_FLAG_DEPRECATED = 1;  
  ELDBUS_METHOD_FLAG_NOREPLY = 1 shl 1;  
  ELDBUS_METHOD_FLAG_HAS_DATA = 1 shl 2;  { @since 1.1 }
  ELDBUS_SIGNAL_FLAG_DEPRECATED = 1;  
  ELDBUS_PROPERTY_FLAG_DEPRECATED = 1;  
  ELDBUS_INTERFACE_DESCRIPTOR_VERSION = 2;  
(* Const before type ignored *)
(* Const before type ignored *)
type
  PEldbus_Arg_Info = ^TEldbus_Arg_Info;
  TEldbus_Arg_Info = record
      signature : Pchar;
      name : Pchar;
    end;
{*
 * @brief Used to insert complete types to signature of methods or signals.
 *
 * Example: ELDBUS_ARGS("s", "interface", "s", "property")
 * The signature will be "ss" and each string will have a tag name on
 * introspect XML with the respective name.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  PEldbus_Method_Cb = ^TEldbus_Method_Cb;
  TEldbus_Method_Cb = function (iface:PEldbus_Service_Interface; message:PEldbus_Message):PEldbus_Message;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

  PEldbus_Method_Data_Cb = ^TEldbus_Method_Data_Cb;
  TEldbus_Method_Data_Cb = function (data:pointer; iface:PEldbus_Service_Interface; message:PEldbus_Message):PEldbus_Message;cdecl;
{ @since 1.11 }
{*
 * Callback function to append property value to message.
 *
 * @param iface interface of property
 * @param propname name of property
 * @param iter variant iterator in which value must be appended
 * @param request_msg message that request property
 * @param error if a error happen you must set a message error to be send caller
 *
 * @return EINA_TRUE if success
 *
 * @note request_msg and error arguments are only different from NULL when a
 * client request a property with Properties.Get or Properties.GetAll. Upon
 * calls to eldbus_service_property_changed(), this callback will also be called.
 * It's a mistake to return an error in this case because if a property changed,
 * it must have a new value set and it should be able to be read.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TEldbus_Property_Get_Cb = function (iface:PEldbus_Service_Interface; propname:Pchar; iter:PEldbus_Message_Iter; request_msg:PEldbus_Message; error:PPEldbus_Message):TEina_Bool;cdecl;
{*
 * Callback function to set property value from message.
 *
 * @param iface interface of property
 * @param propname name of property
 * @param input_msg message call where you have to get value
 *
 * @return Message of response, could be a simple method_return, error or NULL to send response later.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PEldbus_Property_Set_Cb = ^TEldbus_Property_Set_Cb;
  TEldbus_Property_Set_Cb = function (iface:PEldbus_Service_Interface; propname:Pchar; iter:PEldbus_Message_Iter; input_msg:PEldbus_Message):PEldbus_Message;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  PEldbus_Method = ^TEldbus_Method;
  TEldbus_Method = record
      member : Pchar;
      in : PEldbus_Arg_Info;
      out : PEldbus_Arg_Info;
      cb : TEldbus_Method_Cb;
      flags : dword;
    end;
{ @since 1.11 }

  PEldbus_Method2 = ^TEldbus_Method2;
  TEldbus_Method2 = record
      method : TEldbus_Method;
      data : pointer;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

  PEldbus_Signal = ^TEldbus_Signal;
  TEldbus_Signal = record
      name : Pchar;
      args : PEldbus_Arg_Info;
      flags : dword;
    end;
(* Const before type ignored *)
(* Const before type ignored *)

  PEldbus_Property = ^TEldbus_Property;
  TEldbus_Property = record
      name : Pchar;
      _type : Pchar;
      get_func : TEldbus_Property_Get_Cb;
      set_func : TEldbus_Property_Set_Cb;
      flags : dword;
    end;
(* Const before type ignored *)
{*< interface name  }
(* Const before type ignored *)
{*< array of the methods that should be registered in this interface, the last item of array should be filled with NULL  }
(* Const before type ignored *)
{*< array of signal that this interface send, the last item of array should be filled with NULL  }
(* Const before type ignored *)
{*< array of property that this interface have, the last item of array should be filled with NULL   }
(* Const before type ignored *)
{*< default get function, if a property don't have a get function this will be used  }
(* Const before type ignored *)
{*< default set function, if a property don't have a set function this will be used  }

  PEldbus_Service_Interface_Desc = ^TEldbus_Service_Interface_Desc;
  TEldbus_Service_Interface_Desc = record
      interface : Pchar;
      methods : PEldbus_Method;
      signals : PEldbus_Signal;
      properties : PEldbus_Property;
      default_get : TEldbus_Property_Get_Cb;
      default_set : TEldbus_Property_Set_Cb;
    end;
{*< version of the interface descriptor. Must be initialized with ELDBUS_INTERFACE_DESCRIPTOR_VERSION @since 1.11 > }
(* Const before type ignored *)
{*< array of the methods that should be registered in this interface, the last item of array should be filled with NULL @since 1.11  }

  PEldbus_Service_Interface_Desc2 = ^TEldbus_Service_Interface_Desc2;
  TEldbus_Service_Interface_Desc2 = record
      description : TEldbus_Service_Interface_Desc;
      version : longint;
      methods2 : PEldbus_Method2;
    end;
{*
 * @brief Register an interface in the given path and connection.
 *
 * @param conn where the interface should listen
 * @param path object path
 * @param desc description of interface
 *
 * @return Interface
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eldbus_service_interface_register(conn:PEldbus_Connection; path:Pchar; desc:PEldbus_Service_Interface_Desc):PEldbus_Service_Interface;cdecl;external;
{*
 * @brief Register a fallback interface handler for a given subsection of the object hierarchy.
 * Note: Use eldbus_service_interface_unregister() to unregister a interface.
 * @param conn where the interface should listen
 * @param path a '/' delimited string of path elements
 * @param desc description of interface
 * @see eldbus_service_interface_unregister()
 *
 * @since 1.9
 *
 * @return Interface
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_service_interface_fallback_register(conn:PEldbus_Connection; path:Pchar; desc:PEldbus_Service_Interface_Desc):PEldbus_Service_Interface;cdecl;external;
{*
 * @brief Register an interface in the given path and connection. This
 * extended register function allows the registration of stateful methods, with void* data.
 *
 * Note: Use eldbus_service_interface_unregister() to unregister a interface.
 *
 * @param conn where the interface should listen
 * @param path object path
 * @param desc description of interface
 *
 * @since 1.11
 *
 * @return Interface
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_service_interface_register2(conn:PEldbus_Connection; path:Pchar; desc:PEldbus_Service_Interface_Desc2):PEldbus_Service_Interface;cdecl;external;
{*
 * @brief Register a fallback interface handler for a given subsection
 * of the object hierarchy.  This extended register function allows
 * the registration of stateful methods, with void* data.
 *
 * Note: Use eldbus_service_interface_unregister() to unregister a interface.
 *
 * @param conn where the interface should listen
 * @param path a '/' delimited string of path elements
 * @param desc description of interface
 * @see eldbus_service_interface_unregister()
 *
 * @since 1.11
 *
 * @return Interface
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_service_interface_fallback_register2(conn:PEldbus_Connection; path:Pchar; desc:PEldbus_Service_Interface_Desc2):PEldbus_Service_Interface;cdecl;external;
{*
 * @brief Unregister a interface.
 * Note: This doesn't unregister the object path if interface count reaches 0.
 * Use eldbus_service_object_unregister() to unregister the object.
 *
 * @param iface interface to unregister
  }
procedure eldbus_service_interface_unregister(iface:PEldbus_Service_Interface);cdecl;external;
{*
 * @brief Unregister all interfaces of the object path that this interface belongs
 * and the object path.
 *
 * @param iface interface to unregister
  }
procedure eldbus_service_object_unregister(iface:PEldbus_Service_Interface);cdecl;external;
(* Const before type ignored *)
function eldbus_service_connection_get(iface:PEldbus_Service_Interface):PEldbus_Connection;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_service_object_path_get(iface:PEldbus_Service_Interface):Pchar;cdecl;external;
{*
 * @brief Emit a signal handler of the interface with non-complex types.
 * Each signal handler have a internal id, the first signal handler of
 * interface is = 0 the second = 1 and go on.
 *
 * @param iface interface of the signal
 * @param signal_id id of signal
 * @param ... values that will be send on signal
 *
 * @return EINA_TRUE if success
  }
(* Const before type ignored *)
function eldbus_service_signal_emit(iface:PEldbus_Service_Interface; signal_id:dword; args:array of const):TEina_Bool;cdecl;external;
function eldbus_service_signal_emit(iface:PEldbus_Service_Interface; signal_id:dword):TEina_Bool;cdecl;external;
{*
 * @brief Create signal message.
 * Each signal handler have a internal id, the first signal handler of
 * interface is = 0 the second = 1 and go on.
 * This function is used when the signal has complex types.
 *
 * @param iface interface of the signal
 * @param signal_id id of signal
 *
 * @return EINA_TRUE if success
  }
(* Const before type ignored *)
function eldbus_service_signal_new(iface:PEldbus_Service_Interface; signal_id:dword):PEldbus_Message;cdecl;external;
{*
 * @brief Send a signal message.
 *
 * On success this will call eldbus_message_unref() on the @p signal_msg,
 * which is the intended behavior in 99% of the cases. Remember to increment
 * the refcount if you want to keep it alive.
 *
 * @param iface interface of the signal
 * @param signal_msg message of signal
 *
 * @return EINA_TRUE if success
  }
(* Const before type ignored *)
function eldbus_service_signal_send(iface:PEldbus_Service_Interface; signal_msg:PEldbus_Message):TEina_Bool;cdecl;external;
{*
 * @brief Store data at object path, this data can be obtained from all interfaces
 * of the same object.
 *
 * @param iface interface that belong to the object path where data will
 * be stored
 * @param key to identify data
 * @param data
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eldbus_service_object_data_set(iface:PEldbus_Service_Interface; key:Pchar; data:pointer);cdecl;external;
{*
 * @brief Get data stored in object path.
 *
 * @param iface interface that belongs to the object path where data are stored
 * @param key that identify data
 *
 * @return pointer to data if found otherwise NULL
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_service_object_data_get(iface:PEldbus_Service_Interface; key:Pchar):pointer;cdecl;external;
{*
 * @brief Del data stored in object path.
 *
 * @param iface interface that belongs to the object path where data are stored
 * @param key that identify data
 *
 * @return pointer to data if found otherwise NULL
  }
(* Const before type ignored *)
function eldbus_service_object_data_del(iface:PEldbus_Service_Interface; key:Pchar):pointer;cdecl;external;
{*
 * @brief Add property to list of changed properties
 * A DBus.PropertiesChanged signal will be sent in an idler with all properties
 * that have changed.
 *
 * @param iface Interface containing the changed property
 * @param name Property name
 *
 * @return EINA_TRUE if success
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_service_property_changed(iface:PEldbus_Service_Interface; name:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_service_property_invalidate_set(iface:PEldbus_Service_Interface; name:Pchar; is_invalidate:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Attach ObjectManager interface.
 *
 * @param iface ObjectManager will be attach in object path of this interface.
 * @return EINA_TRUE if success
  }
function eldbus_service_object_manager_attach(iface:PEldbus_Service_Interface):TEina_Bool;cdecl;external;
{*
 * Detach ObjectManager interface.
 *
 * @param iface ObjectManager of object path of this interface will be detach.
 * @return EINA_TRUE if success
  }
function eldbus_service_object_manager_detach(iface:PEldbus_Service_Interface):TEina_Bool;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
