
unit eldbus_freedesktop;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_freedesktop.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_freedesktop.h
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
PEina_Hash  = ^Eina_Hash;
PEina_Value  = ^Eina_Value;
PEldbus_Connection  = ^Eldbus_Connection;
PEldbus_Object  = ^Eldbus_Object;
PEldbus_Pending  = ^Eldbus_Pending;
PEldbus_Proxy  = ^Eldbus_Proxy;
PEldbus_Signal_Handler  = ^Eldbus_Signal_Handler;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELDBUS_FREEDESKTOP_H}

const
  ELDBUS_FREEDESKTOP_H = 1;  
{*
 * @defgroup Eldbus_Basic Basic FreeDesktop.Org Methods
 * @ingroup Eldbus
 *
 * @
  }
{*< Allow another service to become the primary owner if requested  }
  ELDBUS_NAME_REQUEST_FLAG_ALLOW_REPLACEMENT = $1;  
{*< Request to replace the current primary owner  }
  ELDBUS_NAME_REQUEST_FLAG_REPLACE_EXISTING = $2;  
{*< If we can not become the primary owner do not place us in the queue  }
  ELDBUS_NAME_REQUEST_FLAG_DO_NOT_QUEUE = $4;  
{ Replies to request for a name  }
{*< Service has become the primary owner of the requested name  }
  ELDBUS_NAME_REQUEST_REPLY_PRIMARY_OWNER = 1;  
{*< Service could not become the primary owner and has been placed in the queue  }
  ELDBUS_NAME_REQUEST_REPLY_IN_QUEUE = 2;  
{*< Service is already in the queue  }
  ELDBUS_NAME_REQUEST_REPLY_EXISTS = 3;  
{*< Service is already the primary owner  }
  ELDBUS_NAME_REQUEST_REPLY_ALREADY_OWNER = 4;  
{*
 * Send a "RequestName" method call in proxy.
 *
 * @param conn Connection object.
 * @param bus Name of the bus
 * @param flags Parameter of the "RequestName" method.
 * @param cb Callback to call when receiving answer.
 * @param cb_data Data passed to callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eldbus_name_request(conn:PEldbus_Connection; bus:Pchar; flags:dword; cb:TEldbus_Message_Cb; cb_data:pointer):PEldbus_Pending;cdecl;external;
{ Replies to releasing a name  }
{*< Service was released from the given name  }
const
  ELDBUS_NAME_RELEASE_REPLY_RELEASED = 1;  
{*< The given name does not exist on the bus  }
  ELDBUS_NAME_RELEASE_REPLY_NON_EXISTENT = 2;  
{*< Service is not an owner of the given name  }
  ELDBUS_NAME_RELEASE_REPLY_NOT_OWNER = 3;  
{*
 * Send a "ReleaseName" method call in proxy.
 *
 * @param conn Connection object.
 * @param bus Name of the bus
 * @param cb Callback to call when receiving answer.
 * @param cb_data Data passed to callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eldbus_name_release(conn:PEldbus_Connection; bus:Pchar; cb:TEldbus_Message_Cb; cb_data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Send a "GetNameOwner" method call in proxy.
 *
 * @param conn Connection object.
 * @param bus Name of the bus
 * @param cb Callback to call when receiving answer.
 * @param cb_data Data passed to callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_name_owner_get(conn:PEldbus_Connection; bus:Pchar; cb:TEldbus_Message_Cb; cb_data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Send a "NameHasOwner" method call in proxy.
 *
 * @param conn Connection object.
 * @param bus Name of the bus
 * @param cb Callback to call when receiving answer.
 * @param cb_data Data passed to callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_name_owner_has(conn:PEldbus_Connection; bus:Pchar; cb:TEldbus_Message_Cb; cb_data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Send a "ListNames" method call in proxy.
 *
 * @param conn Connection object.
 * @param cb Callback to call when receiving answer.
 * @param cb_data Data passed to callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
function eldbus_names_list(conn:PEldbus_Connection; cb:TEldbus_Message_Cb; cb_data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Send a "ListActivatableNames" method call in proxy.
 *
 * @param conn Connection object.
 * @param cb Callback to call when receiving answer.
 * @param cb_data Data passed to callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
function eldbus_names_activatable_list(conn:PEldbus_Connection; cb:TEldbus_Message_Cb; cb_data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Send a "Hello" method call in proxy.
 *
 * @param conn Connection object.
 * @param cb Callback to call when receiving answer.
 * @param cb_data Data passed to callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
function eldbus_hello(conn:PEldbus_Connection; cb:TEldbus_Message_Cb; cb_data:pointer):PEldbus_Pending;cdecl;external;
{ Replies to service starts  }
{*< Service was auto started  }
const
  ELDBUS_NAME_START_REPLY_SUCCESS = 1;  
{*< Service was already running  }
  ELDBUS_NAME_START_REPLY_ALREADY_RUNNING = 2;  
{*
 * Send a "StartServiceByName" method call in proxy.
 *
 * @param conn Connection object.
 * @param bus Name of the bus.
 * @param flags Parameter of the "StartServiceByName" method.
 * @param cb Callback to call when receiving answer.
 * @param cb_data Data passed to callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eldbus_name_start(conn:PEldbus_Connection; bus:Pchar; flags:dword; cb:TEldbus_Message_Cb; cb_data:pointer):PEldbus_Pending;cdecl;external;
{*
 * @typedef Eldbus_Name_Owner_Changed_Cb
 *
 * Callback called when unique id of a bus name changed.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type

  TEldbus_Name_Owner_Changed_Cb = procedure (data:pointer; bus:Pchar; old_id:Pchar; new_id:Pchar);cdecl;
{*
 * Add a callback to be called when unique id of a bus name changed.
 *
 * This function implicitly calls eldbus_name_owner_get() in order to be able to
 * monitor the name. If the only interest is to receive notifications when the
 * name in fact changes, pass EINA_FALSE to \p allow_initial_call so your
 * callback will not be called on first retrieval of name owner. If the
 * initial state is important, pass EINA_TRUE to this parameter.
 *
 * @param conn connection
 * @param bus name of bus
 * @param cb callback
 * @param cb_data context data
 * @param allow_initial_call allow call callback with actual id of the bus
  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure eldbus_name_owner_changed_callback_add(conn:PEldbus_Connection; bus:Pchar; cb:TEldbus_Name_Owner_Changed_Cb; cb_data:pointer; allow_initial_call:TEina_Bool);cdecl;external;
{*
 * Remove callback added with eldbus_name_owner_changed_callback_add().
 *
 * @param conn connection
 * @param bus name of bus
 * @param cb callback
 * @param cb_data context data
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eldbus_name_owner_changed_callback_del(conn:PEldbus_Connection; bus:Pchar; cb:TEldbus_Name_Owner_Changed_Cb; cb_data:pointer);cdecl;external;
{*
 * @defgroup Eldbus_FDO_Peer org.freedesktop.DBus.Peer
 *
 * @
  }
{*
 * Call the method "Ping" on the eldbus object.
 *
 * @param obj Eldbus object.
 * @param cb Callback called when receiving an answer.
 * @param data Data passed to the callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
function eldbus_object_peer_ping(obj:PEldbus_Object; cb:TEldbus_Message_Cb; data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Call the method "GetMachineId" on the eldbus object.
 *
 * @param obj Eldbus object.
 * @param cb Callback called when receiving an answer.
 * @param data Data passed to the callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
function eldbus_object_peer_machine_id_get(obj:PEldbus_Object; cb:TEldbus_Message_Cb; data:pointer):PEldbus_Pending;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Eldbus_FDO_Introspectable org.freedesktop.DBus.Introspectable
 *
 * @
  }
{*
 * Call the method "Introspect" on the eldbus object.
 *
 * @param obj Eldbus object.
 * @param cb Callback called when receiving an answer.
 * @param data Data passed to the callback.
 * @return The Eldbus_Pending corresponding to the message sent.
  }
(* Const before type ignored *)
function eldbus_object_introspect(obj:PEldbus_Object; cb:TEldbus_Message_Cb; data:pointer):PEldbus_Pending;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Eldbus_FDO_Properties org.freedesktop.DBus.Properties
 * @
  }
{*
 * Enable or disable local cache of properties.
 *
 * After enable you can call eldbus_proxy_property_local_get() or
 * eldbus_proxy_property_local_get_all() to get cached properties.
 *
 * @param proxy bus+path+interface that the properties belong
 * @param enable enable or disable properties monitor
 * @return EINA_TRUE if already have cached properties
 * EINA_FALSE if it will asynchrony get the properties.
 * You should listen for a ELDBUS_PROXY_EVENT_PROPERTY_LOADED
 * to know when properties finish to load.
  }
function eldbus_proxy_properties_monitor(proxy:PEldbus_Proxy; enable:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Get a property.
 *
 * @param proxy The proxy object on which to do the query.
 * @param name The property name to get.
 * @param cb The callback to be called when receiving an answer.
 * @param data Data to be passed to the callback.
 * @return Eldbus_Pending object corresponding to the message sent.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_proxy_property_get(proxy:PEldbus_Proxy; name:Pchar; cb:TEldbus_Message_Cb; data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Set a property.
 *
 * @param proxy The proxy object on which to do the query.
 * @param name The property name to get.
 * @param sig
 * @param value The value to set.
 * @param cb The callback to be called when receiving an answer.
 * @param data Data to be passed to the callback.
 * @return Eldbus_Pending object corresponding to the message sent.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_proxy_property_set(proxy:PEldbus_Proxy; name:Pchar; sig:Pchar; value:pointer; cb:TEldbus_Message_Cb; 
           data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Set a property with a Eina_Value.
 *
 * @param proxy The proxy object on which to do the query.
 * @param name The property name to get.
 * @param sig
 * @param value The value to set.
 * @param cb The callback to be called when receiving an answer.
 * @param data Data to be passed to the callback.
 * @return Eldbus_Pending object corresponding to the message sent.
 *
 * @since 1.17
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_proxy_property_value_set(proxy:PEldbus_Proxy; name:Pchar; sig:Pchar; value:PEina_Value; cb:TEldbus_Message_Cb; 
           data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Get all properties.
 *
 * @param proxy The proxy object on which to do the query.
 * @param cb The callback to be called when receiving an answer.
 * @param data Data to be passed to the callback.
 * @return Eldbus_Pending object corresponding to the message sent.
  }
(* Const before type ignored *)
function eldbus_proxy_property_get_all(proxy:PEldbus_Proxy; cb:TEldbus_Message_Cb; data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Register a callback on "PropertiesChanged" signal.
 *
 * @param proxy The proxy object on which to register the callback.
 * @param cb The callback to be called when receiving the signal.
 * @param data Data to be passed to the callback.
 * @return Eldbus_Signal_Handler object representing a listener for "PropertiesChanged" signal.
  }
(* Const before type ignored *)
function eldbus_proxy_properties_changed_callback_add(proxy:PEldbus_Proxy; cb:TEldbus_Signal_Cb; data:pointer):PEldbus_Signal_Handler;cdecl;external;
{*
 * Return the cached value of property.
 *
 * This only work if you have enable eldbus_proxy_properties_monitor or
 * if you have call eldbus_proxy_event_callback_add of type
 * ELDBUS_PROXY_EVENT_PROPERTY_CHANGED and the property you want had changed.
 *
 * @param proxy The proxy object on which to do the query.
 * @param name The property name to get.
 * @return Cached value of property.
  }
(* Const before type ignored *)
function eldbus_proxy_property_local_get(proxy:PEldbus_Proxy; name:Pchar):PEina_Value;cdecl;external;
{*
 * Get all cached properties.
 *
 * This only work if you have enable eldbus_proxy_properties_monitor or
 * if you have call eldbus_proxy_event_callback_add of type
 * ELDBUS_PROXY_EVENT_PROPERTY_CHANGED.
 *
 * @param proxy The proxy object on which to do the query.
 * @return A Eina_Hash with all cached properties
  }
(* Const before type ignored *)
function eldbus_proxy_property_local_get_all(proxy:PEldbus_Proxy):PEina_Hash;cdecl;external;
{*
 * @
  }
{*
 * @defgroup Eldbus_FDO_ObjectManager org.freedesktop.DBus.ObjectManager *
 * @
  }
{*
 * Call the method "GetManagedObjects" on the eldbus object.
 *
 * @param obj A Eldbus object.
 * @param cb The callback to call when receiving an answer.
 * @param data The data to pass to the callback.
 *
 * @return A Eldbus_Pending object corresponding to the message sent.
  }
(* Const before type ignored *)
function eldbus_object_managed_objects_get(obj:PEldbus_Object; cb:TEldbus_Message_Cb; data:pointer):PEldbus_Pending;cdecl;external;
{*
 * Register a callback on "InterfacesAdded" signal.
 *
 * @param obj The Eldbus object on which to register the callback.
 * @param cb The callback to be called when receiving the signal.
 * @param cb_data Data to be passed to the callback.
 * @return Eldbus_Signal_Handler object representing a listener for "InterfacesAdded" signal.
  }
(* Const before type ignored *)
function eldbus_object_manager_interfaces_added(obj:PEldbus_Object; cb:TEldbus_Signal_Cb; cb_data:pointer):PEldbus_Signal_Handler;cdecl;external;
{*
 * Register a callback on "InterfacesRemoved" signal.
 *
 * @param obj The Eldbus object on which to register the callback.
 * @param cb The callback to be called when receiving the signal.
 * @param cb_data Data to be passed to the callback.
 * @return Eldbus_Signal_Handler object representing a listener for "InterfacesRemoved" signal.
  }
(* Const before type ignored *)
function eldbus_object_manager_interfaces_removed(obj:PEldbus_Object; cb:TEldbus_Signal_Cb; cb_data:pointer):PEldbus_Signal_Handler;cdecl;external;
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation


end.
