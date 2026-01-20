unit heif;

interface

uses
  fp_heif, heif_version;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function heif_fourcc(a, b, c, d: longint): Tuint32_t;

function heif_get_version: pchar; cdecl; external libheif;
function heif_get_version_number: Tuint32_t; cdecl; external libheif;
function heif_get_version_number_major: longint; cdecl; external libheif;
function heif_get_version_number_minor: longint; cdecl; external libheif;
function heif_get_version_number_maintenance: longint; cdecl; external libheif;

function LIBHEIF_MAKE_VERSION(h, m, l: longint): longint;
function LIBHEIF_HAVE_VERSION(h, m, l: longint): boolean;

type
  Pheif_context = type Pointer;
  Pheif_image_handle = type Pointer;
  PPheif_image_handle = ^Pheif_image_handle;
  Pheif_image = type Pointer;
  PPheif_image = ^Pheif_image;

type
  Theif_error_code = longint;

const
  heif_error_Ok = 0;
  heif_error_Input_does_not_exist = 1;
  heif_error_Invalid_input = 2;
  heif_error_Unsupported_filetype = 3;
  heif_error_Unsupported_feature = 4;
  heif_error_Usage_error = 5;
  heif_error_Memory_allocation_error = 6;
  heif_error_Decoder_plugin_error = 7;
  heif_error_Encoder_plugin_error = 8;
  heif_error_Encoding_error = 9;
  heif_error_Color_profile_does_not_exist = 10;
  heif_error_Plugin_loading_error = 11;

type
  Theif_suberror_code = longint;

const
  heif_suberror_Unspecified = 0;
  heif_suberror_End_of_data = 100;
  heif_suberror_Invalid_box_size = 101;
  heif_suberror_No_ftyp_box = 102;
  heif_suberror_No_idat_box = 103;
  heif_suberror_No_meta_box = 104;
  heif_suberror_No_hdlr_box = 105;
  heif_suberror_No_hvcC_box = 106;
  heif_suberror_No_pitm_box = 107;
  heif_suberror_No_ipco_box = 108;
  heif_suberror_No_ipma_box = 109;
  heif_suberror_No_iloc_box = 110;
  heif_suberror_No_iinf_box = 111;
  heif_suberror_No_iprp_box = 112;
  heif_suberror_No_iref_box = 113;
  heif_suberror_No_pict_handler = 114;
  heif_suberror_Ipma_box_references_nonexisting_property = 115;
  heif_suberror_No_properties_assigned_to_item = 116;
  heif_suberror_No_item_data = 117;
  heif_suberror_Invalid_grid_data = 118;
  heif_suberror_Missing_grid_images = 119;
  heif_suberror_Invalid_clean_aperture = 120;
  heif_suberror_Invalid_overlay_data = 121;
  heif_suberror_Overlay_image_outside_of_canvas = 122;
  heif_suberror_Auxiliary_image_type_unspecified = 123;
  heif_suberror_No_or_invalid_primary_item = 124;
  heif_suberror_No_infe_box = 125;
  heif_suberror_Unknown_color_profile_type = 126;
  heif_suberror_Wrong_tile_image_chroma_format = 127;
  heif_suberror_Invalid_fractional_number = 128;
  heif_suberror_Invalid_image_size = 129;
  heif_suberror_Invalid_pixi_box = 130;
  heif_suberror_No_av1C_box = 131;
  heif_suberror_Wrong_tile_image_pixel_depth = 132;
  heif_suberror_Unknown_NCLX_color_primaries = 133;
  heif_suberror_Unknown_NCLX_transfer_characteristics = 134;
  heif_suberror_Unknown_NCLX_matrix_coefficients = 135;
  heif_suberror_Invalid_region_data = 136;
  heif_suberror_Security_limit_exceeded = 1000;
  heif_suberror_Nonexisting_item_referenced = 2000;
  heif_suberror_Null_pointer_argument = 2001;
  heif_suberror_Nonexisting_image_channel_referenced = 2002;
  heif_suberror_Unsupported_plugin_version = 2003;
  heif_suberror_Unsupported_writer_version = 2004;
  heif_suberror_Unsupported_parameter = 2005;
  heif_suberror_Invalid_parameter_value = 2006;
  heif_suberror_Invalid_property = 2007;
  heif_suberror_Item_reference_cycle = 2008;
  heif_suberror_Unsupported_codec = 3000;
  heif_suberror_Unsupported_image_type = 3001;
  heif_suberror_Unsupported_data_version = 3002;
  heif_suberror_Unsupported_color_conversion = 3003;
  heif_suberror_Unsupported_item_construction_method = 3004;
  heif_suberror_Unsupported_header_compression_method = 3005;
  heif_suberror_Unsupported_bit_depth = 4000;
  heif_suberror_Cannot_write_output_data = 5000;
  heif_suberror_Encoder_initialization = 5001;
  heif_suberror_Encoder_encoding = 5002;
  heif_suberror_Encoder_cleanup = 5003;
  heif_suberror_Too_many_regions = 5004;
  heif_suberror_Plugin_loading_error = 6000;
  heif_suberror_Plugin_is_not_loaded = 6001;
  heif_suberror_Cannot_read_plugin_directory = 6002;

type
  Theif_error = record
    code: Theif_error_code;
    subcode: Theif_suberror_code;
    message: pchar;
  end;
  Pheif_error = ^Theif_error;

var
  heif_error_success: Theif_error; cvar;external libheif;

type
  Pheif_item_id = ^Theif_item_id;
  Theif_item_id = Tuint32_t;

  Pheif_property_id = ^Theif_property_id;
  Theif_property_id = Tuint32_t;

type
  Theif_compression_format = longint;

const
  heif_compression_undefined = 0;
  heif_compression_HEVC = 1;
  heif_compression_AVC = 2;
  heif_compression_JPEG = 3;
  heif_compression_AV1 = 4;
  heif_compression_VVC = 5;
  heif_compression_EVC = 6;
  heif_compression_JPEG2000 = 7;
  heif_compression_uncompressed = 8;
  heif_compression_mask = 9;

