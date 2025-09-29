
unit soup_content_decoder;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_content_decoder.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_content_decoder.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2009 Red Hat, Inc.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-message-body.h"}

{ was #define dname def_expr }
function SOUP_TYPE_CONTENT_DECODER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupContentDecoder, soup_content_decoder, SOUP, CONTENT_DECODER, GObject) }

implementation

{ was #define dname def_expr }
function SOUP_TYPE_CONTENT_DECODER : longint; { return type might be wrong }
  begin
    SOUP_TYPE_CONTENT_DECODER:=soup_content_decoder_get_type;
  end;


end.
