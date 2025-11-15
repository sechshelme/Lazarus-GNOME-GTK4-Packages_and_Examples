
unit geocode_place;
interface

{
  Automatically converted by H2Pas 1.0.0 from geocode_place.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    geocode_place.h
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
Pchar  = ^char;
PGeocodeBoundingBox  = ^GeocodeBoundingBox;
PGeocodeLocation  = ^GeocodeLocation;
PGeocodePlace  = ^GeocodePlace;
PGeocodePlaceClass  = ^GeocodePlaceClass;
PGeocodePlaceOsmType  = ^GeocodePlaceOsmType;
PGeocodePlacePrivate  = ^GeocodePlacePrivate;
PGeocodePlaceType  = ^GeocodePlaceType;
PGIcon  = ^GIcon;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
   Copyright 2012 Bastien Nocera

   The Gnome Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Library General Public License as
   published by the Free Software Foundation; either version 2 of the
   License, or (at your option) any later version.

   The Gnome Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Library General Public License for more details.

   You should have received a copy of the GNU Library General Public
   License along with the Gnome Library; see the file COPYING.LIB.  If not,
   write to the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301  USA.

   Authors: Bastien Nocera <hadess@hadess.net>
            Zeeshan Ali (Khattak) <zeeshanak@gnome.org>

  }
{$ifndef GEOCODE_PLACE_H}
{$define GEOCODE_PLACE_H}
{$include <glib-object.h>}
{$include <gio/gio.h>}
{$include <geocode-glib/geocode-location.h>}
{$include <geocode-glib/geocode-bounding-box.h>}

