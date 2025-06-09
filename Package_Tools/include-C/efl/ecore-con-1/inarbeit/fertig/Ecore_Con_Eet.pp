
unit Ecore_Con_Eet;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Con_Eet.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Con_Eet.h
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
PEcore_Con_Client  = ^Ecore_Con_Client;
PEcore_Con_Eet  = ^Ecore_Con_Eet;
PEcore_Con_Reply  = ^Ecore_Con_Reply;
PEcore_Con_Server  = ^Ecore_Con_Server;
PEet_Data_Descriptor  = ^Eet_Data_Descriptor;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_CON_EET}
{$define _ECORE_CON_EET}
{$include <Eet.h>}
{$include <Ecore.h>}
{$include <Ecore_Con.h>}
{$include <ecore_con_api.h>}
{*
 * @defgroup Ecore_Con_Eet_Group Eet connection functions
 * @ingroup Ecore_Con_Group
 *
 * The Ecore Connection Eet library (@c Ecore_Con_Eet) adds @c Eet data
 * serialization features to Ecore Connection objects. Its main aim is to
 * provide a way to send @c Eet data streams to another program through sockets
 * using @c Ecore_Con objects.
 *
 * @
  }
{ C++ extern C conditionnal removed }
type
  PEcore_Con_Eet = ^TEcore_Con_Eet;
  TEcore_Con_Eet = TEo;
{$ifndef _ECORE_CON_EET_BASE_EO_TYPES}
{$define _ECORE_CON_EET_BASE_EO_TYPES}
type
{$endif}
{*
 * @typedef Ecore_Con_Eet_Data_Cb
 * @brief Called when an Ecore_Con_Eet object receives data.
  }
(* Const before type ignored *)
type

  TEcore_Con_Eet_Data_Cb = procedure (data:pointer; reply:PEcore_Con_Reply; protocol_name:Pchar; value:pointer);cdecl;
{*
 * @typedef Ecore_Con_Eet_Raw_Data_Cb
 * @brief Called when an Ecore_Con_Eet object receives raw data.
  }
(* Const before type ignored *)
(* Const before type ignored *)

  TEcore_Con_Eet_Raw_Data_Cb = procedure (data:pointer; reply:PEcore_Con_Reply; protocol_name:Pchar; section:Pchar; value:pointer; 
                length:Tsize_t);cdecl;
{*
 * @typedef Ecore_Con_Eet_Client_Cb
 * @brief Called when a client connects to the server.
  }

  TEcore_Con_Eet_Client_Cb = function (data:pointer; reply:PEcore_Con_Reply; conn:PEcore_Con_Client):TEina_Bool;cdecl;
{*
 * @typedef Ecore_Con_Eet_Server_Cb
 * @brief Called when the server has accepted the connection of the client.
  }

  TEcore_Con_Eet_Server_Cb = function (data:pointer; reply:PEcore_Con_Reply; conn:PEcore_Con_Server):TEina_Bool;cdecl;
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "Ecore_Con_Eet_Legacy.h"}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{$include "Ecore_Con_Eet_Eo.h"}
{$endif}
{*
 * @brief Creates an Ecore_Con_Eet server.
 *
 * @param server    An existing Ecore_Con_Server that have been previously
 *                  created by the server program with @ref
 *                  ecore_con_server_add.
 *
 * This object gets deleted automatically when the parent Ecore_Con_Server is
 * deleted.
 *
 * @return A new Ecore_Con_Eet server.
  }

function ecore_con_eet_server_new(server:PEcore_Con_Server):PEcore_Con_Eet;cdecl;external;
{*
 * @brief Creates an Ecore_Con_Eet client.
 *
 * @param server    An existing Ecore_Con_Server that have been previously
 *                  returned by a call to @ref ecore_con_server_connect in the
 *                  client program.
 *
 * This object gets deleted automatically when the parent Ecore_Con_Server is
 * deleted.
 *
 * @return A new Ecore_Con_Eet client.
  }
