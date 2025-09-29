
unit soup_multipart;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_multipart.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_multipart.h
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
PGBytes  = ^GBytes;
PSoupMessageHeaders  = ^SoupMessageHeaders;
PSoupMultipart  = ^SoupMultipart;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2008 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-message-body.h"}
{$include "soup-message-headers.h"}
type

function soup_multipart_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_MULTIPART : longint; { return type might be wrong }

(* Const before type ignored *)
function soup_multipart_new(mime_type:Pchar):PSoupMultipart;cdecl;external;
function soup_multipart_new_from_message(headers:PSoupMessageHeaders; body:PGBytes):PSoupMultipart;cdecl;external;
function soup_multipart_get_length(multipart:PSoupMultipart):longint;cdecl;external;
function soup_multipart_get_part(multipart:PSoupMultipart; part:longint; headers:PPSoupMessageHeaders; body:PPGBytes):Tgboolean;cdecl;external;
procedure soup_multipart_append_part(multipart:PSoupMultipart; headers:PSoupMessageHeaders; body:PGBytes);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure soup_multipart_append_form_string(multipart:PSoupMultipart; control_name:Pchar; data:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure soup_multipart_append_form_file(multipart:PSoupMultipart; control_name:Pchar; filename:Pchar; content_type:Pchar; body:PGBytes);cdecl;external;
procedure soup_multipart_to_message(multipart:PSoupMultipart; dest_headers:PSoupMessageHeaders; dest_body:PPGBytes);cdecl;external;
procedure soup_multipart_free(multipart:PSoupMultipart);cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_MULTIPART : longint; { return type might be wrong }
  begin
    SOUP_TYPE_MULTIPART:=soup_multipart_get_type;
  end;


end.
