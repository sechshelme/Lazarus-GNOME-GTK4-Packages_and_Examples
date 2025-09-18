
unit gmime_references;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_references.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_references.h
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
PGMimeParserOptions  = ^GMimeParserOptions;
PGMimeReferences  = ^GMimeReferences;
PGPtrArray  = ^GPtrArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_REFERENCES_H__}
{$define __GMIME_REFERENCES_H__}
{$include <gmime/gmime-parser-options.h>}

{ was #define dname def_expr }
function GMIME_TYPE_REFERENCES : longint; { return type might be wrong }

type
{*
 * GMimeReferences:
 * @array: the array of message-id references
 *
 * A List of references, as per the References or In-Reply-To header
 * fields.
 * }
  PGMimeReferences = ^TGMimeReferences;
  TGMimeReferences = record
      array : PGPtrArray;
    end;


function g_mime_references_get_type:TGType;cdecl;external;
function g_mime_references_new:PGMimeReferences;cdecl;external;
procedure g_mime_references_free(refs:PGMimeReferences);cdecl;external;
(* Const before type ignored *)
function g_mime_references_parse(options:PGMimeParserOptions; text:Pchar):PGMimeReferences;cdecl;external;
function g_mime_references_copy(refs:PGMimeReferences):PGMimeReferences;cdecl;external;
function g_mime_references_length(refs:PGMimeReferences):longint;cdecl;external;
(* Const before type ignored *)
procedure g_mime_references_append(refs:PGMimeReferences; msgid:Pchar);cdecl;external;
procedure g_mime_references_clear(refs:PGMimeReferences);cdecl;external;
(* Const before type ignored *)
function g_mime_references_get_message_id(refs:PGMimeReferences; index:longint):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_references_set_message_id(refs:PGMimeReferences; index:longint; msgid:Pchar);cdecl;external;
{$endif}
{ __GMIME_REFERENCES_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_REFERENCES : longint; { return type might be wrong }
  begin
    GMIME_TYPE_REFERENCES:=gmime_references_get_type;
  end;


end.
