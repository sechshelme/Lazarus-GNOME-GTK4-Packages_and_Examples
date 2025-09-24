
unit Http;
interface

{
  Automatically converted by H2Pas 1.0.0 from Http.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Http.h
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
PsfHttp  = ^sfHttp;
PsfHttpMethod  = ^sfHttpMethod;
PsfHttpRequest  = ^sfHttpRequest;
PsfHttpResponse  = ^sfHttpResponse;
PsfHttpStatus  = ^sfHttpStatus;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{////////////////////////////////////////////////////////// }
{ }
{ SFML - Simple and Fast Multimedia Library }
{ Copyright (C) 2007-2023 Laurent Gomila (laurent@sfml-dev.org) }
{ }
{ This software is provided 'as-is', without any express or implied warranty. }
{ In no event will the authors be held liable for any damages arising from the use of this software. }
{ }
{ Permission is granted to anyone to use this software for any purpose, }
{ including commercial applications, and to alter it and redistribute it freely, }
{ subject to the following restrictions: }
{ }
{ 1. The origin of this software must not be misrepresented; }
{    you must not claim that you wrote the original software. }
{    If you use this software in a product, an acknowledgment }
{    in the product documentation would be appreciated but is not required. }
{ }
{ 2. Altered source versions must be plainly marked as such, }
{    and must not be misrepresented as being the original software. }
{ }
{ 3. This notice may not be removed or altered from any source distribution. }
{ }
{////////////////////////////////////////////////////////// }
{$ifndef SFML_HTTP_H}
{$define SFML_HTTP_H}
{////////////////////////////////////////////////////////// }
{ Headers }
{////////////////////////////////////////////////////////// }
{$include <SFML/Network/Export.h>}
{$include <SFML/Network/Types.h>}
{$include <SFML/System/Time.h>}
{////////////////////////////////////////////////////////// }
{/ \brief Enumerate the available HTTP methods for a request }
{/ }
{////////////////////////////////////////////////////////// }
{/< Request in get mode, standard method to retrieve a page }
{/< Request in post mode, usually to send data to a page }
{/< Request a page's header only }
{/< Request in put mode, useful for a REST API }
{/< Request in delete mode, useful for a REST API }
type
  PsfHttpMethod = ^TsfHttpMethod;
  TsfHttpMethod =  Longint;
  Const
    sfHttpGet = 0;
    sfHttpPost = 1;
    sfHttpHead = 2;
    sfHttpPut = 3;
    sfHttpDelete = 4;
;
{////////////////////////////////////////////////////////// }
{/ \brief Enumerate all the valid status codes for a response }
{/ }
{////////////////////////////////////////////////////////// }
{ 2xx: success }
{/< Most common code returned when operation was successful }
{/< The resource has successfully been created }
{/< The request has been accepted, but will be processed later by the server }
{/< Sent when the server didn't send any data in return }
{/< The server informs the client that it should clear the view (form) that caused the request to be sent }
{/< The server has sent a part of the resource, as a response to a partial GET request }
{ 3xx: redirection }
{/< The requested page can be accessed from several locations }
{/< The requested page has permanently moved to a new location }
{/< The requested page has temporarily moved to a new location }
{/< For conditional requests, means the requested page hasn't changed and doesn't need to be refreshed }
{ 4xx: client error }
{/< The server couldn't understand the request (syntax error) }
{/< The requested page needs an authentication to be accessed }
{/< The requested page cannot be accessed at all, even with authentication }
{/< The requested page doesn't exist }
{/< The server can't satisfy the partial GET request (with a "Range" header field) }
{ 5xx: server error }
{/< The server encountered an unexpected error }
{/< The server doesn't implement a requested feature }
{/< The gateway server has received an error from the source server }
{/< The server is temporarily unavailable (overloaded, in maintenance, ...) }
{/< The gateway server couldn't receive a response from the source server }
{/< The server doesn't support the requested HTTP version }
{ 10xx: SFML custom codes }
{/< Response is not a valid HTTP one }
{/< Connection with server failed }
type
  PsfHttpStatus = ^TsfHttpStatus;
  TsfHttpStatus =  Longint;
  Const
    sfHttpOk = 200;
    sfHttpCreated = 201;
    sfHttpAccepted = 202;
    sfHttpNoContent = 204;
    sfHttpResetContent = 205;
    sfHttpPartialContent = 206;
    sfHttpMultipleChoices = 300;
    sfHttpMovedPermanently = 301;
    sfHttpMovedTemporarily = 302;
    sfHttpNotModified = 304;
    sfHttpBadRequest = 400;
    sfHttpUnauthorized = 401;
    sfHttpForbidden = 403;
    sfHttpNotFound = 404;
    sfHttpRangeNotSatisfiable = 407;
    sfHttpInternalServerError = 500;
    sfHttpNotImplemented = 501;
    sfHttpBadGateway = 502;
    sfHttpServiceNotAvailable = 503;
    sfHttpGatewayTimeout = 504;
    sfHttpVersionNotSupported = 505;
    sfHttpInvalidResponse = 1000;
    sfHttpConnectionFailed = 1001;
;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new HTTP request }
{/ }
{/ \return A new sfHttpRequest object }
{/ }
{////////////////////////////////////////////////////////// }

function sfHttpRequest_create:PsfHttpRequest;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a HTTP request }
{/ }
{/ \param httpRequest HTTP request to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfHttpRequest_destroy(httpRequest:PsfHttpRequest);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the value of a header field of a HTTP request }
{/ }
{/ The field is created if it doesn't exist. The name of }
{/ the field is case insensitive. }
{/ By default, a request doesn't contain any field (but the }
{/ mandatory fields are added later by the HTTP client when }
{/ sending the request). }
{/ }
{/ \param httpRequest HTTP request }
{/ \param field       Name of the field to set }
{/ \param value       Value of the field }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
procedure sfHttpRequest_setField(httpRequest:PsfHttpRequest; field:Pchar; value:Pchar);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set a HTTP request method }
{/ }
{/ See the sfHttpMethod enumeration for a complete list of all }
{/ the availale methods. }
{/ The method is sfHttpGet by default. }
{/ }
{/ \param httpRequest HTTP request }
{/ \param method      Method to use for the request }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfHttpRequest_setMethod(httpRequest:PsfHttpRequest; method:TsfHttpMethod);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set a HTTP request URI }
{/ }
{/ The URI is the resource (usually a web page or a file) }
{/ that you want to get or post. }
{/ The URI is "/" (the root page) by default. }
{/ }
{/ \param httpRequest HTTP request }
{/ \param uri         URI to request, relative to the host }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfHttpRequest_setUri(httpRequest:PsfHttpRequest; uri:Pchar);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the HTTP version of a HTTP request }
{/ }
{/ The HTTP version is 1.0 by default. }
{/ }
{/ \param httpRequest HTTP request }
{/ \param major       Major HTTP version number }
{/ \param minor       Minor HTTP version number }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfHttpRequest_setHttpVersion(httpRequest:PsfHttpRequest; major:dword; minor:dword);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the body of a HTTP request }
{/ }
{/ The body of a request is optional and only makes sense }
{/ for POST requests. It is ignored for all other methods. }
{/ The body is empty by default. }
{/ }
{/ \param httpRequest HTTP request }
{/ \param body        Content of the body }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfHttpRequest_setBody(httpRequest:PsfHttpRequest; body:Pchar);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a HTTP response }
{/ }
{/ \param httpResponse HTTP response to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfHttpResponse_destroy(httpResponse:PsfHttpResponse);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the value of a field of a HTTP response }
{/ }
{/ If the field \a field is not found in the response header, }
{/ the empty string is returned. This function uses }
{/ case-insensitive comparisons. }
{/ }
{/ \param httpResponse HTTP response }
{/ \param field        Name of the field to get }
{/ }
{/ \return Value of the field, or empty string if not found }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function sfHttpResponse_getField(httpResponse:PsfHttpResponse; field:Pchar):Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the status code of a HTTP reponse }
{/ }
{/ The status code should be the first thing to be checked }
{/ after receiving a response, it defines whether it is a }
{/ success, a failure or anything else (see the sfHttpStatus }
{/ enumeration). }
{/ }
{/ \param httpResponse HTTP response }
{/ }
{/ \return Status code of the response }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfHttpResponse_getStatus(httpResponse:PsfHttpResponse):TsfHttpStatus;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the major HTTP version number of a HTTP response }
{/ }
{/ \param httpResponse HTTP response }
{/ }
{/ \return Major HTTP version number }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfHttpResponse_getMajorVersion(httpResponse:PsfHttpResponse):dword;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the minor HTTP version number of a HTTP response }
{/ }
{/ \param httpResponse HTTP response }
{/ }
{/ \return Minor HTTP version number }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfHttpResponse_getMinorVersion(httpResponse:PsfHttpResponse):dword;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Get the body of a HTTP response }
{/ }
{/ The body of a response may contain: }
{/ \li the requested page (for GET requests) }
{/ \li a response from the server (for POST requests) }
{/ \li nothing (for HEAD requests) }
{/ \li an error message (in case of an error) }
{/ }
{/ \param httpResponse HTTP response }
{/ }
{/ \return The response body }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
(* Const before type ignored *)
function sfHttpResponse_getBody(httpResponse:PsfHttpResponse):Pchar;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Create a new Http object }
{/ }
{/ \return A new sfHttp object }
{/ }
{////////////////////////////////////////////////////////// }
function sfHttp_create:PsfHttp;cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Destroy a Http object }
{/ }
{/ \param http Http object to destroy }
{/ }
{////////////////////////////////////////////////////////// }
procedure sfHttp_destroy(http:PsfHttp);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Set the target host of a HTTP object }
{/ }
{/ This function just stores the host address and port, it }
{/ doesn't actually connect to it until you send a request. }
{/ If the port is 0, it means that the HTTP client will use }
{/ the right port according to the protocol used }
{/ (80 for HTTP, 443 for HTTPS). You should }
{/ leave it like this unless you really need a port other }
{/ than the standard one, or use an unknown protocol. }
{/ }
{/ \param http Http object }
{/ \param host Web server to connect to }
{/ \param port Port to use for connection }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
procedure sfHttp_setHost(http:PsfHttp; host:Pchar; port:word);cdecl;external;
{////////////////////////////////////////////////////////// }
{/ \brief Send a HTTP request and return the server's response. }
{/ }
{/ You must have a valid host before sending a request (see sfHttp_setHost). }
{/ Any missing mandatory header field in the request will be added }
{/ with an appropriate value. }
{/ Warning: this function waits for the server's response and may }
{/ not return instantly; use a thread if you don't want to block your }
{/ application, or use a timeout to limit the time to wait. A value }
{/ of 0 means that the client will use the system defaut timeout }
{/ (which is usually pretty long). }
{/ }
{/ \param http    Http object }
{/ \param request Request to send }
{/ \param timeout Maximum time to wait }
{/ }
{/ \return Server's response }
{/ }
{////////////////////////////////////////////////////////// }
(* Const before type ignored *)
function sfHttp_sendRequest(http:PsfHttp; request:PsfHttpRequest; timeout:TsfTime):PsfHttpResponse;cdecl;external;
{$endif}
{ SFML_HTTP_H }

implementation


end.
