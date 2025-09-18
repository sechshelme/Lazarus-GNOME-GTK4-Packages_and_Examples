unit gmime_filter_windows;

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
{$ifndef __GMIME_FILTER_WINDOWS_H__}
{$define __GMIME_FILTER_WINDOWS_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeFilterWindows:
 * @parent_object: parent #GMimeFilter
 * @is_windows: %TRUE if the stream is detected to be a windows-cp125x charset
 * @claimed_charset: charset the text stream is claimed to be
 *
 * A filter for detecting whether or not a text stream claimed to be
 * iso-8859-X is really that charset or if it is really a
 * Windows-CP125x charset.
 * }
  PGMimeFilterWindows = ^TGMimeFilterWindows;
  TGMimeFilterWindows = record
      parent_object : TGMimeFilter;
      is_windows : Tgboolean;
      claimed_charset : Pchar;
    end;

  PGMimeFilterWindowsClass = ^TGMimeFilterWindowsClass;
  TGMimeFilterWindowsClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_windows_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_windows_new(claimed_charset:Pchar):PGMimeFilter;cdecl;external libgmime3;
function g_mime_filter_windows_is_windows_charset(filter:PGMimeFilterWindows):Tgboolean;cdecl;external libgmime3;
function g_mime_filter_windows_real_charset(filter:PGMimeFilterWindows):Pchar;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_WINDOWS_H__  }

// === Konventiert am: 18-9-25 15:28:21 ===

function GMIME_TYPE_FILTER_WINDOWS : TGType;
function GMIME_FILTER_WINDOWS(obj : Pointer) : PGMimeFilterWindows;
function GMIME_FILTER_WINDOWS_CLASS(klass : Pointer) : PGMimeFilterWindowsClass;
function GMIME_IS_FILTER_WINDOWS(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_WINDOWS_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_WINDOWS_GET_CLASS(obj : Pointer) : PGMimeFilterWindowsClass;

implementation

function GMIME_TYPE_FILTER_WINDOWS : TGType;
  begin
    GMIME_TYPE_FILTER_WINDOWS:=g_mime_filter_windows_get_type;
  end;

function GMIME_FILTER_WINDOWS(obj : Pointer) : PGMimeFilterWindows;
begin
  Result := PGMimeFilterWindows(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_WINDOWS));
end;

function GMIME_FILTER_WINDOWS_CLASS(klass : Pointer) : PGMimeFilterWindowsClass;
begin
  Result := PGMimeFilterWindowsClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_WINDOWS));
end;

function GMIME_IS_FILTER_WINDOWS(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_WINDOWS);
end;

function GMIME_IS_FILTER_WINDOWS_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_WINDOWS);
end;

function GMIME_FILTER_WINDOWS_GET_CLASS(obj : Pointer) : PGMimeFilterWindowsClass;
begin
  Result := PGMimeFilterWindowsClass(PGTypeInstance(obj)^.g_class);
end;



end.
