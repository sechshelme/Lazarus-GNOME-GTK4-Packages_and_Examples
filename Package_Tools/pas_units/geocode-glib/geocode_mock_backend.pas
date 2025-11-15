unit geocode_mock_backend;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2016 Collabora Ltd.
 *
 * The geocode-glib library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public License as
 * published by the Free Software Foundation; either version 2 of the
 * License, or (at your option) any later version.
 *
 * The geocode-glib library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with the Gnome Library; see the file COPYING.LIB.  If not,
 * write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301  USA.
 *
 * Authors: Philip Withnall <philip.withnall@collabora.co.uk>
  }
{$ifndef GEOCODE_MOCK_BACKEND_H}
{$define GEOCODE_MOCK_BACKEND_H}
{$include <glib.h>}
{$include <glib-object.h>}
{*
 * GeocodeMockBackend:
 *
 * All the fields in the #GeocodeMockBackend structure are private and should
 * never be accessed directly.
 *
 * Since: 3.23.1
  }

{G_DECLARE_FINAL_TYPE (GeocodeMockBackend, geocode_mock_backend, GEOCODE, MOCK_BACKEND, GObject) }
{*
 * GEOCODE_TYPE_MOCK_BACKEND:
 *
 * See #GeocodeMockBackend.
 *
 * Since: 3.23.1
  }
function geocode_mock_backend_new:PGeocodeMockBackend;cdecl;external geocode_glib;
procedure geocode_mock_backend_add_forward_result(self:PGeocodeMockBackend; params:PGHashTable; results:PGList; error:PGError);cdecl;external geocode_glib;
procedure geocode_mock_backend_add_reverse_result(self:PGeocodeMockBackend; params:PGHashTable; results:PGList; error:PGError);cdecl;external geocode_glib;
procedure geocode_mock_backend_clear(self:PGeocodeMockBackend);cdecl;external geocode_glib;
{*
 * GeocodeMockBackendQuery:
 * @params: query parameters, in the format accepted by geocode_forward_search()
 *     (if @is_forward is %TRUE) or geocode_reverse_resolve() (otherwise)
 * @is_forward: %TRUE if this represents a call to geocode_forward_search();
 *     %FALSE if it represents a call to geocode_reverse_resolve()
 * @results: (nullable) (element-type GeocodePlace): results returned by the
 *     query, or %NULL if an error was returned
 * @error: (nullable): error returned by the query, or %NULL if a result set
 *     was returned
 *
 * The details of a forward or reverse query which was performed on a
 * #GeocodeMockBackend by application code. This includes the input (@params,
 * @is_forward), and the output which was returned (@results or @error).
 *
 * Empty result sets are represented by the %GEOCODE_ERROR_NO_MATCHES error
 * (for forward queries) or the %GEOCODE_ERROR_NOT_SUPPORTED error (for reverse
 * queries), rather than an empty @results list.
 *
 * Since: 3.23.1
  }
{ Request  }
{ Response  }
type
  PGeocodeMockBackendQuery = ^TGeocodeMockBackendQuery;
  TGeocodeMockBackendQuery = record
      params : PGHashTable;
      is_forward : Tgboolean;
      results : PGList;
      error : PGError;
    end;

function geocode_mock_backend_get_query_log(self:PGeocodeMockBackend):PGPtrArray;cdecl;external geocode_glib;
{$endif}
{ GEOCODE_MOCK_BACKEND_H  }

// === Konventiert am: 15-11-25 16:52:39 ===

function GEOCODE_TYPE_MOCK_BACKEND: TGType;
function GEOCODE_MOCK_BACKEND(obj: Pointer): PGeocodeMockBackend;
function GEOCODE_IS_MOCK_BACKEND(obj: Pointer): Tgboolean;

implementation

function GEOCODE_TYPE_MOCK_BACKEND: TGType;
begin
  Result := geocode_mock_backend_get_type;
end;

function GEOCODE_MOCK_BACKEND(obj: Pointer): PGeocodeMockBackend;
begin
  Result := PGeocodeMockBackend(g_type_check_instance_cast(obj, GEOCODE_TYPE_MOCK_BACKEND));
end;

function GEOCODE_IS_MOCK_BACKEND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_MOCK_BACKEND);
end;

type 
  TGeocodeMockBackend = record
  end;
  PGeocodeMockBackend = ^TGeocodeMockBackend;

  TGeocodeMockBackendClass = record
    parent_class: TGObjectClass;
  end;
  PGeocodeMockBackendClass = ^TGeocodeMockBackendClass;

function geocode_mock_backend_get_type: TGType; cdecl; external libgxxxxxxx;



end.
