
unit eldbus_proxy;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_proxy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_proxy.h
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
PEldbus_Message  = ^Eldbus_Message;
PEldbus_Object  = ^Eldbus_Object;
PEldbus_Pending  = ^Eldbus_Pending;
PEldbus_Proxy  = ^Eldbus_Proxy;
PEldbus_Proxy_Event_Property_Changed  = ^Eldbus_Proxy_Event_Property_Changed;
PEldbus_Proxy_Event_Property_Loaded  = ^Eldbus_Proxy_Event_Property_Loaded;
PEldbus_Proxy_Event_Property_Removed  = ^Eldbus_Proxy_Event_Property_Removed;
PEldbus_Proxy_Event_Type  = ^Eldbus_Proxy_Event_Type;
PEldbus_Signal_Handler  = ^Eldbus_Signal_Handler;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELDBUS_PROXY_H}

const
  ELDBUS_PROXY_H = 1;  
{*
 * @defgroup Eldbus_Proxy Proxy
 * @ingroup Eldbus
 *
 * @
  }
{*
 * @brief Get a proxy of the following interface name in a Eldbus_Object.
 *
 * @param obj The Eldbus_Object on which to do the query.
 * @param interface The interface name of the proxy.
 * @return The corresponding Eldbus_Proxy object.
  }
(* Const before type ignored *)

function eldbus_proxy_get(obj:PEldbus_Object; interface:Pchar):PEldbus_Proxy;cdecl;external;
{*
 * @brief Increase proxy reference.
 *
 * @param proxy The Eldbus_Proxy on which to increase the refcount.
 * @return The Eldbus_Proxy with an increased refcount.
  }
function eldbus_proxy_ref(proxy:PEldbus_Proxy):PEldbus_Proxy;cdecl;external;
{*
 * @brief Decrease proxy reference.
 * If reference == 0 proxy will be freed and all your children.
 *
 * @param proxy The Eldbus_Proxy on which to decrease the refcount.
  }
procedure eldbus_proxy_unref(proxy:PEldbus_Proxy);cdecl;external;
{*
 * @brief Get the Eldbus_Object associated with a proxy object.
 *
 * @param proxy The Eldbus_Proxy on which to do the query.
 * @return The corresponding Eldbus_Object.
  }
