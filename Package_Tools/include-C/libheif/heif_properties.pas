unit heif_properties;

interface

uses
  fp_heif, heif;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Theif_item_property_type = longint;

const
  heif_item_property_type_invalid = 0;
  heif_item_property_type_user_description = (ord('u') shl 24) or (ord('d') shl 16) or (ord('e') shl 8) or ord('s');
  heif_item_property_type_transform_mirror = (ord('i') shl 24) or (ord('m') shl 16) or (ord('i') shl 8) or ord('r');
  heif_item_property_type_transform_rotation = (ord('i') shl 24) or (ord('r') shl 16) or (ord('o') shl 8) or ord('t');
  heif_item_property_type_transform_crop = (ord('c') shl 24) or (ord('l') shl 16) or (ord('a') shl 8) or ord('p');
  heif_item_property_type_image_size = (ord('i') shl 24) or (ord('s') shl 16) or (ord('p') shl 8) or ord('e');

function heif_item_get_properties_of_type(context: Pheif_context; id: Theif_item_id; _type: Theif_item_property_type; out_list: Pheif_property_id; count: longint): longint; cdecl; external libheif;
function heif_item_get_transformation_properties(context: Pheif_context; id: Theif_item_id; out_list: Pheif_property_id; count: longint): longint; cdecl; external libheif;
function heif_item_get_property_type(context: Pheif_context; id: Theif_item_id; property_id: Theif_property_id): Theif_item_property_type; cdecl; external libheif;

type
  Theif_property_user_description = record
    version: longint;
    lang: pchar;
    name: pchar;
    description: pchar;
    tags: pchar;
  end;
  Pheif_property_user_description = ^Theif_property_user_description;
  PPheif_property_user_description = ^Pheif_property_user_description;

function heif_item_get_property_user_description(context: Pheif_context; itemId: Theif_item_id; propertyId: Theif_property_id; out_: PPheif_property_user_description): Theif_error; cdecl; external libheif;
function heif_item_add_property_user_description(context: Pheif_context; itemId: Theif_item_id; description: Pheif_property_user_description; out_propertyId: Pheif_property_id): Theif_error; cdecl; external libheif;
procedure heif_property_user_description_release(para1: Pheif_property_user_description); cdecl; external libheif;

type
  Theif_transform_mirror_direction = longint;

const
  heif_transform_mirror_direction_invalid = -(1);
  heif_transform_mirror_direction_vertical = 0;
  heif_transform_mirror_direction_horizontal = 1;

function heif_item_get_property_transform_mirror(context: Pheif_context; itemId: Theif_item_id; propertyId: Theif_property_id): Theif_transform_mirror_direction; cdecl; external libheif;
function heif_item_get_property_transform_rotation_ccw(context: Pheif_context; itemId: Theif_item_id; propertyId: Theif_property_id): longint; cdecl; external libheif;
procedure heif_item_get_property_transform_crop_borders(context: Pheif_context; itemId: Theif_item_id; propertyId: Theif_property_id; image_width: longint; image_height: longint;
  left: Plongint; top: Plongint; right: Plongint; bottom: Plongint); cdecl; external libheif;

// === Konventiert am: 20-1-26 17:29:55 ===


implementation



end.
