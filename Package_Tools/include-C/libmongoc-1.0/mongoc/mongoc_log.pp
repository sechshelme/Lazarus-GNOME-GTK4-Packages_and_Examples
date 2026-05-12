
unit mongoc_log;
interface

{
  Automatically converted by H2Pas 1.0.0 from mongoc_log.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    mongoc_log.h
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
Pmongoc_log_level_t  = ^mongoc_log_level_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2013 MongoDB, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
  }
{$include "mongoc-prelude.h"}
{$ifndef MONGOC_LOG_H}
{$define MONGOC_LOG_H}
{$include <bson/bson.h>}
{$include "mongoc-macros.h"}
{$ifndef MONGOC_LOG_DOMAIN}

const
  MONGOC_LOG_DOMAIN = 'mongoc';  
{$endif}
type
  Pmongoc_log_level_t = ^Tmongoc_log_level_t;
  Tmongoc_log_level_t =  Longint;
  Const
    MONGOC_LOG_LEVEL_ERROR = 0;
    MONGOC_LOG_LEVEL_CRITICAL = 1;
    MONGOC_LOG_LEVEL_WARNING = 2;
    MONGOC_LOG_LEVEL_MESSAGE = 3;
    MONGOC_LOG_LEVEL_INFO = 4;
    MONGOC_LOG_LEVEL_DEBUG = 5;
    MONGOC_LOG_LEVEL_TRACE = 6;
;
{*
 * mongoc_log_func_t:
 * @log_level: The level of the log message.
 * @log_domain: The domain of the log message, such as "client".
 * @message: The message generated.
 * @user_data: User data provided to mongoc_log_set_handler().
 *
 * This function prototype can be used to set a custom log handler for the
 * libmongoc library. This is useful if you would like to show them in a
 * user interface or alternate storage.
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  Tmongoc_log_func_t = procedure (log_level:Tmongoc_log_level_t; log_domain:Pchar; message:Pchar; user_data:pointer);cdecl;
{*
 * mongoc_log_set_handler:
 * @log_func: A function to handle log messages.
 * @user_data: User data for @log_func.
 *
 * Sets the function to be called to handle logging.
  }

procedure mongoc_log_set_handler(log_func:Tmongoc_log_func_t; user_data:pointer);cdecl;external;
{*
 * mongoc_log:
 * @log_level: The log level.
 * @log_domain: The log domain (such as "client").
 * @format: The format string for the log message.
 *
 * Logs a message using the currently configured logger.
 *
 * This method will hold a logging lock to prevent concurrent calls to the
 * logging infrastructure. It is important that your configured log function
 * does not re-enter the logging system or deadlock will occur.
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure mongoc_log(log_level:Tmongoc_log_level_t; log_domain:Pchar; format:Pchar; args:array of const);cdecl;external;
procedure mongoc_log(log_level:Tmongoc_log_level_t; log_domain:Pchar; format:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure mongoc_log_default_handler(log_level:Tmongoc_log_level_t; log_domain:Pchar; message:Pchar; user_data:pointer);cdecl;external;
{*
 * mongoc_log_level_str:
 * @log_level: The log level.
 *
 * Returns: The string representation of log_level
  }
(* Const before type ignored *)
function mongoc_log_level_str(log_level:Tmongoc_log_level_t):Pchar;cdecl;external;
{*
 * mongoc_log_trace_enable:
 *
 * Enables tracing at runtime (if it has been enabled at compile time).
  }
procedure mongoc_log_trace_enable;cdecl;external;
{*
 * mongoc_log_trace_disable:
 *
 * Disables tracing at runtime (if it has been enabled at compile time).
  }
procedure mongoc_log_trace_disable;cdecl;external;
{$endif}
{ MONGOC_LOG_H  }

implementation


end.
