
unit shumate_data_source;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_data_source.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_data_source
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
PGAsyncResult  = ^GAsyncResult;
PGBytes  = ^GBytes;
PGCancellable  = ^GCancellable;
PGError  = ^GError;
PShumateDataSource  = ^ShumateDataSource;
PShumateDataSourceClass  = ^ShumateDataSourceClass;
PShumateDataSourceRequest  = ^ShumateDataSourceRequest;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2021 James Westman <james@jwestman.net>
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <https://www.gnu.org/licenses/>.
  }
(** unsupported pragma#pragma once*)
{$include <gio/gio.h>}
{$include "shumate-data-source-request.h"}

{ was #define dname def_expr }
function SHUMATE_TYPE_DATA_SOURCE : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (ShumateDataSource, shumate_data_source, SHUMATE, DATA_SOURCE, GObject) }
{< private > }
type
  PShumateDataSourceClass = ^TShumateDataSourceClass;
  TShumateDataSourceClass = record
      parent_class : TGObjectClass;
      get_tile_data_async : procedure (self:PShumateDataSource; x:longint; y:longint; zoom_level:longint; cancellable:PGCancellable; 
                    callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      get_tile_data_finish : function (self:PShumateDataSource; result:PGAsyncResult; error:PPGError):PGBytes;cdecl;
      start_request : function (self:PShumateDataSource; x:longint; y:longint; zoom_level:longint; cancellable:PGCancellable):PShumateDataSourceRequest;cdecl;
      padding : array[0..14] of Tgpointer;
    end;


procedure shumate_data_source_get_tile_data_async(self:PShumateDataSource; x:longint; y:longint; zoom_level:longint; cancellable:PGCancellable; 
            callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external;
function shumate_data_source_get_tile_data_finish(self:PShumateDataSource; result:PGAsyncResult; error:PPGError):PGBytes;cdecl;external;
function shumate_data_source_start_request(self:PShumateDataSource; x:longint; y:longint; zoom_level:longint; cancellable:PGCancellable):PShumateDataSourceRequest;cdecl;external;
function shumate_data_source_get_min_zoom_level(self:PShumateDataSource):Tguint;cdecl;external;
procedure shumate_data_source_set_min_zoom_level(self:PShumateDataSource; zoom_level:Tguint);cdecl;external;
function shumate_data_source_get_max_zoom_level(self:PShumateDataSource):Tguint;cdecl;external;
procedure shumate_data_source_set_max_zoom_level(self:PShumateDataSource; zoom_level:Tguint);cdecl;external;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_DATA_SOURCE : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_DATA_SOURCE:=shumate_data_source_get_type;
  end;


end.
