
unit eina_debug;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_debug.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_debug.h
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
PEina_Debug_Opcode  = ^Eina_Debug_Opcode;
PEina_Debug_Packet_Header  = ^Eina_Debug_Packet_Header;
PEina_Debug_Session  = ^Eina_Debug_Session;
PEina_Debug_Timer  = ^Eina_Debug_Timer;
Plongint  = ^longint;
Pxxx  = ^xxx;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ EINA - EFL data type library
 * Copyright (C) 2015 Carsten Haitzler
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library;
 * if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef EINA_DEBUG_H_}
{$define EINA_DEBUG_H_}
{$include "eina_config.h"}
{$include "eina_list.h"}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @page eina_debug_main Eina Debug
 *
 * @date 2015 (created)
  }
{*
 * @addtogroup Eina_Debug
 * @
  }
{*< Invalid opcode value  }
{*< Opcode used to register other opcodes  }
{*< Opcode used to send greetings to the daemon  }
type
  Txxx =  Longint;
  Const
    EINA_DEBUG_OPCODE_INVALID = -(1);
    EINA_DEBUG_OPCODE_REGISTER = 0;
    EINA_DEBUG_OPCODE_HELLO = 1;

{*
 * @typedef Eina_Debug_Session
 *
 * A handle used to interact with the debug daemon.
 * It contains all the information related to this connection and needed
 * to send/receive/dispatch/...
  }
type
{*
 * @typedef Eina_Debug_Cb
 *
 * A callback invoked when a specific packet is received.
 *
 * @param[in,out] session the session
 * @param[in] srcid the source id
 * @param[in] buffer the packet payload data. It doesn't contain any transport information.
 * @param[in] size the packet payload size
 *
 * @return True on success, false if the connection seems compromised.
  }

  TEina_Debug_Cb = function (session:PEina_Debug_Session; srcid:longint; buffer:pointer; size:longint):TEina_Bool;cdecl;
{*
 * @typedef Eina_Debug_Opcode_Status_Cb
 *
 * When the opcodes ids are retrieved, this callback is invoked with a true
 * status.
 * When a disconnection to the daemon is happening, the opcodes ids are set
 * as invalid and this callback is invoked with a false status. The upper
 * layer should not try to send more requests until a new connection is
 * established.
 *
 * @param[in,out] data data pointer given when registering opcodes
 * @param[in] status EINA_TRUE if opcodes have been received from the daemon, EINA_FALSE otherwise.
  }

  TEina_Debug_Opcode_Status_Cb = procedure (data:pointer; status:TEina_Bool);cdecl;
{*
 * @typedef Eina_Debug_Dispatch_Cb
 *
 * Dispatcher callback prototype used to override the default dispatcher of a
 * session.
 *
 * @param[in,out] session the session
 * @param[in] buffer the packet received
 *
 * The given packet is the entire data received, including the header.
 *
 * @return The return result of the invoked callback.
  }

  TEina_Debug_Dispatch_Cb = function (session:PEina_Debug_Session; buffer:pointer):TEina_Bool;cdecl;
{*
 * @typedef Eina_Debug_Timer_Cb
 *
 * A callback for a timer
  }

  TEina_Debug_Timer_Cb = function (para1:pointer):TEina_Bool;cdecl;
{*
 * @typedef Eina_Debug_Timer
  }
{*
 * @struct Eina_Debug_Packet_Header
 *
 * Header of Eina Debug packet
  }
{*< Packet size including this element  }
{*<
    * During sending, it corresponds to the id of the destination. During reception, it is the id of the source
    * The daemon is in charge of swapping the id before forwarding the packet to the destination.
     }
{*< Opcode of the packet  }

  PEina_Debug_Packet_Header = ^TEina_Debug_Packet_Header;
  TEina_Debug_Packet_Header = record
      size : dword;
      cid : longint;
      opcode : longint;
    end;
{*
 * Helper for creating global opcodes arrays.
 * The problem is on windows where you can't declare a static array with
 * external symbols in it, because the addresses are only known at runtime.
  }
{*
 * @struct Eina_Debug_Opcode
 *
 * Structure to describe information for an opcode. It is used to register new
 * opcodes.
  }
{*< Opcode string. On registration, the daemon uses it to calculate an opcode id  }
{*< A pointer to store the opcode id received from the daemon  }
{*< Callback to call when a packet corresponding to the opcode is received  }

  PEina_Debug_Opcode = ^TEina_Debug_Opcode;
  TEina_Debug_Opcode = record
      opcode_name : Pchar;
      opcode_id : Plongint;
      cb : TEina_Debug_Cb;
    end;
{*
 * @brief Disable debugging
 *
 * Useful for applications that don't want debugging. The debug daemon is one
 * of them.
 * Need to be invoked before eina_init. Otherwise it won't have any effect.
  }

