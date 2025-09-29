
unit soup_form;
interface

{
  Automatically converted by H2Pas 1.0.0 from soup_form.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    soup_form.h
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
PGData  = ^GData;
PGHashTable  = ^GHashTable;
PSoupMultipart  = ^SoupMultipart;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 8 -*-  }
{ 
 * Copyright 2008 Red Hat, Inc.
  }
{$ifndef  __SOUP_FORM_H__}

const
  __SOUP_FORM_H__ = 1;  
{$include "soup-types.h"}
{$include "soup-multipart.h"}

const
  SOUP_FORM_MIME_TYPE_URLENCODED = 'application/x-www-form-urlencoded';  
  SOUP_FORM_MIME_TYPE_MULTIPART = 'multipart/form-data';  
(* Const before type ignored *)

function soup_form_decode(encoded_form:Pchar):PGHashTable;cdecl;external;
(* Const before type ignored *)
function soup_form_decode_multipart(multipart:PSoupMultipart; file_control_name:Pchar; filename:PPchar; content_type:PPchar; file:PPGBytes):PGHashTable;cdecl;external;
(* Const before type ignored *)
function soup_form_encode(first_field:Pchar; args:array of const):Pchar;cdecl;external;
function soup_form_encode(first_field:Pchar):Pchar;cdecl;external;
function soup_form_encode_hash(form_data_set:PGHashTable):Pchar;cdecl;external;
function soup_form_encode_datalist(form_data_set:PPGData):Pchar;cdecl;external;
(* Const before type ignored *)
function soup_form_encode_valist(first_field:Pchar; args:Tva_list):Pchar;cdecl;external;
{$endif}
{ __SOUP_FORM_H__  }

implementation


end.
