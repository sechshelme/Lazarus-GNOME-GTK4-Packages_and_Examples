
unit receiver;
interface

{
  Automatically converted by H2Pas 1.0.0 from receiver.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    receiver.h
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
Prist_ctx  = ^rist_ctx;
Prist_data_block  = ^rist_data_block;
Prist_logging_settings  = ^rist_logging_settings;
Prist_nack_type  = ^rist_nack_type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2020, VideoLAN and librist authors
 * Copyright © 2019-2020 SipRadius LLC
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-2-Clause
  }
{$ifndef LIBRIST_RECEIVER_H}
{$define LIBRIST_RECEIVER_H}
{$include "common.h"}
{$include "logging.h"}
{$include "headers.h"}
{ C++ extern C conditionnal removed }
{ Receiver specific functions, use rist_receiver_create to create a receiver rist_ctx  }
{*
 * Create a RIST receiver instance
 *
 * @param[out] ctx a context representing the receiver instance
 * @param profile RIST profile
 * @param logging_settings Optional struct containing the logging settings.
 * @return 0 on success, -1 on error
  }

function rist_receiver_create(ctx:PPrist_ctx; profile:Trist_profile; logging_settings:Prist_logging_settings):longint;cdecl;external;
type
  Trist_nack_type =  Longint;
  Const
    RIST_NACK_RANGE = 0;
    RIST_NACK_BITMASK = 1;

{*
 * @brief Configure nack type
 *
 * Choose the nack type used by the receiver.
 *
 * @param ctx RIST receiver context
 * @param nack_type 0 for range (default), 1 for bitmask
 * @return 0 on success, -1 on error
  }

function rist_receiver_nack_type_set(ctx:Prist_ctx; nacks_type:Trist_nack_type):longint;cdecl;external;
{*
 * @brief Set output fifo size
 *
 * Set the output fifo size to the desired maximum, can be set to 0 to disable
 * desired size must be a power of 2. When enabled libRIST will output packets
 * into the fifo queue for reading by the calling application.
 * The fifo buffer size can only be set before starting, and defaults to 1024
 *
 * @param ctx RIST receiver context
 * @param desired_size max number of packets to keep in fifo buffer, 0 to disable
 * @return 0 for success
  }
function rist_receiver_set_output_fifo_size(ctx:Prist_ctx; desired_size:Tuint32_t):longint;cdecl;external;
{*
 * @brief Reads rist data
 *
 * Use this API to read data from an internal fifo queue instead of the callback
 *
 * @param ctx RIST receiver context
 * @param[out] reference counted data_blockstructure MUST be freed via rist_receiver_data_block_free
 * @param timeout How long to wait for queue data (ms), 0 for no wait
 * @return num buffers remaining on queue +1 (0 if no buffer returned), -1 on error
  }
{xxxxxxxx RIST_DEPRECATED  }
(* Const before type ignored *)
function rist_receiver_data_read(ctx:Prist_ctx; data_block:PPrist_data_block; timeout:longint):longint;cdecl;external;
function rist_receiver_data_read2(ctx:Prist_ctx; data_block:PPrist_data_block; timeout:longint):longint;cdecl;external;
{*
 * @brief Data callback function
 *
 * Optional calling application provided function for receiving callbacks upon data reception.
 * Can be used to directly process data, or signal the calling application to read within it's own context.
 * Stalling in this function will hinder data-reception of the libRIST library.
 * This function will be called from a per-flow output thread and must be thread-safe.
 *
 * @param arg optional user data set via rist_receiver_data_callback_set
 * @param data_block reference counted data_block structure MUST be freed via rist_receiver_data_block_free
 * @return int, ignored.
  }
(* Const before type ignored *)
type

  Treceiver_data_callback_t = function (arg:pointer; data_block:Prist_data_block):longint;cdecl;

  Treceiver_data_callback2_t = function (arg:pointer; data_block:Prist_data_block):longint;cdecl;
{*
 * @brief Enable data callback channel
 *
 * Call to enable data callback channel.
 *
 * @param ctx RIST receiver context
 * @param data_callback The function that will be called when a data frame is
 * received from a sender.
 * @param arg the extra argument passed to the `data_callback`
 * @return 0 on success, -1 on error
  }
{xxxxxxxRIST_DEPRECATED  }

function rist_receiver_data_callback_set(ctx:Prist_ctx; para2:Treceiver_data_callback_t; arg:pointer):longint;cdecl;external;
function rist_receiver_data_callback_set2(ctx:Prist_ctx; para2:Treceiver_data_callback2_t; arg:pointer):longint;cdecl;external;
{*
 * @brief Free rist data block
 *
 * Must be called whenever a received data block is no longer needed by the calling application.
 *
 * @param block double pointer to rist_data_block, containing pointer will be set to NULL
  }
{xxxxxxxxx RIST_DEPRECATED  }
(* Const before declarator ignored *)
procedure rist_receiver_data_block_free(block:PPrist_data_block);cdecl;external;
procedure rist_receiver_data_block_free2(block:PPrist_data_block);cdecl;external;
{*
 * @brief Set data ready signalling fd
 *
 * Calling applications can provide an fd that will be written to whenever a packet
 * is ready for reading via FIFO read function (rist_receiver_data_read).
 * This allows calling applications to poll an fd (i.e.: in event loops).
 * Whenever a packet is ready for reading, a byte (with undefined value) will
 * be written to the FD. Calling application should make no assumptions
 * whatsoever based on the number of bytes available for reading.
 * It is highly recommended that the fd is setup to operate in non blocking mode.
 * A call with a 0 value fd disables the notify fd functionality. And must be
 * made before a calling application closes the fd.
 * @param ctx RIST receiver context
 * @param file_handle The file descriptor to be written to
 * @return 0 on success, -1 on error
  }
function rist_receiver_data_notify_fd_set(ctx:Prist_ctx; fd:longint):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBRIST_RECEIVER_H  }

implementation


end.
