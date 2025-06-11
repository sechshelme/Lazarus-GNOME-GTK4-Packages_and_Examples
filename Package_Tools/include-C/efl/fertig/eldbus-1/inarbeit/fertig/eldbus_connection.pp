
unit eldbus_connection;
interface

{
  Automatically converted by H2Pas 1.0.0 from eldbus_connection.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eldbus_connection.h
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
PEldbus_Connection  = ^Eldbus_Connection;
PEldbus_Connection_Event_Type  = ^Eldbus_Connection_Event_Type;
PEldbus_Connection_Type  = ^Eldbus_Connection_Type;
PEldbus_Message  = ^Eldbus_Message;
PEldbus_Pending  = ^Eldbus_Pending;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELDBUS_CONNECTION_H}

const
  ELDBUS_CONNECTION_H = 1;  
{*
 * @defgroup Eldbus_Connection Connection
 * @ingroup Eldbus
 *
 * @
  }
{*
 * @typedef Eldbus_Connection_Type
 * Enum of several Eldbus connection types.
  }
{*< sentinel, not a real type  }
{*< sentinel, not a real type  }
type
  PEldbus_Connection_Type = ^TEldbus_Connection_Type;
  TEldbus_Connection_Type =  Longint;
  Const
    ELDBUS_CONNECTION_TYPE_UNKNOWN = 0;
    ELDBUS_CONNECTION_TYPE_SESSION = 1;
    ELDBUS_CONNECTION_TYPE_SYSTEM = 2;
    ELDBUS_CONNECTION_TYPE_STARTER = 3;
    ELDBUS_CONNECTION_TYPE_ADDRESS = 4;
    ELDBUS_CONNECTION_TYPE_LAST = 5;
;
{*< Infinite timeout definition  }

