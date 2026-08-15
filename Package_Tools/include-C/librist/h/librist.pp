
unit librist;
interface

{
  Automatically converted by H2Pas 1.0.0 from librist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    librist
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
Prist_ctx  = ^rist_ctx;
Prist_udp_config  = ^rist_udp_config;
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
{$ifndef LIBRIST_H}
{$define LIBRIST_H}
{$include "common.h"}
{$include "receiver.h"}
{$include "sender.h"}
{$include "peer.h"}
{$include "stats.h"}
{$include "logging.h"}
{$include "librist_srp.h"}
{$include "opt.h"}
{$include "oob.h"}
{$include "headers.h"}
{ C++ extern C conditionnal removed }
{*
 * @brief Set RIST max jitter
 *
 * Set max jitter
 *
 * @param ctx RIST context
 * @param t max jitter in ms
 * @return 0 on success, -1 on error
  }

function rist_jitter_max_set(ctx:Prist_ctx; t:longint):longint;cdecl;external;
{*
 * @brief Starts the RIST sender or receiver
 *
 * After all the peers have been added, this function triggers
 * the RIST sender/receiver to start
 *
 * @param ctx RIST context
 * @return 0 on success, -1 in case of error.
  }
function rist_start(ctx:Prist_ctx):longint;cdecl;external;
{*
 * @brief Destroy RIST sender/receiver
 *
 * Destroys the RIST instance
 *
 * @param ctx RIST context
 * @return 0 on success, -1 on error
  }
function rist_destroy(ctx:Prist_ctx):longint;cdecl;external;
{*
 * @brief Parses udp url for udp config data (multicast interface, stream-id, prefix, etc)
 *
 * Use this API to parse a generic URL string and turn it into a meaningful udp_config structure
 *
 * @param url a pointer to a url to be parsed, i.e. udp://myserver.net:1234?miface=eth0&stream-id=1968
 * @param[out] udp_config a pointer to a the rist_udp_config structure (NULL is allowed).
 * When passing NULL, the library will allocate a new rist_udp_config structure with the latest
 * default values and it expects the application to free it when it is done using it.
 * @return 0 on success or non-zero on error. The value returned is actually the number
 * of parameters that are valid
  }
{xxxxxxxxRIST_DEPRECATED  }
(* Const before type ignored *)
(* Const before type ignored *)
function rist_parse_udp_address(url:Pchar; peer_config:PPrist_udp_config):longint;cdecl;external;
(* Const before type ignored *)
function rist_parse_udp_address2(url:Pchar; peer_config:PPrist_udp_config):longint;cdecl;external;
{*
 * @brief Free the rist_udp_config structure memory allocation
 *
 * @return 0 on success or non-zero on error.
  }
{xxxxxxxxRIST_DEPRECATED  }
(* Const before type ignored *)
function rist_udp_config_free(udp_config:PPrist_udp_config):longint;cdecl;external;
function rist_udp_config_free2(udp_config:PPrist_udp_config):longint;cdecl;external;
{*
 * @brief Get the version of libRIST
 *
 * @return String representing the version of libRIST
  }
(* Const before type ignored *)
function librist_version:Pchar;cdecl;external;
{*
 * @brief Get the API version of libRIST
  }
(* Const before type ignored *)
function librist_api_version:Pchar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
