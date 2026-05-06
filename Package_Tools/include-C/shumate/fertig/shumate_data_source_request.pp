
unit shumate_data_source_request;
interface

{
  Automatically converted by H2Pas 1.0.0 from shumate_data_source_request.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    shumate_data_source_request.h
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
PGBytes  = ^GBytes;
PGError  = ^GError;
PShumateDataSourceRequest  = ^ShumateDataSourceRequest;
PShumateDataSourceRequestClass  = ^ShumateDataSourceRequestClass;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2023 James Westman <james@jwestman.net>
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
{$if !defined (__SHUMATE_SHUMATE_H_INSIDE__) && !defined (SHUMATE_COMPILATION)}
{$error "Only <shumate/shumate.h> can be included directly."}
{$endif}
{$include <glib-object.h>}

{ was #define dname def_expr }
function SHUMATE_TYPE_DATA_SOURCE_REQUEST : longint; { return type might be wrong }

{//G_DECLARE_DERIVABLE_TYPE (ShumateDataSourceRequest, shumate_data_source_request, SHUMATE, DATA_SOURCE_REQUEST, GObject) }
{< private > }
type
  PShumateDataSourceRequestClass = ^TShumateDataSourceRequestClass;
  TShumateDataSourceRequestClass = record
      parent_class : TGObjectClass;
      padding : array[0..15] of Tgpointer;
    end;


function shumate_data_source_request_new(x:longint; y:longint; zoom_level:longint):PShumateDataSourceRequest;cdecl;external;
function shumate_data_source_request_get_x(self:PShumateDataSourceRequest):longint;cdecl;external;
function shumate_data_source_request_get_y(self:PShumateDataSourceRequest):longint;cdecl;external;
function shumate_data_source_request_get_zoom_level(self:PShumateDataSourceRequest):longint;cdecl;external;
function shumate_data_source_request_get_data(self:PShumateDataSourceRequest):PGBytes;cdecl;external;
procedure shumate_data_source_request_emit_data(self:PShumateDataSourceRequest; data:PGBytes; complete:Tgboolean);cdecl;external;
function shumate_data_source_request_get_error(self:PShumateDataSourceRequest):PGError;cdecl;external;
(* Const before type ignored *)
procedure shumate_data_source_request_emit_error(self:PShumateDataSourceRequest; error:PGError);cdecl;external;
function shumate_data_source_request_is_completed(self:PShumateDataSourceRequest):Tgboolean;cdecl;external;
procedure shumate_data_source_request_complete(self:PShumateDataSourceRequest);cdecl;external;

implementation

{ was #define dname def_expr }
function SHUMATE_TYPE_DATA_SOURCE_REQUEST : longint; { return type might be wrong }
  begin
    SHUMATE_TYPE_DATA_SOURCE_REQUEST:=shumate_data_source_request_get_type;
  end;


end.
