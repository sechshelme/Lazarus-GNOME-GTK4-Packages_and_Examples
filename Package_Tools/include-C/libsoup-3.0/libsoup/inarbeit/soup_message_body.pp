
unit soup_message_body;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_message_body.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_message_body.h
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
Pguchar  = ^guchar;
PSoupMemoryUse  = ^SoupMemoryUse;
PSoupMessageBody  = ^SoupMessageBody;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2000-2003, Ximian, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
type
  PSoupMemoryUse = ^TSoupMemoryUse;
  TSoupMemoryUse =  Longint;
  Const
    SOUP_MEMORY_STATIC = 0;
    SOUP_MEMORY_TAKE = 1;
    SOUP_MEMORY_COPY = 2;
;
(* Const before type ignored *)
type
  PSoupMessageBody = ^TSoupMessageBody;
  TSoupMessageBody = record
      data : Pchar;
      length : Tgoffset;
    end;

function soup_message_body_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function SOUP_TYPE_MESSAGE_BODY : longint; { return type might be wrong }

function soup_message_body_new:PSoupMessageBody;cdecl;external;
function soup_message_body_ref(body:PSoupMessageBody):PSoupMessageBody;cdecl;external;
procedure soup_message_body_unref(body:PSoupMessageBody);cdecl;external;
procedure soup_message_body_set_accumulate(body:PSoupMessageBody; accumulate:Tgboolean);cdecl;external;
function soup_message_body_get_accumulate(body:PSoupMessageBody):Tgboolean;cdecl;external;
procedure soup_message_body_append(body:PSoupMessageBody; use:TSoupMemoryUse; data:Tgconstpointer; length:Tgsize);cdecl;external;
procedure soup_message_body_append_take(body:PSoupMessageBody; data:Pguchar; length:Tgsize);cdecl;external;
procedure soup_message_body_append_bytes(body:PSoupMessageBody; buffer:PGBytes);cdecl;external;
procedure soup_message_body_truncate(body:PSoupMessageBody);cdecl;external;
procedure soup_message_body_complete(body:PSoupMessageBody);cdecl;external;
function soup_message_body_flatten(body:PSoupMessageBody):PGBytes;cdecl;external;
function soup_message_body_get_chunk(body:PSoupMessageBody; offset:Tgoffset):PGBytes;cdecl;external;
procedure soup_message_body_got_chunk(body:PSoupMessageBody; chunk:PGBytes);cdecl;external;
procedure soup_message_body_wrote_chunk(body:PSoupMessageBody; chunk:PGBytes);cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_MESSAGE_BODY : longint; { return type might be wrong }
  begin
    SOUP_TYPE_MESSAGE_BODY:=soup_message_body_get_type;
  end;


end.
