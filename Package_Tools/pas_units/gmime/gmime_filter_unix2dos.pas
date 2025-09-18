unit gmime_filter_unix2dos;

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
{$ifndef __GMIME_FILTER_UNIX2DOS_H__}
{$define __GMIME_FILTER_UNIX2DOS_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeFilterUnix2Dos:
 * @parent_object: parent #GMimeFilter
 * @ensure_newline: %TRUE if the filter should ensure that the stream ends with a new line
 * @pc: the previous character encountered
 *
 * A filter to convert a stream from Windows/DOS line endings to Unix line endings.
 * }
  PGMimeFilterUnix2Dos = ^TGMimeFilterUnix2Dos;
  TGMimeFilterUnix2Dos = record
      parent_object : TGMimeFilter;
      ensure_newline : Tgboolean;
      pc : char;
    end;

  PGMimeFilterUnix2DosClass = ^TGMimeFilterUnix2DosClass;
  TGMimeFilterUnix2DosClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_unix2dos_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_unix2dos_new(ensure_newline:Tgboolean):PGMimeFilter;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_UNIX2DOS_H__  }

// === Konventiert am: 18-9-25 15:28:15 ===

function GMIME_TYPE_FILTER_UNIX2DOS : TGType;
function GMIME_FILTER_UNIX2DOS(obj : Pointer) : PGMimeFilterUnix2Dos;
function GMIME_FILTER_UNIX2DOS_CLASS(klass : Pointer) : PGMimeFilterUnix2DosClass;
function GMIME_IS_FILTER_UNIX2DOS(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_UNIX2DOS_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_UNIX2DOS_GET_CLASS(obj : Pointer) : PGMimeFilterUnix2DosClass;

implementation

function GMIME_TYPE_FILTER_UNIX2DOS : TGType;
  begin
    GMIME_TYPE_FILTER_UNIX2DOS:=g_mime_filter_unix2dos_get_type;
  end;

function GMIME_FILTER_UNIX2DOS(obj : Pointer) : PGMimeFilterUnix2Dos;
begin
  Result := PGMimeFilterUnix2Dos(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_UNIX2DOS));
end;

function GMIME_FILTER_UNIX2DOS_CLASS(klass : Pointer) : PGMimeFilterUnix2DosClass;
begin
  Result := PGMimeFilterUnix2DosClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_UNIX2DOS));
end;

function GMIME_IS_FILTER_UNIX2DOS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_UNIX2DOS);
end;

function GMIME_IS_FILTER_UNIX2DOS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_UNIX2DOS);
end;

function GMIME_FILTER_UNIX2DOS_GET_CLASS(obj : Pointer) : PGMimeFilterUnix2DosClass;
begin
  Result := PGMimeFilterUnix2DosClass(PGTypeInstance(obj)^.g_class);
end;



end.
