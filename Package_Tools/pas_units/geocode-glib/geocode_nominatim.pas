unit geocode_nominatim;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright 2011-2016 Bastien Nocera
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
 * Authors: Bastien Nocera <hadess@hadess.net>
 *          Aleksander Morgado <aleksander.morgado@collabora.co.uk>
 *          Philip Withnall <philip.withnall@collabora.co.uk>
  }
{$ifndef GEOCODE_NOMINATIM_H}
{$define GEOCODE_NOMINATIM_H}
{$include <glib.h>}
{$include <gio/gio.h>}
{$include "geocode-place.h"}
{*
 * GeocodeNominatim:
 *
 * All the fields in the #GeocodeNominatim structure are private and should
 * never be accessed directly.
 *
 * Since: 3.23.1
  }

{G_DECLARE_DERIVABLE_TYPE (GeocodeNominatim, geocode_nominatim, GEOCODE, NOMINATIM, GObject) }
{*
 * GEOCODE_TYPE_NOMINATIM:
 *
 * See #GeocodeNominatim.
 *
 * Since: 3.23.1
  }
{*
 * GeocodeNominatimClass:
 * @query: synchronous query function to override network `GET` requests.
 * @query_async: asynchronous version of @query.
 * @query_finish: asynchronous finish function for @query_async.
 *
 * #GeocodeNominatim allows derived classes to override its query functions,
 * which are called for each network request the Nominatim client makes. All
 * network requests are `GET`s with no request body; just a URI. The default
 * implementation makes the requests internally, but derived classes may want
 * to override these queries to check the URIs for testing, for example.
 *
 * Applications should not normally have to derive #GeocodeNominatim; these
 * virtual methods are mainly intended for testing.
 *
 * Since: 3.23.1
  }
type
  PGeocodeNominatimClass = ^TGeocodeNominatimClass;
  TGeocodeNominatimClass = record
      parent_class : TGObjectClass;
      query : function (self:PGeocodeNominatim; uri:Pgchar; cancellable:PGCancellable; error:PPGError):Pgchar;cdecl;
      query_async : procedure (self:PGeocodeNominatim; uri:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      query_finish : function (self:PGeocodeNominatim; res:PGAsyncResult; error:PPGError):Pgchar;cdecl;
    end;


function geocode_nominatim_new(base_url:Pgchar; maintainer_email_address:Pgchar):PGeocodeNominatim;cdecl;external geocode_glib;
function geocode_nominatim_get_gnome:PGeocodeNominatim;cdecl;external geocode_glib;
{$endif}
{ GEOCODE_NOMINATIM_H  }

// === Konventiert am: 15-11-25 16:52:45 ===

function GEOCODE_TYPE_NOMINATIM: TGType;
function GEOCODE_NOMINATIM(obj: Pointer): PGeocodeNominatim;
function GEOCODE_IS_NOMINATIM(obj: Pointer): Tgboolean;
function GEOCODE_NOMINATIM_CLASS(klass: Pointer): PGeocodeNominatimClass;
function GEOCODE_IS_NOMINATIM_CLASS(klass: Pointer): Tgboolean;
function GEOCODE_NOMINATIM_GET_CLASS(obj: Pointer): PGeocodeNominatimClass;

implementation

function GEOCODE_TYPE_NOMINATIM: TGType;
begin
  Result := geocode_nominatim_get_type;
end;

function GEOCODE_NOMINATIM(obj: Pointer): PGeocodeNominatim;
begin
  Result := PGeocodeNominatim(g_type_check_instance_cast(obj, GEOCODE_TYPE_NOMINATIM));
end;

function GEOCODE_IS_NOMINATIM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEOCODE_TYPE_NOMINATIM);
end;

function GEOCODE_NOMINATIM_CLASS(klass: Pointer): PGeocodeNominatimClass;
begin
  Result := PGeocodeNominatimClass(g_type_check_class_cast(klass, GEOCODE_TYPE_NOMINATIM));
end;

function GEOCODE_IS_NOMINATIM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GEOCODE_TYPE_NOMINATIM);
end;

function GEOCODE_NOMINATIM_GET_CLASS(obj: Pointer): PGeocodeNominatimClass;
begin
  Result := PGeocodeNominatimClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGeocodeNominatim = record
    parent_instance: TGObject;
  end;
  PGeocodeNominatim = ^TGeocodeNominatim;

  TGeocodeNominatimClass = record
  end;
  PGeocodeNominatimClass = ^TGeocodeNominatimClass;

function geocode_nominatim_get_type: TGType; cdecl; external libgxxxxxxx;



end.
