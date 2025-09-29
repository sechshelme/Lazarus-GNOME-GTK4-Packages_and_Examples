unit soup_multipart;

interface

uses
  fp_glib2, fp_soup;

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

function soup_multipart_get_type:TGType;cdecl;external libsoup;
{ was #define dname def_expr }
function SOUP_TYPE_MULTIPART : longint; { return type might be wrong }

function soup_multipart_new(mime_type:Pchar):PSoupMultipart;cdecl;external libsoup;
function soup_multipart_new_from_message(headers:PSoupMessageHeaders; body:PGBytes):PSoupMultipart;cdecl;external libsoup;
function soup_multipart_get_length(multipart:PSoupMultipart):longint;cdecl;external libsoup;
function soup_multipart_get_part(multipart:PSoupMultipart; part:longint; headers:PPSoupMessageHeaders; body:PPGBytes):Tgboolean;cdecl;external libsoup;
procedure soup_multipart_append_part(multipart:PSoupMultipart; headers:PSoupMessageHeaders; body:PGBytes);cdecl;external libsoup;
procedure soup_multipart_append_form_string(multipart:PSoupMultipart; control_name:Pchar; data:Pchar);cdecl;external libsoup;
procedure soup_multipart_append_form_file(multipart:PSoupMultipart; control_name:Pchar; filename:Pchar; content_type:Pchar; body:PGBytes);cdecl;external libsoup;
procedure soup_multipart_to_message(multipart:PSoupMultipart; dest_headers:PSoupMessageHeaders; dest_body:PPGBytes);cdecl;external libsoup;
procedure soup_multipart_free(multipart:PSoupMultipart);cdecl;external libsoup;

// === Konventiert am: 29-9-25 19:44:19 ===


implementation


{ was #define dname def_expr }
function SOUP_TYPE_MULTIPART : longint; { return type might be wrong }
  begin
    SOUP_TYPE_MULTIPART:=soup_multipart_get_type;
  end;


end.
