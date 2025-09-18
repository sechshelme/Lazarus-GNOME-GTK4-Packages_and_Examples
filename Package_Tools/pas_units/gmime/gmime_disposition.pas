unit gmime_disposition;

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
{$ifndef __GMIME_DISPOSITION_H__}
{$define __GMIME_DISPOSITION_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <gmime/gmime-param.h>}

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


function g_mime_content_disposition_get_type:TGType;cdecl;external libgmime3;
function g_mime_content_disposition_new:PGMimeContentDisposition;cdecl;external libgmime3;
function g_mime_content_disposition_parse(options:PGMimeParserOptions; str:Pchar):PGMimeContentDisposition;cdecl;external libgmime3;
procedure g_mime_content_disposition_set_disposition(disposition:PGMimeContentDisposition; value:Pchar);cdecl;external libgmime3;
function g_mime_content_disposition_get_disposition(disposition:PGMimeContentDisposition):Pchar;cdecl;external libgmime3;
function g_mime_content_disposition_get_parameters(disposition:PGMimeContentDisposition):PGMimeParamList;cdecl;external libgmime3;
procedure g_mime_content_disposition_set_parameter(disposition:PGMimeContentDisposition; name:Pchar; value:Pchar);cdecl;external libgmime3;
function g_mime_content_disposition_get_parameter(disposition:PGMimeContentDisposition; name:Pchar):Pchar;cdecl;external libgmime3;
function g_mime_content_disposition_is_attachment(disposition:PGMimeContentDisposition):Tgboolean;cdecl;external libgmime3;
function g_mime_content_disposition_encode(disposition:PGMimeContentDisposition; options:PGMimeFormatOptions):Pchar;cdecl;external libgmime3;
{$endif}
{ __GMIME_DISPOSITION_H__  }

// === Konventiert am: 18-9-25 15:26:38 ===

function GMIME_TYPE_CONTENT_DISPOSITION : TGType;
function GMIME_CONTENT_DISPOSITION(obj : Pointer) : PGMimeContentDisposition;
function GMIME_CONTENT_DISPOSITION_CLASS(klass : Pointer) : PGMimeContentDispositionClass;
function GMIME_IS_CONTENT_DISPOSITION(obj : Pointer) : Tgboolean;
function GMIME_IS_CONTENT_DISPOSITION_CLASS(klass : Pointer) : Tgboolean;
function GMIME_CONTENT_DISPOSITION_GET_CLASS(obj : Pointer) : PGMimeContentDispositionClass;

implementation

function GMIME_TYPE_CONTENT_DISPOSITION : TGType;
  begin
    GMIME_TYPE_CONTENT_DISPOSITION:=g_mime_content_disposition_get_type;
  end;

function GMIME_CONTENT_DISPOSITION(obj : Pointer) : PGMimeContentDisposition;
begin
  Result := PGMimeContentDisposition(g_type_check_instance_cast(obj, GMIME_TYPE_CONTENT_DISPOSITION));
end;

function GMIME_CONTENT_DISPOSITION_CLASS(klass : Pointer) : PGMimeContentDispositionClass;
begin
  Result := PGMimeContentDispositionClass(g_type_check_class_cast(klass, GMIME_TYPE_CONTENT_DISPOSITION));
end;

function GMIME_IS_CONTENT_DISPOSITION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_CONTENT_DISPOSITION);
end;

function GMIME_IS_CONTENT_DISPOSITION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_CONTENT_DISPOSITION);
end;

function GMIME_CONTENT_DISPOSITION_GET_CLASS(obj : Pointer) : PGMimeContentDispositionClass;
begin
  Result := PGMimeContentDispositionClass(PGTypeInstance(obj)^.g_class);
end;



end.
