
unit eldbus_object;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_object.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_object.h
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
PEina_Value  = ^Eina_Value;
PEldbus_Connection  = ^Eldbus_Connection;
PEldbus_Message  = ^Eldbus_Message;
PEldbus_Object  = ^Eldbus_Object;
PEldbus_Object_Event_Interface_Added  = ^Eldbus_Object_Event_Interface_Added;
PEldbus_Object_Event_Interface_Removed  = ^Eldbus_Object_Event_Interface_Removed;
PEldbus_Object_Event_Property_Changed  = ^Eldbus_Object_Event_Property_Changed;
PEldbus_Object_Event_Property_Removed  = ^Eldbus_Object_Event_Property_Removed;
PEldbus_Object_Event_Type  = ^Eldbus_Object_Event_Type;
PEldbus_Pending  = ^Eldbus_Pending;
PEldbus_Proxy  = ^Eldbus_Proxy;
PEldbus_Signal_Handler  = ^Eldbus_Signal_Handler;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELDBUS_OBJECT_H}

const
  ELDBUS_OBJECT_H = 1;  
{*
 * @defgroup Eldbus_Object_Mapper Object Mapper
 * @ingroup Eldbus
 *
 * @
  }
{*
 * @brief Get an object of the given bus and path.
 *
 * @param conn connection where object belongs
 * @param bus name of bus or unique-id of who listens for calls of this object
 * @param path object path of this object
 * @return The corresponding Eldbus_Object.
  }
(* Const before type ignored *)
(* Const before type ignored *)

function eldbus_object_get(conn:PEldbus_Connection; bus:Pchar; path:Pchar):PEldbus_Object;cdecl;external;
{*
 * @brief Increase object reference.
 *
 * @param obj An Eldbus_Object.
 * @return The same Eldbus_Object with an increased refcount.
  }
function eldbus_object_ref(obj:PEldbus_Object):PEldbus_Object;cdecl;external;
{*
 * @brief Decrease object reference.
 * If reference == 0 object will be freed and all its children.
 *
 * @param obj An Eldbus_Object.
  }
procedure eldbus_object_unref(obj:PEldbus_Object);cdecl;external;
{*
 * @brief Add a callback function to be called when object will be freed.
 *
 * @param obj object that you want to monitor
 * @param cb callback that will be executed
 * @param data passed to callback
  }