type
  Theif_chroma = longint;
  Pheif_chroma = ^Theif_chroma;

const
  heif_chroma_undefined = 99;
  heif_chroma_monochrome = 0;
  heif_chroma_420 = 1;
  heif_chroma_422 = 2;
  heif_chroma_444 = 3;
  heif_chroma_interleaved_RGB = 10;
  heif_chroma_interleaved_RGBA = 11;
  heif_chroma_interleaved_RRGGBB_BE = 12;
  heif_chroma_interleaved_RRGGBBAA_BE = 13;
  heif_chroma_interleaved_RRGGBB_LE = 14;
  heif_chroma_interleaved_RRGGBBAA_LE = 15;

  heif_chroma_interleaved_24bit = heif_chroma_interleaved_RGB;
  heif_chroma_interleaved_32bit = heif_chroma_interleaved_RGBA;

type
  Theif_colorspace = longint;
  Pheif_colorspace = ^Theif_colorspace;

const
  heif_colorspace_undefined = 99;
  heif_colorspace_YCbCr = 0;
  heif_colorspace_RGB = 1;
  heif_colorspace_monochrome = 2;

type
  Theif_channel = longint;

const
  heif_channel_Y = 0;
  heif_channel_Cb = 1;
  heif_channel_Cr = 2;
  heif_channel_R = 3;
  heif_channel_G = 4;
  heif_channel_B = 5;
  heif_channel_Alpha = 6;
  heif_channel_interleaved = 10;

type
  Theif_init_params = record
    version: longint;
  end;
  Pheif_init_params = ^Theif_init_params;

function heif_init(para1: Pheif_init_params): Theif_error; cdecl; external libheif;
procedure heif_deinit; cdecl; external libheif;

type
  Theif_plugin_type = longint;

const
  heif_plugin_type_encoder = 0;
  heif_plugin_type_decoder = 1;

type
  Theif_plugin_info = record
    version: longint;
    _type: Theif_plugin_type;
    plugin: pointer;
    internal_handle: pointer;
  end;
  Pheif_plugin_info = ^Theif_plugin_info;
  PPheif_plugin_info = ^Pheif_plugin_info;

function heif_load_plugin(filename: pchar; out_plugin: PPheif_plugin_info): Theif_error; cdecl; external libheif;
function heif_load_plugins(directory: pchar; out_plugins: PPheif_plugin_info; out_nPluginsLoaded: Plongint; output_array_size: longint): Theif_error; cdecl; external libheif;
function heif_unload_plugin(plugin: Pheif_plugin_info): Theif_error; cdecl; external libheif;
function heif_get_plugin_directories: PPchar; cdecl; external libheif;
procedure heif_free_plugin_directories(para1: PPchar); cdecl; external libheif;

type
  Theif_filetype_result = longint;

const
  heif_filetype_no = 0;
  heif_filetype_yes_supported = 1;
  heif_filetype_yes_unsupported = 2;
  heif_filetype_maybe = 3;

function heif_check_filetype(data: Puint8_t; len: longint): Theif_filetype_result; cdecl; external libheif;
function heif_check_jpeg_filetype(data: Puint8_t; len: longint): longint; cdecl; external libheif;

type
  Theif_brand = longint;

const
  heif_unknown_brand = 0;
  heif_heic = 1;
  heif_heix = 2;
  heif_hevc = 3;
  heif_hevx = 4;
  heif_heim = 5;
  heif_heis = 6;
  heif_hevm = 7;
  heif_hevs = 8;
  heif_mif1 = 9;
  heif_msf1 = 10;
  heif_avif = 11;
  heif_avis = 12;
  heif_vvic = 13;
  heif_vvis = 14;
  heif_evbi = 15;
  heif_evbs = 16;
  heif_j2ki = 17;
  heif_j2is = 18;

function heif_main_brand(data: Puint8_t; len: longint): Theif_brand; cdecl; external libheif;

type
  PPheif_brand2 = ^Pheif_brand2;
  Pheif_brand2 = ^Theif_brand2;
  Theif_brand2 = Tuint32_t;

const
  heif_brand2_heic = (ord('h') shl 24) or (ord('e') shl 16) or (ord('i') shl 8) or ord('c');
  heif_brand2_heix = (ord('h') shl 24) or (ord('e') shl 16) or (ord('i') shl 8) or ord('x');
  heif_brand2_hevc = (ord('h') shl 24) or (ord('e') shl 16) or (ord('v') shl 8) or ord('c');
  heif_brand2_hevx = (ord('h') shl 24) or (ord('e') shl 16) or (ord('v') shl 8) or ord('x');
  heif_brand2_heim = (ord('h') shl 24) or (ord('e') shl 16) or (ord('i') shl 8) or ord('m');
  heif_brand2_heis = (ord('h') shl 24) or (ord('e') shl 16) or (ord('i') shl 8) or ord('s');
  heif_brand2_hevm = (ord('h') shl 24) or (ord('e') shl 16) or (ord('v') shl 8) or ord('m');
  heif_brand2_hevs = (ord('h') shl 24) or (ord('e') shl 16) or (ord('v') shl 8) or ord('s');
  heif_brand2_avif = (ord('a') shl 24) or (ord('v') shl 16) or (ord('i') shl 8) or ord('f');
  heif_brand2_avis = (ord('a') shl 24) or (ord('v') shl 16) or (ord('i') shl 8) or ord('s');
  heif_brand2_mif1 = (ord('m') shl 24) or (ord('i') shl 16) or (ord('f') shl 8) or ord('1');
  heif_brand2_mif2 = (ord('m') shl 24) or (ord('i') shl 16) or (ord('f') shl 8) or ord('2');
  heif_brand2_msf1 = (ord('m') shl 24) or (ord('s') shl 16) or (ord('f') shl 8) or ord('1');
  heif_brand2_vvic = (ord('v') shl 24) or (ord('v') shl 16) or (ord('i') shl 8) or ord('c');
  heif_brand2_vvis = (ord('v') shl 24) or (ord('v') shl 16) or (ord('i') shl 8) or ord('s');
  heif_brand2_evbi = (ord('e') shl 24) or (ord('v') shl 16) or (ord('b') shl 8) or ord('i');
  heif_brand2_evmi = (ord('e') shl 24) or (ord('v') shl 16) or (ord('m') shl 8) or ord('i');
  heif_brand2_evbs = (ord('e') shl 24) or (ord('v') shl 16) or (ord('b') shl 8) or ord('s');
  heif_brand2_evms = (ord('e') shl 24) or (ord('v') shl 16) or (ord('m') shl 8) or ord('s');
  heif_brand2_jpeg = (ord('j') shl 24) or (ord('p') shl 16) or (ord('e') shl 8) or ord('g');
  heif_brand2_jpgs = (ord('j') shl 24) or (ord('p') shl 16) or (ord('g') shl 8) or ord('s');
  heif_brand2_j2ki = (ord('j') shl 24) or (ord('2') shl 16) or (ord('k') shl 8) or ord('i');
  heif_brand2_j2is = (ord('j') shl 24) or (ord('2') shl 16) or (ord('i') shl 8) or ord('s');
  heif_brand2_miaf = (ord('m') shl 24) or (ord('i') shl 16) or (ord('a') shl 8) or ord('f');
  heif_brand2_1pic = (ord('1') shl 24) or (ord('p') shl 16) or (ord('i') shl 8) or ord('c');

