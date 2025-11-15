unit geocode_bounding_box;

interface

uses
  fp_glib2;

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

function geocode_bounding_box_get_type:TGType;cdecl;external geocode_glib;
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


function geocode_bounding_box_new(top:Tgdouble; bottom:Tgdouble; left:Tgdouble; right:Tgdouble):PGeocodeBoundingBox;cdecl;external geocode_glib;
function geocode_bounding_box_equal(a:PGeocodeBoundingBox; b:PGeocodeBoundingBox):Tgboolean;cdecl;external geocode_glib;
function geocode_bounding_box_get_top(bbox:PGeocodeBoundingBox):Tgdouble;cdecl;external geocode_glib;
function geocode_bounding_box_get_bottom(bbox:PGeocodeBoundingBox):Tgdouble;cdecl;external geocode_glib;
function geocode_bounding_box_get_left(bbox:PGeocodeBoundingBox):Tgdouble;cdecl;external geocode_glib;
function geocode_bounding_box_get_right(bbox:PGeocodeBoundingBox):Tgdouble;cdecl;external geocode_glib;
{$endif}
{ GEOCODE_BOUNDING_BOX_H  }

// === Konventiert am: 15-11-25 16:54:44 ===

function GEOCODE_TYPE_BOUNDING_BOX : TGType;
function GEOCODE_BOUNDING_BOX(obj : Pointer) : PGeocodeBoundingBox;
function GEOCODE_BOUNDING_BOX_CLASS(klass : Pointer) : PGeocodeBoundingBoxClass;
function GEOCODE_IS_BOUNDING_BOX(obj : Pointer) : Tgboolean;
function GEOCODE_IS_BOUNDING_BOX_CLASS(klass : Pointer) : Tgboolean;
function GEOCODE_BOUNDING_BOX_GET_CLASS(obj : Pointer) : PGeocodeBoundingBoxClass;

implementation

function GEOCODE_TYPE_BOUNDING_BOX : TGType;
  begin
    GEOCODE_TYPE_BOUNDING_BOX:=geocode_bounding_box_get_type;
  end;

function GEOCODE_BOUNDING_BOX(obj : Pointer) : PGeocodeBoundingBox;
begin
  Result := PGeocodeBoundingBox(g_type_check_instance_cast(obj, GEOCODE_TYPE_BOUNDING_BOX));
end;

function GEOCODE_BOUNDING_BOX_CLASS(klass : Pointer) : PGeocodeBoundingBoxClass;
begin
  Result := PGeocodeBoundingBoxClass(g_type_check_class_cast(klass, GEOCODE_TYPE_BOUNDING_BOX));
end;

function GEOCODE_IS_BOUNDING_BOX(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GEOCODE_TYPE_BOUNDING_BOX);
end;

function GEOCODE_IS_BOUNDING_BOX_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GEOCODE_TYPE_BOUNDING_BOX);
end;

function GEOCODE_BOUNDING_BOX_GET_CLASS(obj : Pointer) : PGeocodeBoundingBoxClass;
begin
  Result := PGeocodeBoundingBoxClass(PGTypeInstance(obj)^.g_class);
end;



end.
