
unit oob;
interface

{
  Automatically converted by H2Pas 1.0.0 from oob.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    oob.h
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
Prist_oob_block  = ^rist_oob_block;
Prist_peer  = ^rist_peer;
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
{$ifndef LIBRIST_OOB_H}
{$define LIBRIST_OOB_H}
{$include "common.h"}
{$include "headers.h"}
{ C++ extern C conditionnal removed }
(* Const before type ignored *)
type
  Prist_oob_block = ^Trist_oob_block;
  Trist_oob_block = record
      peer : Prist_peer;
      payload : pointer;
      payload_len : Tsize_t;
      ts_ntp : Tuint64_t;
    end;

{ OOB Specific functions, send and receive IP traffic inband in RIST Main Profile  }
{*
 * @brief Write data directly to a remote peer.
 *
 * This API is used to transmit out-of-band data to a remote peer
 *
 * @param ctx RIST context
 * @param oob_block a pointer to the struct rist_oob_block
 * @return number of written bytes on success, -1 in case of error.
  }
(* Const before type ignored *)

function rist_oob_write(ctx:Prist_ctx; oob_block:Prist_oob_block):longint;cdecl;external;
{*
 * @brief Reads out-of-band data
 *
 * Use this API to read out-of-band data from an internal fifo queue instead of the callback
 *
 * @param ctx RIST context
 * @param[out] oob_block pointer to the rist_oob_block structure
 * @return 0 on success, -1 in case of error.
  }
(* Const before type ignored *)
function rist_oob_read(ctx:Prist_ctx; oob_block:PPrist_oob_block):longint;cdecl;external;
(* Const before type ignored *)
type

  Toob_callback_func_t = function (arg:pointer; oob_block:Prist_oob_block):longint;cdecl;
{*
 * @brief Enable out-of-band data channel
 *
 * Call after receiver initialization to enable out-of-band data.
 *
 * @param ctx RIST context
 * @param oob_callback A pointer to the function that will be called when out-of-band data
 * comes in (NULL function pointer is valid)
 * @param arg is an the extra argument passed to the `oob_callback`
 * @return 0 on success, -1 on error
  }

function rist_oob_callback_set(ctx:Prist_ctx; callback_func:Toob_callback_func_t; arg:pointer):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBRIST_OOB_H  }

implementation


end.
