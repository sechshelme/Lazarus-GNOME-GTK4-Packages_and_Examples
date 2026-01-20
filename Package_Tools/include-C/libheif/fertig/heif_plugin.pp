
unit heif_plugin;
interface

{
  Automatically converted by H2Pas 1.0.0 from heif_plugin.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    heif_plugin.h
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
Pheif_chroma  = ^heif_chroma;
Pheif_colorspace  = ^heif_colorspace;
Pheif_decoder_plugin  = ^heif_decoder_plugin;
Pheif_encoded_data_type  = ^heif_encoded_data_type;
Pheif_encoder_parameter  = ^heif_encoder_parameter;
Pheif_encoder_plugin  = ^heif_encoder_plugin;
Pheif_image  = ^heif_image;
Pheif_image_input_class  = ^heif_image_input_class;
Plongint  = ^longint;
Puint32_t  = ^uint32_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * HEIF codec.
 * Copyright (c) 2017 Dirk Farin <dirk.farin@gmail.com>
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
{$ifndef LIBHEIF_HEIF_PLUGIN_H}
{$define LIBHEIF_HEIF_PLUGIN_H}
{ C++ extern C conditionnal removed }
{$include <libheif/heif.h>}
{ ==================================================================================================== }
{  This file is for codec plugin developers only. }
{ ==================================================================================================== }
{ API versions table }
{ }
{ release    decoder   encoder   enc.params }
{ ----------------------------------------- }
{  1.0          1        N/A        N/A }
{  1.1          1         1          1 }
{  1.4          1         1          2 }
{  1.8          1         2          2 }
{  1.13         2         3          2 }
{  1.15         3         3          2 }
{ ==================================================================================================== }
{  Decoder plugin API }
{  In order to decode images in other formats than HEVC, additional compression codecs can be }
{  added as plugins. A plugin has to implement the functions specified in heif_decoder_plugin }
{  and the plugin has to be registered to the libheif library using heif_register_decoder(). }
{ API version supported by this plugin (see table above for supported versions) }
{ --- version 1 functions --- }
{ Human-readable name of the plugin }
(* Const before type ignored *)
{ Global plugin initialization (may be NULL) }
{ Global plugin deinitialization (may be NULL) }
{ Query whether the plugin supports decoding of the given format }
{ Result is a priority value. The plugin with the largest value wins. }
{ Default priority is 100. Returning 0 indicates that the plugin cannot decode this format. }
{ Create a new decoder context for decoding an image }
{ Free the decoder context (heif_image can still be used after destruction) }
{ Push more data into the decoder. This can be called multiple times. }
{ This may not be called after any decode_*() function has been called. }
(* Const before type ignored *)
{ --- After pushing the data into the decoder, the decode functions may be called only once. }
{ --- version 2 functions will follow below ... --- }
{ If not NULL, this can provide a specialized function to convert YCbCr to sRGB, because }
{ only the codec itself knows how to interpret the chroma samples and their locations. }
{
  struct heif_error (*convert_YCbCr_to_sRGB)(void* decoder,
                                             struct heif_image* in_YCbCr_img,
                                             struct heif_image** out_sRGB_img);

   }
{ Reset decoder, such that we can feed in new data for another image. }
{ void (*reset_image)(void* decoder); }
{ --- version 3 functions will follow below ... --- }
(* Const before type ignored *)
{ --- version 4 functions will follow below ... --- }
type
  Pheif_decoder_plugin = ^Theif_decoder_plugin;
  Theif_decoder_plugin = record
      plugin_api_version : longint;
      get_plugin_name : function :Pchar;cdecl;
      init_plugin : procedure ;cdecl;
      deinit_plugin : procedure ;cdecl;
      does_support_format : function (format:Theif_compression_format):longint;cdecl;
      new_decoder : function (decoder:Ppointer):Theif_error;cdecl;
      free_decoder : procedure (decoder:pointer);cdecl;
      push_data : function (decoder:pointer; data:pointer; size:Tsize_t):Theif_error;cdecl;
      decode_image : function (decoder:pointer; out_img:PPheif_image):Theif_error;cdecl;
      set_strict_decoding : procedure (decoder:pointer; flag:longint);cdecl;
      id_name : Pchar;
    end;

