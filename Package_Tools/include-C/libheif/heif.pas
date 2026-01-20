unit heif;

interface

uses
  fp_heif;

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
{$ifndef LIBHEIF_HEIF_H}
{$define LIBHEIF_HEIF_H}
{ C++ extern C conditionnal removed }
{! \file heif.h
 *
 * Public API for libheif.
 }
{$include <stddef.h>}
{$include <stdint.h>}
{$include <libheif/heif_version.h>}
{ API versions table }
{ }
{ release    dec.options   enc.options   heif_reader   heif_writer   depth.rep   col.profile }
{ ------------------------------------------------------------------------------------------ }
{  1.0            1           N/A           N/A           N/A           1           N/A }
{  1.1            1           N/A           N/A            1            1           N/A }
{  1.3            1            1             1             1            1           N/A }
{  1.4            1            1             1             1            1            1 }
{  1.7            2            1             1             1            1            1 }
{  1.9.2          2            2             1             1            1            1 }
{  1.10           2            3             1             1            1            1 }
{  1.11           2            4             1             1            1            1 }
{  1.13           3            4             1             1            1            1 }
{  1.14           3            5             1             1            1            1 }
{  1.15           4            5             1             1            1            1 }
{  1.16           5            6             1             1            1            1 }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function heif_fourcc(a,b,c,d : longint) : Tuint32_t;

