
unit sender;
interface

{
  Automatically converted by H2Pas 1.0.0 from sender.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    sender.h
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
Puint32_t  = ^uint32_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef LIBRIST_SENDER_H}
{$define LIBRIST_SENDER_H}
{$include "common.h"}
{$include "logging.h"}
{$include "headers.h"}
{$include <stdint.h>}
{ C++ extern C conditionnal removed }
{*
 * @brief Helper function used to create valid random 32 bit flow_id.
 *
 * Use this function when you want to generate a valid random flow_id.
 *
 * @return random uint32_t number that complies with the flow_id rules
  }

function rist_flow_id_create:Tuint32_t;cdecl;external;
{*
 * @brief Create Sender
 *
 * Create a RIST sender instance
 *
 * @param[out] ctx a context representing the sender instance
 * @param profile RIST profile
 * @param flow_id Flow ID, use 0 to delegate creation of flow_id to lib
 * @param logging_settings Struct containing logging settings
 * @return 0 on success, -1 in case of error.
  }
function rist_sender_create(ctx:PPrist_ctx; profile:Trist_profile; flow_id:Tuint32_t; logging_settings:Prist_logging_settings):longint;cdecl;external;
{*
 * @brief Enable RIST NULL Packet deletion
 *
 *  Enables deletion of NULL packets, packets are modified on submission to
 *  the libRIST library, so this only affects packets inserted after enabling
 *  NPD.
 * @param ctx RIST sender ctx
 * @return 0 on success, -1 in case of error.
  }
function rist_sender_npd_enable(ctx:Prist_ctx):longint;cdecl;external;
{*
 * @brief Disable RIST NULL Packet deletion
 *
 *  Disables deletion of NULL packets, packets are modified on submission to
 *  the libRIST library, so this only affects packets inserted after enabling
 *  NPD.
 * @param ctx RIST sender ctx
 * @return 0 on success, -1 in case of error.
  }
function rist_sender_npd_disable(ctx:Prist_ctx):longint;cdecl;external;
{*
 * @brief Retrieve the current flow_id value
 *
 * Retrieve the current flow_id value
 *
 * @param ctx RIST sender context
 * @param flow_id pointer to your flow_id variable
 * @return 0 on success, -1 on error
  }
function rist_sender_flow_id_get(ctx:Prist_ctx; flow_id:Puint32_t):longint;cdecl;external;
{*
 * @brief Change the flow_id value
 *
 * Change the flow_id value
 *
 * @param ctx RIST sender context
 * @param flow_id new flow_id
 * @return 0 on success, -1 on error
  }
function rist_sender_flow_id_set(ctx:Prist_ctx; flow_id:Tuint32_t):longint;cdecl;external;
{*
 * @brief Write data into a librist packet.
 *
 * One sender can send write data into a librist packet.
 *
 * @param ctx RIST sender context
 * @param data_block pointer to the rist_data_block structure
 * the ts_ntp will be populated by the lib if a value of 0 is passed
 * @return number of written bytes on success, -1 in case of error.
  }
(* Const before type ignored *)
function rist_sender_data_write(ctx:Prist_ctx; data_block:Prist_data_block):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBRIST_SENDER_H  }

implementation


end.
