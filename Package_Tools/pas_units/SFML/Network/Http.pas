unit Http;

interface

uses
  fp_sfml, Time, NetWork_Types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PsfHttpMethod = ^TsfHttpMethod;
  TsfHttpMethod = longint;

const
  sfHttpGet = 0;
  sfHttpPost = 1;
  sfHttpHead = 2;
  sfHttpPut = 3;
  sfHttpDelete = 4;

type
  PsfHttpStatus = ^TsfHttpStatus;
  TsfHttpStatus = longint;

const
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

function sfHttpRequest_create: PsfHttpRequest; cdecl; external libsfml_network;
procedure sfHttpRequest_destroy(httpRequest: PsfHttpRequest); cdecl; external libsfml_network;
procedure sfHttpRequest_setField(httpRequest: PsfHttpRequest; field: pchar; value: pchar); cdecl; external libsfml_network;
procedure sfHttpRequest_setMethod(httpRequest: PsfHttpRequest; method: TsfHttpMethod); cdecl; external libsfml_network;
procedure sfHttpRequest_setUri(httpRequest: PsfHttpRequest; uri: pchar); cdecl; external libsfml_network;
procedure sfHttpRequest_setHttpVersion(httpRequest: PsfHttpRequest; major: dword; minor: dword); cdecl; external libsfml_network;
procedure sfHttpRequest_setBody(httpRequest: PsfHttpRequest; body: pchar); cdecl; external libsfml_network;
procedure sfHttpResponse_destroy(httpResponse: PsfHttpResponse); cdecl; external libsfml_network;
function sfHttpResponse_getField(httpResponse: PsfHttpResponse; field: pchar): pchar; cdecl; external libsfml_network;
function sfHttpResponse_getStatus(httpResponse: PsfHttpResponse): TsfHttpStatus; cdecl; external libsfml_network;
function sfHttpResponse_getMajorVersion(httpResponse: PsfHttpResponse): dword; cdecl; external libsfml_network;
function sfHttpResponse_getMinorVersion(httpResponse: PsfHttpResponse): dword; cdecl; external libsfml_network;
function sfHttpResponse_getBody(httpResponse: PsfHttpResponse): pchar; cdecl; external libsfml_network;
function sfHttp_create: PsfHttp; cdecl; external libsfml_network;
procedure sfHttp_destroy(http: PsfHttp); cdecl; external libsfml_network;
procedure sfHttp_setHost(http: PsfHttp; host: pchar; port: word); cdecl; external libsfml_network;
function sfHttp_sendRequest(http: PsfHttp; request: PsfHttpRequest; timeout: TsfTime): PsfHttpResponse; cdecl; external libsfml_network;

// === Konventiert am: 24-9-25 16:56:46 ===


implementation



end.