{ === version numbers ===  }
{ Version string of linked libheif library. }
function heif_get_version:Pchar;cdecl;external libheif;
{ Numeric version of linked libheif library, encoded as 0xHHMMLL00 = hh.mm.ll, where hh, mm, ll is the decimal representation of HH, MM, LL. }
{ For example: 0x02150300 is version 2.21.3 }
function heif_get_version_number:Tuint32_t;cdecl;external libheif;
{ Numeric part "HH" from above. Returned as a decimal number. }
function heif_get_version_number_major:longint;cdecl;external libheif;
{ Numeric part "MM" from above. Returned as a decimal number. }
function heif_get_version_number_minor:longint;cdecl;external libheif;
{ Numeric part "LL" from above. Returned as a decimal number. }
function heif_get_version_number_maintenance:longint;cdecl;external libheif;
{ Helper macros to check for given versions of libheif at compile time. }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBHEIF_MAKE_VERSION(h,m,l : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBHEIF_HAVE_VERSION(h,m,l : longint) : longint;

type
  Pheif_context = ^Theif_context;
  Theif_context = record
      {undefined structure}
    end;

  Pheif_image_handle = ^Theif_image_handle;
  Theif_image_handle = record
      {undefined structure}
    end;

  Pheif_image = ^Theif_image;
  Theif_image = record
      {undefined structure}
    end;

{ Everything ok, no error occurred. }
{ Input file does not exist. }
{ Error in input file. Corrupted or invalid content. }
{ Input file type is not supported. }
{ Image requires an unsupported decoder feature. }
{ Library API has been used in an invalid way. }
{ Could not allocate enough memory. }
{ The decoder plugin generated an error }
{ The encoder plugin generated an error }
{ Error during encoding or when writing to the output }
{ Application has asked for a color profile type that does not exist }
{ Error loading a dynamic plugin }
  Theif_error_code =  Longint;
  Const
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

{ no further information available }
{ --- Invalid_input --- }
{ End of data reached unexpectedly. }
{ Size of box (defined in header) is wrong }
{ Mandatory 'ftyp' box is missing }
{ An item property referenced in the 'ipma' box is not existing in the 'ipco' container. }
{ No properties have been assigned to an item. }
{ Image has no (compressed) data }
{ Invalid specification of image grid (tiled image) }
{ Tile-images in a grid image are missing }
{ Invalid specification of overlay image }
{ Overlay image completely outside of visible canvas area }
{ Invalid specification of region item }
{ --- Memory_allocation_error --- }
{ A security limit preventing unreasonable memory allocations was exceeded by the input file. }
{ Please check whether the file is valid. If it is, contact us so that we could increase the }
{ security limits further. }
{ --- Usage_error --- }
{ An item ID was used that is not present in the file. }
{ also used for Invalid_input }
{ An API argument was given a NULL pointer, which is not allowed for that function. }
{ Image channel referenced that does not exist in the image }
{ The version of the passed plugin is not supported. }
{ The version of the passed writer is not supported. }
{ The given (encoder) parameter name does not exist. }
{ The value for the given parameter is not in the valid range. }
{ Error in property specification }
{ Image reference cycle found in iref }
{ --- Unsupported_feature --- }
{ Image was coded with an unsupported compression method. }
{ Image is specified in an unknown way, e.g. as tiled grid image (which is supported) }
{ The conversion of the source image to the requested chroma / colorspace is not supported. }
{ --- Encoder_plugin_error --- }
{ --- Encoding_error --- }
{ --- Plugin loading error --- }
{ a specific plugin file cannot be loaded }
{ trying to remove a plugin that is not loaded }
{ error while scanning the directory for plugins }
type
  Theif_suberror_code =  Longint;
  Const
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

{ main error category }
{ more detailed error code }
{ textual error message (is always defined, you do not have to check for NULL) }
type
  Pheif_error = ^Theif_error;
  Theif_error = record
      code : Theif_error_code;
      subcode : Theif_suberror_code;
      message : Pchar;
    end;

{ Default success return value. Intended for use in user-supplied callback functions. }
  var
    heif_error_success : Theif_error;cvar;external libheif;
type
  Pheif_item_id = ^Theif_item_id;
  Theif_item_id = Tuint32_t;

  Pheif_property_id = ^Theif_property_id;
  Theif_property_id = Tuint32_t;
{ ========================= enum types ====================== }
{*
 * libheif known compression formats.
  }
{*
   * Unspecified / undefined compression format.
   *
   * This is used to mean "no match" or "any decoder" for some parts of the
   * API. It does not indicate a specific compression format.
    }
{*
   * HEVC compression, used for HEIC images.
   *
   * This is equivalent to H.265.
   }
{*
   * AVC compression. (Currently unused in libheif.)
   *
   * The compression is defined in ISO/IEC 14496-10. This is equivalent to H.264.
   *
   * The encapsulation is defined in ISO/IEC 23008-12:2022 Annex E.
    }
{*
   * JPEG compression.
   *
   * The compression format is defined in ISO/IEC 10918-1. The encapsulation
   * of JPEG is specified in ISO/IEC 23008-12:2022 Annex H.
   }
{*
   * AV1 compression, used for AVIF images.
   *
   * The compression format is provided at https://aomediacodec.github.io/av1-spec/
   *
   * The encapsulation is defined in https://aomediacodec.github.io/av1-avif/
    }
{*
   * VVC compression. (Currently unused in libheif.)
   *
   * The compression format is defined in ISO/IEC 23090-3. This is equivalent to H.266.
   *
   * The encapsulation is defined in ISO/IEC 23008-12:2022 Annex L.
    }
{*
   * EVC compression. (Currently unused in libheif.)
   *
   * The compression format is defined in ISO/IEC 23094-1. This is equivalent to H.266.
   *
   * The encapsulation is defined in ISO/IEC 23008-12:2022 Annex M.
    }
{*
   * JPEG 2000 compression.
   *
   * The encapsulation of JPEG 2000 is specified in ISO/IEC 15444-16:2021.
   * The core encoding is defined in ISO/IEC 15444-1, or ITU-T T.800.
   }
{*
   * Uncompressed encoding.
   *
   * This is defined in ISO/IEC 23001-17:2023 (Final Draft International Standard).
   }
{*
   * Mask image encoding.
   *
   * See ISO/IEC 23008-12:2022 Section 6.10.2
    }
  Theif_compression_format =  Longint;
  Const
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

{ HDR, big endian. }
{ HDR, big endian. }
{ HDR, little endian. }
{ HDR, little endian. }
type
  Theif_chroma =  Longint;
  Const
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

{ DEPRECATED ENUM NAMES }
  heif_chroma_interleaved_24bit = heif_chroma_interleaved_RGB;  
  heif_chroma_interleaved_32bit = heif_chroma_interleaved_RGBA;  
{ heif_colorspace_YCbCr should be used with one of these heif_chroma values: }
{ * heif_chroma_444 }
{ * heif_chroma_422 }
{ * heif_chroma_420 }
{ heif_colorspace_RGB should be used with one of these heif_chroma values: }
{ * heif_chroma_444 (for planar RGB) }
{ * heif_chroma_interleaved_RGB }
{ * heif_chroma_interleaved_RGBA }
{ * heif_chroma_interleaved_RRGGBB_BE }
{ * heif_chroma_interleaved_RRGGBBAA_BE }
{ * heif_chroma_interleaved_RRGGBB_LE }
{ * heif_chroma_interleaved_RRGGBBAA_LE }
{ heif_colorspace_monochrome should only be used with heif_chroma = heif_chroma_monochrome }
type
  Theif_colorspace =  Longint;
  Const
    heif_colorspace_undefined = 99;
    heif_colorspace_YCbCr = 0;
    heif_colorspace_RGB = 1;
    heif_colorspace_monochrome = 2;

type
  Theif_channel =  Longint;
  Const
    heif_channel_Y = 0;
    heif_channel_Cb = 1;
    heif_channel_Cr = 2;
    heif_channel_R = 3;
    heif_channel_G = 4;
    heif_channel_B = 5;
    heif_channel_Alpha = 6;
    heif_channel_interleaved = 10;

{ ========================= library initialization ====================== }
{ currently no parameters }
type
  Pheif_init_params = ^Theif_init_params;
  Theif_init_params = record
      version : longint;
    end;

{*
 * Initialise library.
 *
 * You should call heif_init() when you start using libheif and heif_deinit() when you are finished.
 * These calls are reference counted. Each call to heif_init() should be matched by one call to heif_deinit().
 *
 * For backwards compatibility, it is not really necessary to call heif_init(), but some library memory objects
 * will never be freed if you do not call heif_init()/heif_deinit().
 *
 * heif_init() will load the external modules installed in the default plugin path. Thus, you need it when you
 * want to load external plugins from the default path.
 * Codec plugins that are compiled into the library directly (selected by the compile-time parameters of libheif)
 * will be available even without heif_init().
 *
 * Make sure that you do not have one part of your program use heif_init()/heif_deinit() and another part that does
 * not use it as the latter may try to use an uninitialized library. If in doubt, enclose everything with init/deinit.
 *
 * You may pass nullptr to get default parameters. Currently, no parameters are supported.
  }

function heif_init(para1:Pheif_init_params):Theif_error;cdecl;external libheif;
{*
 * Deinitialise and clean up library.
 *
 * You should call heif_init() when you start using libheif and heif_deinit() when you are finished.
 * These calls are reference counted. Each call to heif_init() should be matched by one call to heif_deinit().
 *
 * \sa heif_init()
  }
procedure heif_deinit;cdecl;external libheif;
{ --- Plugins are currently only supported on Unix platforms. }
type
  Theif_plugin_type =  Longint;
  Const
    heif_plugin_type_encoder = 0;
    heif_plugin_type_decoder = 1;

{ version of this info struct }
{ for internal use only }
type
  Pheif_plugin_info = ^Theif_plugin_info;
  Theif_plugin_info = record
      version : longint;
      _type : Theif_plugin_type;
      plugin : pointer;
      internal_handle : pointer;
    end;


function heif_load_plugin(filename:Pchar; out_plugin:PPheif_plugin_info):Theif_error;cdecl;external libheif;
function heif_load_plugins(directory:Pchar; out_plugins:PPheif_plugin_info; out_nPluginsLoaded:Plongint; output_array_size:longint):Theif_error;cdecl;external libheif;
function heif_unload_plugin(plugin:Pheif_plugin_info):Theif_error;cdecl;external libheif;
{ Get a NULL terminated array of the plugin directories that are searched by libheif. }
{ This includes the paths specified in the environment variable LIBHEIF_PLUGIN_PATHS and the built-in path }
{ (if not overridden by the environment variable). }
function heif_get_plugin_directories:^Pchar;cdecl;external libheif;
(* Const before abstract_declarator ignored *)
procedure heif_free_plugin_directories(para1:PPchar);cdecl;external libheif;
{ ========================= file type check ====================== }
{ it is heif and can be read by libheif }
{ it is heif, but cannot be read by libheif }
{ not sure whether it is an heif, try detection with more input data }
type
  Theif_filetype_result =  Longint;
  Const
    heif_filetype_no = 0;
    heif_filetype_yes_supported = 1;
    heif_filetype_yes_unsupported = 2;
    heif_filetype_maybe = 3;

{ input data should be at least 12 bytes }

function heif_check_filetype(data:Puint8_t; len:longint):Theif_filetype_result;cdecl;external libheif;
function heif_check_jpeg_filetype(data:Puint8_t; len:longint):longint;cdecl;external libheif;
{ DEPRECATED, use heif_brand2 and the heif_brand2_* constants below instead }
{ HEIF image with h265 }
{ 10bit images, or anything that uses h265 with range extension }
{ brands for image sequences }
{ multiview }
{ scalable }
{ multiview sequence }
{ scalable sequence }
{ image, any coding algorithm }
{ sequence, any coding algorithm }
{ HEIF image with AV1 }
{ VVC image }
{ VVC sequence }
{ EVC image }
{ EVC sequence }
{ JPEG2000 image }
{ JPEG2000 image sequence }
type
  Theif_brand =  Longint;
  Const
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

{ input data should be at least 12 bytes }
{ DEPRECATED, use heif_read_main_brand() instead }

function heif_main_brand(data:Puint8_t; len:longint):Theif_brand;cdecl;external libheif;
type
  Pheif_brand2 = ^Theif_brand2;
  Theif_brand2 = Tuint32_t;
{*
 * HEVC image (`heic`) brand.
 *
 * Image conforms to HEVC (H.265) Main or Main Still profile.
 *
 * See ISO/IEC 23008-12:2022 Section B.4.1.
  }

{ was #define dname def_expr }
function heif_brand2_heic : longint; { return type might be wrong }

{*
 * HEVC image (`heix`) brand.
 *
 * Image conforms to HEVC (H.265) Main 10 profile.
 *
 * See ISO/IEC 23008-12:2022 Section B.4.1.
  }
{ was #define dname def_expr }
function heif_brand2_heix : longint; { return type might be wrong }

{*
 * HEVC image sequence (`hevc`) brand.
 *
 * Image sequence conforms to HEVC (H.265) Main profile.
 *
 * See ISO/IEC 23008-12:2022 Section B.4.2.
  }
{ was #define dname def_expr }
function heif_brand2_hevc : longint; { return type might be wrong }

{*
 * HEVC image sequence (`hevx`) brand.
 *
 * Image sequence conforms to HEVC (H.265) Main 10 profile.
 *
 * See ISO/IEC 23008-12:2022 Section B.4.2.
  }
{ was #define dname def_expr }
function heif_brand2_hevx : longint; { return type might be wrong }

{*
 * HEVC layered image (`heim`) brand.
 *
 * Image layers conform to HEVC (H.265) Main or Multiview Main profile.
 *
 * See ISO/IEC 23008-12:2022 Section B.4.3.
  }
{ was #define dname def_expr }
function heif_brand2_heim : longint; { return type might be wrong }

{*
 * HEVC layered image (`heis`) brand.
 *
 * Image layers conform to HEVC (H.265) Main, Main 10, Scalable Main
 * or Scalable Main 10 profile.
 *
 * See ISO/IEC 23008-12:2022 Section B.4.3.
  }
{ was #define dname def_expr }
function heif_brand2_heis : longint; { return type might be wrong }

{*
 * HEVC layered image sequence (`hevm`) brand.
 *
 * Image sequence layers conform to HEVC (H.265) Main or Multiview Main profile.
 *
 * See ISO/IEC 23008-12:2022 Section B.4.4.
  }
{ was #define dname def_expr }
function heif_brand2_hevm : longint; { return type might be wrong }

{*
 * HEVC layered image sequence (`hevs`) brand.
 *
 * Image sequence layers conform to HEVC (H.265) Main, Main 10, Scalable Main
 * or Scalable Main 10 profile.
 *
 * See ISO/IEC 23008-12:2022 Section B.4.4.
  }
{ was #define dname def_expr }
function heif_brand2_hevs : longint; { return type might be wrong }

{*
 * AV1 image (`avif`) brand.
 *
 * See https://aomediacodec.github.io/av1-avif/#image-and-image-collection-brand
  }
{ was #define dname def_expr }
function heif_brand2_avif : longint; { return type might be wrong }

{*
 * AV1 image sequence (`avis`) brand.
 *
 * See https://aomediacodec.github.io/av1-avif/#image-sequence-brand
  }
{ was #define dname def_expr }
function heif_brand2_avis : longint; { return type might be wrong }

{*
 * HEIF image structural brand (`mif1`).
 *
 * This does not imply a specific coding algorithm.
 *
 * See ISO/IEC 23008-12:2022 Section 10.2.2.
  }
{ was #define dname def_expr }
function heif_brand2_mif1 : longint; { return type might be wrong }

{*
 * HEIF image structural brand (`mif2`).
 *
 * This does not imply a specific coding algorithm. `mif2` extends
 * the requirements of `mif1` to include the `rref` and `iscl` item
 * properties.
 *
 * See ISO/IEC 23008-12:2022 Section 10.2.3.
  }
{ was #define dname def_expr }
function heif_brand2_mif2 : longint; { return type might be wrong }

{*
 * HEIF image sequence structural brand (`msf1`).
 *
 * This does not imply a specific coding algorithm.
 *
 * See ISO/IEC 23008-12:2022 Section 10.3.1.
  }
{ was #define dname def_expr }
function heif_brand2_msf1 : longint; { return type might be wrong }

{*
 * VVC image (`vvic`) brand.
 *
 * See ISO/IEC 23008-12:2022 Section L.4.1.
  }
{ was #define dname def_expr }
function heif_brand2_vvic : longint; { return type might be wrong }

{*
 * VVC image sequence (`vvis`) brand.
 *
 * See ISO/IEC 23008-12:2022 Section L.4.2.
  }
{ was #define dname def_expr }
function heif_brand2_vvis : longint; { return type might be wrong }

{*
 * EVC baseline image (`evbi`) brand.
 *
 * See ISO/IEC 23008-12:2022 Section M.4.1.
  }
{ was #define dname def_expr }
function heif_brand2_evbi : longint; { return type might be wrong }

{*
 * EVC main profile image (`evmi`) brand.
 *
 * See ISO/IEC 23008-12:2022 Section M.4.2.
  }
{ was #define dname def_expr }
function heif_brand2_evmi : longint; { return type might be wrong }

{*
 * EVC baseline image sequence (`evbs`) brand.
 *
 * See ISO/IEC 23008-12:2022 Section M.4.3.
  }
{ was #define dname def_expr }
function heif_brand2_evbs : longint; { return type might be wrong }

{*
 * EVC main profile image sequence (`evms`) brand.
 *
 * See ISO/IEC 23008-12:2022 Section M.4.4.
  }
{ was #define dname def_expr }
function heif_brand2_evms : longint; { return type might be wrong }

{*
 * JPEG image (`jpeg`) brand.
 *
 * See ISO/IEC 23008-12:2022 Annex H.4
  }
{ was #define dname def_expr }
function heif_brand2_jpeg : longint; { return type might be wrong }

{*
 * JPEG image sequence (`jpgs`) brand.
 *
 * See ISO/IEC 23008-12:2022 Annex H.5
  }
{ was #define dname def_expr }
function heif_brand2_jpgs : longint; { return type might be wrong }

{*
 * JPEG 2000 image (`j2ki`) brand.
 *
 * See ISO/IEC 15444-16:2021 Section 6.5 
  }
{ was #define dname def_expr }
function heif_brand2_j2ki : longint; { return type might be wrong }

{*
 * JPEG 2000 image sequence (`j2is`) brand.
 *
 * See ISO/IEC 15444-16:2021 Section 7.6
  }
{ was #define dname def_expr }
function heif_brand2_j2is : longint; { return type might be wrong }

{*
 * Multi-image application format (MIAF) brand.
 *
 * This is HEIF with additional constraints for interoperability.
 *
 * See ISO/IEC 23000-22.
  }
{ was #define dname def_expr }
function heif_brand2_miaf : longint; { return type might be wrong }

{*
 * Single picture file brand.
 *
 * This is a compatible brand indicating the file contains a single intra-coded picture.
 *
 * See ISO/IEC 23008-12:2022 Section 10.2.5.
 }
{ was #define dname def_expr }
function heif_brand2_1pic : longint; { return type might be wrong }

{ input data should be at least 12 bytes }
function heif_read_main_brand(data:Puint8_t; len:longint):Theif_brand2;cdecl;external libheif;
{ 'brand_fourcc' must be 4 character long, but need not be 0-terminated }
function heif_fourcc_to_brand(brand_fourcc:Pchar):Theif_brand2;cdecl;external libheif;
{ the output buffer must be at least 4 bytes long }
procedure heif_brand_to_fourcc(brand:Theif_brand2; out_fourcc:Pchar);cdecl;external libheif;
{ 'brand_fourcc' must be 4 character long, but need not be 0-terminated }
{ returns 1 if file includes the brand, and 0 if it does not }
{ returns -1 if the provided data is not sufficient }
{            (you should input at least as many bytes as indicated in the first 4 bytes of the file, usually ~50 bytes will do) }
{ returns -2 on other errors }
function heif_has_compatible_brand(data:Puint8_t; len:longint; brand_fourcc:Pchar):longint;cdecl;external libheif;
{ Returns an array of compatible brands. The array is allocated by this function and has to be freed with 'heif_free_list_of_compatible_brands()'. }
{ The number of entries is returned in out_size. }
function heif_list_compatible_brands(data:Puint8_t; len:longint; out_brands:PPheif_brand2; out_size:Plongint):Theif_error;cdecl;external libheif;
procedure heif_free_list_of_compatible_brands(brands_list:Pheif_brand2);cdecl;external libheif;
{ Returns one of these MIME types: }
{ - image/heic           HEIF file using h265 compression }
{ - image/heif           HEIF file using any other compression }
{ - image/heic-sequence  HEIF image sequence using h265 compression }
{ - image/heif-sequence  HEIF image sequence using any other compression }
{ - image/avif           AVIF image }
{ - image/avif-sequence  AVIF sequence }
{ - image/jpeg    JPEG image }
{ - image/png     PNG image }
{ If the format could not be detected, an empty string is returned. }
{ }
{ Provide at least 12 bytes of input. With less input, its format might not }
{ be detected. You may also provide more input to increase detection accuracy. }
{ }
{ Note that JPEG and PNG images cannot be decoded by libheif even though the }
{ formats are detected by this function. }
function heif_get_file_mime_type(data:Puint8_t; len:longint):Pchar;cdecl;external libheif;
{ ========================= heif_context ========================= }
{ A heif_context represents a HEIF file that has been read. }
{ In the future, you will also be able to add pictures to a heif_context }
{ and write it into a file again. }
{ Allocate a new context for reading HEIF files. }
{ Has to be freed again with heif_context_free(). }
function heif_context_alloc:Pheif_context;cdecl;external libheif;
{ Free a previously allocated HEIF context. You should not free a context twice. }
procedure heif_context_free(para1:Pheif_context);cdecl;external libheif;
type
  Pheif_reading_options = ^Theif_reading_options;
  Theif_reading_options = record
      {undefined structure}
    end;

{ requested size has been reached, we can read until this point }
{ size has not been reached yet, but it may still grow further }
{ size has not been reached and never will. The file has grown to its full size }
  Theif_reader_grow_status =  Longint;
  Const
    heif_reader_grow_status_size_reached = 0;
    heif_reader_grow_status_timeout = 1;
    heif_reader_grow_status_size_beyond_eof = 2;

{ API version supported by this reader }
{ --- version 1 functions --- }
{ The functions read(), and seek() return heif_error_ok on success. }
{ Generally, libheif will make sure that we do not read past the file size. }
{ When calling this function, libheif wants to make sure that it can read the file }
{ up to 'target_size'. This is useful when the file is currently downloaded and may }
{ grow with time. You may, for example, extract the image sizes even before the actual }
{ compressed image data has been completely downloaded. }
{ }
{ Even if your input files will not grow, you will have to implement at least }
{ detection whether the target_size is above the (fixed) file length }
{ (in this case, return 'size_beyond_eof'). }
type
  Pheif_reader = ^Theif_reader;
  Theif_reader = record
      reader_api_version : longint;
      get_position : function (userdata:pointer):Tint64_t;cdecl;
      read : function (data:pointer; size:Tsize_t; userdata:pointer):longint;cdecl;
      seek : function (position:Tint64_t; userdata:pointer):longint;cdecl;
      wait_for_file_size : function (target_size:Tint64_t; userdata:pointer):Theif_reader_grow_status;cdecl;
    end;

{ Read a HEIF file from a named disk file. }
{ The heif_reading_options should currently be set to NULL. }

function heif_context_read_from_file(para1:Pheif_context; filename:Pchar; para3:Pheif_reading_options):Theif_error;cdecl;external libheif;
{ Read a HEIF file stored completely in memory. }
{ The heif_reading_options should currently be set to NULL. }
{ DEPRECATED: use heif_context_read_from_memory_without_copy() instead. }
function heif_context_read_from_memory(para1:Pheif_context; mem:pointer; size:Tsize_t; para4:Pheif_reading_options):Theif_error;cdecl;external libheif;
{ Same as heif_context_read_from_memory() except that the provided memory is not copied. }
{ That means, you will have to keep the memory area alive as long as you use the heif_context. }
function heif_context_read_from_memory_without_copy(para1:Pheif_context; mem:pointer; size:Tsize_t; para4:Pheif_reading_options):Theif_error;cdecl;external libheif;
function heif_context_read_from_reader(para1:Pheif_context; reader:Pheif_reader; userdata:pointer; para4:Pheif_reading_options):Theif_error;cdecl;external libheif;
{ Number of top-level images in the HEIF file. This does not include the thumbnails or the }
{ tile images that are composed to an image grid. You can get access to the thumbnails via }
{ the main image handle. }
function heif_context_get_number_of_top_level_images(ctx:Pheif_context):longint;cdecl;external libheif;
function heif_context_is_top_level_image_ID(ctx:Pheif_context; id:Theif_item_id):longint;cdecl;external libheif;
{ Fills in image IDs into the user-supplied int-array 'ID_array', preallocated with 'count' entries. }
{ Function returns the total number of IDs filled into the array. }
function heif_context_get_list_of_top_level_image_IDs(ctx:Pheif_context; ID_array:Pheif_item_id; count:longint):longint;cdecl;external libheif;
function heif_context_get_primary_image_ID(ctx:Pheif_context; id:Pheif_item_id):Theif_error;cdecl;external libheif;
{ Get a handle to the primary image of the HEIF file. }
{ This is the image that should be displayed primarily when there are several images in the file. }
function heif_context_get_primary_image_handle(ctx:Pheif_context; para2:PPheif_image_handle):Theif_error;cdecl;external libheif;
{ Get the image handle for a known image ID. }
function heif_context_get_image_handle(ctx:Pheif_context; id:Theif_item_id; para3:PPheif_image_handle):Theif_error;cdecl;external libheif;
{ Print information about the boxes of a HEIF file to file descriptor. }
{ This is for debugging and informational purposes only. You should not rely on }
{ the output having a specific format. At best, you should not use this at all. }
procedure heif_context_debug_dump_boxes_to_file(ctx:Pheif_context; fd:longint);cdecl;external libheif;
procedure heif_context_set_maximum_image_size_limit(ctx:Pheif_context; maximum_width:longint);cdecl;external libheif;
{ If the maximum threads number is set to 0, the image tiles are decoded in the main thread. }
{ This is different from setting it to 1, which will generate a single background thread to decode the tiles. }
{ Note that this setting only affects libheif itself. The codecs itself may still use multi-threaded decoding. }
{ You can use it, for example, in cases where you are decoding several images in parallel anyway you thus want }
{ to minimize parallelism in each decoder. }
procedure heif_context_set_max_decoding_threads(ctx:Pheif_context; max_threads:longint);cdecl;external libheif;
{ ========================= heif_image_handle ========================= }
{ An heif_image_handle is a handle to a logical image in the HEIF file. }
{ To get the actual pixel data, you have to decode the handle to an heif_image. }
{ An heif_image_handle also gives you access to the thumbnails and Exif data }
{ associated with an image. }
{ Once you obtained an heif_image_handle, you can already release the heif_context, }
{ since it is internally ref-counted. }
{ Release image handle. }
procedure heif_image_handle_release(para1:Pheif_image_handle);cdecl;external libheif;
{ Check whether the given image_handle is the primary image of the file. }
function heif_image_handle_is_primary_image(handle:Pheif_image_handle):longint;cdecl;external libheif;
function heif_image_handle_get_item_id(handle:Pheif_image_handle):Theif_item_id;cdecl;external libheif;
{ Get the resolution of an image. }
function heif_image_handle_get_width(handle:Pheif_image_handle):longint;cdecl;external libheif;
function heif_image_handle_get_height(handle:Pheif_image_handle):longint;cdecl;external libheif;
function heif_image_handle_has_alpha_channel(para1:Pheif_image_handle):longint;cdecl;external libheif;
function heif_image_handle_is_premultiplied_alpha(para1:Pheif_image_handle):longint;cdecl;external libheif;
{ Returns -1 on error, e.g. if this information is not present in the image. }
function heif_image_handle_get_luma_bits_per_pixel(para1:Pheif_image_handle):longint;cdecl;external libheif;
{ Returns -1 on error, e.g. if this information is not present in the image. }
function heif_image_handle_get_chroma_bits_per_pixel(para1:Pheif_image_handle):longint;cdecl;external libheif;
{ Return the colorspace that libheif proposes to use for decoding. }
{ Usually, these will be either YCbCr or Monochrome, but it may also propose RGB for images }
{ encoded with matrix_coefficients=0. }
{ It may also return *_undefined if the file misses relevant information to determine this without decoding. }
function heif_image_handle_get_preferred_decoding_colorspace(image_handle:Pheif_image_handle; out_colorspace:Pheif_colorspace; out_chroma:Pheif_chroma):Theif_error;cdecl;external libheif;
{ Get the image width from the 'ispe' box. This is the original image size without }
{ any transformations applied to it. Do not use this unless you know exactly what }
{ you are doing. }
function heif_image_handle_get_ispe_width(handle:Pheif_image_handle):longint;cdecl;external libheif;
function heif_image_handle_get_ispe_height(handle:Pheif_image_handle):longint;cdecl;external libheif;
{ This gets the context associated with the image handle. }
{ Note that you have to release the returned context with heif_context_free() in any case. }
{ }
{ This means: when you have several image-handles that originate from the same file and you get the }
{ context of each of them, the returned pointer may be different even though it refers to the same }
{ logical context. You have to call heif_context_free() on all those context pointers. }
{ After you freed a context pointer, you can still use the context through a different pointer that you }
{ might have acquired from elsewhere. }
function heif_image_handle_get_context(handle:Pheif_image_handle):Pheif_context;cdecl;external libheif;
{ ------------------------- depth images ------------------------- }
function heif_image_handle_has_depth_image(para1:Pheif_image_handle):longint;cdecl;external libheif;
function heif_image_handle_get_number_of_depth_images(handle:Pheif_image_handle):longint;cdecl;external libheif;
function heif_image_handle_get_list_of_depth_image_IDs(handle:Pheif_image_handle; ids:Pheif_item_id; count:longint):longint;cdecl;external libheif;
function heif_image_handle_get_depth_image_handle(handle:Pheif_image_handle; depth_image_id:Theif_item_id; out_depth_handle:PPheif_image_handle):Theif_error;cdecl;external libheif;
type
  Theif_depth_representation_type =  Longint;
  Const
    heif_depth_representation_type_uniform_inverse_Z = 0;
    heif_depth_representation_type_uniform_disparity = 1;
    heif_depth_representation_type_uniform_Z = 2;
    heif_depth_representation_type_nonuniform_disparity = 3;

{ version 1 fields }
{ version 2 fields below }
type
  Pheif_depth_representation_info = ^Theif_depth_representation_info;
  Theif_depth_representation_info = record
      version : Tuint8_t;
      has_z_near : Tuint8_t;
      has_z_far : Tuint8_t;
      has_d_min : Tuint8_t;
      has_d_max : Tuint8_t;
      z_near : Tdouble;
      z_far : Tdouble;
      d_min : Tdouble;
      d_max : Tdouble;
      depth_representation_type : Theif_depth_representation_type;
      disparity_reference_view : Tuint32_t;
      depth_nonlinear_representation_model_size : Tuint32_t;
      depth_nonlinear_representation_model : Puint8_t;
    end;


procedure heif_depth_representation_info_free(info:Pheif_depth_representation_info);cdecl;external libheif;
{ Returns true when there is depth_representation_info available }
{ Note 1: depth_image_id is currently unused because we support only one depth channel per image, but }
{ you should still provide the correct ID for future compatibility. }
{ Note 2: Because of an API bug before v1.11.0, the function also works when 'handle' is the handle of the depth image. }
{ However, you should pass the handle of the main image. Please adapt your code if needed. }
function heif_image_handle_get_depth_image_representation_info(handle:Pheif_image_handle; depth_image_id:Theif_item_id; out:PPheif_depth_representation_info):longint;cdecl;external libheif;
{ ------------------------- thumbnails ------------------------- }
{ List the number of thumbnails assigned to this image handle. Usually 0 or 1. }
function heif_image_handle_get_number_of_thumbnails(handle:Pheif_image_handle):longint;cdecl;external libheif;
function heif_image_handle_get_list_of_thumbnail_IDs(handle:Pheif_image_handle; ids:Pheif_item_id; count:longint):longint;cdecl;external libheif;
{ Get the image handle of a thumbnail image. }
function heif_image_handle_get_thumbnail(main_image_handle:Pheif_image_handle; thumbnail_id:Theif_item_id; out_thumbnail_handle:PPheif_image_handle):Theif_error;cdecl;external libheif;
{ ------------------------- auxiliary images ------------------------- }
const
  LIBHEIF_AUX_IMAGE_FILTER_OMIT_ALPHA = 1 shl 1;  
  LIBHEIF_AUX_IMAGE_FILTER_OMIT_DEPTH = 2 shl 1;  
{ List the number of auxiliary images assigned to this image handle. }

function heif_image_handle_get_number_of_auxiliary_images(handle:Pheif_image_handle; aux_filter:longint):longint;cdecl;external libheif;
function heif_image_handle_get_list_of_auxiliary_image_IDs(handle:Pheif_image_handle; aux_filter:longint; ids:Pheif_item_id; count:longint):longint;cdecl;external libheif;
{ You are responsible to deallocate the returned buffer with heif_image_handle_release_auxiliary_type(). }
function heif_image_handle_get_auxiliary_type(handle:Pheif_image_handle; out_type:PPchar):Theif_error;cdecl;external libheif;
procedure heif_image_handle_release_auxiliary_type(handle:Pheif_image_handle; out_type:PPchar);cdecl;external libheif;
{ DEPRECATED (because typo in function name). Use heif_image_handle_release_auxiliary_type() instead. }
procedure heif_image_handle_free_auxiliary_types(handle:Pheif_image_handle; out_type:PPchar);cdecl;external libheif;
{ Get the image handle of an auxiliary image. }
function heif_image_handle_get_auxiliary_image_handle(main_image_handle:Pheif_image_handle; auxiliary_id:Theif_item_id; out_auxiliary_handle:PPheif_image_handle):Theif_error;cdecl;external libheif;
{ ------------------------- metadata (Exif / XMP) ------------------------- }
{ How many metadata blocks are attached to an image. If you only want to get EXIF data, }
{ set the type_filter to "Exif". Otherwise, set the type_filter to NULL. }
function heif_image_handle_get_number_of_metadata_blocks(handle:Pheif_image_handle; type_filter:Pchar):longint;cdecl;external libheif;
{ 'type_filter' can be used to get only metadata of specific types, like "Exif". }
{ If 'type_filter' is NULL, it will return all types of metadata IDs. }
function heif_image_handle_get_list_of_metadata_block_IDs(handle:Pheif_image_handle; type_filter:Pchar; ids:Pheif_item_id; count:longint):longint;cdecl;external libheif;
{ Return a string indicating the type of the metadata, as specified in the HEIF file. }
{ Exif data will have the type string "Exif". }
{ This string will be valid until the next call to a libheif function. }
{ You do not have to free this string. }
function heif_image_handle_get_metadata_type(handle:Pheif_image_handle; metadata_id:Theif_item_id):Pchar;cdecl;external libheif;
{ For EXIF, the content type is empty. }
{ For XMP, the content type is "application/rdf+xml". }
function heif_image_handle_get_metadata_content_type(handle:Pheif_image_handle; metadata_id:Theif_item_id):Pchar;cdecl;external libheif;
{ Get the size of the raw metadata, as stored in the HEIF file. }
function heif_image_handle_get_metadata_size(handle:Pheif_image_handle; metadata_id:Theif_item_id):Tsize_t;cdecl;external libheif;
{ 'out_data' must point to a memory area of the size reported by heif_image_handle_get_metadata_size(). }
{ The data is returned exactly as stored in the HEIF file. }
{ For Exif data, you probably have to skip the first four bytes of the data, since they }
{ indicate the offset to the start of the TIFF header of the Exif data. }
function heif_image_handle_get_metadata(handle:Pheif_image_handle; metadata_id:Theif_item_id; out_data:pointer):Theif_error;cdecl;external libheif;
{ Only valid for item type == "uri ", an absolute URI }
function heif_image_handle_get_metadata_item_uri_type(handle:Pheif_image_handle; metadata_id:Theif_item_id):Pchar;cdecl;external libheif;
{ ------------------------- color profiles ------------------------- }
type
  Theif_color_profile_type =  Longint;
  Const
    heif_color_profile_type_not_present = 0;
    heif_color_profile_type_nclx = heif_fourcc('n','c','l','x');
    heif_color_profile_type_rICC = heif_fourcc('r','I','C','C');
    heif_color_profile_type_prof = heif_fourcc('p','r','o','f');

{ Returns 'heif_color_profile_type_not_present' if there is no color profile. }
{ If there is an ICC profile and an NCLX profile, the ICC profile is returned. }
{ TODO: we need a new API for this function as images can contain both NCLX and ICC at the same time. }
{       However, you can still use heif_image_handle_get_raw_color_profile() and }
{       heif_image_handle_get_nclx_color_profile() to access both profiles. }

function heif_image_handle_get_color_profile_type(handle:Pheif_image_handle):Theif_color_profile_type;cdecl;external libheif;
function heif_image_handle_get_raw_color_profile_size(handle:Pheif_image_handle):Tsize_t;cdecl;external libheif;
{ Returns 'heif_error_Color_profile_does_not_exist' when there is no ICC profile. }
function heif_image_handle_get_raw_color_profile(handle:Pheif_image_handle; out_data:pointer):Theif_error;cdecl;external libheif;
{ g=0.3;0.6, b=0.15;0.06, r=0.64;0.33, w=0.3127,0.3290 }
type
  Theif_color_primaries =  Longint;
  Const
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
  Theif_transfer_characteristics =  Longint;
  Const
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

{ TODO: or 709-6 according to h.273 }
{ TODO: or 601-7 according to h.273 }
type
  Theif_matrix_coefficients =  Longint;
  Const
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

{ === version 1 fields }
{ --- decoded values (not used when saving nclx) }
type
  Pheif_color_profile_nclx = ^Theif_color_profile_nclx;
  Theif_color_profile_nclx = record
      version : Tuint8_t;
      color_primaries : Theif_color_primaries;
      transfer_characteristics : Theif_transfer_characteristics;
      matrix_coefficients : Theif_matrix_coefficients;
      full_range_flag : Tuint8_t;
      color_primary_red_x : single;
      color_primary_red_y : single;
      color_primary_green_x : single;
      color_primary_green_y : single;
      color_primary_blue_x : single;
      color_primary_blue_y : single;
      color_primary_white_x : single;
      color_primary_white_y : single;
    end;


function heif_nclx_color_profile_set_color_primaries(nclx:Pheif_color_profile_nclx; cp:Tuint16_t):Theif_error;cdecl;external libheif;
function heif_nclx_color_profile_set_transfer_characteristics(nclx:Pheif_color_profile_nclx; transfer_characteristics:Tuint16_t):Theif_error;cdecl;external libheif;
function heif_nclx_color_profile_set_matrix_coefficients(nclx:Pheif_color_profile_nclx; matrix_coefficients:Tuint16_t):Theif_error;cdecl;external libheif;
{ Returns 'heif_error_Color_profile_does_not_exist' when there is no NCLX profile. }
{ TODO: This function does currently not return an NCLX profile if it is stored in the image bitstream. }
{       Only NCLX profiles stored as colr boxes are returned. This may change in the future. }
function heif_image_handle_get_nclx_color_profile(handle:Pheif_image_handle; out_data:PPheif_color_profile_nclx):Theif_error;cdecl;external libheif;
{ Returned color profile has 'version' field set to the maximum allowed. }
{ Do not fill values for higher versions as these might be outside the allocated structure size. }
{ May return NULL. }
function heif_nclx_color_profile_alloc:Pheif_color_profile_nclx;cdecl;external libheif;
procedure heif_nclx_color_profile_free(nclx_profile:Pheif_color_profile_nclx);cdecl;external libheif;
function heif_image_get_color_profile_type(image:Pheif_image):Theif_color_profile_type;cdecl;external libheif;
function heif_image_get_raw_color_profile_size(image:Pheif_image):Tsize_t;cdecl;external libheif;
function heif_image_get_raw_color_profile(image:Pheif_image; out_data:pointer):Theif_error;cdecl;external libheif;
function heif_image_get_nclx_color_profile(image:Pheif_image; out_data:PPheif_color_profile_nclx):Theif_error;cdecl;external libheif;
{ ========================= heif_image ========================= }
{ An heif_image contains a decoded pixel image in various colorspaces, chroma formats, }
{ and bit depths. }
{ Note: when converting images to an interleaved chroma format, the resulting }
{ image contains only a single channel of type channel_interleaved with, e.g., 3 bytes per pixel, }
{ containing the interleaved R,G,B values. }
{ Planar RGB images are specified as heif_colorspace_RGB / heif_chroma_444. }
type
  Theif_progress_step =  Longint;
  Const
    heif_progress_step_total = 0;
    heif_progress_step_load_tile = 1;

{ Combine with 'heif_chroma_upsampling_bilinear' for best quality. }
{ Makes edges look sharper when using YUV 420 with bilinear chroma upsampling. }
type
  Theif_chroma_downsampling_algorithm =  Longint;
  Const
    heif_chroma_downsampling_nearest_neighbor = 1;
    heif_chroma_downsampling_average = 2;
    heif_chroma_downsampling_sharp_yuv = 3;

type
  Theif_chroma_upsampling_algorithm =  Longint;
  Const
    heif_chroma_upsampling_nearest_neighbor = 1;
    heif_chroma_upsampling_bilinear = 2;

{ --- version 1 options }
{ When set to 'false' libheif may also use a different algorithm if the preferred one is not available }
{ or using a different algorithm is computationally less complex. Note that currently (v1.17.0) this }
{ means that for RGB input it will usually choose nearest-neighbor sampling because this is computationally }
{ the simplest. }
{ Set this field to 'true' if you want to make sure that the specified algorithm is used even }
{ at the cost of slightly higher computation times. }
type
  Pheif_color_conversion_options = ^Theif_color_conversion_options;
  Theif_color_conversion_options = record
      version : Tuint8_t;
      preferred_chroma_downsampling_algorithm : Theif_chroma_downsampling_algorithm;
      preferred_chroma_upsampling_algorithm : Theif_chroma_upsampling_algorithm;
      only_use_preferred_chroma_algorithm : Tuint8_t;
    end;

{ version 1 options }
{ Ignore geometric transformations like cropping, rotation, mirroring. }
{ Default: false (do not ignore). }
{ version 2 options }
{ version 3 options }
{ When enabled, an error is returned for invalid input. Otherwise, it will try its best and }
{ add decoding warnings to the decoded heif_image. Default is non-strict. }
{ version 4 options }
{ name_id of the decoder to use for the decoding. }
{ If set to NULL (default), the highest priority decoder is chosen. }
{ The priority is defined in the plugin. }
{ version 5 options }
  Pheif_decoding_options = ^Theif_decoding_options;
  Theif_decoding_options = record
      version : Tuint8_t;
      ignore_transformations : Tuint8_t;
      start_progress : procedure (step:Theif_progress_step; max_progress:longint; progress_user_data:pointer);cdecl;
      on_progress : procedure (step:Theif_progress_step; progress:longint; progress_user_data:pointer);cdecl;
      end_progress : procedure (step:Theif_progress_step; progress_user_data:pointer);cdecl;
      progress_user_data : pointer;
      convert_hdr_to_8bit : Tuint8_t;
      strict_decoding : Tuint8_t;
      decoder_id : Pchar;
      color_conversion_options : Theif_color_conversion_options;
    end;

{ Allocate decoding options and fill with default values. }
{ Note: you should always get the decoding options through this function since the }
{ option structure may grow in size in future versions. }

function heif_decoding_options_alloc:Pheif_decoding_options;cdecl;external libheif;
procedure heif_decoding_options_free(para1:Pheif_decoding_options);cdecl;external libheif;
{ Decode an heif_image_handle into the actual pixel image and also carry out }
{ all geometric transformations specified in the HEIF file (rotation, cropping, mirroring). }
{ }
{ If colorspace or chroma is set to heif_colorspace_undefined or heif_chroma_undefined, }
{ respectively, the original colorspace is taken. }
{ Decoding options may be NULL. If you want to supply options, always use }
{ heif_decoding_options_alloc() to get the structure. }
function heif_decode_image(in_handle:Pheif_image_handle; out_img:PPheif_image; colorspace:Theif_colorspace; chroma:Theif_chroma; options:Pheif_decoding_options):Theif_error;cdecl;external libheif;
{ Get the colorspace format of the image. }
function heif_image_get_colorspace(para1:Pheif_image):Theif_colorspace;cdecl;external libheif;
{ Get the chroma format of the image. }
function heif_image_get_chroma_format(para1:Pheif_image):Theif_chroma;cdecl;external libheif;
{*
 * Get the width of a specified image channel.
 *
 * @param img the image to get the width for
 * @param channel the channel to select
 * @return the width of the channel in pixels, or -1 the channel does not exist in the image
  }
function heif_image_get_width(img:Pheif_image; channel:Theif_channel):longint;cdecl;external libheif;
{*
 * Get the height of a specified image channel.
 *
 * @param img the image to get the height for
 * @param channel the channel to select
 * @return the height of the channel in pixels, or -1 the channel does not exist in the image
  }
function heif_image_get_height(img:Pheif_image; channel:Theif_channel):longint;cdecl;external libheif;
{*
 * Get the width of the main channel.
 *
 * This is the Y channel in YCbCr or mono, or any in RGB.
 *
 * @param img the image to get the primary width for
 * @return the width in pixels
  }
function heif_image_get_primary_width(img:Pheif_image):longint;cdecl;external libheif;
{*
 * Get the height of the main channel.
 *
 * This is the Y channel in YCbCr or mono, or any in RGB.
 *
 * @param img the image to get the primary height for
 * @return the height in pixels
  }
function heif_image_get_primary_height(img:Pheif_image):longint;cdecl;external libheif;
function heif_image_crop(img:Pheif_image; left:longint; right:longint; top:longint; bottom:longint):Theif_error;cdecl;external libheif;
{ Get the number of bits per pixel in the given image channel. Returns -1 if }
{ a non-existing channel was given. }
{ Note that the number of bits per pixel may be different for each color channel. }
{ This function returns the number of bits used for storage of each pixel. }
{ Especially for HDR images, this is probably not what you want. Have a look at }
{ heif_image_get_bits_per_pixel_range() instead. }
function heif_image_get_bits_per_pixel(para1:Pheif_image; channel:Theif_channel):longint;cdecl;external libheif;
{ Get the number of bits per pixel in the given image channel. This function returns }
{ the number of bits used for representing the pixel value, which might be smaller }
{ than the number of bits used in memory. }
{ For example, in 12bit HDR images, this function returns '12', while still 16 bits }
{ are reserved for storage. For interleaved RGBA with 12 bit, this function also returns }
{ '12', not '48' or '64' (heif_image_get_bits_per_pixel returns 64 in this case). }
function heif_image_get_bits_per_pixel_range(para1:Pheif_image; channel:Theif_channel):longint;cdecl;external libheif;
function heif_image_has_channel(para1:Pheif_image; channel:Theif_channel):longint;cdecl;external libheif;
{ Get a pointer to the actual pixel data. }
{ The 'out_stride' is returned as "bytes per line". }
{ When out_stride is NULL, no value will be written. }
{ Returns NULL if a non-existing channel was given. }
function heif_image_get_plane_readonly(para1:Pheif_image; channel:Theif_channel; out_stride:Plongint):Puint8_t;cdecl;external libheif;
function heif_image_get_plane(para1:Pheif_image; channel:Theif_channel; out_stride:Plongint):Puint8_t;cdecl;external libheif;
type
  Pheif_scaling_options = ^Theif_scaling_options;
  Theif_scaling_options = record
      {undefined structure}
    end;

{ Currently, heif_scaling_options is not defined yet. Pass a NULL pointer. }

function heif_image_scale_image(input:Pheif_image; output:PPheif_image; width:longint; height:longint; options:Pheif_scaling_options):Theif_error;cdecl;external libheif;
{ The color profile is not attached to the image handle because we might need it }
{ for color space transform and encoding. }
function heif_image_set_raw_color_profile(image:Pheif_image; profile_type_fourcc_string:Pchar; profile_data:pointer; profile_size:Tsize_t):Theif_error;cdecl;external libheif;
function heif_image_set_nclx_color_profile(image:Pheif_image; color_profile:Pheif_color_profile_nclx):Theif_error;cdecl;external libheif;
{ TODO: this function does not make any sense yet, since we currently cannot modify existing HEIF files. }
{extern }
{void heif_image_remove_color_profile(struct heif_image* image); }
{ Fills the image decoding warnings into the provided 'out_warnings' array. }
{ The size of the array has to be provided in max_output_buffer_entries. }
{ If max_output_buffer_entries==0, the number of decoder warnings is returned. }
{ The function fills the warnings into the provided buffer, starting with 'first_warning_idx'. }
{ It returns the number of warnings filled into the buffer. }
{ Note: you can iterate through all warnings by using 'max_output_buffer_entries=1' and iterate 'first_warning_idx'. }
function heif_image_get_decoding_warnings(image:Pheif_image; first_warning_idx:longint; out_warnings:Pheif_error; max_output_buffer_entries:longint):longint;cdecl;external libheif;
{ This function is only for decoder plugin implementors. }
procedure heif_image_add_decoding_warning(image:Pheif_image; err:Theif_error);cdecl;external libheif;
{ Release heif_image. }
procedure heif_image_release(para1:Pheif_image);cdecl;external libheif;
{ Note: a value of 0 for any of these values indicates that the value is undefined. }
{ The unit of these values is Candelas per square meter. }
type
  Pheif_content_light_level = ^Theif_content_light_level;
  Theif_content_light_level = record
      max_content_light_level : Tuint16_t;
      max_pic_average_light_level : Tuint16_t;
    end;


function heif_image_has_content_light_level(para1:Pheif_image):longint;cdecl;external libheif;
procedure heif_image_get_content_light_level(para1:Pheif_image; out:Pheif_content_light_level);cdecl;external libheif;
procedure heif_image_set_content_light_level(para1:Pheif_image; in:Pheif_content_light_level);cdecl;external libheif;
{ Note: color coordinates are defined according to the CIE 1931 definition of x as specified in ISO 11664-1 (see also ISO 11664-3 and CIE 15). }
type
  Pheif_mastering_display_colour_volume = ^Theif_mastering_display_colour_volume;
  Theif_mastering_display_colour_volume = record
      display_primaries_x : array[0..2] of Tuint16_t;
      display_primaries_y : array[0..2] of Tuint16_t;
      white_point_x : Tuint16_t;
      white_point_y : Tuint16_t;
      max_display_mastering_luminance : Tuint32_t;
      min_display_mastering_luminance : Tuint32_t;
    end;

{ The units for max_display_mastering_luminance and min_display_mastering_luminance is Candelas per square meter. }
  Pheif_decoded_mastering_display_colour_volume = ^Theif_decoded_mastering_display_colour_volume;
  Theif_decoded_mastering_display_colour_volume = record
      display_primaries_x : array[0..2] of single;
      display_primaries_y : array[0..2] of single;
      white_point_x : single;
      white_point_y : single;
      max_display_mastering_luminance : Tdouble;
      min_display_mastering_luminance : Tdouble;
    end;


function heif_image_has_mastering_display_colour_volume(para1:Pheif_image):longint;cdecl;external libheif;
procedure heif_image_get_mastering_display_colour_volume(para1:Pheif_image; out:Pheif_mastering_display_colour_volume);cdecl;external libheif;
procedure heif_image_set_mastering_display_colour_volume(para1:Pheif_image; in:Pheif_mastering_display_colour_volume);cdecl;external libheif;
{ Converts the internal numeric representation of heif_mastering_display_colour_volume to the }
{ normalized values, collected in heif_decoded_mastering_display_colour_volume. }
{ Values that are out-of-range are decoded to 0, indicating an undefined value (as specified in ISO/IEC 23008-2). }
function heif_mastering_display_colour_volume_decode(in:Pheif_mastering_display_colour_volume; out:Pheif_decoded_mastering_display_colour_volume):Theif_error;cdecl;external libheif;
procedure heif_image_get_pixel_aspect_ratio(para1:Pheif_image; aspect_h:Puint32_t; aspect_v:Puint32_t);cdecl;external libheif;
procedure heif_image_set_pixel_aspect_ratio(para1:Pheif_image; aspect_h:Tuint32_t; aspect_v:Tuint32_t);cdecl;external libheif;
{ ==================================================================================================== }
{  Encoding API }
function heif_context_write_to_file(para1:Pheif_context; filename:Pchar):Theif_error;cdecl;external libheif;
{ API version supported by this writer }
{ --- version 1 functions --- }
{ TODO: why do we need this parameter? }
type
  Pheif_writer = ^Theif_writer;
  Theif_writer = record
      writer_api_version : longint;
      write : function (ctx:Pheif_context; data:pointer; size:Tsize_t; userdata:pointer):Theif_error;cdecl;
    end;


function heif_context_write(para1:Pheif_context; writer:Pheif_writer; userdata:pointer):Theif_error;cdecl;external libheif;
{ ----- encoder ----- }
{ The encoder used for actually encoding an image. }
type
  Pheif_encoder = ^Theif_encoder;
  Theif_encoder = record
      {undefined structure}
    end;

{ A description of the encoder's capabilities and name. }
  Pheif_encoder_descriptor = ^Theif_encoder_descriptor;
  Theif_encoder_descriptor = record
      {undefined structure}
    end;

{ A configuration parameter of the encoder. Each encoder implementation may have a different }
{ set of parameters. For the most common settings (e.q. quality), special functions to set }
{ the parameters are provided. }
  Pheif_encoder_parameter = ^Theif_encoder_parameter;
  Theif_encoder_parameter = record
      {undefined structure}
    end;

  Pheif_decoder_descriptor = ^Theif_decoder_descriptor;
  Theif_decoder_descriptor = record
      {undefined structure}
    end;

{ Get a list of available decoders. You can filter the encoders by compression format. }
{ Use format_filter==heif_compression_undefined to get all available decoders. }
{ The returned list of decoders is sorted by their priority (which is a plugin property). }
{ The number of decoders is returned, which are not more than 'count' if (out_decoders != nullptr). }
{ By setting out_decoders==nullptr, you can query the number of decoders, 'count' is ignored. }

function heif_get_decoder_descriptors(format_filter:Theif_compression_format; out_decoders:PPheif_decoder_descriptor; count:longint):longint;cdecl;external libheif;
{ Return a long, descriptive name of the decoder (including version information). }
function heif_decoder_descriptor_get_name(para1:Pheif_decoder_descriptor):Pchar;cdecl;external libheif;
{ Return a short, symbolic name for identifying the decoder. }
{ This name should stay constant over different decoder versions. }
{ Note: the returned ID may be NULL for old plugins that don't support this yet. }
function heif_decoder_descriptor_get_id_name(para1:Pheif_decoder_descriptor):Pchar;cdecl;external libheif;
{ DEPRECATED: use heif_get_encoder_descriptors() instead. }
{ Get a list of available encoders. You can filter the encoders by compression format and name. }
{ Use format_filter==heif_compression_undefined and name_filter==NULL as wildcards. }
{ The returned list of encoders is sorted by their priority (which is a plugin property). }
{ The number of encoders is returned, which are not more than 'count' if (out_encoders != nullptr). }
{ By setting out_encoders==nullptr, you can query the number of encoders, 'count' is ignored. }
{ Note: to get the actual encoder from the descriptors returned here, use heif_context_get_encoder(). }
{ TODO: why do we need this parameter? }
function heif_context_get_encoder_descriptors(para1:Pheif_context; format_filter:Theif_compression_format; name_filter:Pchar; out_encoders:PPheif_encoder_descriptor; count:longint):longint;cdecl;external libheif;
{ Get a list of available encoders. You can filter the encoders by compression format and name. }
{ Use format_filter==heif_compression_undefined and name_filter==NULL as wildcards. }
{ The returned list of encoders is sorted by their priority (which is a plugin property). }
{ The number of encoders is returned, which are not more than 'count' if (out_encoders != nullptr). }
{ By setting out_encoders==nullptr, you can query the number of encoders, 'count' is ignored. }
{ Note: to get the actual encoder from the descriptors returned here, use heif_context_get_encoder(). }
function heif_get_encoder_descriptors(format_filter:Theif_compression_format; name_filter:Pchar; out_encoders:PPheif_encoder_descriptor; count:longint):longint;cdecl;external libheif;
{ Return a long, descriptive name of the encoder (including version information). }
function heif_encoder_descriptor_get_name(para1:Pheif_encoder_descriptor):Pchar;cdecl;external libheif;
{ Return a short, symbolic name for identifying the encoder. }
{ This name should stay constant over different encoder versions. }
function heif_encoder_descriptor_get_id_name(para1:Pheif_encoder_descriptor):Pchar;cdecl;external libheif;
function heif_encoder_descriptor_get_compression_format(para1:Pheif_encoder_descriptor):Theif_compression_format;cdecl;external libheif;
function heif_encoder_descriptor_supports_lossy_compression(para1:Pheif_encoder_descriptor):longint;cdecl;external libheif;
function heif_encoder_descriptor_supports_lossless_compression(para1:Pheif_encoder_descriptor):longint;cdecl;external libheif;
{ Get an encoder instance that can be used to actually encode images from a descriptor. }
function heif_context_get_encoder(context:Pheif_context; para2:Pheif_encoder_descriptor; out_encoder:PPheif_encoder):Theif_error;cdecl;external libheif;
{ Quick check whether there is a decoder available for the given format. }
{ Note that the decoder still may not be able to decode all variants of that format. }
{ You will have to query that further (todo) or just try to decode and check the returned error. }
function heif_have_decoder_for_format(format:Theif_compression_format):longint;cdecl;external libheif;
{ Quick check whether there is an enoder available for the given format. }
{ Note that the encoder may be limited to a certain subset of features (e.g. only 8 bit, only lossy). }
{ You will have to query the specific capabilities further. }
function heif_have_encoder_for_format(format:Theif_compression_format):longint;cdecl;external libheif;
{ Get an encoder for the given compression format. If there are several encoder plugins }
{ for this format, the encoder with the highest plugin priority will be returned. }
function heif_context_get_encoder_for_format(context:Pheif_context; format:Theif_compression_format; para3:PPheif_encoder):Theif_error;cdecl;external libheif;
{ You have to release the encoder after use. }
procedure heif_encoder_release(para1:Pheif_encoder);cdecl;external libheif;
{ Get the encoder name from the encoder itself. }
function heif_encoder_get_name(para1:Pheif_encoder):Pchar;cdecl;external libheif;
{ --- Encoder Parameters --- }
{ Libheif supports settings parameters through specialized functions and through }
{ generic functions by parameter name. Sometimes, the same parameter can be set }
{ in both ways. }
{ We consider it best practice to use the generic parameter functions only in }
{ dynamically generated user interfaces, as no guarantees are made that some specific }
{ parameter names are supported by all plugins. }
{ Set a 'quality' factor (0-100). How this is mapped to actual encoding parameters is }
{ encoder dependent. }
function heif_encoder_set_lossy_quality(para1:Pheif_encoder; quality:longint):Theif_error;cdecl;external libheif;
function heif_encoder_set_lossless(para1:Pheif_encoder; enable:longint):Theif_error;cdecl;external libheif;
{ level should be between 0 (= none) to 4 (= full) }
function heif_encoder_set_logging_level(para1:Pheif_encoder; level:longint):Theif_error;cdecl;external libheif;
{ Get a generic list of encoder parameters. }
{ Each encoder may define its own, additional set of parameters. }
{ You do not have to free the returned list. }
function heif_encoder_list_parameters(para1:Pheif_encoder):^Pheif_encoder_parameter;cdecl;external libheif;
{ Return the parameter name. }
function heif_encoder_parameter_get_name(para1:Pheif_encoder_parameter):Pchar;cdecl;external libheif;
type
  Theif_encoder_parameter_type =  Longint;
  Const
    heif_encoder_parameter_type_integer = 1;
    heif_encoder_parameter_type_boolean = 2;
    heif_encoder_parameter_type_string = 3;

{ Return the parameter type. }

function heif_encoder_parameter_get_type(para1:Pheif_encoder_parameter):Theif_encoder_parameter_type;cdecl;external libheif;
{ DEPRECATED. Use heif_encoder_parameter_get_valid_integer_values() instead. }
function heif_encoder_parameter_get_valid_integer_range(para1:Pheif_encoder_parameter; have_minimum_maximum:Plongint; minimum:Plongint; maximum:Plongint):Theif_error;cdecl;external libheif;
{ If integer is limited by a range, have_minimum and/or have_maximum will be != 0 and *minimum, *maximum is set. }
{ If integer is limited by a fixed set of values, *num_valid_values will be >0 and *out_integer_array is set. }
function heif_encoder_parameter_get_valid_integer_values(para1:Pheif_encoder_parameter; have_minimum:Plongint; have_maximum:Plongint; minimum:Plongint; maximum:Plongint; 
           num_valid_values:Plongint; out_integer_array:PPlongint):Theif_error;cdecl;external libheif;
function heif_encoder_parameter_get_valid_string_values(para1:Pheif_encoder_parameter; out_stringarray:PPPchar):Theif_error;cdecl;external libheif;
function heif_encoder_set_parameter_integer(para1:Pheif_encoder; parameter_name:Pchar; value:longint):Theif_error;cdecl;external libheif;
function heif_encoder_get_parameter_integer(para1:Pheif_encoder; parameter_name:Pchar; value:Plongint):Theif_error;cdecl;external libheif;
{ TODO: name should be changed to heif_encoder_get_valid_integer_parameter_range }
{ DEPRECATED. }
function heif_encoder_parameter_integer_valid_range(para1:Pheif_encoder; parameter_name:Pchar; have_minimum_maximum:Plongint; minimum:Plongint; maximum:Plongint):Theif_error;cdecl;external libheif;
function heif_encoder_set_parameter_boolean(para1:Pheif_encoder; parameter_name:Pchar; value:longint):Theif_error;cdecl;external libheif;
function heif_encoder_get_parameter_boolean(para1:Pheif_encoder; parameter_name:Pchar; value:Plongint):Theif_error;cdecl;external libheif;
function heif_encoder_set_parameter_string(para1:Pheif_encoder; parameter_name:Pchar; value:Pchar):Theif_error;cdecl;external libheif;
function heif_encoder_get_parameter_string(para1:Pheif_encoder; parameter_name:Pchar; value:Pchar; value_size:longint):Theif_error;cdecl;external libheif;
{ returns a NULL-terminated list of valid strings or NULL if all values are allowed }
function heif_encoder_parameter_string_valid_values(para1:Pheif_encoder; parameter_name:Pchar; out_stringarray:PPPchar):Theif_error;cdecl;external libheif;
function heif_encoder_parameter_integer_valid_values(para1:Pheif_encoder; parameter_name:Pchar; have_minimum:Plongint; have_maximum:Plongint; minimum:Plongint; 
           maximum:Plongint; num_valid_values:Plongint; out_integer_array:PPlongint):Theif_error;cdecl;external libheif;
{ Set a parameter of any type to the string value. }
{ Integer values are parsed from the string. }
{ Boolean values can be "true"/"false"/"1"/"0" }
{ }
{ x265 encoder specific note: }
{ When using the x265 encoder, you may pass any of its parameters by }
{ prefixing the parameter name with 'x265:'. Hence, to set the 'ctu' parameter, }
{ you will have to set 'x265:ctu' in libheif. }
{ Note that there is no checking for valid parameters when using the prefix. }
function heif_encoder_set_parameter(para1:Pheif_encoder; parameter_name:Pchar; value:Pchar):Theif_error;cdecl;external libheif;
{ Get the current value of a parameter of any type as a human readable string. }
{ The returned string is compatible with heif_encoder_set_parameter(). }
function heif_encoder_get_parameter(para1:Pheif_encoder; parameter_name:Pchar; value_ptr:Pchar; value_size:longint):Theif_error;cdecl;external libheif;
{ Query whether a specific parameter has a default value. }
function heif_encoder_has_default(para1:Pheif_encoder; parameter_name:Pchar):longint;cdecl;external libheif;
{ The orientation values are defined equal to the EXIF Orientation tag. }
type
  Theif_orientation =  Longint;
  Const
    heif_orientation_normal = 1;
    heif_orientation_flip_horizontally = 2;
    heif_orientation_rotate_180 = 3;
    heif_orientation_flip_vertically = 4;
    heif_orientation_rotate_90_cw_then_flip_horizontally = 5;
    heif_orientation_rotate_90_cw = 6;
    heif_orientation_rotate_90_cw_then_flip_vertically = 7;
    heif_orientation_rotate_270_cw = 8;

{ version 1 options }
{ default: true }
{ version 2 options }
{ DEPRECATED. This option is not required anymore. Its value will be ignored. }
{ version 3 options }
{ default: false }
{ version 4 options }
{ Set this to the NCLX parameters to be used in the output image or set to NULL }
{ when the same parameters as in the input image should be used. }
{ version 5 options }
{ libheif will generate irot/imir boxes to match these orientations }
{ version 6 options }
type
  Pheif_encoding_options = ^Theif_encoding_options;
  Theif_encoding_options = record
      version : Tuint8_t;
      save_alpha_channel : Tuint8_t;
      macOS_compatibility_workaround : Tuint8_t;
      save_two_colr_boxes_when_ICC_and_nclx_available : Tuint8_t;
      output_nclx_profile : Pheif_color_profile_nclx;
      macOS_compatibility_workaround_no_nclx_profile : Tuint8_t;
      image_orientation : Theif_orientation;
      color_conversion_options : Theif_color_conversion_options;
    end;


function heif_encoding_options_alloc:Pheif_encoding_options;cdecl;external libheif;
procedure heif_encoding_options_free(para1:Pheif_encoding_options);cdecl;external libheif;
{ Compress the input image. }
{ Returns a handle to the coded image in 'out_image_handle' unless out_image_handle = NULL. }
{ 'options' should be NULL for now. }
{ The first image added to the context is also automatically set the primary image, but }
{ you can change the primary image later with heif_context_set_primary_image(). }
function heif_context_encode_image(para1:Pheif_context; image:Pheif_image; encoder:Pheif_encoder; options:Pheif_encoding_options; out_image_handle:PPheif_image_handle):Theif_error;cdecl;external libheif;
function heif_context_set_primary_image(para1:Pheif_context; image_handle:Pheif_image_handle):Theif_error;cdecl;external libheif;
{ Encode the 'image' as a scaled down thumbnail image. }
{ The image is scaled down to fit into a square area of width 'bbox_size'. }
{ If the input image is already so small that it fits into this bounding box, no thumbnail }
{ image is encoded and NULL is returned in 'out_thumb_image_handle'. }
{ No error is returned in this case. }
{ The encoded thumbnail is automatically assigned to the 'master_image_handle'. Hence, you }
{ do not have to call heif_context_assign_thumbnail(). }
function heif_context_encode_thumbnail(para1:Pheif_context; image:Pheif_image; master_image_handle:Pheif_image_handle; encoder:Pheif_encoder; options:Pheif_encoding_options; 
           bbox_size:longint; out_thumb_image_handle:PPheif_image_handle):Theif_error;cdecl;external libheif;
type
  Theif_metadata_compression =  Longint;
  Const
    heif_metadata_compression_off = 0;
    heif_metadata_compression_auto = 1;
    heif_metadata_compression_deflate = 2;

{ Assign 'thumbnail_image' as the thumbnail image of 'master_image'. }

function heif_context_assign_thumbnail(para1:Pheif_context; master_image:Pheif_image_handle; thumbnail_image:Pheif_image_handle):Theif_error;cdecl;external libheif;
{ Add EXIF metadata to an image. }
function heif_context_add_exif_metadata(para1:Pheif_context; image_handle:Pheif_image_handle; data:pointer; size:longint):Theif_error;cdecl;external libheif;
{ Add XMP metadata to an image. }
function heif_context_add_XMP_metadata(para1:Pheif_context; image_handle:Pheif_image_handle; data:pointer; size:longint):Theif_error;cdecl;external libheif;
{ New version of heif_context_add_XMP_metadata() with data compression (experimental). }
function heif_context_add_XMP_metadata2(para1:Pheif_context; image_handle:Pheif_image_handle; data:pointer; size:longint; compression:Theif_metadata_compression):Theif_error;cdecl;external libheif;
{ Add generic, proprietary metadata to an image. You have to specify an 'item_type' that will }
{ identify your metadata. 'content_type' can be an additional type, or it can be NULL. }
{ For example, this function can be used to add IPTC metadata (IIM stream, not XMP) to an image. }
{ Although not standard, we propose to store IPTC data with item type="iptc", content_type=NULL. }
function heif_context_add_generic_metadata(ctx:Pheif_context; image_handle:Pheif_image_handle; data:pointer; size:longint; item_type:Pchar; 
           content_type:Pchar):Theif_error;cdecl;external libheif;
{ --- heif_image allocation }
{ Create a new image of the specified resolution and colorspace. }
{ Note: no memory for the actual image data is reserved yet. You have to use }
{ heif_image_add_plane() to add the image planes required by your colorspace/chroma. }
function heif_image_create(width:longint; height:longint; colorspace:Theif_colorspace; chroma:Theif_chroma; out_image:PPheif_image):Theif_error;cdecl;external libheif;
{ The indicated bit_depth corresponds to the bit depth per channel. }
{ I.e. for interleaved formats like RRGGBB, the bit_depth would be, e.g., 10 bit instead }
{ of 30 bits or 3*16=48 bits. }
{ For backward compatibility, one can also specify 24bits for RGB and 32bits for RGBA, }
{ instead of the preferred 8 bits. }
function heif_image_add_plane(image:Pheif_image; channel:Theif_channel; width:longint; height:longint; bit_depth:longint):Theif_error;cdecl;external libheif;
{ Signal that the image is premultiplied by the alpha pixel values. }
procedure heif_image_set_premultiplied_alpha(image:Pheif_image; is_premultiplied_alpha:longint);cdecl;external libheif;
function heif_image_is_premultiplied_alpha(image:Pheif_image):longint;cdecl;external libheif;
{ This function extends the padding of the image so that it has at least the given physical size. }
{ The padding border is filled with the pixels along the right/bottom border. }
{ This function may be useful if you want to process the image, but have some external padding requirements. }
{ The image size will not be modified if it is already larger/equal than the given physical size. }
{ I.e. you cannot assume that after calling this function, the stride will be equal to min_physical_width. }
function heif_image_extend_padding_to_size(image:Pheif_image; min_physical_width:longint; min_physical_height:longint):Theif_error;cdecl;external libheif;
{ --- register plugins }
type
  Pheif_decoder_plugin = ^Theif_decoder_plugin;
  Theif_decoder_plugin = record
      {undefined structure}
    end;

  Pheif_encoder_plugin = ^Theif_encoder_plugin;
  Theif_encoder_plugin = record
      {undefined structure}
    end;

{ DEPRECATED. Use heif_register_decoder_plugin(const struct heif_decoder_plugin*) instead. }

function heif_register_decoder(heif:Pheif_context; para2:Pheif_decoder_plugin):Theif_error;cdecl;external libheif;
function heif_register_decoder_plugin(para1:Pheif_decoder_plugin):Theif_error;cdecl;external libheif;
function heif_register_encoder_plugin(para1:Pheif_encoder_plugin):Theif_error;cdecl;external libheif;
{ DEPRECATED, typo in function name }
function heif_encoder_descriptor_supportes_lossy_compression(para1:Pheif_encoder_descriptor):longint;cdecl;external libheif;
{ DEPRECATED, typo in function name }
function heif_encoder_descriptor_supportes_lossless_compression(para1:Pheif_encoder_descriptor):longint;cdecl;external libheif;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 20-1-26 17:29:50 ===


implementation


{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function heif_fourcc(a,b,c,d : longint) : Tuint32_t;
begin
  heif_fourcc:=Tuint32_t((((a shl 24) or (b shl 16)) or (c shl 8)) or d);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBHEIF_MAKE_VERSION(h,m,l : longint) : longint;
begin
  LIBHEIF_MAKE_VERSION:=((h shl 24) or (m shl 16)) or (l shl 8);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LIBHEIF_HAVE_VERSION(h,m,l : longint) : longint;
begin
  LIBHEIF_HAVE_VERSION:=LIBHEIF_NUMERIC_VERSION>=(LIBHEIF_MAKE_VERSION(h,m,l));
end;

{ was #define dname def_expr }
function heif_brand2_heic : longint; { return type might be wrong }
  begin
    heif_brand2_heic:=heif_fourcc('h','e','i','c');
  end;

{ was #define dname def_expr }
function heif_brand2_heix : longint; { return type might be wrong }
  begin
    heif_brand2_heix:=heif_fourcc('h','e','i','x');
  end;

{ was #define dname def_expr }
function heif_brand2_hevc : longint; { return type might be wrong }
  begin
    heif_brand2_hevc:=heif_fourcc('h','e','v','c');
  end;

{ was #define dname def_expr }
function heif_brand2_hevx : longint; { return type might be wrong }
  begin
    heif_brand2_hevx:=heif_fourcc('h','e','v','x');
  end;

{ was #define dname def_expr }
function heif_brand2_heim : longint; { return type might be wrong }
  begin
    heif_brand2_heim:=heif_fourcc('h','e','i','m');
  end;

{ was #define dname def_expr }
function heif_brand2_heis : longint; { return type might be wrong }
  begin
    heif_brand2_heis:=heif_fourcc('h','e','i','s');
  end;

{ was #define dname def_expr }
function heif_brand2_hevm : longint; { return type might be wrong }
  begin
    heif_brand2_hevm:=heif_fourcc('h','e','v','m');
  end;

{ was #define dname def_expr }
function heif_brand2_hevs : longint; { return type might be wrong }
  begin
    heif_brand2_hevs:=heif_fourcc('h','e','v','s');
  end;

{ was #define dname def_expr }
function heif_brand2_avif : longint; { return type might be wrong }
  begin
    heif_brand2_avif:=heif_fourcc('a','v','i','f');
  end;

{ was #define dname def_expr }
function heif_brand2_avis : longint; { return type might be wrong }
  begin
    heif_brand2_avis:=heif_fourcc('a','v','i','s');
  end;

{ was #define dname def_expr }
function heif_brand2_mif1 : longint; { return type might be wrong }
  begin
    heif_brand2_mif1:=heif_fourcc('m','i','f','1');
  end;

{ was #define dname def_expr }
function heif_brand2_mif2 : longint; { return type might be wrong }
  begin
    heif_brand2_mif2:=heif_fourcc('m','i','f','2');
  end;

{ was #define dname def_expr }
function heif_brand2_msf1 : longint; { return type might be wrong }
  begin
    heif_brand2_msf1:=heif_fourcc('m','s','f','1');
  end;

{ was #define dname def_expr }
function heif_brand2_vvic : longint; { return type might be wrong }
  begin
    heif_brand2_vvic:=heif_fourcc('v','v','i','c');
  end;

{ was #define dname def_expr }
function heif_brand2_vvis : longint; { return type might be wrong }
  begin
    heif_brand2_vvis:=heif_fourcc('v','v','i','s');
  end;

{ was #define dname def_expr }
function heif_brand2_evbi : longint; { return type might be wrong }
  begin
    heif_brand2_evbi:=heif_fourcc('e','v','b','i');
  end;

{ was #define dname def_expr }
function heif_brand2_evmi : longint; { return type might be wrong }
  begin
    heif_brand2_evmi:=heif_fourcc('e','v','m','i');
  end;

{ was #define dname def_expr }
function heif_brand2_evbs : longint; { return type might be wrong }
  begin
    heif_brand2_evbs:=heif_fourcc('e','v','b','s');
  end;

{ was #define dname def_expr }
function heif_brand2_evms : longint; { return type might be wrong }
  begin
    heif_brand2_evms:=heif_fourcc('e','v','m','s');
  end;

{ was #define dname def_expr }
function heif_brand2_jpeg : longint; { return type might be wrong }
  begin
    heif_brand2_jpeg:=heif_fourcc('j','p','e','g');
  end;

{ was #define dname def_expr }
function heif_brand2_jpgs : longint; { return type might be wrong }
  begin
    heif_brand2_jpgs:=heif_fourcc('j','p','g','s');
  end;

{ was #define dname def_expr }
function heif_brand2_j2ki : longint; { return type might be wrong }
  begin
    heif_brand2_j2ki:=heif_fourcc('j','2','k','i');
  end;

{ was #define dname def_expr }
function heif_brand2_j2is : longint; { return type might be wrong }
  begin
    heif_brand2_j2is:=heif_fourcc('j','2','i','s');
  end;

{ was #define dname def_expr }
function heif_brand2_miaf : longint; { return type might be wrong }
  begin
    heif_brand2_miaf:=heif_fourcc('m','i','a','f');
  end;

{ was #define dname def_expr }
function heif_brand2_1pic : longint; { return type might be wrong }
  begin
    heif_brand2_1pic:=heif_fourcc('1','p','i','c');
  end;


end.
