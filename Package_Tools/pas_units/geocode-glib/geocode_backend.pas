unit geocode_backend;

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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with the Gnome Library; see the file COPYING.LIB.  If not,
 * write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301  USA.
 *
 * Authors:
 *     Aleksander Morgado <aleksander.morgado@collabora.co.uk>
 *     Philip Withnall <philip.withnall@collabora.co.uk>
  }
{$ifndef GEOCODE_BACKEND_H}
{$define GEOCODE_BACKEND_H}
{$include <glib.h>}
{$include <gio/gio.h>}
{$include "geocode-place.h"}
{*
 * GeocodeBackend:
 *
 * All the fields in the #GeocodeBackend structure are private and should
 * never be accessed directly.
 *
 * Since: 3.23.1
  }

{G_DECLARE_INTERFACE (GeocodeBackend, geocode_backend, GEOCODE, BACKEND, GObject) }
{*
 * GEOCODE_TYPE_BACKEND:
 *
 * See #GeocodeBackend.
 *
 * Since: 3.23.1
  }
{*
 * GeocodeBackendInterface:
 * @forward_search: handles a synchronous forward geocoding request.
 * @forward_search_async: starts an asynchronous forward geocoding request.
 * @forward_search_finish: finishes an asynchronous forward geocoding request.
 * @reverse_resolve: handles a synchronous reverse geocoding request.
 * @reverse_resolve_async: starts an asynchronous reverse geocoding request.
 * @reverse_resolve_finish: finishes an asynchronous reverse geocoding request.
 *
 * Interface which defines the basic operations for geocoding.
 *
 * Since: 3.23.1
  }
{< private > }
{< public > }
{ Forward  }
{ Reverse  }
{< private > }
type
  PGeocodeBackendInterface = ^TGeocodeBackendInterface;
  TGeocodeBackendInterface = record
      g_iface : TGTypeInterface;
      forward_search : function (backend:PGeocodeBackend; params:PGHashTable; cancellable:PGCancellable; error:PPGError):PGList;cdecl;
      forward_search_async : procedure (backend:PGeocodeBackend; params:PGHashTable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      forward_search_finish : function (backend:PGeocodeBackend; result:PGAsyncResult; error:PPGError):PGList;cdecl;
      reverse_resolve : function (backend:PGeocodeBackend; params:PGHashTable; cancellable:PGCancellable; error:PPGError):PGList;cdecl;
      reverse_resolve_async : procedure (backend:PGeocodeBackend; params:PGHashTable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      reverse_resolve_finish : function (backend:PGeocodeBackend; result:PGAsyncResult; error:PPGError):PGList;cdecl;
      padding : array[0..3] of Tgpointer;
    end;

{ Forward geocoding operations  }

procedure geocode_backend_forward_search_async(backend:PGeocodeBackend; params:PGHashTable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external geocode_glib;
function geocode_backend_forward_search_finish(backend:PGeocodeBackend; result:PGAsyncResult; error:PPGError):PGList;cdecl;external geocode_glib;
function geocode_backend_forward_search(backend:PGeocodeBackend; params:PGHashTable; cancellable:PGCancellable; error:PPGError):PGList;cdecl;external geocode_glib;
{ Reverse geocoding operations  }
procedure geocode_backend_reverse_resolve_async(backend:PGeocodeBackend; params:PGHashTable; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;external geocode_glib;
function geocode_backend_reverse_resolve_finish(backend:PGeocodeBackend; result:PGAsyncResult; error:PPGError):PGList;cdecl;external geocode_glib;
function geocode_backend_reverse_resolve(backend:PGeocodeBackend; params:PGHashTable; cancellable:PGCancellable; error:PPGError):PGList;cdecl;external geocode_glib;
{$endif}
{ GEOCODE_BACKEND_H  }

// === Konventiert am: 15-11-25 16:50:42 ===

function GEOCODE_TYPE_BACKEND: TGType;
function GEOCODE_BACKEND(obj: Pointer): PGeocodeBackend;
function GEOCODE_IS_BACKEND(obj: Pointer): Tgboolean;
function GEOCODE_BACKEND_GET_IFACE(obj: Pointer): PGeocodeBackendInterface;

implementation

function GEOCODE_TYPE_BACKEND: TGType;
begin
  Result := geocode_backend_get_type;
end;

function GEOCODE_BACKEND(obj: Pointer): PGeocodeBackend;
begin
  Result := PGeocodeBackend(g_type_check_instance_cast(obj, GEOCODE_TYPE_BACKEND));
end;

function GEOCODE_IS_BACKEND(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_BACKEND);
end;

function GEOCODE_BACKEND_GET_IFACE(obj: Pointer): PGeocodeBackendInterface;
begin
  Result := g_type_interface_peek(obj, GEOCODE_TYPE_BACKEND);
end;

type 
  TGeocodeBackend = record
  end;
  PGeocodeBackend = ^TGeocodeBackend;

  TGeocodeBackendInterface = record
  end;
  PGeocodeBackendInterface = ^TGeocodeBackendInterface;

function geocode_backend_get_type: TGType; cdecl; external libgxxxxxxx;



end.
