
unit gmime_multipart;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_multipart.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_multipart.h
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
PGMimeMultipart  = ^GMimeMultipart;
PGMimeMultipartClass  = ^GMimeMultipartClass;
PGMimeObject  = ^GMimeObject;
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
{$ifndef __GMIME_MULTIPART_H__}
{$define __GMIME_MULTIPART_H__}
{$include <glib.h>}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-object.h>}

{ was #define dname def_expr }
function GMIME_TYPE_MULTIPART : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MULTIPART(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MULTIPART_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_GET_CLASS(obj : longint) : longint;

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

(* Const before type ignored *)
(* Const before type ignored *)
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


function g_mime_multipart_get_type:TGType;cdecl;external;
function g_mime_multipart_new:PGMimeMultipart;cdecl;external;
(* Const before type ignored *)
function g_mime_multipart_new_with_subtype(subtype:Pchar):PGMimeMultipart;cdecl;external;
(* Const before type ignored *)
procedure g_mime_multipart_set_prologue(multipart:PGMimeMultipart; prologue:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_multipart_get_prologue(multipart:PGMimeMultipart):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_multipart_set_epilogue(multipart:PGMimeMultipart; epilogue:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_multipart_get_epilogue(multipart:PGMimeMultipart):Pchar;cdecl;external;
procedure g_mime_multipart_clear(multipart:PGMimeMultipart);cdecl;external;
procedure g_mime_multipart_add(multipart:PGMimeMultipart; part:PGMimeObject);cdecl;external;
procedure g_mime_multipart_insert(multipart:PGMimeMultipart; index:longint; part:PGMimeObject);cdecl;external;
function g_mime_multipart_remove(multipart:PGMimeMultipart; part:PGMimeObject):Tgboolean;cdecl;external;
function g_mime_multipart_remove_at(multipart:PGMimeMultipart; index:longint):PGMimeObject;cdecl;external;
function g_mime_multipart_replace(multipart:PGMimeMultipart; index:longint; replacement:PGMimeObject):PGMimeObject;cdecl;external;
function g_mime_multipart_get_part(multipart:PGMimeMultipart; index:longint):PGMimeObject;cdecl;external;
function g_mime_multipart_contains(multipart:PGMimeMultipart; part:PGMimeObject):Tgboolean;cdecl;external;
function g_mime_multipart_index_of(multipart:PGMimeMultipart; part:PGMimeObject):longint;cdecl;external;
function g_mime_multipart_get_count(multipart:PGMimeMultipart):longint;cdecl;external;
(* Const before type ignored *)
procedure g_mime_multipart_set_boundary(multipart:PGMimeMultipart; boundary:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_multipart_get_boundary(multipart:PGMimeMultipart):Pchar;cdecl;external;
{ convenience functions  }
procedure g_mime_multipart_foreach(multipart:PGMimeMultipart; callback:TGMimeObjectForeachFunc; user_data:Tgpointer);cdecl;external;
(* Const before type ignored *)
function g_mime_multipart_get_subpart_from_content_id(multipart:PGMimeMultipart; content_id:Pchar):PGMimeObject;cdecl;external;
{$endif}
{ __GMIME_MULTIPART_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_MULTIPART : longint; { return type might be wrong }
  begin
    GMIME_TYPE_MULTIPART:=g_mime_multipart_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART(obj : longint) : longint;
begin
  GMIME_MULTIPART:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_MULTIPART,GMimeMultipart);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_CLASS(klass : longint) : longint;
begin
  GMIME_MULTIPART_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_MULTIPART,GMimeMultipartClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MULTIPART(obj : longint) : longint;
begin
  GMIME_IS_MULTIPART:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_MULTIPART);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_MULTIPART_CLASS(klass : longint) : longint;
begin
  GMIME_IS_MULTIPART_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_MULTIPART);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_MULTIPART_GET_CLASS(obj : longint) : longint;
begin
  GMIME_MULTIPART_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_MULTIPART,GMimeMultipartClass);
end;


end.
