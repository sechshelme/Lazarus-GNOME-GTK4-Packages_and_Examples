unit ges_multi_file_source;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2013 Lubosz Sarnecki <lubosz@gmail.com>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
(** unsupported pragma#pragma once*)
{$include <glib-object.h>}
{$include <ges/ges-types.h>}
{$include <ges/ges-video-source.h>}

{GES_DECLARE_TYPE(MultiFileSource, multi_file_source, MULTI_FILE_SOURCE); }
{*
 * GESMultiFileSource:
  }
{< private >  }
{ Padding for API extension  }
type
  PGESMultiFileSource = ^TGESMultiFileSource;
  TGESMultiFileSource = record
      parent : TGESVideoSource;
      uri : Pgchar;
      priv : PGESMultiFileSourcePrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;

{ Padding for API extension  }
  PGESMultiFileSourceClass = ^TGESMultiFileSourceClass;
  TGESMultiFileSourceClass = record
      parent_class : TGESVideoSourceClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


function ges_multi_file_source_new(uri:Pgchar):PGESMultiFileSource;cdecl;external libges;
const
  GES_MULTI_FILE_URI_PREFIX = 'multifile://';  

// === Konventiert am: 27-7-26 20:00:41 ===

function GES_TYPE_MULTI_FILE_SOURCE: TGType;
function GES_MULTI_FILE_SOURCE(obj: Pointer): PGESMultiFileSource;
function GES_IS_MULTI_FILE_SOURCE(obj: Pointer): Tgboolean;
function GES_MULTI_FILE_SOURCE_CLASS(klass: Pointer): PGESMultiFileSourceClass;
function GES_IS_MULTI_FILE_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_MULTI_FILE_SOURCE_GET_CLASS(obj: Pointer): PGESMultiFileSourceClass;

implementation

function GES_TYPE_MULTI_FILE_SOURCE: TGType;
begin
  Result := ges_multi_file_source_get_type;
end;

function GES_MULTI_FILE_SOURCE(obj: Pointer): PGESMultiFileSource;
begin
  Result := PGESMultiFileSource(g_type_check_instance_cast(obj, GES_TYPE_MULTI_FILE_SOURCE));
end;

function GES_IS_MULTI_FILE_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_MULTI_FILE_SOURCE);
end;

function GES_MULTI_FILE_SOURCE_CLASS(klass: Pointer): PGESMultiFileSourceClass;
begin
  Result := PGESMultiFileSourceClass(g_type_check_class_cast(klass, GES_TYPE_MULTI_FILE_SOURCE));
end;

function GES_IS_MULTI_FILE_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_MULTI_FILE_SOURCE);
end;

function GES_MULTI_FILE_SOURCE_GET_CLASS(obj: Pointer): PGESMultiFileSourceClass;
begin
  Result := PGESMultiFileSourceClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESMultiFileSourcePrivate = type Pointer

function ges_multi_file_source_get_type: TGType; cdecl; external libgxxxxxxx;



end.
