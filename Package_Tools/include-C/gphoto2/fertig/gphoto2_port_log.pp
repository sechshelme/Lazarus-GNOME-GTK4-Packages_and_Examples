
unit gphoto2_port_log;
interface

{
  Automatically converted by H2Pas 1.0.0 from gphoto2_port_log.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gphoto2_port_log.h
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
Pdword  = ^dword;
PGPLogLevel  = ^GPLogLevel;
PStringFlagItem  = ^StringFlagItem;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* \file gphoto2-port-log.h
 *
 * Copyright 2001 Lutz Mueller <lutz@users.sf.net>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA  02110-1301  USA
  }
{$ifndef LIBGPHOTO2_GPHOTO2_PORT_LOG_H}
{$define LIBGPHOTO2_GPHOTO2_PORT_LOG_H}
{$include <stdarg.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{*
 * \brief Logging level
 * Specifies the logging severity level.
  }
{*< \brief Log message is an error information.  }
{*< \brief Log message is an verbose debug information.  }
{*< \brief Log message is an debug information.  }
{*< \brief Log message is a data hex dump.  }
type
  PGPLogLevel = ^TGPLogLevel;
  TGPLogLevel =  Longint;
  Const
    GP_LOG_ERROR = 0;
    GP_LOG_VERBOSE = 1;
    GP_LOG_DEBUG = 2;
    GP_LOG_DATA = 3;
;
{*
 * GP_LOG_ALL:
 *
 * Used by frontends if they want to be sure their
 * callback function receives all messages. Defined
 * as the highest debug level. Can make frontend code
 * more understandable and extension of log levels
 * easier.
 * }
  GP_LOG_ALL = GP_LOG_DATA;  
{*
 * \brief Logging function hook
 *
 * This is the function frontends can use to receive logging information
 * from the libgphoto2 framework. It is set using gp_log_add_func() and
 * removed using gp_log_remove_func() and will then receive the logging
 * messages of the level specified.
 *
 * \param level the log level of the passed message, as set by the camera driver or libgphoto2
 * \param domain the logging domain as set by the camera driver, or libgphoto2 function
 * \param str the logmessage, without linefeed
 * \param data the caller private data that was passed to gp_log_add_func()
  }
(* Const before type ignored *)
(* Const before type ignored *)
type

  TGPLogFunc = procedure (level:TGPLogLevel; domain:Pchar; str:Pchar; data:pointer);cdecl;
{$ifndef DISABLE_DEBUGGING}

function gp_log_add_func(level:TGPLogLevel; func:TGPLogFunc; data:pointer):longint;cdecl;external;
function gp_log_remove_func(id:longint):longint;cdecl;external;
{ Logging  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure gp_log(level:TGPLogLevel; domain:Pchar; format:Pchar; args:array of const);cdecl;external;
procedure gp_log(level:TGPLogLevel; domain:Pchar; format:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gp_log_with_source_location(level:TGPLogLevel; file:Pchar; line:longint; func:Pchar; format:Pchar; 
            args:array of const);cdecl;external;
procedure gp_log_with_source_location(level:TGPLogLevel; file:Pchar; line:longint; func:Pchar; format:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gp_logv(level:TGPLogLevel; domain:Pchar; format:Pchar; args:Tva_list);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure gp_log_data(domain:Pchar; data:Pchar; size:dword; format:Pchar; args:array of const);cdecl;external;
procedure gp_log_data(domain:Pchar; data:Pchar; size:dword; format:Pchar);cdecl;external;
{$ifdef _GPHOTO2_INTERNAL_CODE}
type
  PStringFlagItem = ^TStringFlagItem;
  TStringFlagItem = record
      str : Pchar;
      flag : dword;
    end;
(* Const before type ignored *)

  Tstring_item_func = procedure (str:Pchar; data:pointer);cdecl;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gpi_enum_to_string(_enum:dword; map:PStringFlagItem):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gpi_string_to_enum(str:Pchar; result:Pdword; map:PStringFlagItem):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure gpi_flags_to_string_list(flags:dword; map:PStringFlagItem; func:Tstring_item_func; data:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gpi_string_or_to_flags(str:Pchar; flags:Pdword; map:PStringFlagItem):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gpi_string_to_flag(str:Pchar; map:PStringFlagItem):dword;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gpi_string_list_to_flags(str:PPchar; map:PStringFlagItem):dword;cdecl;external;
{ Allocates a sufficiently large buffer and interpolates the format
   * string with the proveded va_list args. The returned memory has to
   * be freed by the caller.  }
(* Const before type ignored *)
function gpi_vsnprintf(format:Pchar; args:Tva_list):Pchar;cdecl;external;
{$endif}
{ _GPHOTO2_INTERNAL_CODE  }
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ !defined(LIBGPHOTO2_GPHOTO2_PORT_LOG_H)  }

implementation


end.
