
unit gmime_object;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_object.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_object.h
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
PGDateTime  = ^GDateTime;
PGMimeAutocryptHeaderList  = ^GMimeAutocryptHeaderList;
PGMimeContentDisposition  = ^GMimeContentDisposition;
PGMimeContentType  = ^GMimeContentType;
PGMimeFormatOptions  = ^GMimeFormatOptions;
PGMimeHeader  = ^GMimeHeader;
PGMimeHeaderList  = ^GMimeHeaderList;
PGMimeObject  = ^GMimeObject;
PGMimeObjectClass  = ^GMimeObjectClass;
PGMimeParserOptions  = ^GMimeParserOptions;
PGMimeStream  = ^GMimeStream;
PInternetAddressList  = ^InternetAddressList;
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
{$ifndef __GMIME_OBJECT_H__}
{$define __GMIME_OBJECT_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gmime/gmime-format-options.h>}
{$include <gmime/gmime-parser-options.h>}
{$include <gmime/gmime-content-type.h>}
{$include <gmime/gmime-disposition.h>}
{$include <gmime/gmime-encodings.h>}
{$include <gmime/gmime-stream.h>}
{$include <gmime/gmime-header.h>}
{$include <gmime/gmime-autocrypt.h>}

{ was #define dname def_expr }
function GMIME_TYPE_OBJECT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_OBJECT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_OBJECT_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_OBJECT_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeObject:
 * @parent_object: parent #GObject
 * @disposition: a #GMimeContentDisposition
 * @content_type: a #GMimeContentType
 * @content_id: a Content-Id
 * @headers: a #GMimeHeaderList
 *
 * Base class for all MIME parts.
 * }
{ < private >  }
  PGMimeObject = ^TGMimeObject;
  TGMimeObject = record
      parent_object : TGObject;
      disposition : PGMimeContentDisposition;
      content_type : PGMimeContentType;
      headers : PGMimeHeaderList;
      content_id : Pchar;
      ensure_newline : Tgboolean;
    end;

  PGMimeObjectClass = ^TGMimeObjectClass;
  TGMimeObjectClass = record
      parent_class : TGObjectClass;
      header_added : procedure (object:PGMimeObject; header:PGMimeHeader);cdecl;
      header_changed : procedure (object:PGMimeObject; header:PGMimeHeader);cdecl;
      header_removed : procedure (object:PGMimeObject; header:PGMimeHeader);cdecl;
      headers_cleared : procedure (object:PGMimeObject);cdecl;
      set_content_type : procedure (object:PGMimeObject; content_type:PGMimeContentType);cdecl;
      get_headers : function (object:PGMimeObject; options:PGMimeFormatOptions):Pchar;cdecl;
      write_to_stream : function (object:PGMimeObject; options:PGMimeFormatOptions; content_only:Tgboolean; stream:PGMimeStream):Tssize_t;cdecl;
      encode : procedure (object:PGMimeObject; constraint:TGMimeEncodingConstraint);cdecl;
    end;

{*
 * GMimeObjectForeachFunc:
 * @parent: parent #GMimeObject
 * @part: a #GMimeObject
 * @user_data: User-supplied callback data.
 *
 * The function signature for a callback to g_mime_message_foreach()
 * and g_mime_multipart_foreach().
 * }

  TGMimeObjectForeachFunc = procedure (parent:PGMimeObject; part:PGMimeObject; user_data:Tgpointer);cdecl;

function g_mime_object_get_type:TGType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_object_register_type(_type:Pchar; subtype:Pchar; object_type:TGType);cdecl;external;
function g_mime_object_new(options:PGMimeParserOptions; content_type:PGMimeContentType):PGMimeObject;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_object_new_type(options:PGMimeParserOptions; _type:Pchar; subtype:Pchar):PGMimeObject;cdecl;external;
procedure g_mime_object_set_content_type(object:PGMimeObject; content_type:PGMimeContentType);cdecl;external;
function g_mime_object_get_content_type(object:PGMimeObject):PGMimeContentType;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_object_set_content_type_parameter(object:PGMimeObject; name:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_object_get_content_type_parameter(object:PGMimeObject; name:Pchar):Pchar;cdecl;external;
procedure g_mime_object_set_content_disposition(object:PGMimeObject; disposition:PGMimeContentDisposition);cdecl;external;
function g_mime_object_get_content_disposition(object:PGMimeObject):PGMimeContentDisposition;cdecl;external;
(* Const before type ignored *)
procedure g_mime_object_set_disposition(object:PGMimeObject; disposition:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_object_get_disposition(object:PGMimeObject):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_object_set_content_disposition_parameter(object:PGMimeObject; name:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_object_get_content_disposition_parameter(object:PGMimeObject; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
procedure g_mime_object_set_content_id(object:PGMimeObject; content_id:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_object_get_content_id(object:PGMimeObject):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_object_prepend_header(object:PGMimeObject; header:Pchar; value:Pchar; charset:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_object_append_header(object:PGMimeObject; header:Pchar; value:Pchar; charset:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_object_set_header(object:PGMimeObject; header:Pchar; value:Pchar; charset:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_object_get_header(object:PGMimeObject; header:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function g_mime_object_remove_header(object:PGMimeObject; header:Pchar):Tgboolean;cdecl;external;
function g_mime_object_get_header_list(object:PGMimeObject):PGMimeHeaderList;cdecl;external;
function g_mime_object_get_headers(object:PGMimeObject; options:PGMimeFormatOptions):Pchar;cdecl;external;
function g_mime_object_write_to_stream(object:PGMimeObject; options:PGMimeFormatOptions; stream:PGMimeStream):Tssize_t;cdecl;external;
function g_mime_object_write_content_to_stream(object:PGMimeObject; options:PGMimeFormatOptions; stream:PGMimeStream):Tssize_t;cdecl;external;
function g_mime_object_to_string(object:PGMimeObject; options:PGMimeFormatOptions):Pchar;cdecl;external;
procedure g_mime_object_encode(object:PGMimeObject; constraint:TGMimeEncodingConstraint);cdecl;external;
{ Internal API  }
procedure g_mime_object_type_registry_init;cdecl;external;
procedure g_mime_object_type_registry_shutdown;cdecl;external;
(* Const before type ignored *)
function g_mime_object_get_autocrypt_headers(mime_part:PGMimeObject; effective_date:PGDateTime; matchheader:Pchar; addresses:PInternetAddressList; keep_incomplete:Tgboolean):PGMimeAutocryptHeaderList;cdecl;external;
{$endif}
{ __GMIME_OBJECT_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_OBJECT : longint; { return type might be wrong }
  begin
    GMIME_TYPE_OBJECT:=g_mime_object_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_OBJECT(obj : longint) : longint;
begin
  GMIME_OBJECT:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_OBJECT,GMimeObject);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_OBJECT_CLASS(klass : longint) : longint;
begin
  GMIME_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_OBJECT,GMimeObjectClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_OBJECT(obj : longint) : longint;
begin
  GMIME_IS_OBJECT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_OBJECT_CLASS(klass : longint) : longint;
begin
  GMIME_IS_OBJECT_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_OBJECT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_OBJECT_GET_CLASS(obj : longint) : longint;
begin
  GMIME_OBJECT_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_OBJECT,GMimeObjectClass);
end;


end.