function geocode_place_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GEOCODE_TYPE_PLACE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_PLACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_PLACE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_PLACE(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_PLACE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_PLACE_GET_CLASS(obj : longint) : longint;

type
{*
 * GeocodePlace:
 *
 * All the fields in the #GeocodePlace structure are private and should never be accessed directly.
* }
{ <private>  }
  PGeocodePlace = ^TGeocodePlace;
  TGeocodePlace = record
      parent_instance : TGObject;
      priv : PGeocodePlacePrivate;
    end;

{*
 * GeocodePlaceClass:
 *
 * All the fields in the #GeocodePlaceClass structure are private and should never be accessed directly.
* }
{ <private>  }
  PGeocodePlaceClass = ^TGeocodePlaceClass;
  TGeocodePlaceClass = record
      parent_class : TGObjectClass;
    end;

{*
 * GeocodePlaceType:
 * @GEOCODE_PLACE_TYPE_UNKNOWN: Type is unknown for this place.
 * @GEOCODE_PLACE_TYPE_BUILDING: A building or house.
 * @GEOCODE_PLACE_TYPE_STREET: A street.
 * @GEOCODE_PLACE_TYPE_TOWN: A populated settlement such as a city, town, village.
 * @GEOCODE_PLACE_TYPE_STATE: One of the primary administrative areas within a country.
 * @GEOCODE_PLACE_TYPE_COUNTY: One of the secondary administrative areas within a country.
 * @GEOCODE_PLACE_TYPE_LOCAL_ADMINISTRATIVE_AREA: One of the tertiary administrative areas within a country.
 * @GEOCODE_PLACE_TYPE_POSTAL_CODE: A partial or full postal code.
 * @GEOCODE_PLACE_TYPE_COUNTRY: One of the countries or dependent territories defined by the ISO 3166-1 standard.
 * @GEOCODE_PLACE_TYPE_ISLAND: An island.
 * @GEOCODE_PLACE_TYPE_AIRPORT: An airport.
 * @GEOCODE_PLACE_TYPE_RAILWAY_STATION: A railway station.
 * @GEOCODE_PLACE_TYPE_BUS_STOP: A bus stop.
 * @GEOCODE_PLACE_TYPE_MOTORWAY: A high capacity highways designed to safely carry fast motor traffic.
 * @GEOCODE_PLACE_TYPE_DRAINAGE: A water feature such as a river, canal, lake, bay or ocean.
 * @GEOCODE_PLACE_TYPE_LAND_FEATURE: A land feature such as a park, mountain or beach.
 * @GEOCODE_PLACE_TYPE_MISCELLANEOUS: A uncategorized place.
 * @GEOCODE_PLACE_TYPE_SUPERNAME: An area covering multiple countries.
 * @GEOCODE_PLACE_TYPE_POINT_OF_INTEREST: A point of interest such as a school, hospital or tourist attraction.
 * @GEOCODE_PLACE_TYPE_SUBURB: A subdivision of a town such as a suburb or neighborhood.
 * @GEOCODE_PLACE_TYPE_COLLOQUIAL: A place known by a colloquial name.
 * @GEOCODE_PLACE_TYPE_ZONE: An area known within a specific context such as MSA or area code.
 * @GEOCODE_PLACE_TYPE_HISTORICAL_STATE: A historical primary administrative area within a country.
 * @GEOCODE_PLACE_TYPE_HISTORICAL_COUNTY: A historical secondary administrative area within a country.
 * @GEOCODE_PLACE_TYPE_CONTINENT: One of the major land masses on the Earth.
 * @GEOCODE_PLACE_TYPE_TIME_ZONE: An area defined by the Olson standard (tz database).
 * @GEOCODE_PLACE_TYPE_ESTATE: A housing development or subdivision known by name.
 * @GEOCODE_PLACE_TYPE_HISTORICAL_TOWN: A historical populated settlement that is no longer known by its original name.
 * @GEOCODE_PLACE_TYPE_OCEAN: One of the five major bodies of water on the Earth.
 * @GEOCODE_PLACE_TYPE_SEA: An area of open water smaller than an ocean.
 * @GEOCODE_PLACE_TYPE_SCHOOL: Institution designed for learning under the supervision of teachers.
 * @GEOCODE_PLACE_TYPE_PLACE_OF_WORSHIP: All places of worship independently of the religion or denomination.
 * @GEOCODE_PLACE_TYPE_RESTAURANT: Generally formal place with sit-down facilities selling full meals served by waiters.
 * @GEOCODE_PLACE_TYPE_BAR: A bar or pub.
 * @GEOCODE_PLACE_TYPE_LIGHT_RAIL_STATION: A light rail station or tram stop.
 *
 * Type of the place.
  }

  PGeocodePlaceType = ^TGeocodePlaceType;
  TGeocodePlaceType =  Longint;
  Const
    GEOCODE_PLACE_TYPE_UNKNOWN = 0;
    GEOCODE_PLACE_TYPE_BUILDING = 1;
    GEOCODE_PLACE_TYPE_STREET = 2;
    GEOCODE_PLACE_TYPE_TOWN = 3;
    GEOCODE_PLACE_TYPE_STATE = 4;
    GEOCODE_PLACE_TYPE_COUNTY = 5;
    GEOCODE_PLACE_TYPE_LOCAL_ADMINISTRATIVE_AREA = 6;
    GEOCODE_PLACE_TYPE_POSTAL_CODE = 7;
    GEOCODE_PLACE_TYPE_COUNTRY = 8;
    GEOCODE_PLACE_TYPE_ISLAND = 9;
    GEOCODE_PLACE_TYPE_AIRPORT = 10;
    GEOCODE_PLACE_TYPE_RAILWAY_STATION = 11;
    GEOCODE_PLACE_TYPE_BUS_STOP = 12;
    GEOCODE_PLACE_TYPE_MOTORWAY = 13;
    GEOCODE_PLACE_TYPE_DRAINAGE = 14;
    GEOCODE_PLACE_TYPE_LAND_FEATURE = 15;
    GEOCODE_PLACE_TYPE_MISCELLANEOUS = 16;
    GEOCODE_PLACE_TYPE_SUPERNAME = 17;
    GEOCODE_PLACE_TYPE_POINT_OF_INTEREST = 18;
    GEOCODE_PLACE_TYPE_SUBURB = 19;
    GEOCODE_PLACE_TYPE_COLLOQUIAL = 20;
    GEOCODE_PLACE_TYPE_ZONE = 21;
    GEOCODE_PLACE_TYPE_HISTORICAL_STATE = 22;
    GEOCODE_PLACE_TYPE_HISTORICAL_COUNTY = 23;
    GEOCODE_PLACE_TYPE_CONTINENT = 24;
    GEOCODE_PLACE_TYPE_TIME_ZONE = 25;
    GEOCODE_PLACE_TYPE_ESTATE = 26;
    GEOCODE_PLACE_TYPE_HISTORICAL_TOWN = 27;
    GEOCODE_PLACE_TYPE_OCEAN = 28;
    GEOCODE_PLACE_TYPE_SEA = 29;
    GEOCODE_PLACE_TYPE_SCHOOL = 30;
    GEOCODE_PLACE_TYPE_PLACE_OF_WORSHIP = 31;
    GEOCODE_PLACE_TYPE_RESTAURANT = 32;
    GEOCODE_PLACE_TYPE_BAR = 33;
    GEOCODE_PLACE_TYPE_LIGHT_RAIL_STATION = 34;
;
{*
 * GeocodePlaceOsmType:
 * @GEOCODE_PLACE_OSM_TYPE_UNKNOWN: Unknown type
 * @GEOCODE_PLACE_OSM_TYPE_NODE: Defines a point in space.
 * @GEOCODE_PLACE_OSM_TYPE_RELATION: Used to explain how other elements work together.
 * @GEOCODE_PLACE_OSM_TYPE_WAY: Defines a linear feature and area boundaries.
 *
 * Osm type of the place.
  }
type
  PGeocodePlaceOsmType = ^TGeocodePlaceOsmType;
  TGeocodePlaceOsmType =  Longint;
  Const
    GEOCODE_PLACE_OSM_TYPE_UNKNOWN = 0;
    GEOCODE_PLACE_OSM_TYPE_NODE = 1;
    GEOCODE_PLACE_OSM_TYPE_RELATION = 2;
    GEOCODE_PLACE_OSM_TYPE_WAY = 3;
;

{ was #define dname def_expr }
function GEOCODE_TYPE_PLACE : longint; { return type might be wrong }

(* Const before type ignored *)
function geocode_place_new(name:Pchar; place_type:TGeocodePlaceType):PGeocodePlace;cdecl;external;
(* Const before type ignored *)
function geocode_place_new_with_location(name:Pchar; place_type:TGeocodePlaceType; location:PGeocodeLocation):PGeocodePlace;cdecl;external;
function geocode_place_equal(a:PGeocodePlace; b:PGeocodePlace):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_name(place:PGeocodePlace; name:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_name(place:PGeocodePlace):Pchar;cdecl;external;
function geocode_place_get_place_type(place:PGeocodePlace):TGeocodePlaceType;cdecl;external;
function geocode_place_get_bounding_box(place:PGeocodePlace):PGeocodeBoundingBox;cdecl;external;
procedure geocode_place_set_bounding_box(place:PGeocodePlace; bbox:PGeocodeBoundingBox);cdecl;external;
procedure geocode_place_set_location(place:PGeocodePlace; location:PGeocodeLocation);cdecl;external;
function geocode_place_get_location(place:PGeocodePlace):PGeocodeLocation;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_street_address(place:PGeocodePlace; street_address:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_street_address(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_street(place:PGeocodePlace; street:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_street(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_building(place:PGeocodePlace; building:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_building(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_postal_code(place:PGeocodePlace; postal_code:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_postal_code(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_area(place:PGeocodePlace; area:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_area(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_town(place:PGeocodePlace; town:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_town(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_county(place:PGeocodePlace; county:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_county(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_state(place:PGeocodePlace; state:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_state(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_administrative_area(place:PGeocodePlace; admin_area:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_administrative_area(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_country_code(place:PGeocodePlace; country_code:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_country_code(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_country(place:PGeocodePlace; country:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_country(place:PGeocodePlace):Pchar;cdecl;external;
(* Const before type ignored *)
procedure geocode_place_set_continent(place:PGeocodePlace; continent:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_place_get_continent(place:PGeocodePlace):Pchar;cdecl;external;
function geocode_place_get_icon(place:PGeocodePlace):PGIcon;cdecl;external;
(* Const before type ignored *)
function geocode_place_get_osm_id(place:PGeocodePlace):Pchar;cdecl;external;
function geocode_place_get_osm_type(place:PGeocodePlace):TGeocodePlaceOsmType;cdecl;external;
{$endif}
{ GEOCODE_PLACE_H  }

implementation

{ was #define dname def_expr }
function GEOCODE_TYPE_PLACE : longint; { return type might be wrong }
  begin
    GEOCODE_TYPE_PLACE:=geocode_place_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_PLACE(obj : longint) : longint;
begin
  GEOCODE_PLACE:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEOCODE_TYPE_PLACE,GeocodePlace);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_PLACE_CLASS(klass : longint) : longint;
begin
  GEOCODE_PLACE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEOCODE_TYPE_PLACE,GeocodePlaceClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_PLACE(obj : longint) : longint;
begin
  GEOCODE_IS_PLACE:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEOCODE_TYPE_PLACE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_PLACE_CLASS(klass : longint) : longint;
begin
  GEOCODE_IS_PLACE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEOCODE_TYPE_PLACE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_PLACE_GET_CLASS(obj : longint) : longint;
begin
  GEOCODE_PLACE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEOCODE_TYPE_PLACE,GeocodePlaceClass);
end;

{ was #define dname def_expr }
function GEOCODE_TYPE_PLACE : longint; { return type might be wrong }
  begin
    GEOCODE_TYPE_PLACE:=geocode_place_get_type;
  end;


end.
