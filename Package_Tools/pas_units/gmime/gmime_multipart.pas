unit gmime_multipart;

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
{$ifndef __GMIME_MULTIPART_H__}
{$define __GMIME_MULTIPART_H__}
{$include <glib.h>}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-object.h>}

type
{*
 * GMimeMultipart:
 * @parent_object: parent #GMimeObject
 * @children: array of MIME sub-parts
 * @boundary: MIME boundary
 * @prologue: multipart prologue
 * @epilogue: multipart epilogue
 *
 * A base MIME multipart object.
 * }
{ < private >  }
  PGMimeMultipart = ^TGMimeMultipart;
  TGMimeMultipart = record
      parent_object : TGMimeObject;
      children : PGPtrArray;
      boundary : Pchar;
      prologue : Pchar;
      epilogue : Pchar;
      write_end_boundary : Tgboolean;
    end;

  PGMimeMultipartClass = ^TGMimeMultipartClass;
  TGMimeMultipartClass = record
      parent_class : TGMimeObjectClass;
      clear : procedure (multipart:PGMimeMultipart);cdecl;
      add : procedure (multipart:PGMimeMultipart; part:PGMimeObject);cdecl;
      insert : procedure (multipart:PGMimeMultipart; index:longint; part:PGMimeObject);cdecl;
      remove : function (multipart:PGMimeMultipart; part:PGMimeObject):Tgboolean;cdecl;
      remove_at : function (multipart:PGMimeMultipart; index:longint):PGMimeObject;cdecl;
      get_part : function (multipart:PGMimeMultipart; index:longint):PGMimeObject;cdecl;
      contains : function (multipart:PGMimeMultipart; part:PGMimeObject):Tgboolean;cdecl;
      index_of : function (multipart:PGMimeMultipart; part:PGMimeObject):longint;cdecl;
      get_count : function (multipart:PGMimeMultipart):longint;cdecl;
      set_boundary : procedure (multipart:PGMimeMultipart; boundary:Pchar);cdecl;
      get_boundary : function (multipart:PGMimeMultipart):Pchar;cdecl;
    end;


function g_mime_multipart_get_type:TGType;cdecl;external libgmime3;
function g_mime_multipart_new:PGMimeMultipart;cdecl;external libgmime3;
function g_mime_multipart_new_with_subtype(subtype:Pchar):PGMimeMultipart;cdecl;external libgmime3;
procedure g_mime_multipart_set_prologue(multipart:PGMimeMultipart; prologue:Pchar);cdecl;external libgmime3;
function g_mime_multipart_get_prologue(multipart:PGMimeMultipart):Pchar;cdecl;external libgmime3;
procedure g_mime_multipart_set_epilogue(multipart:PGMimeMultipart; epilogue:Pchar);cdecl;external libgmime3;
function g_mime_multipart_get_epilogue(multipart:PGMimeMultipart):Pchar;cdecl;external libgmime3;
procedure g_mime_multipart_clear(multipart:PGMimeMultipart);cdecl;external libgmime3;
procedure g_mime_multipart_add(multipart:PGMimeMultipart; part:PGMimeObject);cdecl;external libgmime3;
procedure g_mime_multipart_insert(multipart:PGMimeMultipart; index:longint; part:PGMimeObject);cdecl;external libgmime3;
function g_mime_multipart_remove(multipart:PGMimeMultipart; part:PGMimeObject):Tgboolean;cdecl;external libgmime3;
function g_mime_multipart_remove_at(multipart:PGMimeMultipart; index:longint):PGMimeObject;cdecl;external libgmime3;
function g_mime_multipart_replace(multipart:PGMimeMultipart; index:longint; replacement:PGMimeObject):PGMimeObject;cdecl;external libgmime3;
function g_mime_multipart_get_part(multipart:PGMimeMultipart; index:longint):PGMimeObject;cdecl;external libgmime3;
function g_mime_multipart_contains(multipart:PGMimeMultipart; part:PGMimeObject):Tgboolean;cdecl;external libgmime3;
function g_mime_multipart_index_of(multipart:PGMimeMultipart; part:PGMimeObject):longint;cdecl;external libgmime3;
function g_mime_multipart_get_count(multipart:PGMimeMultipart):longint;cdecl;external libgmime3;
procedure g_mime_multipart_set_boundary(multipart:PGMimeMultipart; boundary:Pchar);cdecl;external libgmime3;
function g_mime_multipart_get_boundary(multipart:PGMimeMultipart):Pchar;cdecl;external libgmime3;
{ convenience functions  }
procedure g_mime_multipart_foreach(multipart:PGMimeMultipart; callback:TGMimeObjectForeachFunc; user_data:Tgpointer);cdecl;external libgmime3;
function g_mime_multipart_get_subpart_from_content_id(multipart:PGMimeMultipart; content_id:Pchar):PGMimeObject;cdecl;external libgmime3;
{$endif}
{ __GMIME_MULTIPART_H__  }

// === Konventiert am: 18-9-25 15:29:51 ===

function GMIME_TYPE_MULTIPART : TGType;
function GMIME_MULTIPART(obj : Pointer) : PGMimeMultipart;
function GMIME_MULTIPART_CLASS(klass : Pointer) : PGMimeMultipartClass;
function GMIME_IS_MULTIPART(obj : Pointer) : Tgboolean;
function GMIME_IS_MULTIPART_CLASS(klass : Pointer) : Tgboolean;
function GMIME_MULTIPART_GET_CLASS(obj : Pointer) : PGMimeMultipartClass;

implementation

function GMIME_TYPE_MULTIPART : TGType;
  begin
    GMIME_TYPE_MULTIPART:=g_mime_multipart_get_type;
  end;

function GMIME_MULTIPART(obj : Pointer) : PGMimeMultipart;
begin
  Result := PGMimeMultipart(g_type_check_instance_cast(obj, GMIME_TYPE_MULTIPART));
end;

function GMIME_MULTIPART_CLASS(klass : Pointer) : PGMimeMultipartClass;
begin
  Result := PGMimeMultipartClass(g_type_check_class_cast(klass, GMIME_TYPE_MULTIPART));
end;

function GMIME_IS_MULTIPART(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_MULTIPART);
end;

function GMIME_IS_MULTIPART_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_MULTIPART);
end;

function GMIME_MULTIPART_GET_CLASS(obj : Pointer) : PGMimeMultipartClass;
begin
  Result := PGMimeMultipartClass(PGTypeInstance(obj)^.g_class);
end;



end.
