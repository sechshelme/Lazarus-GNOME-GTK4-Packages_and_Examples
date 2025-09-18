unit gmime_filter_dos2unix;

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
{$ifndef __GMIME_FILTER_DOS2UNIX_H__}
{$define __GMIME_FILTER_DOS2UNIX_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeFilterDos2Unix:
 * @parent_object: parent #GMimeFilter
 * @ensure_newline: %TRUE if the filter should ensure that the stream ends with a new line
 * @pc: the previous character encountered
 *
 * A filter to convert a stream from Windows/DOS line endings to Unix line endings.
 * }
  PGMimeFilterDos2Unix = ^TGMimeFilterDos2Unix;
  TGMimeFilterDos2Unix = record
      parent_object : TGMimeFilter;
      ensure_newline : Tgboolean;
      pc : char;
    end;

  PGMimeFilterDos2UnixClass = ^TGMimeFilterDos2UnixClass;
  TGMimeFilterDos2UnixClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_dos2unix_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_dos2unix_new(ensure_newline:Tgboolean):PGMimeFilter;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_DOS2UNIX_H__  }

// === Konventiert am: 18-9-25 15:27:29 ===

function GMIME_TYPE_FILTER_DOS2UNIX : TGType;
function GMIME_FILTER_DOS2UNIX(obj : Pointer) : PGMimeFilterDos2Unix;
function GMIME_FILTER_DOS2UNIX_CLASS(klass : Pointer) : PGMimeFilterDos2UnixClass;
function GMIME_IS_FILTER_DOS2UNIX(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_DOS2UNIX_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_DOS2UNIX_GET_CLASS(obj : Pointer) : PGMimeFilterDos2UnixClass;

implementation

function GMIME_TYPE_FILTER_DOS2UNIX : TGType;
  begin
    GMIME_TYPE_FILTER_DOS2UNIX:=g_mime_filter_dos2unix_get_type;
  end;

function GMIME_FILTER_DOS2UNIX(obj : Pointer) : PGMimeFilterDos2Unix;
begin
  Result := PGMimeFilterDos2Unix(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_DOS2UNIX));
end;

function GMIME_FILTER_DOS2UNIX_CLASS(klass : Pointer) : PGMimeFilterDos2UnixClass;
begin
  Result := PGMimeFilterDos2UnixClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_DOS2UNIX));
end;

function GMIME_IS_FILTER_DOS2UNIX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_DOS2UNIX);
end;

function GMIME_IS_FILTER_DOS2UNIX_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_DOS2UNIX);
end;

function GMIME_FILTER_DOS2UNIX_GET_CLASS(obj : Pointer) : PGMimeFilterDos2UnixClass;
begin
  Result := PGMimeFilterDos2UnixClass(PGTypeInstance(obj)^.g_class);
end;



end.
