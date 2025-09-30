
unit soup_status;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_status.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_status.h
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
PSoupHTTPVersion  = ^SoupHTTPVersion;
PSoupStatus  = ^SoupStatus;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * soup-status.h: HTTP status code and status class definitions
 *
 * Copyright (C) 2001-2003, Ximian, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-version.h"}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SOUP_STATUS_IS_INFORMATIONAL(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SOUP_STATUS_IS_SUCCESSFUL(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SOUP_STATUS_IS_REDIRECTION(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SOUP_STATUS_IS_CLIENT_ERROR(status : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SOUP_STATUS_IS_SERVER_ERROR(status : longint) : longint;

{ WebDAV  }
{ WebDAV  }
{ RFC 2068  }
{ (reserved)  }
{ (reserved)  }
{ HTTP/2  }
{ WebDAV  }
{ WebDAV  }
{ WebDAV  }
{ WebDAV search  }
{ RFC 2774  }
type
  PSoupStatus = ^TSoupStatus;
  TSoupStatus =  Longint;
  Const
    SOUP_STATUS_NONE = 0;
    SOUP_STATUS_CONTINUE = 100;
    SOUP_STATUS_SWITCHING_PROTOCOLS = 101;
    SOUP_STATUS_PROCESSING = 102;
    SOUP_STATUS_OK = 200;
    SOUP_STATUS_CREATED = 201;
    SOUP_STATUS_ACCEPTED = 202;
    SOUP_STATUS_NON_AUTHORITATIVE = 203;
    SOUP_STATUS_NO_CONTENT = 204;
    SOUP_STATUS_RESET_CONTENT = 205;
    SOUP_STATUS_PARTIAL_CONTENT = 206;
    SOUP_STATUS_MULTI_STATUS = 207;
    SOUP_STATUS_MULTIPLE_CHOICES = 300;
    SOUP_STATUS_MOVED_PERMANENTLY = 301;
    SOUP_STATUS_FOUND = 302;
    SOUP_STATUS_MOVED_TEMPORARILY = 302;
    SOUP_STATUS_SEE_OTHER = 303;
    SOUP_STATUS_NOT_MODIFIED = 304;
    SOUP_STATUS_USE_PROXY = 305;
    SOUP_STATUS_NOT_APPEARING_IN_THIS_PROTOCOL = 306;
    SOUP_STATUS_TEMPORARY_REDIRECT = 307;
    SOUP_STATUS_PERMANENT_REDIRECT = 308;
    SOUP_STATUS_BAD_REQUEST = 400;
    SOUP_STATUS_UNAUTHORIZED = 401;
    SOUP_STATUS_PAYMENT_REQUIRED = 402;
    SOUP_STATUS_FORBIDDEN = 403;
    SOUP_STATUS_NOT_FOUND = 404;
    SOUP_STATUS_METHOD_NOT_ALLOWED = 405;
    SOUP_STATUS_NOT_ACCEPTABLE = 406;
    SOUP_STATUS_PROXY_AUTHENTICATION_REQUIRED = 407;
    SOUP_STATUS_PROXY_UNAUTHORIZED = SOUP_STATUS_PROXY_AUTHENTICATION_REQUIRED;
    SOUP_STATUS_REQUEST_TIMEOUT = 408;
    SOUP_STATUS_CONFLICT = 409;
    SOUP_STATUS_GONE = 410;
    SOUP_STATUS_LENGTH_REQUIRED = 411;
    SOUP_STATUS_PRECONDITION_FAILED = 412;
    SOUP_STATUS_REQUEST_ENTITY_TOO_LARGE = 413;
    SOUP_STATUS_REQUEST_URI_TOO_LONG = 414;
    SOUP_STATUS_UNSUPPORTED_MEDIA_TYPE = 415;
    SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE = 416;
    SOUP_STATUS_INVALID_RANGE = SOUP_STATUS_REQUESTED_RANGE_NOT_SATISFIABLE;
    SOUP_STATUS_EXPECTATION_FAILED = 417;
    SOUP_STATUS_MISDIRECTED_REQUEST = 421;
    SOUP_STATUS_UNPROCESSABLE_ENTITY = 422;
    SOUP_STATUS_LOCKED = 423;
    SOUP_STATUS_FAILED_DEPENDENCY = 424;
    SOUP_STATUS_INTERNAL_SERVER_ERROR = 500;
    SOUP_STATUS_NOT_IMPLEMENTED = 501;
    SOUP_STATUS_BAD_GATEWAY = 502;
    SOUP_STATUS_SERVICE_UNAVAILABLE = 503;
    SOUP_STATUS_GATEWAY_TIMEOUT = 504;
    SOUP_STATUS_HTTP_VERSION_NOT_SUPPORTED = 505;
    SOUP_STATUS_INSUFFICIENT_STORAGE = 507;
    SOUP_STATUS_NOT_EXTENDED = 510;
;
{< nick=http-1-0 > }
{< nick=http-1-1 > }
{< nick=http-2-0 > }
type
  PSoupHTTPVersion = ^TSoupHTTPVersion;
  TSoupHTTPVersion =  Longint;
  Const
    SOUP_HTTP_1_0 = 0;
    SOUP_HTTP_1_1 = 1;
    SOUP_HTTP_2_0 = 2;
;
(* Const before type ignored *)

function soup_status_get_phrase(status_code:Tguint):Pchar;cdecl;external;

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SOUP_STATUS_IS_INFORMATIONAL(status : longint) : longint;
begin
  SOUP_STATUS_IS_INFORMATIONAL:=(status>=(100 and (@(status))))<200;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SOUP_STATUS_IS_SUCCESSFUL(status : longint) : longint;
begin
  SOUP_STATUS_IS_SUCCESSFUL:=(status>=(200 and (@(status))))<300;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SOUP_STATUS_IS_REDIRECTION(status : longint) : longint;
begin
  SOUP_STATUS_IS_REDIRECTION:=(status>=(300 and (@(status))))<400;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SOUP_STATUS_IS_CLIENT_ERROR(status : longint) : longint;
begin
  SOUP_STATUS_IS_CLIENT_ERROR:=(status>=(400 and (@(status))))<500;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SOUP_STATUS_IS_SERVER_ERROR(status : longint) : longint;
begin
  SOUP_STATUS_IS_SERVER_ERROR:=(status>=(500 and (@(status))))<600;
end;


end.