(* Const before type ignored *)
procedure eldbus_object_free_cb_add(obj:PEldbus_Object; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
{*
 * @brief Remove callback registered in eldbus_object_free_cb_add().
 *
 * @param obj Object monitored.
 * @param cb Callback that was registered.
 * @param data Data that was passed to callback.
  }
(* Const before type ignored *)
procedure eldbus_object_free_cb_del(obj:PEldbus_Object; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
{*
 * @typedef Eldbus_Object_Event_Type
 *
 * An enumeration containing several Eldbus_Object event types.
  }
{*< a parent path must have a ObjectManager interface  }
{*< a parent path must have a ObjectManager interface  }
{*< a property has changes  }
{*< a property was removed  }
{*< sentinel, not a real event type  }
type
  PEldbus_Object_Event_Type = ^TEldbus_Object_Event_Type;
  TEldbus_Object_Event_Type =  Longint;
  Const
    ELDBUS_OBJECT_EVENT_IFACE_ADDED = 0;
    ELDBUS_OBJECT_EVENT_IFACE_REMOVED = 1;
    ELDBUS_OBJECT_EVENT_PROPERTY_CHANGED = 2;
    ELDBUS_OBJECT_EVENT_PROPERTY_REMOVED = 3;
    ELDBUS_OBJECT_EVENT_DEL = 4;
    ELDBUS_OBJECT_EVENT_LAST = 5;
;
{*
 * @typedef Eldbus_Object_Event_Interface_Added
 *
 * Structure used with the ELDBUS_OBJECT_EVENT_IFACE_ADDED event.
  }
(* Const before type ignored *)
{*< The interface name  }
{*< The proxy object  }
type
  PEldbus_Object_Event_Interface_Added = ^TEldbus_Object_Event_Interface_Added;
  TEldbus_Object_Event_Interface_Added = record
      interface : Pchar;
      proxy : PEldbus_Proxy;
    end;
{*
 * @typedef Eldbus_Object_Event_Interface_Removed
 *
 * Structure used with the ELDBUS_OBJECT_EVENT_IFACE_REMOVED event.
  }
(* Const before type ignored *)
{*< The interface name  }

  PEldbus_Object_Event_Interface_Removed = ^TEldbus_Object_Event_Interface_Removed;
  TEldbus_Object_Event_Interface_Removed = record
      interface : Pchar;
    end;
{*
 * @typedef Eldbus_Object_Event_Property_Changed
 *
 * Structure used with the ELDBUS_OBJECT_EVENT_PROPERTY_CHANGED event.
  }
(* Const before type ignored *)
{*< The interface name  }
{*< The proxy object  }
(* Const before type ignored *)
{*< The name of the property  }
(* Const before type ignored *)
{*< The value of the property  }

  PEldbus_Object_Event_Property_Changed = ^TEldbus_Object_Event_Property_Changed;
  TEldbus_Object_Event_Property_Changed = record
      interface : Pchar;
      proxy : PEldbus_Proxy;
      name : Pchar;
      value : PEina_Value;
    end;
{*
 * @typedef Eldbus_Object_Event_Property_Removed
 *
 * Structure used with the ELDBUS_OBJECT_EVENT_PROPERTY_REMOVED event.
  }
(* Const before type ignored *)
{*< The interface name  }
{*< The proxy object  }
(* Const before type ignored *)
{*< The name of the property  }

  PEldbus_Object_Event_Property_Removed = ^TEldbus_Object_Event_Property_Removed;
  TEldbus_Object_Event_Property_Removed = record
      interface : Pchar;
      proxy : PEldbus_Proxy;
      name : Pchar;
    end;
{*
 * @typedef Eldbus_Object_Event_Cb
 *
 * Callback that will be called when an Eldbus_Object event happens.
 *
 * @param data Context data.
 * @param obj The Eldbus_Object.
 * @param event_info Information about the event that triggered the callback.
  }

  TEldbus_Object_Event_Cb = procedure (data:pointer; obj:PEldbus_Object; event_info:pointer);cdecl;
{*
 * @brief Add a callback function to be called when an event of the specified
 * type occurs.
 *
 * @param obj The Eldbus_Object on which to register a callback.
 * @param type The type of the event.
 * @param cb The callback to call.
 * @param cb_data The data to pass to the callback.
  }
(* Const before type ignored *)

procedure eldbus_object_event_callback_add(obj:PEldbus_Object; _type:TEldbus_Object_Event_Type; cb:TEldbus_Object_Event_Cb; cb_data:pointer);cdecl;external;
{*
 * @brief Remove callback registered in eldbus_object_event_callback_add().
 *
 * @param obj The Eldbus_Object.
 * @param type The type of the event.
 * @param cb The callback to call.
 * @param cb_data The data to pass to the callback.
  }
(* Const before type ignored *)
procedure eldbus_object_event_callback_del(obj:PEldbus_Object; _type:TEldbus_Object_Event_Type; cb:TEldbus_Object_Event_Cb; cb_data:pointer);cdecl;external;
{*
 * Get the Eldbus_Connection object associated with a Eldbus_Object.
 *
 * @param obj The Eldbus_Object.
 * @return The corresponding Eldbus_Connection object.
  }
(* Const before type ignored *)
function eldbus_object_connection_get(obj:PEldbus_Object):PEldbus_Connection;cdecl;external;
{*
 * Get the name associated with a Eldbus_Object.
 *
 * @param obj The Eldbus_Object.
 * @return A string corresponding to the Eldbus_Object name.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_object_bus_name_get(obj:PEldbus_Object):Pchar;cdecl;external;
{*
 * Get the path associated with a Eldbus_Object.
 *
 * @param obj The Eldbus_Object.
 * @return A string corresponding to the Eldbus_Object path.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_object_path_get(obj:PEldbus_Object):Pchar;cdecl;external;
{*
 * @brief Send a message.
 *
 * @param obj the msg will be sent in connection to this object
 * @param msg message that will be sent
 * @param cb if msg is a method call a callback should be passed
 * to be executed when a response arrives
 * @param cb_data data passed to callback
 * @param timeout timeout in milliseconds, -1 to default internal value or
 * ELDBUS_TIMEOUT_INFINITE for no timeout
 * @return A Eldbus_Pending object.
  }
(* Const before type ignored *)
function eldbus_object_send(obj:PEldbus_Object; msg:PEldbus_Message; cb:TEldbus_Message_Cb; cb_data:pointer; timeout:Tdouble):PEldbus_Pending;cdecl;external;
{*
 * @brief Add a signal handler.
 *
 * @param obj where the signal is emitted
 * @param interface of the signal
 * @param member name of the signal
 * @param cb callback that will be called when this signal is received
 * @param cb_data data that will be passed to callback
 * @return A listener to the desired signal.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_object_signal_handler_add(obj:PEldbus_Object; interface:Pchar; member:Pchar; cb:TEldbus_Signal_Cb; cb_data:pointer):PEldbus_Signal_Handler;cdecl;external;
{*
 * @brief Call a dbus method on the Eldbus_Object.
 *
 * @param obj The Eldbus_Object on which to call the method.
 * @param interface Interface name.
 * @param member Name of the method to be called.
 *
 * @return a new Eldbus_Message, free with eldbus_message_unref()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_object_method_call_new(obj:PEldbus_Object; interface:Pchar; member:Pchar):PEldbus_Message;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
