
unit geocode_bounding_box;
interface

{
  Automatically converted by H2Pas 1.0.0 from geocode_bounding_box.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    geocode_bounding_box.h
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
PGeocodeBoundingBox  = ^GeocodeBoundingBox;
PGeocodeBoundingBoxClass  = ^GeocodeBoundingBoxClass;
PGeocodeBoundingBoxPrivate  = ^GeocodeBoundingBoxPrivate;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
   Copyright 2013 Jonas Danielsson

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

   Authors: Jonas Danielsson <jonas@threetimestwo.org>

  }
{$ifndef GEOCODE_BOUNDING_BOX_H}
{$define GEOCODE_BOUNDING_BOX_H}
{$include <glib-object.h>}

function geocode_bounding_box_get_type:TGType;cdecl;external;
{ was #define dname def_expr }
function GEOCODE_TYPE_BOUNDING_BOX : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_BOUNDING_BOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_BOUNDING_BOX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_BOUNDING_BOX(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_BOUNDING_BOX_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_BOUNDING_BOX_GET_CLASS(obj : longint) : longint;

type
{*
 * GeocodeBoundingBox:
 *
 * All the fields in the #GeocodeLocation structure are private and should
 * never be accessed directly.
* }
{ <private>  }
  PGeocodeBoundingBox = ^TGeocodeBoundingBox;
  TGeocodeBoundingBox = record
      parent_instance : TGObject;
      priv : PGeocodeBoundingBoxPrivate;
    end;

{*
 * GeocodeBoundingBoxClass:
 *
 * All the fields in the #GeocodeBoundingBoxClass structure are private and
 * should never be accessed directly.
* }
{ <private>  }
  PGeocodeBoundingBoxClass = ^TGeocodeBoundingBoxClass;
  TGeocodeBoundingBoxClass = record
      parent_class : TGObjectClass;
    end;


function geocode_bounding_box_new(top:Tgdouble; bottom:Tgdouble; left:Tgdouble; right:Tgdouble):PGeocodeBoundingBox;cdecl;external;
function geocode_bounding_box_equal(a:PGeocodeBoundingBox; b:PGeocodeBoundingBox):Tgboolean;cdecl;external;
function geocode_bounding_box_get_top(bbox:PGeocodeBoundingBox):Tgdouble;cdecl;external;
function geocode_bounding_box_get_bottom(bbox:PGeocodeBoundingBox):Tgdouble;cdecl;external;
function geocode_bounding_box_get_left(bbox:PGeocodeBoundingBox):Tgdouble;cdecl;external;
function geocode_bounding_box_get_right(bbox:PGeocodeBoundingBox):Tgdouble;cdecl;external;
{$endif}
{ GEOCODE_BOUNDING_BOX_H  }

implementation

{ was #define dname def_expr }
function GEOCODE_TYPE_BOUNDING_BOX : longint; { return type might be wrong }
  begin
    GEOCODE_TYPE_BOUNDING_BOX:=geocode_bounding_box_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_BOUNDING_BOX(obj : longint) : longint;
begin
  GEOCODE_BOUNDING_BOX:=G_TYPE_CHECK_INSTANCE_CAST(obj,GEOCODE_TYPE_BOUNDING_BOX,GeocodeBoundingBox);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_BOUNDING_BOX_CLASS(klass : longint) : longint;
begin
  GEOCODE_BOUNDING_BOX_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GEOCODE_TYPE_BOUNDING_BOX,GeocodeBoundingBoxClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_BOUNDING_BOX(obj : longint) : longint;
begin
  GEOCODE_IS_BOUNDING_BOX:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GEOCODE_TYPE_BOUNDING_BOX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_IS_BOUNDING_BOX_CLASS(klass : longint) : longint;
begin
  GEOCODE_IS_BOUNDING_BOX_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GEOCODE_TYPE_BOUNDING_BOX);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GEOCODE_BOUNDING_BOX_GET_CLASS(obj : longint) : longint;
begin
  GEOCODE_BOUNDING_BOX_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GEOCODE_TYPE_BOUNDING_BOX,GeocodeBoundingBoxClass);
end;


end.
