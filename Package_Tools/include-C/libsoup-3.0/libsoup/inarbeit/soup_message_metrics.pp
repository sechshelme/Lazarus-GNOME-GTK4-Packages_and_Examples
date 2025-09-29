
unit soup_message_metrics;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_message_metrics.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_message_metrics.h
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
PSoupMessageMetrics  = ^SoupMessageMetrics;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright 2021 Igalia S.L.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
type

function soup_message_metrics_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_MESSAGE_METRICS : longint; { return type might be wrong }

function soup_message_metrics_copy(metrics:PSoupMessageMetrics):PSoupMessageMetrics;cdecl;external;
procedure soup_message_metrics_free(metrics:PSoupMessageMetrics);cdecl;external;
function soup_message_metrics_get_fetch_start(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_dns_start(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_dns_end(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_connect_start(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_connect_end(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_tls_start(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_request_start(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_response_start(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_response_end(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_request_header_bytes_sent(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_request_body_size(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_request_body_bytes_sent(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_response_header_bytes_received(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_response_body_size(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;
function soup_message_metrics_get_response_body_bytes_received(metrics:PSoupMessageMetrics):Tguint64;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_MESSAGE_METRICS : longint; { return type might be wrong }
  begin
    SOUP_TYPE_MESSAGE_METRICS:=soup_message_metrics_get_type;
  end;


end.
