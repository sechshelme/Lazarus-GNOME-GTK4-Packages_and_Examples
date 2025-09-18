unit gmime_filter_from;

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
{$ifndef __GMIME_FILTER_FROM_H__}
{$define __GMIME_FILTER_FROM_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeFilterFromMode:
 * @GMIME_FILTER_FROM_MODE_DEFAULT: Default mode.
 * @GMIME_FILTER_FROM_MODE_ESCAPE: Escape 'From ' lines with a '>'
 * @GMIME_FILTER_FROM_MODE_ARMOR: QP-Encode 'From ' lines
 *
 * The mode for a #GMimeFilterFrom filter.
 * }

  PGMimeFilterFromMode = ^TGMimeFilterFromMode;
  TGMimeFilterFromMode =  Longint;
  Const
    GMIME_FILTER_FROM_MODE_DEFAULT = 0;
    GMIME_FILTER_FROM_MODE_ESCAPE = 0;
    GMIME_FILTER_FROM_MODE_ARMOR = 1;
;
{*
 * GMimeFilterFrom:
 * @parent_object: parent #GMimeFilter
 * @mode: #GMimeFilterFromMode
 * @midline: %TRUE if in the middle of a line
 *
 * A filter for armoring or escaping lines beginning with "From ".
 * }
type
  PGMimeFilterFrom = ^TGMimeFilterFrom;
  TGMimeFilterFrom = record
      parent_object : TGMimeFilter;
      mode : TGMimeFilterFromMode;
      midline : Tgboolean;
    end;

  PGMimeFilterFromClass = ^TGMimeFilterFromClass;
  TGMimeFilterFromClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_from_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_from_new(mode:TGMimeFilterFromMode):PGMimeFilter;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_FROM_H__  }

// === Konventiert am: 18-9-25 15:27:41 ===

function GMIME_TYPE_FILTER_FROM : TGType;
function GMIME_FILTER_FROM(obj : Pointer) : PGMimeFilterFrom;
function GMIME_FILTER_FROM_CLASS(klass : Pointer) : PGMimeFilterFromClass;
function GMIME_IS_FILTER_FROM(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_FROM_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_FROM_GET_CLASS(obj : Pointer) : PGMimeFilterFromClass;

implementation

function GMIME_TYPE_FILTER_FROM : TGType;
  begin
    GMIME_TYPE_FILTER_FROM:=g_mime_filter_from_get_type;
  end;

function GMIME_FILTER_FROM(obj : Pointer) : PGMimeFilterFrom;
begin
  Result := PGMimeFilterFrom(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_FROM));
end;

function GMIME_FILTER_FROM_CLASS(klass : Pointer) : PGMimeFilterFromClass;
begin
  Result := PGMimeFilterFromClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_FROM));
end;

function GMIME_IS_FILTER_FROM(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_FROM);
end;

function GMIME_IS_FILTER_FROM_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_FROM);
end;

function GMIME_FILTER_FROM_GET_CLASS(obj : Pointer) : PGMimeFilterFromClass;
begin
  Result := PGMimeFilterFromClass(PGTypeInstance(obj)^.g_class);
end;



end.
