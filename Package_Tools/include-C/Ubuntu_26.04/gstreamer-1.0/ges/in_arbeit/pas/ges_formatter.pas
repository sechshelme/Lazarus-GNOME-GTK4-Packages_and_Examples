unit ges_formatter;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer Editing Services
 * Copyright (C) 2010 Brandon Lewis <brandon.lewis@collabora.co.uk>
 *               2010 Nokia Corporation
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
{$include <ges/ges-timeline.h>}

{GES_DECLARE_TYPE(Formatter, formatter, FORMATTER); }
{*
 * GESFormatter:
 *
 * Base class for timeline data serialization and deserialization.
  }
{< private > }
{< protected > }
{ Padding for API extension  }
type
  PGESFormatter = ^TGESFormatter;
  TGESFormatter = record
      parent : TGInitiallyUnowned;
      priv : PGESFormatterPrivate;
      project : PGESProject;
      timeline : PGESTimeline;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


  TGESFormatterCanLoadURIMethod = function (dummy_instance:PGESFormatter; uri:Pgchar; error:PPGError):Tgboolean;cdecl;
{*
 * GESFormatterLoadFromURIMethod:
 * @formatter: a #GESFormatter
 * @timeline: a #GESTimeline
 * @uri: the URI to load from
 * @error: An error to be set in case something wrong happens or %NULL
 *
 * Virtual method for loading a timeline from a given URI.
 *
 * Every #GESFormatter subclass needs to implement this method.
 *
 * Returns: TRUE if the @timeline was properly loaded from the given @uri,
 * else FALSE.
 * }

  TGESFormatterLoadFromURIMethod = function (formatter:PGESFormatter; timeline:PGESTimeline; uri:Pgchar; error:PPGError):Tgboolean;cdecl;
{*
 * GESFormatterSaveToURIMethod:
 * @formatter: a #GESFormatter
 * @timeline: a #GESTimeline
 * @uri: the URI to save to
 * @overwrite: Whether the file should be overwritten in case it exists
 * @error: An error to be set in case something wrong happens or %NULL
 *
 * Virtual method for saving a timeline to a uri.
 *
 * Every #GESFormatter subclass needs to implement this method.
 *
 * Returns: TRUE if the @timeline was properly stored to the given @uri,
 * else FALSE.
  }

  TGESFormatterSaveToURIMethod = function (formatter:PGESFormatter; timeline:PGESTimeline; uri:Pgchar; overwrite:Tgboolean; error:PPGError):Tgboolean;cdecl;
{*
 * GESFormatterClass:
 * @parent_class: the parent class structure
 * @can_load_uri: Whether the URI can be loaded
 * @load_from_uri: class method to deserialize data from a URI
 * @save_to_uri: class method to serialize data to a URI
 *
 * GES Formatter class. Override the vmethods to implement the formatter functionnality.
  }
{ TODO 2.0: Rename the loading method to can_load and load.
   * Technically we just pass data to load, it should not necessarily
   * be a URI  }
{ < private >  }
{ Padding for API extension  }
  PGESFormatterClass = ^TGESFormatterClass;
  TGESFormatterClass = record
      parent_class : TGInitiallyUnownedClass;cdecl;
      can_load_uri : TGESFormatterCanLoadURIMethod;
      load_from_uri : TGESFormatterLoadFromURIMethod;
      save_to_uri : TGESFormatterSaveToURIMethod;
      name : Pgchar;
      description : Pgchar;
      extension : Pgchar;
      mimetype : Pgchar;
      version : Tgdouble;
      rank : TGstRank;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;


procedure ges_formatter_class_register_metas(klass:PGESFormatterClass; name:Pgchar; description:Pgchar; extensions:Pgchar; caps:Pgchar; 
            version:Tgdouble; rank:TGstRank);cdecl;external libges;
function ges_formatter_can_load_uri(uri:Pgchar; error:PPGError):Tgboolean;cdecl;external libges;
function ges_formatter_can_save_uri(uri:Pgchar; error:PPGError):Tgboolean;cdecl;external libges;
{xxxxxxGES_DEPRECATED_FOR(ges_timeline_load_from_uri) }
function ges_formatter_load_from_uri(formatter:PGESFormatter; timeline:PGESTimeline; uri:Pgchar; error:PPGError):Tgboolean;cdecl;external libges;
{xxxxxxxxGES_DEPRECATED_FOR(ges_timeline_save_to_uri) }
function ges_formatter_save_to_uri(formatter:PGESFormatter; timeline:PGESTimeline; uri:Pgchar; overwrite:Tgboolean; error:PPGError):Tgboolean;cdecl;external libges;
function ges_formatter_get_default:PGESAsset;cdecl;external libges;
function ges_find_formatter_for_uri(uri:Pgchar):PGESAsset;cdecl;external libges;

// === Konventiert am: 27-7-26 20:01:39 ===

function GES_TYPE_FORMATTER: TGType;
function GES_FORMATTER(obj: Pointer): PGESFormatter;
function GES_IS_FORMATTER(obj: Pointer): Tgboolean;
function GES_FORMATTER_CLASS(klass: Pointer): PGESFormatterClass;
function GES_IS_FORMATTER_CLASS(klass: Pointer): Tgboolean;
function GES_FORMATTER_GET_CLASS(obj: Pointer): PGESFormatterClass;

implementation

function GES_TYPE_FORMATTER: TGType;
begin
  Result := ges_formatter_get_type;
end;

function GES_FORMATTER(obj: Pointer): PGESFormatter;
begin
  Result := PGESFormatter(g_type_check_instance_cast(obj, GES_TYPE_FORMATTER));
end;

function GES_IS_FORMATTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_FORMATTER);
end;

function GES_FORMATTER_CLASS(klass: Pointer): PGESFormatterClass;
begin
  Result := PGESFormatterClass(g_type_check_class_cast(klass, GES_TYPE_FORMATTER));
end;

function GES_IS_FORMATTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_FORMATTER);
end;

function GES_FORMATTER_GET_CLASS(obj: Pointer): PGESFormatterClass;
begin
  Result := PGESFormatterClass(PGTypeInstance(obj)^.g_class);
end;

type 
  PGESFormatterPrivate = type Pointer

function ges_formatter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