function heif_read_main_brand(data: Puint8_t; len: longint): Theif_brand2; cdecl; external libheif;
function heif_fourcc_to_brand(brand_fourcc: pchar): Theif_brand2; cdecl; external libheif;
procedure heif_brand_to_fourcc(brand: Theif_brand2; out_fourcc: pchar); cdecl; external libheif;
function heif_has_compatible_brand(data: Puint8_t; len: longint; brand_fourcc: pchar): longint; cdecl; external libheif;
function heif_list_compatible_brands(data: Puint8_t; len: longint; out_brands: PPheif_brand2; out_size: Plongint): Theif_error; cdecl; external libheif;
procedure heif_free_list_of_compatible_brands(brands_list: Pheif_brand2); cdecl; external libheif;
function heif_get_file_mime_type(data: Puint8_t; len: longint): pchar; cdecl; external libheif;
function heif_context_alloc: Pheif_context; cdecl; external libheif;
procedure heif_context_free(para1: Pheif_context); cdecl; external libheif;

type
  Pheif_reading_options = type Pointer;

type
  Theif_reader_grow_status = longint;

const
  heif_reader_grow_status_size_reached = 0;
  heif_reader_grow_status_timeout = 1;
  heif_reader_grow_status_size_beyond_eof = 2;

type
  Theif_reader = record
    reader_api_version: longint;
    get_position: function(userdata: pointer): Tint64_t; cdecl;
    read: function(data: pointer; size: Tsize_t; userdata: pointer): longint; cdecl;
    seek: function(position: Tint64_t; userdata: pointer): longint; cdecl;
    wait_for_file_size: function(target_size: Tint64_t; userdata: pointer): Theif_reader_grow_status; cdecl;
  end;
  Pheif_reader = ^Theif_reader;

