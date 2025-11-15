
unit geocode_nominatim;
interface

{
  Automatically converted by H2Pas 1.0.0 from geocode_nominatim.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    geocode_nominatim.h
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
PGCancellable  = ^GCancellable;
Pgchar  = ^gchar;
PGeocodeNominatim  = ^GeocodeNominatim;
PGeocodeNominatimClass  = ^GeocodeNominatimClass;
PGError  = ^GError;
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

{ was #define dname def_expr }
function GEOCODE_TYPE_NOMINATIM : longint; { return type might be wrong }

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
(* Const before type ignored *)
(* Const before type ignored *)
type
  PGeocodeNominatimClass = ^TGeocodeNominatimClass;
  TGeocodeNominatimClass = record
      parent_class : TGObjectClass;
      query : function (self:PGeocodeNominatim; uri:Pgchar; cancellable:PGCancellable; error:PPGError):Pgchar;cdecl;
      query_async : procedure (self:PGeocodeNominatim; uri:Pgchar; cancellable:PGCancellable; callback:TGAsyncReadyCallback; user_data:Tgpointer);cdecl;
      query_finish : function (self:PGeocodeNominatim; res:PGAsyncResult; error:PPGError):Pgchar;cdecl;
    end;

(* Const before type ignored *)
(* Const before type ignored *)

function geocode_nominatim_new(base_url:Pgchar; maintainer_email_address:Pgchar):PGeocodeNominatim;cdecl;external;
function geocode_nominatim_get_gnome:PGeocodeNominatim;cdecl;external;
{$endif}
{ GEOCODE_NOMINATIM_H  }

implementation

{ was #define dname def_expr }
function GEOCODE_TYPE_NOMINATIM : longint; { return type might be wrong }
  begin
    GEOCODE_TYPE_NOMINATIM:=geocode_nominatim_get_type;
  end;


end.