  Theif_encoded_data_type =  Longint;
  Const
    heif_encoded_data_type_HEVC_header = 1;
    heif_encoded_data_type_HEVC_image = 2;
    heif_encoded_data_type_HEVC_depth_SEI = 3;

{ Specifies the class of the input image content. }
{ The encoder may want to encode different classes with different parameters }
{ (e.g. always encode alpha lossless) }
type
  Theif_image_input_class =  Longint;
  Const
    heif_image_input_class_normal = 1;
    heif_image_input_class_alpha = 2;
    heif_image_input_class_depth = 3;
    heif_image_input_class_thumbnail = 4;

{ API version supported by this plugin (see table above for supported versions) }
{ --- version 1 functions --- }
{ The compression format generated by this plugin. }
{ Short name of the encoder that can be used as command line parameter when selecting an encoder. }
{ Hence, it should stay stable and not contain any version numbers that will change. }
(* Const before type ignored *)
{ Default priority is 100. }
{ Feature support }
{ Human-readable name of the plugin }
(* Const before type ignored *)
{ Global plugin initialization (may be NULL) }
{ Global plugin cleanup (may be NULL). }
{ Free data that was allocated in init_plugin() }
{ Create a new decoder context for decoding an image }
{ Free the decoder context (heif_image can still be used after destruction) }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
{ Replace the input colorspace/chroma with the one that is supported by the encoder and that }
{ comes as close to the input colorspace/chroma as possible. }
{ Encode an image. }
{ After pushing an image into the encoder, you should call get_compressed_data() to }
{ get compressed data until it returns a NULL data pointer. }
(* Const before type ignored *)
{ Get a packet of decoded data. The data format depends on the codec. }
{ For HEVC, each packet shall contain exactly one NAL, starting with the NAL header without startcode. }
{ --- version 2 --- }
{ --- version 3 --- }
{ The encoded image size may be different from the input frame size, e.g. because }
{ of required rounding, or a required minimum size. Use this function to return }
{ the encoded size for a given input image size. }
{ You may set this to NULL if no padding is required for any image size. }
{ --- version 4 functions will follow below ... --- }
type
  Pheif_encoder_plugin = ^Theif_encoder_plugin;
  Theif_encoder_plugin = record
      plugin_api_version : longint;
      compression_format : Theif_compression_format;
      id_name : Pchar;
      priority : longint;
      supports_lossy_compression : longint;
      supports_lossless_compression : longint;
      get_plugin_name : function :Pchar;cdecl;
      init_plugin : procedure ;cdecl;
      cleanup_plugin : procedure ;cdecl;
      new_encoder : function (encoder:Ppointer):Theif_error;cdecl;
      free_encoder : procedure (encoder:pointer);cdecl;
      set_parameter_quality : function (encoder:pointer; quality:longint):Theif_error;cdecl;
      get_parameter_quality : function (encoder:pointer; quality:Plongint):Theif_error;cdecl;
      set_parameter_lossless : function (encoder:pointer; lossless:longint):Theif_error;cdecl;
      get_parameter_lossless : function (encoder:pointer; lossless:Plongint):Theif_error;cdecl;
      set_parameter_logging_level : function (encoder:pointer; logging:longint):Theif_error;cdecl;
      get_parameter_logging_level : function (encoder:pointer; logging:Plongint):Theif_error;cdecl;
      list_parameters : function (encoder:pointer):PPheif_encoder_parameter;cdecl;
      set_parameter_integer : function (encoder:pointer; name:Pchar; value:longint):Theif_error;cdecl;
      get_parameter_integer : function (encoder:pointer; name:Pchar; value:Plongint):Theif_error;cdecl;
      set_parameter_boolean : function (encoder:pointer; name:Pchar; value:longint):Theif_error;cdecl;
      get_parameter_boolean : function (encoder:pointer; name:Pchar; value:Plongint):Theif_error;cdecl;
      set_parameter_string : function (encoder:pointer; name:Pchar; value:Pchar):Theif_error;cdecl;
      get_parameter_string : function (encoder:pointer; name:Pchar; value:Pchar; value_size:longint):Theif_error;cdecl;
      query_input_colorspace : procedure (inout_colorspace:Pheif_colorspace; inout_chroma:Pheif_chroma);cdecl;
      encode_image : function (encoder:pointer; image:Pheif_image; image_class:Theif_image_input_class):Theif_error;cdecl;
      get_compressed_data : function (encoder:pointer; data:PPuint8_t; size:Plongint; _type:Pheif_encoded_data_type):Theif_error;cdecl;
      query_input_colorspace2 : procedure (encoder:pointer; inout_colorspace:Pheif_colorspace; inout_chroma:Pheif_chroma);cdecl;
      query_encoded_size : procedure (encoder:pointer; input_width:Tuint32_t; input_height:Tuint32_t; encoded_width:Puint32_t; encoded_height:Puint32_t);cdecl;
    end;

{ Names for standard parameters. These should only be used by the encoder plugins. }

const
  heif_encoder_parameter_name_quality = 'quality';  
  heif_encoder_parameter_name_lossless = 'lossless';  
{ For use only by the encoder plugins. }
{ Application programs should use the access functions. }
{ NOLINTNEXTLINE(clang-analyzer-optin.performance.Padding) }
{
struct heif_encoder_parameter

  int version; // current version: 2

  // --- version 1 fields ---

  const char* name;
  enum heif_encoder_parameter_type type;

  union
  
    struct
    
      int default_value;

      uint8_t have_minimum_maximum; // bool
      int minimum;
      int maximum;

      int* valid_values;
      int num_valid_values;
     integer;

    struct
    
      const char* default_value;

      const char* const* valid_values;
     string; // NOLINT

    struct
    
      int default_value;
     boolean;
  ;

  // --- version 2 fields

  int has_default;
;
 }
  var
    heif_error_ok : Theif_error;cvar;external;
    heif_error_unsupported_parameter : Theif_error;cvar;external;
    heif_error_invalid_parameter_value : Theif_error;cvar;external;

implementation


end.
