
unit logging;
interface

{
  Automatically converted by H2Pas 1.0.0 from logging.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    logging.h
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
PFILE  = ^FILE;
Prist_log_level  = ^rist_log_level;
Prist_logging_settings  = ^rist_logging_settings;
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
{$ifndef RIST_LOGGING_H}
{$define RIST_LOGGING_H}
{$include "headers.h"}
{$include "common.h"}
{$include <stdio.h>}
{ C++ extern C conditionnal removed }
type
  Trist_log_level =  Longint;
  Const
    RIST_LOG_DISABLE = -(1);
    RIST_LOG_ERROR = 3;
    RIST_LOG_WARN = 4;
    RIST_LOG_NOTICE = 5;
    RIST_LOG_INFO = 6;
    RIST_LOG_DEBUG = 7;
    RIST_LOG_SIMULATE = 100;

{*
 * The recommended way to use the logging settings is to stack/heap alloc
 * and initialize via LOGGING_SETTINGS_INITIALIZER, and set it's members.
 *
 * Then call rist_logging_set_global to have the settings copied in for the
 * global log settings (used by udpsocket_ functions).
 *
 * When logging is initialized with either user_data, an udp socket or
 * filestream it's important to call rist_logging_unset_global if those
 * resources are going to be freed, to prevent a use after free, or on exit
 * when using UDP logging to prevent fd's leaking.
 * }
{/<minimum log level }
{*
	 * @brief Log callback function
	 * When set this function is called by the libRIST library whenever a
	 * log message is available. NULL to disable log callback.
	 *
	 * The log callback function can be called from multiple threads, so it
	 * needs to be thread-safe.
	 *
	 * @param arg, user data
	 * @param level log level
	 * @param msg log message
	  }
(* Const before type ignored *)
{/< user data passed to log callback function }
{/< socket to which log messages are written via send call }
{/< FILE to which log messages are written via fputs call }
type
  Prist_logging_settings = ^Trist_logging_settings;
  Trist_logging_settings = record
      log_level : Trist_log_level;
      log_cb : function (arg:pointer; para2:Trist_log_level; msg:Pchar):longint;cdecl;
      log_cb_arg : pointer;
      log_socket : longint;
      log_stream : PFILE;
    end;

{ public interfaces in logging.c  }
(* Const before type ignored *)

procedure rist_log(logging_settings:Prist_logging_settings; level:Trist_log_level; format:Pchar; args:array of const);cdecl;external;
procedure rist_log(logging_settings:Prist_logging_settings; level:Trist_log_level; format:Pchar);cdecl;external;
{*
 * @brief populates and creates logging settings struct with log settings
 *
 * This also sets the global logging settings if they were not set before.
 *
 * @param logging_settings if pointed to pointer is NULL struct will be allocated, otherwise pointed to struct will have it's values updated by given values, closing and opening sockets as needed.
 * @param log_level minimum log level to report
 * @param log_cb log callback , NULL to disable
 * @param cb_args user data passed to log callback function, NULL when unused
 * @param address destination address for UDP log messages, NULL when unused
 * @param logfp log file to write to, NULL when unused
 * }
(* Const before type ignored *)
function rist_logging_set(logging_settings:PPrist_logging_settings; log_level:Trist_log_level; log_cb:function (arg:pointer; para2:Trist_log_level; msg:Pchar):longint; cb_arg:pointer; address:Pchar; 
           logfp:PFILE):longint;cdecl;external;
{*
 * @brief Set global log settings
 * Set the global log settings that are used by the udpsocket_ functions
 * @param logging_settings struct containing log settings from which log settings will be copied from
 * @return 0 for success
 * }
function rist_logging_set_global(logging_settings:Prist_logging_settings):longint;cdecl;external;
{*
 * @brief Unset global log settings
 *
 * This will unset the global log settings, closing any dupped socket as needed.
 * }
procedure rist_logging_unset_global;cdecl;external;
{*
 * @brief Free the rist_logging_settings structure memory allocation
 *
 * @return 0 on success or non-zero on error.
  }
{xxxxxxxxRIST_DEPRECATED  }
(* Const before type ignored *)
function rist_logging_settings_free(logging_settings:PPrist_logging_settings):longint;cdecl;external;
function rist_logging_settings_free2(logging_settings:PPrist_logging_settings):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