function ecore_con_eet_client_new(server:PEcore_Con_Server):PEcore_Con_Eet;cdecl;external;
{*
 * @brief Frees an existing Ecore_Con_Eet object.
 *
 * @param server    An existing Ecore_Con_Eet object that have been previously
 *                  allocated by a @ref ecore_con_eet_server_new or @ref
 *                  ecore_con_eet_client_new.
 *
  }
procedure ecore_con_eet_server_free(server:PEcore_Con_Eet);cdecl;external;
{*
 * @brief Registers an @c Eet data descriptor on a Ecore_Con_Eet object.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param name      The name of the Eet stream to connect.
 * @param edd       A Eet data descriptor that describes the data organization
 *                  in the Eet stream.
 *
  }
(* Const before type ignored *)
procedure ecore_con_eet_register(ece:PEcore_Con_Eet; name:Pchar; edd:PEet_Data_Descriptor);cdecl;external;
{*
 * @brief Registers a data callback on a Ecore_Con_Eet object.
 * When the Ecore_Con_Eet object is deleted, this automatically gets removed.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param name      The name of the Eet stream to connect.
 * @param func      The function to call as a callback.
 * @param data      The data to pass to the callback.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_con_eet_data_callback_add(ece:PEcore_Con_Eet; name:Pchar; func:TEcore_Con_Eet_Data_Cb; data:pointer);cdecl;external;
{*
 * @brief Removes a data callback on a Ecore_Con_Eet object.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param name      The name of the Eet stream to remove callback on.
 *
  }
(* Const before type ignored *)
procedure ecore_con_eet_data_callback_del(ece:PEcore_Con_Eet; name:Pchar);cdecl;external;
{*
 * @brief Registers a raw data callback on a Ecore_Con_Eet object.
 * When the Ecore_Con_Eet object is deleted, this automatically gets removed.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param name      The name of the raw Eet stream to connect.
 * @param func      The function to call as a callback.
 * @param data      The data to pass to the callback.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_con_eet_raw_data_callback_add(ece:PEcore_Con_Eet; name:Pchar; func:TEcore_Con_Eet_Raw_Data_Cb; data:pointer);cdecl;external;
{*
 * @brief Removes a raw data callback on a Ecore_Con_Eet object.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param name      The name of the raw Eet stream to remove callback on.
 *
  }
(* Const before type ignored *)
procedure ecore_con_eet_raw_data_callback_del(ece:PEcore_Con_Eet; name:Pchar);cdecl;external;
{*
 * @brief Registers a client connect callback on a Ecore_Con_Eet object.
 * @brief This callback can be registered on the server program to know when a
 * client connects.
 * When the Ecore_Con_Eet object is deleted, this automatically gets removed.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param func      The function to call as a callback.
 * @param data      The data to pass to the callback.
  }
(* Const before type ignored *)
procedure ecore_con_eet_client_connect_callback_add(ece:PEcore_Con_Eet; func:TEcore_Con_Eet_Client_Cb; data:pointer);cdecl;external;
{*
 * @brief Removes a client connect callback on a Ecore_Con_Eet object.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param func      The callback to remove.
 * @param data      The data passed to this function at the callback registration.
  }
(* Const before type ignored *)
procedure ecore_con_eet_client_connect_callback_del(ece:PEcore_Con_Eet; func:TEcore_Con_Eet_Client_Cb; data:pointer);cdecl;external;
{*
 * @brief Registers a client disconnect callback on a Ecore_Con_Eet object.
 * @brief This callback can be registered on the server program to know when a
 * client disconnects.
 * When the Ecore_Con_Eet object is deleted, this automatically gets removed.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param func      The function to call as a callback.
 * @param data      The data to pass to the callback.
  }
(* Const before type ignored *)
procedure ecore_con_eet_client_disconnect_callback_add(ece:PEcore_Con_Eet; func:TEcore_Con_Eet_Client_Cb; data:pointer);cdecl;external;
{*
 * @brief Removes a client disconnect callback on a Ecore_Con_Eet object.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param func      The callback to remove.
 * @param data      The data passed to this function at the callback registration.
  }
(* Const before type ignored *)
procedure ecore_con_eet_client_disconnect_callback_del(ece:PEcore_Con_Eet; func:TEcore_Con_Eet_Client_Cb; data:pointer);cdecl;external;
{*
 * @brief Registers a server connect callback on a Ecore_Con_Eet object.
 * @brief This callback can be registered on the client program to be called.
 * when it has been connected to the server.
 * When the Ecore_Con_Eet object is deleted, this automatically gets removed.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param func      The function to call as a callback.
 * @param data      The data to pass to the callback.
  }
(* Const before type ignored *)
procedure ecore_con_eet_server_connect_callback_add(ece:PEcore_Con_Eet; func:TEcore_Con_Eet_Server_Cb; data:pointer);cdecl;external;
{*
 * @brief Removes a server connect callback on a Ecore_Con_Eet object.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param func      The callback to remove.
 * @param data      The data passed to this function at the callback registration.
  }
(* Const before type ignored *)
procedure ecore_con_eet_server_connect_callback_del(ece:PEcore_Con_Eet; func:TEcore_Con_Eet_Server_Cb; data:pointer);cdecl;external;
{*
 * @brief Registers a server disconnect callback on a Ecore_Con_Eet object.
 * @brief This callback can be registered on the client program to be called
 * when it has been disconnected from the server.
 * When the Ecore_Con_Eet object is deleted, this automatically gets removed.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param func      The function to call as a callback.
 * @param data      The data to pass to the callback.
  }
(* Const before type ignored *)
procedure ecore_con_eet_server_disconnect_callback_add(ece:PEcore_Con_Eet; func:TEcore_Con_Eet_Server_Cb; data:pointer);cdecl;external;
{*
 * @brief Removes a server disconnect callback on a Ecore_Con_Eet object.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param func      The callback to remove.
 * @param data      The data passed to this function at the callback registration.
  }
(* Const before type ignored *)
procedure ecore_con_eet_server_disconnect_callback_del(ece:PEcore_Con_Eet; func:TEcore_Con_Eet_Server_Cb; data:pointer);cdecl;external;
{*
 * @brief Attaches data to an Ecore_Con_Eet object.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @param data      The data to attach to the Ecore_Con_Eet object.
  }
(* Const before type ignored *)
procedure ecore_con_eet_data_set(ece:PEcore_Con_Eet; data:pointer);cdecl;external;
{*
 * @brief Gets the data attached to an Ecore_Con_Eet object.
 *
 * @param ece       An Ecore_Con_Eet object.
 * @return The data attached to the Ecore_Con_Eet object.
  }
(* Const before type ignored *)
function ecore_con_eet_data_get(ece:PEcore_Con_Eet):pointer;cdecl;external;
{*
 * @brief Gets the Ecore_Con_Eet object corresponding to the Ecore_Con_Reply object.
 *
 * @param reply       An Ecore_Con_Reply object.
 * @return The corresponding Ecore_Con_Eet object.
  }
function ecore_con_eet_reply(reply:PEcore_Con_Reply):PEcore_Con_Eet;cdecl;external;
{*
 * @brief Sends some data using a protocol type.
 *
 * @param reply         An Ecore_Con_Reply object.
 * @param protocol_name The protocol type to use.
 * @param value         The data to send.
  }
(* Const before type ignored *)
procedure ecore_con_eet_send(reply:PEcore_Con_Reply; protocol_name:Pchar; value:pointer);cdecl;external;
{*
 * @brief Sends some raw data using a protocol type.
 *
 * @param reply         An Ecore_Con_Reply object.
 * @param protocol_name The protocol type to use.
 * @param section       The section to add to the protocol.
 * @param value         The data to send.
 * @param length        The data length.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure ecore_con_eet_raw_send(reply:PEcore_Con_Reply; protocol_name:Pchar; section:Pchar; value:pointer; length:dword);cdecl;external;
{*
 * @
  }
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
