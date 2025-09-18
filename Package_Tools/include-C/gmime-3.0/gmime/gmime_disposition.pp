
unit gmime_disposition;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_disposition.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_disposition.h
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
PGMimeContentDisposition  = ^GMimeContentDisposition;
PGMimeContentDispositionClass  = ^GMimeContentDispositionClass;
PGMimeFormatOptions  = ^GMimeFormatOptions;
PGMimeParamList  = ^GMimeParamList;
PGMimeParserOptions  = ^GMimeParserOptions;
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
{$ifndef __GMIME_DISPOSITION_H__}
{$define __GMIME_DISPOSITION_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gmime/gmime-param.h>}

{ was #define dname def_expr }
function GMIME_TYPE_CONTENT_DISPOSITION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_DISPOSITION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_DISPOSITION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CONTENT_DISPOSITION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CONTENT_DISPOSITION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_DISPOSITION_GET_CLASS(obj : longint) : longint;

type
{*
 * GMIME_DISPOSITION_ATTACHMENT:
 *
 * Standard attachment disposition.
 * }

const
  GMIME_DISPOSITION_ATTACHMENT = 'attachment';  
{*
 * GMIME_DISPOSITION_INLINE:
 *
 * Standard inline disposition.
 * }
  GMIME_DISPOSITION_INLINE = 'inline';  
{*
 * GMimeContentDisposition:
 * @parent_object: parent #GObject
 * @disposition: disposition
 * @params: a #GMimeParam list
 *
 * A data structure representing a Content-Disposition.
 * }
{ < private >  }
type
  PGMimeContentDisposition = ^TGMimeContentDisposition;
  TGMimeContentDisposition = record
      parent_object : TGObject;
      disposition : Pchar;
      params : PGMimeParamList;
      changed : Tgpointer;
    end;

  PGMimeContentDispositionClass = ^TGMimeContentDispositionClass;
  TGMimeContentDispositionClass = record
      parent_class : TGObjectClass;
    end;


function g_mime_content_disposition_get_type:TGType;cdecl;external;
function g_mime_content_disposition_new:PGMimeContentDisposition;cdecl;external;
(* Const before type ignored *)
function g_mime_content_disposition_parse(options:PGMimeParserOptions; str:Pchar):PGMimeContentDisposition;cdecl;external;
(* Const before type ignored *)
procedure g_mime_content_disposition_set_disposition(disposition:PGMimeContentDisposition; value:Pchar);cdecl;external;
(* Const before type ignored *)
function g_mime_content_disposition_get_disposition(disposition:PGMimeContentDisposition):Pchar;cdecl;external;
function g_mime_content_disposition_get_parameters(disposition:PGMimeContentDisposition):PGMimeParamList;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure g_mime_content_disposition_set_parameter(disposition:PGMimeContentDisposition; name:Pchar; value:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_mime_content_disposition_get_parameter(disposition:PGMimeContentDisposition; name:Pchar):Pchar;cdecl;external;
function g_mime_content_disposition_is_attachment(disposition:PGMimeContentDisposition):Tgboolean;cdecl;external;
function g_mime_content_disposition_encode(disposition:PGMimeContentDisposition; options:PGMimeFormatOptions):Pchar;cdecl;external;
{$endif}
{ __GMIME_DISPOSITION_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_CONTENT_DISPOSITION : longint; { return type might be wrong }
  begin
    GMIME_TYPE_CONTENT_DISPOSITION:=g_mime_content_disposition_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_DISPOSITION(obj : longint) : longint;
begin
  GMIME_CONTENT_DISPOSITION:=G_TYPE_CHECK_INSTANCE_CAST(obj,g_mime_content_disposition_get_type,GMimeContentDisposition);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_DISPOSITION_CLASS(klass : longint) : longint;
begin
  GMIME_CONTENT_DISPOSITION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,g_mime_content_disposition_get_type,GMimeContentDispositionClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CONTENT_DISPOSITION(obj : longint) : longint;
begin
  GMIME_IS_CONTENT_DISPOSITION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,g_mime_content_disposition_get_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_CONTENT_DISPOSITION_CLASS(klass : longint) : longint;
begin
  GMIME_IS_CONTENT_DISPOSITION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,g_mime_content_disposition_get_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_CONTENT_DISPOSITION_GET_CLASS(obj : longint) : longint;
begin
  GMIME_CONTENT_DISPOSITION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,g_mime_content_disposition_get_type,GMimeContentDispositionClass);
end;


end.
