unit geocode_location;

interface

uses
  fp_glib2;

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
{$ifndef GEOCODE_LOCATION_H}
{$define GEOCODE_LOCATION_H}
{$include <glib-object.h>}

function geocode_location_get_type:TGType;cdecl;external geocode_glib;
type
{*
 * GeocodeLocation:
 *
 * All the fields in the #GeocodeLocation structure are private and should never be accessed directly.
* }
{ <private>  }
  PGeocodeLocation = ^TGeocodeLocation;
  TGeocodeLocation = record
      parent_instance : TGObject;
      priv : PGeocodeLocationPrivate;
    end;

{*
 * GeocodeLocationClass:
 *
 * All the fields in the #GeocodeLocationClass structure are private and should never be accessed directly.
* }
{ <private>  }
  PGeocodeLocationClass = ^TGeocodeLocationClass;
  TGeocodeLocationClass = record
      parent_class : TGObjectClass;
    end;

{*
 * GeocodeLocationURIScheme:
 * @GEOCODE_LOCATION_URI_SCHEME_GEO: The 'geo' URI scheme, RFC 5870
 *
 * The URI scheme for this location.
  }

  PGeocodeLocationURIScheme = ^TGeocodeLocationURIScheme;
  TGeocodeLocationURIScheme =  Longint;
  Const
    GEOCODE_LOCATION_URI_SCHEME_GEO = 0;
;
{*
 * GeocodeLocationCRS:
 * @GEOCODE_LOCATION_CRS_WGS84: CRS is World Geodetic System, standard for Earth.
 *
 * Coordinate Reference System Identification for a location.
  }
type
  PGeocodeLocationCRS = ^TGeocodeLocationCRS;
  TGeocodeLocationCRS =  Longint;
  Const
    GEOCODE_LOCATION_CRS_WGS84 = 0;
;
{*
 * GEOCODE_LOCATION_ALTITUDE_UNKNOWN:
 *
 * Constant representing unknown altitude.
  }
  GEOCODE_LOCATION_ALTITUDE_UNKNOWN = -(G_MAXDOUBLE);  
{*
 * GEOCODE_LOCATION_ACCURACY_UNKNOWN:
 *
 * Constant representing unknown accuracy.
  }
  GEOCODE_LOCATION_ACCURACY_UNKNOWN = -(1);  
{*
 * GEOCODE_LOCATION_ACCURACY_STREET:
 *
 * Constant representing street-level accuracy.
  }
{ 1 km  }
  GEOCODE_LOCATION_ACCURACY_STREET = 1000;  
{*
 * GEOCODE_LOCATION_ACCURACY_CITY:
 *
 * Constant representing city-level accuracy.
  }
{ 15 km  }
  GEOCODE_LOCATION_ACCURACY_CITY = 15000;  
{*
 * GEOCODE_LOCATION_ACCURACY_REGION:
 *
 * Constant representing region-level accuracy.
  }
{ 50 km  }
  GEOCODE_LOCATION_ACCURACY_REGION = 50000;  
{*
 * GEOCODE_LOCATION_ACCURACY_COUNTRY:
 *
 * Constant representing country-level accuracy.
  }
{ 300 km  }
  GEOCODE_LOCATION_ACCURACY_COUNTRY = 300000;  
{*
 * GEOCODE_LOCATION_ACCURACY_CONTINENT:
 *
 * Constant representing continent-level accuracy.
  }
{ 3000 km  }
  GEOCODE_LOCATION_ACCURACY_CONTINENT = 3000000;  

{ was #define dname def_expr }
function GEOCODE_TYPE_LOCATION : longint; { return type might be wrong }

function geocode_location_new(latitude:Tgdouble; longitude:Tgdouble; accuracy:Tgdouble):PGeocodeLocation;cdecl;external geocode_glib;
function geocode_location_new_with_description(latitude:Tgdouble; longitude:Tgdouble; accuracy:Tgdouble; description:Pchar):PGeocodeLocation;cdecl;external geocode_glib;
function geocode_location_equal(a:PGeocodeLocation; b:PGeocodeLocation):Tgboolean;cdecl;external geocode_glib;
function geocode_location_set_from_uri(loc:PGeocodeLocation; uri:Pchar; error:PPGError):Tgboolean;cdecl;external geocode_glib;
function geocode_location_to_uri(loc:PGeocodeLocation; scheme:TGeocodeLocationURIScheme):Pchar;cdecl;external geocode_glib;
function geocode_location_get_distance_from(loca:PGeocodeLocation; locb:PGeocodeLocation):Tdouble;cdecl;external geocode_glib;
procedure geocode_location_set_description(loc:PGeocodeLocation; description:Pchar);cdecl;external geocode_glib;
function geocode_location_get_description(loc:PGeocodeLocation):Pchar;cdecl;external geocode_glib;
function geocode_location_get_latitude(loc:PGeocodeLocation):Tgdouble;cdecl;external geocode_glib;
function geocode_location_get_longitude(loc:PGeocodeLocation):Tgdouble;cdecl;external geocode_glib;
function geocode_location_get_altitude(loc:PGeocodeLocation):Tgdouble;cdecl;external geocode_glib;
function geocode_location_get_crs(loc:PGeocodeLocation):TGeocodeLocationCRS;cdecl;external geocode_glib;
function geocode_location_get_accuracy(loc:PGeocodeLocation):Tgdouble;cdecl;external geocode_glib;
function geocode_location_get_timestamp(loc:PGeocodeLocation):Tguint64;cdecl;external geocode_glib;
{$endif}
{ GEOCODE_LOCATION_H  }

// === Konventiert am: 15-11-25 16:52:29 ===

function GEOCODE_TYPE_LOCATION : TGType;
function GEOCODE_LOCATION(obj : Pointer) : PGeocodeLocation;
function GEOCODE_LOCATION_CLASS(klass : Pointer) : PGeocodeLocationClass;
function GEOCODE_IS_LOCATION(obj : Pointer) : Tgboolean;
function GEOCODE_IS_LOCATION_CLASS(klass : Pointer) : Tgboolean;
function GEOCODE_LOCATION_GET_CLASS(obj : Pointer) : PGeocodeLocationClass;

implementation

function GEOCODE_TYPE_LOCATION : TGType;
  begin
    GEOCODE_TYPE_LOCATION:=geocode_location_get_type;
  end;

function GEOCODE_LOCATION(obj : Pointer) : PGeocodeLocation;
begin
  Result := PGeocodeLocation(g_type_check_instance_cast(obj, GEOCODE_TYPE_LOCATION));
end;

function GEOCODE_LOCATION_CLASS(klass : Pointer) : PGeocodeLocationClass;
begin
  Result := PGeocodeLocationClass(g_type_check_class_cast(klass, GEOCODE_TYPE_LOCATION));
end;

function GEOCODE_IS_LOCATION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GEOCODE_TYPE_LOCATION);
end;

function GEOCODE_IS_LOCATION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GEOCODE_TYPE_LOCATION);
end;

function GEOCODE_LOCATION_GET_CLASS(obj : Pointer) : PGeocodeLocationClass;
begin
  Result := PGeocodeLocationClass(PGTypeInstance(obj)^.g_class);
end;


{ was #define dname def_expr }
function GEOCODE_TYPE_LOCATION : longint; { return type might be wrong }
  begin
    GEOCODE_TYPE_LOCATION:=geocode_location_get_type;
  end;


end.