procedure eina_debug_disable;cdecl;external;
{*
 * @brief Connect to the local daemon
 *
 * @param[in] is_master true if the application is a debugger. EINA_FALSE otherwise.
 *
 * @return The session on success or NULL otherwise.
  }
function eina_debug_local_connect(is_master:TEina_Bool):PEina_Debug_Session;cdecl;external;
{*
 * @brief Connect to remote daemon
 *
 * This function connects to localhost:port.
 *
 * @param[in] port the port to connect to
 *
 * @return The session on success or NULL otherwise.
  }
function eina_debug_remote_connect(port:longint):PEina_Debug_Session;cdecl;external;
{*
 * @brief Terminate the session
 *
 * @param[in,out] session the session to terminate
  }
procedure eina_debug_session_terminate(session:PEina_Debug_Session);cdecl;external;
{*
 * @brief Override the dispatcher of a specific session
 *
 * For example, it can be used to forward a packet to the main thread and to
 * use the default dispatcher there.
 * All the packets received in this session will use this dispatcher.
 *
 * @param[in,out] session the session
 * @param[in] disp_cb the new dispatcher for the given session
  }
procedure eina_debug_session_dispatch_override(session:PEina_Debug_Session; disp_cb:TEina_Debug_Dispatch_Cb);cdecl;external;
{*
 * @brief Get the dispatcher of a specific session
 *
 * @param[in,out] session the session
 *
 * @return The session dispatcher.
  }
function eina_debug_session_dispatch_get(session:PEina_Debug_Session):TEina_Debug_Dispatch_Cb;cdecl;external;
{*
 * @brief Dispatch a given packet according to its header.
 *
 * This function checks the header contained in the packet and invokes
 * the correct callback according to the opcode.
 * This is the default dispatcher.
 *
 * @param[in,out] session the session
 * @param[in] buffer the packet
 *
 * @return True on success, false if the connection seems compromised.
  }
function eina_debug_dispatch(session:PEina_Debug_Session; buffer:pointer):TEina_Bool;cdecl;external;
{*
 * @brief Set data to a session
 *
 * @param[in,out] session the session
 * @param[in] data the data to set
  }
procedure eina_debug_session_data_set(session:PEina_Debug_Session; data:pointer);cdecl;external;
{*
 * @brief Get the data attached to a session
 *
 * @param[in,out] session the session
 *
 * @return The data of the session.
  }
function eina_debug_session_data_get(session:PEina_Debug_Session):pointer;cdecl;external;
{*
 * @brief Register opcodes to a session
 *
 * This function registers opcodes for the given session. If the session is not
 * connected, the request is not sent to the daemon. Otherwise, the request for
 * the opcodes ids is sent.
 * On the reception from the daemon, status_cb function is invoked to inform
 * the requester that the opcodes can now be used.
 *
 * @param[in,out] session the session
 * @param[in] ops the operations to register
 * @param[in] status_cb a function to call when the opcodes are received
 * @param[in] status_data the data to give to status_cb
  }
(* Const before type ignored *)
procedure eina_debug_opcodes_register(session:PEina_Debug_Session; ops:PEina_Debug_Opcode; status_cb:TEina_Debug_Opcode_Status_Cb; status_data:pointer);cdecl;external;
{*
 * @brief Send a packet to the given destination
 *
 * The packet will be treated by the debug thread itself.
 *
 * @param[in,out] session the session to use to send the packet
 * @param[in] dest_id the destination id to send the packet to
 * @param[in] op the opcode for this packet
 * @param[in] data payload to send
 * @param[in] size payload size
 *
 * @return The number of sent bytes.
  }
function eina_debug_session_send(session:PEina_Debug_Session; dest_id:longint; op:longint; data:pointer; size:longint):longint;cdecl;external;
{*
 * @brief Add a timer
 *
 * @param[in] timeout_ms timeout in ms
 * @param[in] cb callback to call when the timeout is reached
 * @param[in] data user data
 *
 * @return The timer handle, NULL on error.
  }
function eina_debug_timer_add(timeout_ms:dword; cb:TEina_Debug_Timer_Cb; data:pointer):PEina_Debug_Timer;cdecl;external;
{*
 * @brief Delete a timer
 *
 * @param[in,out] timer the timer to delete
 *
 * If the timer reaches the end and has not be renewed, trying to delete it will lead to a crash, as
 * it has already been deleted internally.
  }
procedure eina_debug_timer_del(timer:PEina_Debug_Timer);cdecl;external;
{*
 * @brief Reset the eina debug system after forking
 *
 * Call this any time the application forks
 * @since 1.21
 *  }
procedure eina_debug_fork_reset;cdecl;external;
{*
 * @
  }
{$endif}
{$endif}

implementation


end.
