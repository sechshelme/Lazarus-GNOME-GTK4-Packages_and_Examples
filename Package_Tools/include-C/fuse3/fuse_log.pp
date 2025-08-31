
unit fuse_log;
interface

{
  Automatically converted by H2Pas 1.0.0 from fuse_log.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    fuse_log.h
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
Pfuse_log_level  = ^fuse_log_level;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
  FUSE: Filesystem in Userspace
  Copyright (C) 2019  Red Hat, Inc.

  This program can be distributed under the terms of the GNU LGPLv2.
  See the file COPYING.LIB.
 }
{$ifndef FUSE_LOG_H_}
{$define FUSE_LOG_H_}
{* @file
 *
 * This file defines the logging interface of FUSE
  }
{$include <stdarg.h>}
{ C++ extern C conditionnal removed }
{*
 * Log severity level
 *
 * These levels correspond to syslog(2) log levels since they are widely used.
  }
type
  Tfuse_log_level =  Longint;
  Const
    FUSE_LOG_EMERG = 0;
    FUSE_LOG_ALERT = 1;
    FUSE_LOG_CRIT = 2;
    FUSE_LOG_ERR = 3;
    FUSE_LOG_WARNING = 4;
    FUSE_LOG_NOTICE = 5;
    FUSE_LOG_INFO = 6;
    FUSE_LOG_DEBUG = 7;

{*
 * Log message handler function.
 *
 * This function must be thread-safe.  It may be called from any libfuse
 * function, including fuse_parse_cmdline() and other functions invoked before
 * a FUSE filesystem is created.
 *
 * Install a custom log message handler function using fuse_set_log_func().
 *
 * @param level log severity level
 * @param fmt sprintf-style format string including newline
 * @param ap format string arguments
  }
(* Const before type ignored *)
type

  Tfuse_log_func_t = procedure (level:Tfuse_log_level; fmt:Pchar; ap:Tva_list);cdecl;
{*
 * Install a custom log handler function.
 *
 * Log messages are emitted by libfuse functions to report errors and debug
 * information.  Messages are printed to stderr by default but this can be
 * overridden by installing a custom log message handler function.
 *
 * The log message handler function is global and affects all FUSE filesystems
 * created within this process.
 *
 * @param func a custom log message handler function or NULL to revert to
 *             the default
  }

procedure fuse_set_log_func(func:Tfuse_log_func_t);cdecl;external;
{*
 * Emit a log message
 *
 * @param level severity level (FUSE_LOG_ERR, FUSE_LOG_DEBUG, etc)
 * @param fmt sprintf-style format string including newline
  }
(* Const before type ignored *)
procedure fuse_log(level:Tfuse_log_level; fmt:Pchar; args:array of const);cdecl;external;
procedure fuse_log(level:Tfuse_log_level; fmt:Pchar);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ FUSE_LOG_H_  }

implementation


end.
