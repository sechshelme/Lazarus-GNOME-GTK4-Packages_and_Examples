
unit soup_logger;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_logger.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_logger.h
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
PSoupLogger  = ^SoupLogger;
PSoupLoggerLogLevel  = ^SoupLoggerLogLevel;
PSoupMessage  = ^SoupMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2008 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}

{ was #define dname def_expr }
function SOUP_TYPE_LOGGER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupLogger, soup_logger, SOUP, LOGGER, GObject) }
type
  PSoupLoggerLogLevel = ^TSoupLoggerLogLevel;
  TSoupLoggerLogLevel =  Longint;
  Const
    SOUP_LOGGER_LOG_NONE = 0;
    SOUP_LOGGER_LOG_MINIMAL = 1;
    SOUP_LOGGER_LOG_HEADERS = 2;
    SOUP_LOGGER_LOG_BODY = 3;
;
type

  TSoupLoggerFilter = function (logger:PSoupLogger; msg:PSoupMessage; user_data:Tgpointer):TSoupLoggerLogLevel;cdecl;
(* Const before type ignored *)

  TSoupLoggerPrinter = procedure (logger:PSoupLogger; level:TSoupLoggerLogLevel; direction:char; data:Pchar; user_data:Tgpointer);cdecl;

function soup_logger_new(level:TSoupLoggerLogLevel):PSoupLogger;cdecl;external;
procedure soup_logger_set_request_filter(logger:PSoupLogger; request_filter:TSoupLoggerFilter; filter_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
procedure soup_logger_set_response_filter(logger:PSoupLogger; response_filter:TSoupLoggerFilter; filter_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
procedure soup_logger_set_printer(logger:PSoupLogger; printer:TSoupLoggerPrinter; printer_data:Tgpointer; destroy:TGDestroyNotify);cdecl;external;
procedure soup_logger_set_max_body_size(logger:PSoupLogger; max_body_size:longint);cdecl;external;
function soup_logger_get_max_body_size(logger:PSoupLogger):longint;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_LOGGER : longint; { return type might be wrong }
  begin
    SOUP_TYPE_LOGGER:=soup_logger_get_type;
  end;


end.
