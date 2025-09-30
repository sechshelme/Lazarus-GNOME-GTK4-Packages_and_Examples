
unit soup_content_sniffer;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_content_sniffer.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_content_sniffer.h
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
PGHashTable  = ^GHashTable;
PSoupContentSniffer  = ^SoupContentSniffer;
PSoupMessage  = ^SoupMessage;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{
 * Copyright (C) 2009 Gustavo Noronha Silva.
  }
(** unsupported pragma#pragma once*)
{$include "soup-types.h"}
{$include "soup-message-body.h"}

{ was #define dname def_expr }
function SOUP_TYPE_CONTENT_SNIFFER : longint; { return type might be wrong }

{G_DECLARE_FINAL_TYPE (SoupContentSniffer, soup_content_sniffer, SOUP, CONTENT_SNIFFER, GObject) }
function soup_content_sniffer_new:PSoupContentSniffer;cdecl;external;
function soup_content_sniffer_sniff(sniffer:PSoupContentSniffer; msg:PSoupMessage; buffer:PGBytes; params:PPGHashTable):Pchar;cdecl;external;

implementation

{ was #define dname def_expr }
function SOUP_TYPE_CONTENT_SNIFFER : longint; { return type might be wrong }
  begin
    SOUP_TYPE_CONTENT_SNIFFER:=soup_content_sniffer_get_type;
  end;


end.
