
unit geocode_location;
interface

{
  Automatically converted by H2Pas 1.0.0 from geocode_location.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    geocode_location.h
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
PGeocodeLocation  = ^GeocodeLocation;
PGeocodeLocationClass  = ^GeocodeLocationClass;
PGeocodeLocationCRS  = ^GeocodeLocationCRS;
PGeocodeLocationPrivate  = ^GeocodeLocationPrivate;
PGeocodeLocationURIScheme  = ^GeocodeLocationURIScheme;
PGError  = ^GError;
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

function geocode_location_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GEOCODE_TYPE_LOCATION : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_LOCATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_LOCATION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_LOCATION(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_LOCATION_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_LOCATION_GET_CLASS(obj : longint) : longint;

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

function geocode_location_new(latitude:Tgdouble; longitude:Tgdouble; accuracy:Tgdouble):PGeocodeLocation;cdecl;external;
(* Const before type ignored *)
function geocode_location_new_with_description(latitude:Tgdouble; longitude:Tgdouble; accuracy:Tgdouble; description:Pchar):PGeocodeLocation;cdecl;external;
function geocode_location_equal(a:PGeocodeLocation; b:PGeocodeLocation):Tgboolean;cdecl;external;
(* Const before type ignored *)
function geocode_location_set_from_uri(loc:PGeocodeLocation; uri:Pchar; error:PPGError):Tgboolean;cdecl;external;
function geocode_location_to_uri(loc:PGeocodeLocation; scheme:TGeocodeLocationURIScheme):Pchar;cdecl;external;
function geocode_location_get_distance_from(loca:PGeocodeLocation; locb:PGeocodeLocation):Tdouble;cdecl;external;
(* Const before type ignored *)
procedure geocode_location_set_description(loc:PGeocodeLocation; description:Pchar);cdecl;external;
(* Const before type ignored *)
function geocode_location_get_description(loc:PGeocodeLocation):Pchar;cdecl;external;
function geocode_location_get_latitude(loc:PGeocodeLocation):Tgdouble;cdecl;external;
function geocode_location_get_longitude(loc:PGeocodeLocation):Tgdouble;cdecl;external;
function geocode_location_get_altitude(loc:PGeocodeLocation):Tgdouble;cdecl;external;
function geocode_location_get_crs(loc:PGeocodeLocation):TGeocodeLocationCRS;cdecl;external;
function geocode_location_get_accuracy(loc:PGeocodeLocation):Tgdouble;cdecl;external;
function geocode_location_get_timestamp(loc:PGeocodeLocation):Tguint64;cdecl;external;
{$endif}
{ GEOCODE_LOCATION_H  }

implementation

{ was #define dname def_expr }
function GEOCODE_TYPE_LOCATION : longint; { return type might be wrong }
  begin
    GEOCODE_TYPE_LOCATION:=geocode_location_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_LOCATION(obj : longint) : longint;
begin
  GEOCODE_LOCATION:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEOCODE_TYPE_LOCATION,GeocodeLocation);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_LOCATION_CLASS(klass : longint) : longint;
begin
  GEOCODE_LOCATION_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEOCODE_TYPE_LOCATION,GeocodeLocationClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_LOCATION(obj : longint) : longint;
begin
  GEOCODE_IS_LOCATION:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEOCODE_TYPE_LOCATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_LOCATION_CLASS(klass : longint) : longint;
begin
  GEOCODE_IS_LOCATION_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEOCODE_TYPE_LOCATION);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_LOCATION_GET_CLASS(obj : longint) : longint;
begin
  GEOCODE_LOCATION_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEOCODE_TYPE_LOCATION,GeocodeLocationClass);
end;

{ was #define dname def_expr }
function GEOCODE_TYPE_LOCATION : longint; { return type might be wrong }
  begin
    GEOCODE_TYPE_LOCATION:=geocode_location_get_type;
  end;


end.