{ was #define dname def_expr }
function ELDBUS_TIMEOUT_INFINITE : longint;  

{*
 * Establish a connection to bus and integrate it with the ecore main
 * loop. If a connection of given type was already created before, its
 * reference counter is incremented and the connection is returned.
 *
 * @param type type of connection e.g ELDBUS_CONNECTION_TYPE_SESSION,
 * ELDBUS_CONNECTION_TYPE_SYSTEM or ELDBUS_CONNECTION_TYPE_STARTER
 *
 * @return connection with bus
  }
function eldbus_connection_get(_type:TEldbus_Connection_Type):PEldbus_Connection;cdecl;external;
{*
 * Always create and establish a new connection to bus and integrate it with
 * the ecore main loop. Differently from eldbus_connection_get(), this function
 * guarantees to create a new connection to the D-Bus daemon and the connection
 * is not shared by any means.
 *
 * @param type type of connection e.g ELDBUS_CONNECTION_TYPE_SESSION,
 * ELDBUS_CONNECTION_TYPE_SYSTEM or ELDBUS_CONNECTION_TYPE_STARTER
 *
 * @return connection with bus
  }
function eldbus_private_connection_get(_type:TEldbus_Connection_Type):PEldbus_Connection;cdecl;external;
{*
 * Establish a connection to bus and integrate it with the ecore main
 * loop. If a connection of given type was already created before, its
 * reference counter is incremented and the connection is returned.
 *
 * @param address the address which will be passed to dbus_connection_open()
 *
 * @return connection with bus
  }
(* Const before type ignored *)
function eldbus_address_connection_get(address:Pchar):PEldbus_Connection;cdecl;external;
{*
 * Always create and establish a new connection to bus and integrate it with
 * the ecore main loop. Differently from eldbus_connection_get(), this function
 * guarantees to create a new connection to the D-Bus daemon and the connection
 * is not shared by any means.
 *
 * @param address the address which will be passed to dbus_connection_open_private()
 *
 * @return connection with bus
  }
(* Const before type ignored *)
function eldbus_private_address_connection_get(address:Pchar):PEldbus_Connection;cdecl;external;
{*
 * @brief Increment connection reference count.
 *
 * @param conn The given Eldbus_Connection object to reference.
 * @return The Eldbus_Connection object given as parameter.
  }
function eldbus_connection_ref(conn:PEldbus_Connection):PEldbus_Connection;cdecl;external;
{*
 * @brief Decrement connection reference count.
 *
 * If reference count reaches 0, the connection to bus will be dropped and all
 * its children will be invalidated.
 *
 * @param conn The given Eldbus_Connection object to unreference.
  }
procedure eldbus_connection_unref(conn:PEldbus_Connection);cdecl;external;
{*
 * @brief Add a callback function to be called when connection is freed
 *
 * @param conn The connection object to add the callback to.
 * @param cb The callback to be called when the connection is free.
 * @param data The data passed to the callback.
  }
(* Const before type ignored *)
procedure eldbus_connection_free_cb_add(conn:PEldbus_Connection; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
{*
 * @brief Remove callback registered in eldbus_connection_free_cb_add().
 *
 * @param conn The connection object to delete the callback from.
 * @param cb The callback that was called when the connection was free.
 * @param data The data that was passed to the callback.
  }
(* Const before type ignored *)
procedure eldbus_connection_free_cb_del(conn:PEldbus_Connection; cb:TEldbus_Free_Cb; data:pointer);cdecl;external;
{*
 * @brief Set an attached data pointer to an object with a given string key.
 *
 * @param conn The connection object to store data to
 * @param key to identify data
 * @param data data that will be stored
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure eldbus_connection_data_set(conn:PEldbus_Connection; key:Pchar; data:pointer);cdecl;external;
{*
 * @brief Get data stored in connection.
 *
 * @param conn connection where data is stored
 * @param key key that identifies data
 *
 * @return pointer to data if found otherwise NULL
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eldbus_connection_data_get(conn:PEldbus_Connection; key:Pchar):pointer;cdecl;external;
{*
 * @brief Del data stored in connection.
 *
 * @param conn connection where data is stored
 * @param key that identifies data
 *
 * @return pointer to data if found otherwise NULL
  }
(* Const before type ignored *)
function eldbus_connection_data_del(conn:PEldbus_Connection; key:Pchar):pointer;cdecl;external;
{*
 * @typedef Eldbus_Connection_Event_Type
 * Enum of several Eldbus connection events.
  }
{*< sentinel, not a real event type  }
type
  PEldbus_Connection_Event_Type = ^TEldbus_Connection_Event_Type;
  TEldbus_Connection_Event_Type =  Longint;
  Const
    ELDBUS_CONNECTION_EVENT_DEL = 0;
    ELDBUS_CONNECTION_EVENT_DISCONNECTED = 1;
    ELDBUS_CONNECTION_EVENT_LAST = 2;
;
{*
 * @typedef Eldbus_Connection_Event_Cb
 *
 * Callback called when we receive an event.
  }
type

  TEldbus_Connection_Event_Cb = procedure (data:pointer; conn:PEldbus_Connection; event_info:pointer);cdecl;
{*
 * @brief Add a callback function to be called when an event occurs of the
 * type passed.
 *
 * @param conn The connection object to add the callback to.
 * @param type The type of event that will trigger the callback.
 * @param cb The callback to be called when the event is triggered.
 * @param cb_data The data passed to the callback.
  }
(* Const before type ignored *)

procedure eldbus_connection_event_callback_add(conn:PEldbus_Connection; _type:TEldbus_Connection_Event_Type; cb:TEldbus_Connection_Event_Cb; cb_data:pointer);cdecl;external;
{*
 * @brief Remove callback registered in eldbus_connection_event_callback_add().
 *
 * @param conn The connection object to delete the callback from.
 * @param type The type of event that was triggered the callback.
 * @param cb The callback that was called when the event was triggered.
 * @param cb_data The data that was passed to the callback.
  }
(* Const before type ignored *)
procedure eldbus_connection_event_callback_del(conn:PEldbus_Connection; _type:TEldbus_Connection_Event_Type; cb:TEldbus_Connection_Event_Cb; cb_data:pointer);cdecl;external;
{*
 * @brief Send a message.
 *
 * @param conn the connection where the message will be sent
 * @param msg message that will be sent
 * @param cb if msg is a method call a callback should be passed
 * to be executed when a response arrives
 * @param cb_data data passed to callback
 * @param timeout timeout in milliseconds, -1 to use default internal value or
 * ELDBUS_TIMEOUT_INFINITE for no timeout
 * @return A Eldbus_Pending struct.
  }
(* Const before type ignored *)
function eldbus_connection_send(conn:PEldbus_Connection; msg:PEldbus_Message; cb:TEldbus_Message_Cb; cb_data:pointer; timeout:Tdouble):PEldbus_Pending;cdecl;external;
{*
 * @brief Gets unique name assigned by the message bus.
 *
 * @param conn connection object to get unique name from.
 *
 * @return pointer to unique name string or NULL or error. Returned value
 * remains valid until connection is free.
  }
(* Const before type ignored *)
function eldbus_connection_unique_name_get(conn:PEldbus_Connection):Pchar;cdecl;external;
{*
 * @
  }
{$endif}

implementation

{ was #define dname def_expr }
function ELDBUS_TIMEOUT_INFINITE : longint;
  begin
    ELDBUS_TIMEOUT_INFINITE:=longint($7fffffff);
  end;


end.
