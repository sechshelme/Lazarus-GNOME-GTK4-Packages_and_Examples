
unit heif_properties;
interface

{
  Automatically converted by H2Pas 1.0.0 from heif_properties.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    heif_properties.h
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
Pheif_context  = ^heif_context;
Pheif_item_property_type  = ^heif_item_property_type;
Pheif_property_id  = ^heif_property_id;
Pheif_property_user_description  = ^heif_property_user_description;
Pheif_transform_mirror_direction  = ^heif_transform_mirror_direction;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * HEIF codec.
 * Copyright (c) 2017-2023 Dirk Farin <dirk.farin@gmail.com>
 *
 * This file is part of libheif.
 *
 * libheif is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 3 of
 * the License, or (at your option) any later version.
 *
 * libheif is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with libheif.  If not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef LIBHEIF_HEIF_PROPERTIES_H}
{$define LIBHEIF_HEIF_PROPERTIES_H}
{$include "libheif/heif.h"}
{ C++ extern C conditionnal removed }
{ ------------------------- item properties ------------------------- }
{  heif_item_property_unknown = -1, }
type
  Theif_item_property_type =  Longint;
  Const
    heif_item_property_type_invalid = 0;
    heif_item_property_type_user_description = heif_fourcc('u','d','e','s');
    heif_item_property_type_transform_mirror = heif_fourcc('i','m','i','r');
    heif_item_property_type_transform_rotation = heif_fourcc('i','r','o','t');
    heif_item_property_type_transform_crop = heif_fourcc('c','l','a','p');
    heif_item_property_type_image_size = heif_fourcc('i','s','p','e');

{ Get the heif_property_id for a heif_item_id. }
{ You may specify which property 'type' you want to receive. }
{ If you specify 'heif_item_property_type_invalid', all properties associated to that item are returned. }
{ The number of properties is returned, which are not more than 'count' if (out_list != nullptr). }
{ By setting out_list==nullptr, you can query the number of properties, 'count' is ignored. }
(* Const before type ignored *)

function heif_item_get_properties_of_type(context:Pheif_context; id:Theif_item_id; _type:Theif_item_property_type; out_list:Pheif_property_id; count:longint):longint;cdecl;external;
{ Returns all transformative properties in the correct order. }
{ This includes "irot", "imir", "clap". }
{ The number of properties is returned, which are not more than 'count' if (out_list != nullptr). }
{ By setting out_list==nullptr, you can query the number of properties, 'count' is ignored. }
(* Const before type ignored *)
function heif_item_get_transformation_properties(context:Pheif_context; id:Theif_item_id; out_list:Pheif_property_id; count:longint):longint;cdecl;external;
(* Const before type ignored *)
function heif_item_get_property_type(context:Pheif_context; id:Theif_item_id; property_id:Theif_property_id):Theif_item_property_type;cdecl;external;
{ The strings are managed by libheif. They will be deleted in heif_property_user_description_release(). }
{ version 1 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
type
  Pheif_property_user_description = ^Theif_property_user_description;
  Theif_property_user_description = record
      version : longint;
      lang : Pchar;
      name : Pchar;
      description : Pchar;
      tags : Pchar;
    end;

{ Get the "udes" user description property content. }
{ Undefined strings are returned as empty strings. }
(* Const before type ignored *)

function heif_item_get_property_user_description(context:Pheif_context; itemId:Theif_item_id; propertyId:Theif_property_id; out:PPheif_property_user_description):Theif_error;cdecl;external;
{ Add a "udes" user description property to the item. }
{ If any string pointers are NULL, an empty string will be used instead. }
(* Const before type ignored *)
(* Const before type ignored *)
function heif_item_add_property_user_description(context:Pheif_context; itemId:Theif_item_id; description:Pheif_property_user_description; out_propertyId:Pheif_property_id):Theif_error;cdecl;external;
{ Release all strings and the object itself. }
{ Only call for objects that you received from heif_item_get_property_user_description(). }
procedure heif_property_user_description_release(para1:Pheif_property_user_description);cdecl;external;
{ flip image vertically }
{ flip image horizontally }
type
  Theif_transform_mirror_direction =  Longint;
  Const
    heif_transform_mirror_direction_invalid = -(1);
    heif_transform_mirror_direction_vertical = 0;
    heif_transform_mirror_direction_horizontal = 1;

{ Will return 'heif_transform_mirror_direction_invalid' in case of error. }
(* Const before type ignored *)

function heif_item_get_property_transform_mirror(context:Pheif_context; itemId:Theif_item_id; propertyId:Theif_property_id):Theif_transform_mirror_direction;cdecl;external;
{ Returns only 0, 90, 180, or 270 angle values. }
{ Returns -1 in case of error (but it will only return an error in case of wrong usage). }
(* Const before type ignored *)
function heif_item_get_property_transform_rotation_ccw(context:Pheif_context; itemId:Theif_item_id; propertyId:Theif_property_id):longint;cdecl;external;
{ Returns the number of pixels that should be removed from the four edges. }
{ Because of the way this data is stored, you have to pass the image size at the moment of the crop operation }
{ to compute the cropped border sizes. }
(* Const before type ignored *)
procedure heif_item_get_property_transform_crop_borders(context:Pheif_context; itemId:Theif_item_id; propertyId:Theif_property_id; image_width:longint; image_height:longint; 
            left:Plongint; top:Plongint; right:Plongint; bottom:Plongint);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
