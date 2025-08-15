
unit poppler_attachment;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_attachment.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_attachment.h
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
Pgchar  = ^gchar;
PGDateTime  = ^GDateTime;
PGError  = ^GError;
PGString  = ^GString;
PPopplerAttachment  = ^PopplerAttachment;
PPopplerAttachmentClass  = ^PopplerAttachmentClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-attachment.h: glib interface to poppler
 * Copyright (C) 2004, Red Hat, Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __POPPLER_ATTACHMENT_H__}
{$define __POPPLER_ATTACHMENT_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include "poppler.h"}

{ was #define dname def_expr }
function POPPLER_TYPE_ATTACHMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ATTACHMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ATTACHMENT(obj : longint) : longint;

{*
 * PopplerAttachmentSaveFunc:
 * @buf: (array length=count) (element-type guint8): buffer containing
 *   bytes to be written.
 * @count: number of bytes in @buf.
 * @data: (closure): user data passed to poppler_attachment_save_to_callback()
 * @error: GError to set on error, or %NULL
 *
 * Specifies the type of the function passed to
 * poppler_attachment_save_to_callback().  It is called once for each block of
 * bytes that is "written" by poppler_attachment_save_to_callback().  If
 * successful it should return %TRUE.  If an error occurs it should set
 * @error and return %FALSE, in which case poppler_attachment_save_to_callback()
 * will fail with the same error.
 *
 * Returns: %TRUE if successful, %FALSE (with @error set) if failed.
  }
(* Const before type ignored *)
type

  TPopplerAttachmentSaveFunc = function (buf:Pgchar; count:Tgsize; data:Tgpointer; error:PPGError):Tgboolean;cdecl;
{*
 * PopplerAttachment:
 * @name: The filename. Deprecated in poppler 20.09.0. Use
 *   poppler_attachment_get_name() instead.
 * @description: Descriptive text. Deprecated in poppler 20.09.0. Use
 *   poppler_attachment_get_description() instead.
 * @size: The size of the file. Deprecated in poppler 20.09.0. Use
 *   poppler_attachment_get_size() instead.
 * @mtime: The date and time when the file was last modified. Deprecated in
 *   poppler 20.09.0. Use poppler_attachment_get_mtime() instead.
 * @ctime: The date and time when the file was created. Deprecated in poppler
 *   20.09.0. Use poppler_attachment_get_ctime() instead.
 * @checksum: A 16-byte checksum of the file. Deprecated in poppler 20.09.0. Use
 *   poppler_attachment_get_checksum() instead.
  }
{< public > }
{ GTime is deprecated, but is part of our ABI here (see #715, #765).  }
  PPopplerAttachment = ^TPopplerAttachment;
  TPopplerAttachment = record
      parent : TGObject;cdecl;
      name : Pgchar;
      description : Pgchar;
      size : Tgsize;
      mtime : TGTime;
      ctime : TGTime;
      checksum : PGString;
    end;

{ This struct was not intended to be public, but can't be moved to
 * poppler-attachment.cc without breaking the API stability.
  }
{*
 * PopplerAttachmentClass:
 *
 * The GObject class structure of #PopplerAttachment.
  }

  PPopplerAttachmentClass = ^TPopplerAttachmentClass;
  TPopplerAttachmentClass = record
      parent_class : TGObjectClass;
    end;

function poppler_attachment_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function poppler_attachment_get_checksum(attachment:PPopplerAttachment):PGString;cdecl;external;
function poppler_attachment_get_ctime(attachment:PPopplerAttachment):PGDateTime;cdecl;external;
(* Const before type ignored *)
function poppler_attachment_get_description(attachment:PPopplerAttachment):Pgchar;cdecl;external;
function poppler_attachment_get_mtime(attachment:PPopplerAttachment):PGDateTime;cdecl;external;
(* Const before type ignored *)
function poppler_attachment_get_name(attachment:PPopplerAttachment):Pgchar;cdecl;external;
function poppler_attachment_get_size(attachment:PPopplerAttachment):Tgsize;cdecl;external;
(* Const before type ignored *)
function poppler_attachment_save(attachment:PPopplerAttachment; filename:Pchar; error:PPGError):Tgboolean;cdecl;external;
{$ifndef G_OS_WIN32}

function poppler_attachment_save_to_fd(attachment:PPopplerAttachment; fd:longint; error:PPGError):Tgboolean;cdecl;external;
{$endif}

function poppler_attachment_save_to_callback(attachment:PPopplerAttachment; save_func:TPopplerAttachmentSaveFunc; user_data:Tgpointer; error:PPGError):Tgboolean;cdecl;external;
{$endif}
{ __POPPLER_ATTACHMENT_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_TYPE_ATTACHMENT : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_ATTACHMENT:=poppler_attachment_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_ATTACHMENT(obj : longint) : longint;
begin
  POPPLER_ATTACHMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_ATTACHMENT,PopplerAttachment);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_ATTACHMENT(obj : longint) : longint;
begin
  POPPLER_IS_ATTACHMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_ATTACHMENT);
end;


end.
