unit gmime_references;

interface

uses
  fp_glib2, fp_gmime3;

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


function g_mime_references_get_type:TGType;cdecl;external libgmime3;
function g_mime_references_new:PGMimeReferences;cdecl;external libgmime3;
procedure g_mime_references_free(refs:PGMimeReferences);cdecl;external libgmime3;
function g_mime_references_parse(options:PGMimeParserOptions; text:Pchar):PGMimeReferences;cdecl;external libgmime3;
function g_mime_references_copy(refs:PGMimeReferences):PGMimeReferences;cdecl;external libgmime3;
function g_mime_references_length(refs:PGMimeReferences):longint;cdecl;external libgmime3;
procedure g_mime_references_append(refs:PGMimeReferences; msgid:Pchar);cdecl;external libgmime3;
procedure g_mime_references_clear(refs:PGMimeReferences);cdecl;external libgmime3;
function g_mime_references_get_message_id(refs:PGMimeReferences; index:longint):Pchar;cdecl;external libgmime3;
procedure g_mime_references_set_message_id(refs:PGMimeReferences; index:longint; msgid:Pchar);cdecl;external libgmime3;
{$endif}
{ __GMIME_REFERENCES_H__  }

// === Konventiert am: 18-9-25 15:33:21 ===

function GMIME_TYPE_REFERENCES : TGType;

implementation

function GMIME_TYPE_REFERENCES : TGType;
  begin
    GMIME_TYPE_REFERENCES:=gmime_references_get_type;
  end;



end.