function heif_context_read_from_file(para1: Pheif_context; filename: pchar; para3: Pheif_reading_options): Theif_error; cdecl; external libheif;
function heif_context_read_from_memory(para1: Pheif_context; mem: pointer; size: Tsize_t; para4: Pheif_reading_options): Theif_error; cdecl; external libheif;
function heif_context_read_from_memory_without_copy(para1: Pheif_context; mem: pointer; size: Tsize_t; para4: Pheif_reading_options): Theif_error; cdecl; external libheif;
function heif_context_read_from_reader(para1: Pheif_context; reader: Pheif_reader; userdata: pointer; para4: Pheif_reading_options): Theif_error; cdecl; external libheif;
function heif_context_get_number_of_top_level_images(ctx: Pheif_context): longint; cdecl; external libheif;
function heif_context_is_top_level_image_ID(ctx: Pheif_context; id: Theif_item_id): longint; cdecl; external libheif;
function heif_context_get_list_of_top_level_image_IDs(ctx: Pheif_context; ID_array: Pheif_item_id; count: longint): longint; cdecl; external libheif;
function heif_context_get_primary_image_ID(ctx: Pheif_context; id: Pheif_item_id): Theif_error; cdecl; external libheif;
function heif_context_get_primary_image_handle(ctx: Pheif_context; para2: PPheif_image_handle): Theif_error; cdecl; external libheif;
function heif_context_get_image_handle(ctx: Pheif_context; id: Theif_item_id; para3: PPheif_image_handle): Theif_error; cdecl; external libheif;
procedure heif_context_debug_dump_boxes_to_file(ctx: Pheif_context; fd: longint); cdecl; external libheif;
procedure heif_context_set_maximum_image_size_limit(ctx: Pheif_context; maximum_width: longint); cdecl; external libheif;
procedure heif_context_set_max_decoding_threads(ctx: Pheif_context; max_threads: longint); cdecl; external libheif;
procedure heif_image_handle_release(para1: Pheif_image_handle); cdecl; external libheif;
function heif_image_handle_is_primary_image(handle: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_item_id(handle: Pheif_image_handle): Theif_item_id; cdecl; external libheif;
function heif_image_handle_get_width(handle: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_height(handle: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_has_alpha_channel(para1: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_is_premultiplied_alpha(para1: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_luma_bits_per_pixel(para1: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_chroma_bits_per_pixel(para1: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_preferred_decoding_colorspace(image_handle: Pheif_image_handle; out_colorspace: Pheif_colorspace; out_chroma: Pheif_chroma): Theif_error; cdecl; external libheif;
function heif_image_handle_get_ispe_width(handle: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_ispe_height(handle: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_context(handle: Pheif_image_handle): Pheif_context; cdecl; external libheif;

function heif_image_handle_has_depth_image(para1: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_number_of_depth_images(handle: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_list_of_depth_image_IDs(handle: Pheif_image_handle; ids: Pheif_item_id; count: longint): longint; cdecl; external libheif;
function heif_image_handle_get_depth_image_handle(handle: Pheif_image_handle; depth_image_id: Theif_item_id; out_depth_handle: PPheif_image_handle): Theif_error; cdecl; external libheif;

type
  Theif_depth_representation_type = longint;

const
  heif_depth_representation_type_uniform_inverse_Z = 0;
  heif_depth_representation_type_uniform_disparity = 1;
  heif_depth_representation_type_uniform_Z = 2;
  heif_depth_representation_type_nonuniform_disparity = 3;

type
  Theif_depth_representation_info = record
    version: Tuint8_t;
    has_z_near: Tuint8_t;
    has_z_far: Tuint8_t;
    has_d_min: Tuint8_t;
    has_d_max: Tuint8_t;
    z_near: double;
    z_far: double;
    d_min: double;
    d_max: double;
    depth_representation_type: Theif_depth_representation_type;
    disparity_reference_view: Tuint32_t;
    depth_nonlinear_representation_model_size: Tuint32_t;
    depth_nonlinear_representation_model: Puint8_t;
  end;
  Pheif_depth_representation_info = ^Theif_depth_representation_info;
  PPheif_depth_representation_info = ^Pheif_depth_representation_info;

procedure heif_depth_representation_info_free(info: Pheif_depth_representation_info); cdecl; external libheif;
function heif_image_handle_get_depth_image_representation_info(handle: Pheif_image_handle; depth_image_id: Theif_item_id; out_: PPheif_depth_representation_info): longint; cdecl; external libheif;

function heif_image_handle_get_number_of_thumbnails(handle: Pheif_image_handle): longint; cdecl; external libheif;
function heif_image_handle_get_list_of_thumbnail_IDs(handle: Pheif_image_handle; ids: Pheif_item_id; count: longint): longint; cdecl; external libheif;
function heif_image_handle_get_thumbnail(main_image_handle: Pheif_image_handle; thumbnail_id: Theif_item_id; out_thumbnail_handle: PPheif_image_handle): Theif_error; cdecl; external libheif;

const
  LIBHEIF_AUX_IMAGE_FILTER_OMIT_ALPHA = 1 shl 1;
  LIBHEIF_AUX_IMAGE_FILTER_OMIT_DEPTH = 2 shl 1;

function heif_image_handle_get_number_of_auxiliary_images(handle: Pheif_image_handle; aux_filter: longint): longint; cdecl; external libheif;
function heif_image_handle_get_list_of_auxiliary_image_IDs(handle: Pheif_image_handle; aux_filter: longint; ids: Pheif_item_id; count: longint): longint; cdecl; external libheif;
function heif_image_handle_get_auxiliary_type(handle: Pheif_image_handle; out_type: PPchar): Theif_error; cdecl; external libheif;
procedure heif_image_handle_release_auxiliary_type(handle: Pheif_image_handle; out_type: PPchar); cdecl; external libheif;
procedure heif_image_handle_free_auxiliary_types(handle: Pheif_image_handle; out_type: PPchar); cdecl; external libheif;
function heif_image_handle_get_auxiliary_image_handle(main_image_handle: Pheif_image_handle; auxiliary_id: Theif_item_id; out_auxiliary_handle: PPheif_image_handle): Theif_error; cdecl; external libheif;

function heif_image_handle_get_number_of_metadata_blocks(handle: Pheif_image_handle; type_filter: pchar): longint; cdecl; external libheif;
function heif_image_handle_get_list_of_metadata_block_IDs(handle: Pheif_image_handle; type_filter: pchar; ids: Pheif_item_id; count: longint): longint; cdecl; external libheif;
function heif_image_handle_get_metadata_type(handle: Pheif_image_handle; metadata_id: Theif_item_id): pchar; cdecl; external libheif;
function heif_image_handle_get_metadata_content_type(handle: Pheif_image_handle; metadata_id: Theif_item_id): pchar; cdecl; external libheif;
function heif_image_handle_get_metadata_size(handle: Pheif_image_handle; metadata_id: Theif_item_id): Tsize_t; cdecl; external libheif;
function heif_image_handle_get_metadata(handle: Pheif_image_handle; metadata_id: Theif_item_id; out_data: pointer): Theif_error; cdecl; external libheif;
function heif_image_handle_get_metadata_item_uri_type(handle: Pheif_image_handle; metadata_id: Theif_item_id): pchar; cdecl; external libheif;

type
  Theif_color_profile_type = longint;

const
  heif_color_profile_type_not_present = 0;
  heif_color_profile_type_nclx = (ord('n') shl 24) or (ord('c') shl 16) or (ord('l') shl 8) or ord('x');
  heif_color_profile_type_rICC = (ord('r') shl 24) or (ord('I') shl 16) or (ord('C') shl 8) or ord('C');
  heif_color_profile_type_prof = (ord('p') shl 24) or (ord('r') shl 16) or (ord('o') shl 8) or ord('f');


function heif_image_handle_get_color_profile_type(handle: Pheif_image_handle): Theif_color_profile_type; cdecl; external libheif;
function heif_image_handle_get_raw_color_profile_size(handle: Pheif_image_handle): Tsize_t; cdecl; external libheif;
function heif_image_handle_get_raw_color_profile(handle: Pheif_image_handle; out_data: pointer): Theif_error; cdecl; external libheif;

type
  Theif_color_primaries = longint;

const
  heif_color_primaries_ITU_R_BT_709_5 = 1;
  heif_color_primaries_unspecified = 2;
  heif_color_primaries_ITU_R_BT_470_6_System_M = 4;
  heif_color_primaries_ITU_R_BT_470_6_System_B_G = 5;
  heif_color_primaries_ITU_R_BT_601_6 = 6;
  heif_color_primaries_SMPTE_240M = 7;
  heif_color_primaries_generic_film = 8;
  heif_color_primaries_ITU_R_BT_2020_2_and_2100_0 = 9;
  heif_color_primaries_SMPTE_ST_428_1 = 10;
  heif_color_primaries_SMPTE_RP_431_2 = 11;
  heif_color_primaries_SMPTE_EG_432_1 = 12;
  heif_color_primaries_EBU_Tech_3213_E = 22;

type
  Theif_transfer_characteristics = longint;

const
  heif_transfer_characteristic_ITU_R_BT_709_5 = 1;
  heif_transfer_characteristic_unspecified = 2;
  heif_transfer_characteristic_ITU_R_BT_470_6_System_M = 4;
  heif_transfer_characteristic_ITU_R_BT_470_6_System_B_G = 5;
  heif_transfer_characteristic_ITU_R_BT_601_6 = 6;
  heif_transfer_characteristic_SMPTE_240M = 7;
  heif_transfer_characteristic_linear = 8;
  heif_transfer_characteristic_logarithmic_100 = 9;
  heif_transfer_characteristic_logarithmic_100_sqrt10 = 10;
  heif_transfer_characteristic_IEC_61966_2_4 = 11;
  heif_transfer_characteristic_ITU_R_BT_1361 = 12;
  heif_transfer_characteristic_IEC_61966_2_1 = 13;
  heif_transfer_characteristic_ITU_R_BT_2020_2_10bit = 14;
  heif_transfer_characteristic_ITU_R_BT_2020_2_12bit = 15;
  heif_transfer_characteristic_ITU_R_BT_2100_0_PQ = 16;
  heif_transfer_characteristic_SMPTE_ST_428_1 = 17;
  heif_transfer_characteristic_ITU_R_BT_2100_0_HLG = 18;

type
  Theif_matrix_coefficients = longint;

const
  heif_matrix_coefficients_RGB_GBR = 0;
  heif_matrix_coefficients_ITU_R_BT_709_5 = 1;
  heif_matrix_coefficients_unspecified = 2;
  heif_matrix_coefficients_US_FCC_T47 = 4;
  heif_matrix_coefficients_ITU_R_BT_470_6_System_B_G = 5;
  heif_matrix_coefficients_ITU_R_BT_601_6 = 6;
  heif_matrix_coefficients_SMPTE_240M = 7;
  heif_matrix_coefficients_YCgCo = 8;
  heif_matrix_coefficients_ITU_R_BT_2020_2_non_constant_luminance = 9;
  heif_matrix_coefficients_ITU_R_BT_2020_2_constant_luminance = 10;
  heif_matrix_coefficients_SMPTE_ST_2085 = 11;
  heif_matrix_coefficients_chromaticity_derived_non_constant_luminance = 12;
  heif_matrix_coefficients_chromaticity_derived_constant_luminance = 13;
  heif_matrix_coefficients_ICtCp = 14;

type
  Theif_color_profile_nclx = record
    version: Tuint8_t;
    color_primaries: Theif_color_primaries;
    transfer_characteristics: Theif_transfer_characteristics;
    matrix_coefficients: Theif_matrix_coefficients;
    full_range_flag: Tuint8_t;
    color_primary_red_x: single;
    color_primary_red_y: single;
    color_primary_green_x: single;
    color_primary_green_y: single;
    color_primary_blue_x: single;
    color_primary_blue_y: single;
    color_primary_white_x: single;
    color_primary_white_y: single;
  end;
  Pheif_color_profile_nclx = ^Theif_color_profile_nclx;
  PPheif_color_profile_nclx = ^Pheif_color_profile_nclx;

function heif_nclx_color_profile_set_color_primaries(nclx: Pheif_color_profile_nclx; cp: Tuint16_t): Theif_error; cdecl; external libheif;
function heif_nclx_color_profile_set_transfer_characteristics(nclx: Pheif_color_profile_nclx; transfer_characteristics: Tuint16_t): Theif_error; cdecl; external libheif;
function heif_nclx_color_profile_set_matrix_coefficients(nclx: Pheif_color_profile_nclx; matrix_coefficients: Tuint16_t): Theif_error; cdecl; external libheif;
function heif_image_handle_get_nclx_color_profile(handle: Pheif_image_handle; out_data: PPheif_color_profile_nclx): Theif_error; cdecl; external libheif;
function heif_nclx_color_profile_alloc: Pheif_color_profile_nclx; cdecl; external libheif;
procedure heif_nclx_color_profile_free(nclx_profile: Pheif_color_profile_nclx); cdecl; external libheif;
function heif_image_get_color_profile_type(image: Pheif_image): Theif_color_profile_type; cdecl; external libheif;
function heif_image_get_raw_color_profile_size(image: Pheif_image): Tsize_t; cdecl; external libheif;
function heif_image_get_raw_color_profile(image: Pheif_image; out_data: pointer): Theif_error; cdecl; external libheif;
function heif_image_get_nclx_color_profile(image: Pheif_image; out_data: PPheif_color_profile_nclx): Theif_error; cdecl; external libheif;

type
  Theif_progress_step = longint;

const
  heif_progress_step_total = 0;
  heif_progress_step_load_tile = 1;

type
  Theif_chroma_downsampling_algorithm = longint;

const
  heif_chroma_downsampling_nearest_neighbor = 1;
  heif_chroma_downsampling_average = 2;
  heif_chroma_downsampling_sharp_yuv = 3;

type
  Theif_chroma_upsampling_algorithm = longint;

const
  heif_chroma_upsampling_nearest_neighbor = 1;
  heif_chroma_upsampling_bilinear = 2;

type
  Theif_color_conversion_options = record
    version: Tuint8_t;
    preferred_chroma_downsampling_algorithm: Theif_chroma_downsampling_algorithm;
    preferred_chroma_upsampling_algorithm: Theif_chroma_upsampling_algorithm;
    only_use_preferred_chroma_algorithm: Tuint8_t;
  end;
  Pheif_color_conversion_options = ^Theif_color_conversion_options;

  Theif_decoding_options = record
    version: Tuint8_t;
    ignore_transformations: Tuint8_t;
    start_progress: procedure(step: Theif_progress_step; max_progress: longint; progress_user_data: pointer); cdecl;
    on_progress: procedure(step: Theif_progress_step; progress: longint; progress_user_data: pointer); cdecl;
    end_progress: procedure(step: Theif_progress_step; progress_user_data: pointer); cdecl;
    progress_user_data: pointer;
    convert_hdr_to_8bit: Tuint8_t;
    strict_decoding: Tuint8_t;
    decoder_id: pchar;
    color_conversion_options: Theif_color_conversion_options;
  end;
  Pheif_decoding_options = ^Theif_decoding_options;

function heif_decoding_options_alloc: Pheif_decoding_options; cdecl; external libheif;
procedure heif_decoding_options_free(para1: Pheif_decoding_options); cdecl; external libheif;
function heif_decode_image(in_handle: Pheif_image_handle; out_img: PPheif_image; colorspace: Theif_colorspace; chroma: Theif_chroma; options: Pheif_decoding_options): Theif_error; cdecl; external libheif;
function heif_image_get_colorspace(para1: Pheif_image): Theif_colorspace; cdecl; external libheif;
function heif_image_get_chroma_format(para1: Pheif_image): Theif_chroma; cdecl; external libheif;
function heif_image_get_width(img: Pheif_image; channel: Theif_channel): longint; cdecl; external libheif;
function heif_image_get_height(img: Pheif_image; channel: Theif_channel): longint; cdecl; external libheif;
function heif_image_get_primary_width(img: Pheif_image): longint; cdecl; external libheif;
function heif_image_get_primary_height(img: Pheif_image): longint; cdecl; external libheif;
function heif_image_crop(img: Pheif_image; left: longint; right: longint; top: longint; bottom: longint): Theif_error; cdecl; external libheif;
function heif_image_get_bits_per_pixel(para1: Pheif_image; channel: Theif_channel): longint; cdecl; external libheif;
function heif_image_get_bits_per_pixel_range(para1: Pheif_image; channel: Theif_channel): longint; cdecl; external libheif;
function heif_image_has_channel(para1: Pheif_image; channel: Theif_channel): longint; cdecl; external libheif;
function heif_image_get_plane_readonly(para1: Pheif_image; channel: Theif_channel; out_stride: Plongint): Puint8_t; cdecl; external libheif;
function heif_image_get_plane(para1: Pheif_image; channel: Theif_channel; out_stride: Plongint): Puint8_t; cdecl; external libheif;

type
  Pheif_scaling_options = type Pointer;

function heif_image_scale_image(input: Pheif_image; output: PPheif_image; width: longint; height: longint; options: Pheif_scaling_options): Theif_error; cdecl; external libheif;
function heif_image_set_raw_color_profile(image: Pheif_image; profile_type_fourcc_string: pchar; profile_data: pointer; profile_size: Tsize_t): Theif_error; cdecl; external libheif;
function heif_image_set_nclx_color_profile(image: Pheif_image; color_profile: Pheif_color_profile_nclx): Theif_error; cdecl; external libheif;
function heif_image_get_decoding_warnings(image: Pheif_image; first_warning_idx: longint; out_warnings: Pheif_error; max_output_buffer_entries: longint): longint; cdecl; external libheif;
procedure heif_image_add_decoding_warning(image: Pheif_image; err: Theif_error); cdecl; external libheif;
procedure heif_image_release(para1: Pheif_image); cdecl; external libheif;

type
  Theif_content_light_level = record
    max_content_light_level: Tuint16_t;
    max_pic_average_light_level: Tuint16_t;
  end;
  Pheif_content_light_level = ^Theif_content_light_level;

function heif_image_has_content_light_level(para1: Pheif_image): longint; cdecl; external libheif;
procedure heif_image_get_content_light_level(para1: Pheif_image; out_: Pheif_content_light_level); cdecl; external libheif;
procedure heif_image_set_content_light_level(para1: Pheif_image; in_: Pheif_content_light_level); cdecl; external libheif;

type
  Theif_mastering_display_colour_volume = record
    display_primaries_x: array[0..2] of Tuint16_t;
    display_primaries_y: array[0..2] of Tuint16_t;
    white_point_x: Tuint16_t;
    white_point_y: Tuint16_t;
    max_display_mastering_luminance: Tuint32_t;
    min_display_mastering_luminance: Tuint32_t;
  end;
  Pheif_mastering_display_colour_volume = ^Theif_mastering_display_colour_volume;

  Theif_decoded_mastering_display_colour_volume = record
    display_primaries_x: array[0..2] of single;
    display_primaries_y: array[0..2] of single;
    white_point_x: single;
    white_point_y: single;
    max_display_mastering_luminance: double;
    min_display_mastering_luminance: double;
  end;
  Pheif_decoded_mastering_display_colour_volume = ^Theif_decoded_mastering_display_colour_volume;

function heif_image_has_mastering_display_colour_volume(para1: Pheif_image): longint; cdecl; external libheif;
procedure heif_image_get_mastering_display_colour_volume(para1: Pheif_image; out_: Pheif_mastering_display_colour_volume); cdecl; external libheif;
procedure heif_image_set_mastering_display_colour_volume(para1: Pheif_image; in_: Pheif_mastering_display_colour_volume); cdecl; external libheif;
function heif_mastering_display_colour_volume_decode(in_: Pheif_mastering_display_colour_volume; out_: Pheif_decoded_mastering_display_colour_volume): Theif_error; cdecl; external libheif;
procedure heif_image_get_pixel_aspect_ratio(para1: Pheif_image; aspect_h: Puint32_t; aspect_v: Puint32_t); cdecl; external libheif;
procedure heif_image_set_pixel_aspect_ratio(para1: Pheif_image; aspect_h: Tuint32_t; aspect_v: Tuint32_t); cdecl; external libheif;

function heif_context_write_to_file(para1: Pheif_context; filename: pchar): Theif_error; cdecl; external libheif;

type
  Theif_writer = record
    writer_api_version: longint;
    write: function(ctx: Pheif_context; data: pointer; size: Tsize_t; userdata: pointer): Theif_error; cdecl;
  end;
  Pheif_writer = ^Theif_writer;

function heif_context_write(para1: Pheif_context; writer: Pheif_writer; userdata: pointer): Theif_error; cdecl; external libheif;

type
  Pheif_encoder = type Pointer;
  PPheif_encoder = ^Pheif_encoder;
  Pheif_encoder_descriptor = type Pointer;
  PPheif_encoder_descriptor = ^Pheif_encoder_descriptor;
  Pheif_encoder_parameter = type Pointer;
  PPheif_encoder_parameter = ^Pheif_encoder_parameter;
  Pheif_decoder_descriptor = type Pointer;
  PPheif_decoder_descriptor = ^Pheif_decoder_descriptor;

function heif_get_decoder_descriptors(format_filter: Theif_compression_format; out_decoders: PPheif_decoder_descriptor; count: longint): longint; cdecl; external libheif;
function heif_decoder_descriptor_get_name(para1: Pheif_decoder_descriptor): pchar; cdecl; external libheif;
function heif_decoder_descriptor_get_id_name(para1: Pheif_decoder_descriptor): pchar; cdecl; external libheif;
function heif_context_get_encoder_descriptors(para1: Pheif_context; format_filter: Theif_compression_format; name_filter: pchar; out_encoders: PPheif_encoder_descriptor; count: longint): longint; cdecl; external libheif;
function heif_get_encoder_descriptors(format_filter: Theif_compression_format; name_filter: pchar; out_encoders: PPheif_encoder_descriptor; count: longint): longint; cdecl; external libheif;
function heif_encoder_descriptor_get_name(para1: Pheif_encoder_descriptor): pchar; cdecl; external libheif;
function heif_encoder_descriptor_get_id_name(para1: Pheif_encoder_descriptor): pchar; cdecl; external libheif;
function heif_encoder_descriptor_get_compression_format(para1: Pheif_encoder_descriptor): Theif_compression_format; cdecl; external libheif;
function heif_encoder_descriptor_supports_lossy_compression(para1: Pheif_encoder_descriptor): longint; cdecl; external libheif;
function heif_encoder_descriptor_supports_lossless_compression(para1: Pheif_encoder_descriptor): longint; cdecl; external libheif;
function heif_context_get_encoder(context: Pheif_context; para2: Pheif_encoder_descriptor; out_encoder: PPheif_encoder): Theif_error; cdecl; external libheif;
function heif_have_decoder_for_format(format: Theif_compression_format): longint; cdecl; external libheif;
function heif_have_encoder_for_format(format: Theif_compression_format): longint; cdecl; external libheif;
function heif_context_get_encoder_for_format(context: Pheif_context; format: Theif_compression_format; para3: PPheif_encoder): Theif_error; cdecl; external libheif;
procedure heif_encoder_release(para1: Pheif_encoder); cdecl; external libheif;
function heif_encoder_get_name(para1: Pheif_encoder): pchar; cdecl; external libheif;

function heif_encoder_set_lossy_quality(para1: Pheif_encoder; quality: longint): Theif_error; cdecl; external libheif;
function heif_encoder_set_lossless(para1: Pheif_encoder; enable: longint): Theif_error; cdecl; external libheif;
function heif_encoder_set_logging_level(para1: Pheif_encoder; level: longint): Theif_error; cdecl; external libheif;
function heif_encoder_list_parameters(para1: Pheif_encoder): PPheif_encoder_parameter; cdecl; external libheif;
function heif_encoder_parameter_get_name(para1: Pheif_encoder_parameter): pchar; cdecl; external libheif;

type
  Theif_encoder_parameter_type = longint;

const
  heif_encoder_parameter_type_integer = 1;
  heif_encoder_parameter_type_boolean = 2;
  heif_encoder_parameter_type_string = 3;

function heif_encoder_parameter_get_type(para1: Pheif_encoder_parameter): Theif_encoder_parameter_type; cdecl; external libheif;
function heif_encoder_parameter_get_valid_integer_range(para1: Pheif_encoder_parameter; have_minimum_maximum: Plongint; minimum: Plongint; maximum: Plongint): Theif_error; cdecl; external libheif;
function heif_encoder_parameter_get_valid_integer_values(para1: Pheif_encoder_parameter; have_minimum: Plongint; have_maximum: Plongint; minimum: Plongint; maximum: Plongint;
  num_valid_values: Plongint; out_integer_array: PPlongint): Theif_error; cdecl; external libheif;
function heif_encoder_parameter_get_valid_string_values(para1: Pheif_encoder_parameter; out_stringarray: PPPchar): Theif_error; cdecl; external libheif;
function heif_encoder_set_parameter_integer(para1: Pheif_encoder; parameter_name: pchar; value: longint): Theif_error; cdecl; external libheif;
function heif_encoder_get_parameter_integer(para1: Pheif_encoder; parameter_name: pchar; value: Plongint): Theif_error; cdecl; external libheif;
function heif_encoder_parameter_integer_valid_range(para1: Pheif_encoder; parameter_name: pchar; have_minimum_maximum: Plongint; minimum: Plongint; maximum: Plongint): Theif_error; cdecl; external libheif;
function heif_encoder_set_parameter_boolean(para1: Pheif_encoder; parameter_name: pchar; value: longint): Theif_error; cdecl; external libheif;
function heif_encoder_get_parameter_boolean(para1: Pheif_encoder; parameter_name: pchar; value: Plongint): Theif_error; cdecl; external libheif;
function heif_encoder_set_parameter_string(para1: Pheif_encoder; parameter_name: pchar; value: pchar): Theif_error; cdecl; external libheif;
function heif_encoder_get_parameter_string(para1: Pheif_encoder; parameter_name: pchar; value: pchar; value_size: longint): Theif_error; cdecl; external libheif;
function heif_encoder_parameter_string_valid_values(para1: Pheif_encoder; parameter_name: pchar; out_stringarray: PPPchar): Theif_error; cdecl; external libheif;
function heif_encoder_parameter_integer_valid_values(para1: Pheif_encoder; parameter_name: pchar; have_minimum: Plongint; have_maximum: Plongint; minimum: Plongint;
  maximum: Plongint; num_valid_values: Plongint; out_integer_array: PPlongint): Theif_error; cdecl; external libheif;
function heif_encoder_set_parameter(para1: Pheif_encoder; parameter_name: pchar; value: pchar): Theif_error; cdecl; external libheif;
function heif_encoder_get_parameter(para1: Pheif_encoder; parameter_name: pchar; value_ptr: pchar; value_size: longint): Theif_error; cdecl; external libheif;
function heif_encoder_has_default(para1: Pheif_encoder; parameter_name: pchar): longint; cdecl; external libheif;

type
  Theif_orientation = longint;

const
  heif_orientation_normal = 1;
  heif_orientation_flip_horizontally = 2;
  heif_orientation_rotate_180 = 3;
  heif_orientation_flip_vertically = 4;
  heif_orientation_rotate_90_cw_then_flip_horizontally = 5;
  heif_orientation_rotate_90_cw = 6;
  heif_orientation_rotate_90_cw_then_flip_vertically = 7;
  heif_orientation_rotate_270_cw = 8;

type
  Theif_encoding_options = record
    version: Tuint8_t;
    save_alpha_channel: Tuint8_t;
    macOS_compatibility_workaround: Tuint8_t;
    save_two_colr_boxes_when_ICC_and_nclx_available: Tuint8_t;
    output_nclx_profile: Pheif_color_profile_nclx;
    macOS_compatibility_workaround_no_nclx_profile: Tuint8_t;
    image_orientation: Theif_orientation;
    color_conversion_options: Theif_color_conversion_options;
  end;
  Pheif_encoding_options = ^Theif_encoding_options;

function heif_encoding_options_alloc: Pheif_encoding_options; cdecl; external libheif;
procedure heif_encoding_options_free(para1: Pheif_encoding_options); cdecl; external libheif;
function heif_context_encode_image(para1: Pheif_context; image: Pheif_image; encoder: Pheif_encoder; options: Pheif_encoding_options; out_image_handle: PPheif_image_handle): Theif_error; cdecl; external libheif;
function heif_context_set_primary_image(para1: Pheif_context; image_handle: Pheif_image_handle): Theif_error; cdecl; external libheif;
function heif_context_encode_thumbnail(para1: Pheif_context; image: Pheif_image; master_image_handle: Pheif_image_handle; encoder: Pheif_encoder; options: Pheif_encoding_options;
  bbox_size: longint; out_thumb_image_handle: PPheif_image_handle): Theif_error; cdecl; external libheif;

type
  Theif_metadata_compression = longint;

const
  heif_metadata_compression_off = 0;
  heif_metadata_compression_auto = 1;
  heif_metadata_compression_deflate = 2;

function heif_context_assign_thumbnail(para1: Pheif_context; master_image: Pheif_image_handle; thumbnail_image: Pheif_image_handle): Theif_error; cdecl; external libheif;
function heif_context_add_exif_metadata(para1: Pheif_context; image_handle: Pheif_image_handle; data: pointer; size: longint): Theif_error; cdecl; external libheif;
function heif_context_add_XMP_metadata(para1: Pheif_context; image_handle: Pheif_image_handle; data: pointer; size: longint): Theif_error; cdecl; external libheif;
function heif_context_add_XMP_metadata2(para1: Pheif_context; image_handle: Pheif_image_handle; data: pointer; size: longint; compression: Theif_metadata_compression): Theif_error; cdecl; external libheif;
function heif_context_add_generic_metadata(ctx: Pheif_context; image_handle: Pheif_image_handle; data: pointer; size: longint; item_type: pchar;
  content_type: pchar): Theif_error; cdecl; external libheif;

function heif_image_create(width: longint; height: longint; colorspace: Theif_colorspace; chroma: Theif_chroma; out_image: PPheif_image): Theif_error; cdecl; external libheif;
function heif_image_add_plane(image: Pheif_image; channel: Theif_channel; width: longint; height: longint; bit_depth: longint): Theif_error; cdecl; external libheif;
procedure heif_image_set_premultiplied_alpha(image: Pheif_image; is_premultiplied_alpha: longint); cdecl; external libheif;
function heif_image_is_premultiplied_alpha(image: Pheif_image): longint; cdecl; external libheif;
function heif_image_extend_padding_to_size(image: Pheif_image; min_physical_width: longint; min_physical_height: longint): Theif_error; cdecl; external libheif;
{ --- register plugins }
type
  Pheif_decoder_plugin = type Pointer;
  Pheif_encoder_plugin = type Pointer;

function heif_register_decoder(heif: Pheif_context; para2: Pheif_decoder_plugin): Theif_error; cdecl; external libheif;
function heif_register_decoder_plugin(para1: Pheif_decoder_plugin): Theif_error; cdecl; external libheif;
function heif_register_encoder_plugin(para1: Pheif_encoder_plugin): Theif_error; cdecl; external libheif;
function heif_encoder_descriptor_supportes_lossy_compression(para1: Pheif_encoder_descriptor): longint; cdecl; external libheif;
function heif_encoder_descriptor_supportes_lossless_compression(para1: Pheif_encoder_descriptor): longint; cdecl; external libheif;

// === Konventiert am: 20-1-26 17:29:50 ===


implementation


function heif_fourcc(a, b, c, d: longint): Tuint32_t;
begin
  heif_fourcc := Tuint32_t((((a shl 24) or (b shl 16)) or (c shl 8)) or d);
end;

function LIBHEIF_MAKE_VERSION(h, m, l: longint): longint;
begin
  LIBHEIF_MAKE_VERSION := ((h shl 24) or (m shl 16)) or (l shl 8);
end;

function LIBHEIF_HAVE_VERSION(h, m, l: longint): boolean;
begin
  LIBHEIF_HAVE_VERSION := LIBHEIF_NUMERIC_VERSION >= (LIBHEIF_MAKE_VERSION(h, m, l));
end;

end.
