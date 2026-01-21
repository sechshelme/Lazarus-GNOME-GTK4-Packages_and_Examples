{$IFDEF read_interface}


type
  Pheif_region_item = type Pointer;
  PPheif_region_item = ^Pheif_region_item;

type
  Theif_region_type = longint;

const
  heif_region_type_point = 0;
  heif_region_type_rectangle = 1;
  heif_region_type_ellipse = 2;
  heif_region_type_polygon = 3;
  heif_region_type_referenced_mask = 4;
  heif_region_type_inline_mask = 5;
  heif_region_type_polyline = 6;

type
  Pheif_region = type Pointer;
  PPheif_region = ^Pheif_region;

function heif_image_handle_get_number_of_region_items(image_handle: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_list_of_region_item_ids(image_handle: Pheif_image_handle; region_item_ids_array: Pheif_item_id; max_count: longint): longint; cdecl; external libheif;
function heif_context_get_region_item(context: Pheif_context; region_item_id: Theif_item_id; out_: PPheif_region_item): Theif_error; cdecl; external libheif;
function heif_region_item_get_id(region_item: Pheif_region_item): Theif_item_id; cdecl; external libheif;
procedure heif_region_item_release(region_item: Pheif_region_item); cdecl; external libheif;
procedure heif_region_item_get_reference_size(para1: Pheif_region_item; out_width: Puint32_t; out_height: Puint32_t); cdecl; external libheif;
function heif_region_item_get_number_of_regions(region_item: Pheif_region_item): longint; cdecl; external libheif;
function heif_region_item_get_list_of_regions(region_item: Pheif_region_item; out_regions_array: PPheif_region; max_count: longint): longint; cdecl; external libheif;
procedure heif_region_release(region: Pheif_region); cdecl; external libheif;
procedure heif_region_release_many(regions_array: PPheif_region; num_items: longint); cdecl; external libheif;
function heif_region_get_type(region: Pheif_region): Theif_region_type; cdecl; external libheif;
function heif_region_get_point(region: Pheif_region; out_x: Pint32_t; out_y: Pint32_t): Theif_error; cdecl; external libheif;
function heif_region_get_point_transformed(region: Pheif_region; image_id: Theif_item_id; out_x: Pdouble; out_y: Pdouble): Theif_error; cdecl; external libheif;
function heif_region_get_rectangle(region: Pheif_region; out_x: Pint32_t; out_y: Pint32_t; out_width: Puint32_t; out_height: Puint32_t): Theif_error; cdecl; external libheif;
function heif_region_get_rectangle_transformed(region: Pheif_region; image_id: Theif_item_id; out_x: Pdouble; out_y: Pdouble; out_width: Pdouble; out_height: Pdouble): Theif_error; cdecl; external libheif;
function heif_region_get_ellipse(region: Pheif_region; out_x: Pint32_t; out_y: Pint32_t; out_radius_x: Puint32_t; out_radius_y: Puint32_t): Theif_error; cdecl; external libheif;
function heif_region_get_ellipse_transformed(region: Pheif_region; image_id: Theif_item_id; out_x: Pdouble; out_y: Pdouble; out_radius_x: Pdouble; out_radius_y: Pdouble): Theif_error; cdecl; external libheif;
function heif_region_get_polygon_num_points(region: Pheif_region): longint; cdecl; external libheif;
function heif_region_get_polygon_points(region: Pheif_region; out_pts_array: Pint32_t): Theif_error; cdecl; external libheif;
function heif_region_get_polygon_points_transformed(region: Pheif_region; image_id: Theif_item_id; out_pts_array: Pdouble): Theif_error; cdecl; external libheif;
function heif_region_get_polyline_num_points(region: Pheif_region): longint; cdecl; external libheif;
function heif_region_get_polyline_points(region: Pheif_region; out_pts_array: Pint32_t): Theif_error; cdecl; external libheif;
function heif_region_get_polyline_points_transformed(region: Pheif_region; image_id: Theif_item_id; out_pts_array: Pdouble): Theif_error; cdecl; external libheif;
function heif_region_get_referenced_mask_ID(region: Pheif_region; out_x: Pint32_t; out_y: Pint32_t; out_width: Puint32_t; out_height: Puint32_t; out_mask_item_id: Pheif_item_id): Theif_error; cdecl; external libheif;
function heif_region_get_inline_mask_data_len(region: Pheif_region): Tsize_t; cdecl; external libheif;
function heif_region_get_inline_mask_data(region: Pheif_region; out_x: Pint32_t; out_y: Pint32_t; out_width: Puint32_t; out_height: Puint32_t; out_mask_data: Puint8_t): Theif_error; cdecl; external libheif;
function heif_region_get_mask_image(region: Pheif_region; out_x: Pint32_t; out_y: Pint32_t; out_width: Puint32_t; out_height: Puint32_t; out_mask_image: PPheif_image): Theif_error; cdecl; external libheif;
function heif_image_handle_add_region_item(image_handle: Pheif_image_handle; reference_width: Tuint32_t; reference_height: Tuint32_t; out_region_item: PPheif_region_item): Theif_error; cdecl; external libheif;
function heif_region_item_add_region_point(region_item: Pheif_region_item; x: Tint32_t; y: Tint32_t; out_region: PPheif_region): Theif_error; cdecl; external libheif;
function heif_region_item_add_region_rectangle(region_item: Pheif_region_item; x: Tint32_t; y: Tint32_t; width: Tuint32_t; height: Tuint32_t; out_region: PPheif_region): Theif_error; cdecl; external libheif;
function heif_region_item_add_region_ellipse(region_item: Pheif_region_item; x: Tint32_t; y: Tint32_t; radius_x: Tuint32_t; radius_y: Tuint32_t; out_region: PPheif_region): Theif_error; cdecl; external libheif;
function heif_region_item_add_region_polygon(region_item: Pheif_region_item; pts_array: Pint32_t; nPoints: longint; out_region: PPheif_region): Theif_error; cdecl; external libheif;
function heif_region_item_add_region_polyline(region_item: Pheif_region_item; pts_array: Pint32_t; nPoints: longint; out_region: PPheif_region): Theif_error; cdecl; external libheif;
function heif_region_item_add_region_referenced_mask(region_item: Pheif_region_item; x: Tint32_t; y: Tint32_t; width: Tuint32_t; height: Tuint32_t; mask_item_id: Theif_item_id; out_region: PPheif_region): Theif_error; cdecl; external libheif;
function heif_region_item_add_region_inline_mask_data(region_item: Pheif_region_item; x: Tint32_t; y: Tint32_t; width: Tuint32_t; height: Tuint32_t; mask_data: Puint8_t; mask_data_len: Tsize_t; out_region: PPheif_region): Theif_error; cdecl; external libheif;
function heif_region_item_add_region_inline_mask(region_item: Pheif_region_item; x: Tint32_t; y: Tint32_t; width: Tuint32_t; height: Tuint32_t; image: Pheif_image; out_region: PPheif_region): Theif_error; cdecl; external libheif;

// === Konventiert am: 20-1-26 17:29:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
