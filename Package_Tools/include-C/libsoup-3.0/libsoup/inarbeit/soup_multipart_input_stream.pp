
unit soup_multipart_input_stream;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_multipart_input_stream.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_multipart_input_stream.h
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
PGAsyncResult  = ^GAsyncResult;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PGInputStream  = ^GInputStream;
PSoupMessage  = ^SoupMessage;
PSoupMessageHeaders  = ^SoupMessageHeaders;
PSoupMultipartInputStream  = ^SoupMultipartInputStream;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2012 Collabora Ltd.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-message-headers.h"}

{ was #define dname def_expr }
function SOUP_TYPE_MULTIPART_INPUT_STREAM : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupMultipartInputStream, soup_multipart_input_stream, SOUP, MULTIPART_INPUT_STREAM, GFilterInputStream) }
function soup_multipart_input_stream_new(msg:PSoupMessage; base_stream:PGInputStream):PSoupMultipartInputStream;cdecl;external;
function soup_multipart_input_stream_next_part(multipart:PSoupMultipartInputStream; cancellable:PGCancellable; error:PPGError):PGInputStream;cdecl;external;
procedure soup_multipart_input_stream_next_part_async(multipart:PSoupMultipartInputStream; io_priority:longint; cancellable:PGCancellable; callback:TGAsyncReadyCallback; data:Tgpointer);cdecl;external;
function soup_multipart_input_stream_next_part_finish(multipart:PSoupMultipartInputStream; result:PGAsyncResult; error:PPGError):PGInputStream;cdecl;external;
function soup_multipart_input_stream_get_headers(multipart:PSoupMultipartInputStream):PSoupMessageHeaders;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_MULTIPART_INPUT_STREAM : longint; { return type might be wrong }
  begin
    SOUP_TYPE_MULTIPART_INPUT_STREAM:=soup_multipart_input_stream_get_type;
  end;


end.