(* Const before type ignored *)
function eldbus_proxy_object_get(proxy:PEldbus_Proxy):PEldbus_Object;cdecl;external;
{*
 * @brief Get the interface name associated with a proxy object.
 *
 * @param proxy The Eldbus_Proxy on which to do the query.
 * @return The string corresponding to the interface name.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_proxy_interface_get(proxy:PEldbus_Proxy):Pchar;cdecl;external;
{*
 * @brief Set data to an Eldbus_Proxy object.
 *
 * @param proxy The Eldbus_Proxy on which to set the data.
 * @param key A string to which the data will be associated.
 * @param data The data to set to the proxy object.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eldbus_proxy_data_set(proxy:PEldbus_Proxy; key:Pchar; data:pointer);cdecl;external;
{*
 * @brief Get data of an Eldbus_Proxy object.
 *
 * @param proxy The Eldbus_Proxy on which to get the data.
 * @param key The string to which the data is associated.
 * @return The data set to the proxy object associated with the provided key.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_proxy_data_get(proxy:PEldbus_Proxy; key:Pchar):pointer;cdecl;external;
{*
 * @brief Delete data of an Eldbus_Proxy object.
 *
 * @param proxy The Eldbus_Proxy on which to delete the data.
 * @param key The string to which the data is associated.
  }
(* Const before type ignored *)
function eldbus_proxy_data_del(proxy:PEldbus_Proxy; key:Pchar):pointer;cdecl;external;
{*
 * @brief Add a callback function to be called when an event of the
 * type passed occurs.
 *
 * @param proxy The Eldbus_Proxy on which to add the callback.
 * @param cb The callback to add.
 * @param data The data to pass to the callback.
  }
(* Const before type ignored *)
procedure eldbus_proxy_free_cb_add(proxy:PEldbus_Proxy; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
{*
 * @brief Remove callback registered in eldbus_proxy_free_cb_add().
 *
 * @param proxy The Eldbus_Proxy on which to delete the callback.
 * @param cb The callback to delete.
 * @param data The data passed to the callback.
  }
(* Const before type ignored *)
procedure eldbus_proxy_free_cb_del(proxy:PEldbus_Proxy; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
{*
 * @brief Constructs a new message to invoke a method on a remote interface.
 *
 * @param proxy The Eldbus_Proxy on which to call the method.
 * @param member The name of the method to invoke.
 * @return An Eldbus_Message object.
  }
(* Const before type ignored *)
function eldbus_proxy_method_call_new(proxy:PEldbus_Proxy; member:Pchar):PEldbus_Message;cdecl;external;
{*
 * @brief Send a message.
 *
 * @param proxy the msg will be send in connection that proxy belongs
 * @param msg message that will be send
 * @param cb if msg is a method call a callback should be passed
 * @param cb_data data passed to callback
 * @param timeout timeout in milliseconds, -1 to default internal value or
 * ELDBUS_TIMEOUT_INFINITE for no timeout
 * @return A Eldbus_Pending object on the sent message.
  }
(* Const before type ignored *)
function eldbus_proxy_send(proxy:PEldbus_Proxy; msg:PEldbus_Message; cb:TEldbus_Message_Cb; cb_data:pointer; timeout:Tdouble):PEldbus_Pending;cdecl;external;
{*
 * @brief Send a message and block while waiting for the reply.
 *
 * @param proxy the msg will be send in connection that proxy belongs
 * @param msg message that will be send
 * @param timeout timeout in milliseconds, -1 to default internal value or
 * ELDBUS_TIMEOUT_INFINITE for no timeout
 *
 * @return The reply message, error message or NULL.
 * The returned Eldbus_Message need to be unref after read.
 * @since 1.13
  }
function eldbus_proxy_send_and_block(proxy:PEldbus_Proxy; msg:PEldbus_Message; timeout:Tdouble):PEldbus_Message;cdecl;external;
{*
 * @brief Call a method in proxy.
 * Send a method call to interface that proxy belong with data.
 *
 * @param proxy
 * @param member method name
 * @param cb if msg is a method call a callback should be passed
 * to be execute when response arrive
 * @param cb_data data passed to callback
 * @param timeout timeout in milliseconds, -1 to default internal value or
 * ELDBUS_TIMEOUT_INFINITE for no timeout
 * @param signature of data that will be send
 * @param ... data value
 * @return A Eldbus_Pending object on the sent message.
 *
 * @note This function only support basic type to complex types use
 * eldbus_message_iter_* functions.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_proxy_call(proxy:PEldbus_Proxy; member:Pchar; cb:TEldbus_Message_Cb; cb_data:pointer; timeout:Tdouble; 
           signature:Pchar; args:array of const):PEldbus_Pending;cdecl;external;
function eldbus_proxy_call(proxy:PEldbus_Proxy; member:Pchar; cb:TEldbus_Message_Cb; cb_data:pointer; timeout:Tdouble; 
           signature:Pchar):PEldbus_Pending;cdecl;external;
{*
 * @brief Call a method in proxy.
 * Send a method call to interface that proxy belong with data.
 *
 * @param proxy
 * @param member method name
 * @param cb callback that will be called when response arrive.
 * @param cb_data data passed to callback
 * @param timeout timeout in milliseconds, -1 to default internal value or
 * ELDBUS_TIMEOUT_INFINITE for no timeout
 * @param signature of data that will be send
 * @param ap va_list of data value
 * @return A Eldbus_Pending object on the sent message.
 *
 * @note This function only support basic type to complex types use
 * eldbus_message_iter_* functions.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_proxy_vcall(proxy:PEldbus_Proxy; member:Pchar; cb:TEldbus_Message_Cb; cb_data:pointer; timeout:Tdouble; 
           signature:Pchar; ap:Tva_list):PEldbus_Pending;cdecl;external;
{*
 * @brief Add a signal handler.
 *
 * @param proxy interface where the signal is emitted
 * @param member name of the signal
 * @param cb callback that will be called when this signal is received
 * @param cb_data data that will be passed to callback
 * @return A listener to the desired signal.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_proxy_signal_handler_add(proxy:PEldbus_Proxy; member:Pchar; cb:TEldbus_Signal_Cb; cb_data:pointer):PEldbus_Signal_Handler;cdecl;external;
{*
 * @typedef Eldbus_Proxy_Event_Type
 *
 * An enumeration containing proxy event types.
  }
{*< a property has changed  }
{*< a property was removed  }
{*< sentinel, not a real event type  }
type
  PEldbus_Proxy_Event_Type = ^TEldbus_Proxy_Event_Type;
  TEldbus_Proxy_Event_Type =  Longint;
  Const
    ELDBUS_PROXY_EVENT_PROPERTY_CHANGED = 0;
    ELDBUS_PROXY_EVENT_PROPERTY_REMOVED = 1;
    ELDBUS_PROXY_EVENT_DEL = 2;
    ELDBUS_PROXY_EVENT_PROPERTY_LOADED = 3;
    ELDBUS_PROXY_EVENT_LAST = 4;
;
{*
 * @typedef Eldbus_Proxy_Event_Property_Changed
 *
 * A structure used when ELDBUS_PROXY_EVENT_PROPERTY_CHANGED event is received.
  }
(* Const before type ignored *)
{*< the name of the property  }
(* Const before type ignored *)
{*< the proxy object  }
(* Const before type ignored *)
{*< the value of the property  }
type
  PEldbus_Proxy_Event_Property_Changed = ^TEldbus_Proxy_Event_Property_Changed;
  TEldbus_Proxy_Event_Property_Changed = record
      name : Pchar;
      proxy : PEldbus_Proxy;
      value : PEina_Value;
    end;
{*
 * @typedef Eldbus_Proxy_Event_Property_Loaded
 *
 * A structure used when ELDBUS_PROXY_EVENT_PROPERTY_LOADED event is received.
  }
(* Const before type ignored *)
{*< the proxy object  }

  PEldbus_Proxy_Event_Property_Loaded = ^TEldbus_Proxy_Event_Property_Loaded;
  TEldbus_Proxy_Event_Property_Loaded = record
      proxy : PEldbus_Proxy;
    end;
{*
 * @typedef Eldbus_Proxy_Event_Property_Removed
 *
 * A structure used when ELDBUS_PROXY_EVENT_PROPERTY_REMOVED event is received.
  }
(* Const before type ignored *)
{*< interface name  }
(* Const before type ignored *)
{*< the proxy object  }
(* Const before type ignored *)
{*< the name of the property  }

  PEldbus_Proxy_Event_Property_Removed = ^TEldbus_Proxy_Event_Property_Removed;
  TEldbus_Proxy_Event_Property_Removed = record
      interface : Pchar;
      proxy : PEldbus_Proxy;
      name : Pchar;
    end;
{*
 * @typedef Eldbus_Proxy_Event_Cb
 *
 * A callback called when an event occurs.
 * @param data The data passed by the caller.
 * @param proxy The Eldbus_Proxy object.
 * @param event_info Information on the event that triggered the callback.
  }

  TEldbus_Proxy_Event_Cb = procedure (data:pointer; proxy:PEldbus_Proxy; event_info:pointer);cdecl;
{*
 * @brief Add a callback function to be called when occurs a event of the
 * type passed.
 *
 * @param proxy The Eldbus_Proxy object.
 * @param type The type of the event to register an callback on.
 * @param cb The callback function to register.
 * @param cb_data The data to pass to the callback.
  }
(* Const before type ignored *)

procedure eldbus_proxy_event_callback_add(proxy:PEldbus_Proxy; _type:TEldbus_Proxy_Event_Type; cb:TEldbus_Proxy_Event_Cb; cb_data:pointer);cdecl;external;
{*
 * @brief Remove callback registered in eldbus_proxy_event_callback_add().
 *
 * @param proxy The Eldbus_Proxy object.
 * @param type The type of the event the callback was registered on.
 * @param cb The callback function to delete.
 * @param cb_data The data passed to the callback.
  }
(* Const before type ignored *)
procedure eldbus_proxy_event_callback_del(proxy:PEldbus_Proxy; _type:TEldbus_Proxy_Event_Type; cb:TEldbus_Proxy_Event_Cb; cb_data:pointer);cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
