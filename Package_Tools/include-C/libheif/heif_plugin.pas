unit heif_plugin;

interface

uses
  fp_heif, heif;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Theif_decoder_plugin = record
    plugin_api_version: longint;
    get_plugin_name: function: pchar; cdecl;
    init_plugin: procedure; cdecl;
    deinit_plugin: procedure; cdecl;
    does_support_format: function(format: Theif_compression_format): longint; cdecl;
    new_decoder: function(decoder: Ppointer): Theif_error; cdecl;
    free_decoder: procedure(decoder: pointer); cdecl;
    push_data: function(decoder: pointer; data: pointer; size: Tsize_t): Theif_error; cdecl;
    decode_image: function(decoder: pointer; out_img: PPheif_image): Theif_error; cdecl;
    set_strict_decoding: procedure(decoder: pointer; flag: longint); cdecl;
    id_name: pchar;
  end;
  Pheif_decoder_plugin = ^Theif_decoder_plugin;

type
  Theif_encoded_data_type = longint;
  Pheif_encoded_data_type = ^Theif_encoded_data_type;

const
  heif_encoded_data_type_HEVC_header = 1;
  heif_encoded_data_type_HEVC_image = 2;
  heif_encoded_data_type_HEVC_depth_SEI = 3;

type
  Theif_image_input_class = longint;

const
  heif_image_input_class_normal = 1;
  heif_image_input_class_alpha = 2;
  heif_image_input_class_depth = 3;
  heif_image_input_class_thumbnail = 4;

type
  Theif_encoder_plugin = record
    plugin_api_version: longint;
    compression_format: Theif_compression_format;
    id_name: pchar;
    priority: longint;
    supports_lossy_compression: longint;
    supports_lossless_compression: longint;
    get_plugin_name: function: pchar; cdecl;
    init_plugin: procedure; cdecl;
    cleanup_plugin: procedure; cdecl;
    new_encoder: function(encoder: Ppointer): Theif_error; cdecl;
    free_encoder: procedure(encoder: pointer); cdecl;
    set_parameter_quality: function(encoder: pointer; quality: longint): Theif_error; cdecl;
    get_parameter_quality: function(encoder: pointer; quality: Plongint): Theif_error; cdecl;
    set_parameter_lossless: function(encoder: pointer; lossless: longint): Theif_error; cdecl;
    get_parameter_lossless: function(encoder: pointer; lossless: Plongint): Theif_error; cdecl;
    set_parameter_logging_level: function(encoder: pointer; logging: longint): Theif_error; cdecl;
    get_parameter_logging_level: function(encoder: pointer; logging: Plongint): Theif_error; cdecl;
    list_parameters: function(encoder: pointer): PPheif_encoder_parameter; cdecl;
    set_parameter_integer: function(encoder: pointer; name: pchar; value: longint): Theif_error; cdecl;
    get_parameter_integer: function(encoder: pointer; name: pchar; value: Plongint): Theif_error; cdecl;
    set_parameter_boolean: function(encoder: pointer; name: pchar; value: longint): Theif_error; cdecl;
    get_parameter_boolean: function(encoder: pointer; name: pchar; value: Plongint): Theif_error; cdecl;
    set_parameter_string: function(encoder: pointer; name: pchar; value: pchar): Theif_error; cdecl;
    get_parameter_string: function(encoder: pointer; name: pchar; value: pchar; value_size: longint): Theif_error; cdecl;
    query_input_colorspace: procedure(inout_colorspace: Pheif_colorspace; inout_chroma: Pheif_chroma); cdecl;
    encode_image: function(encoder: pointer; image: Pheif_image; image_class: Theif_image_input_class): Theif_error; cdecl;
    get_compressed_data: function(encoder: pointer; data: PPuint8_t; size: Plongint; _type: Pheif_encoded_data_type): Theif_error; cdecl;
    query_input_colorspace2: procedure(encoder: pointer; inout_colorspace: Pheif_colorspace; inout_chroma: Pheif_chroma); cdecl;
    query_encoded_size: procedure(encoder: pointer; input_width: Tuint32_t; input_height: Tuint32_t; encoded_width: Puint32_t; encoded_height: Puint32_t); cdecl;
  end;
  Pheif_encoder_plugin = ^Theif_encoder_plugin;

const
  heif_encoder_parameter_name_quality = 'quality';
  heif_encoder_parameter_name_lossless = 'lossless';

type
  PPheif_encoder_parameter = ^Theif_encoder_parameter;

  Theif_encoder_parameter = record
    version: integer;
    name: pchar;
    _type: Theif_encoder_parameter_type;
    _union: record
      case integer of
        0: (integer: record
            default_value: integer;
            have_minimum_maximum: uint8;
            minimum: integer;
            maximum: integer;
            valid_values: PInteger;
            num_valid_values: integer;
            end;
        );
        1: (_string: record
            default_value: pchar;
            valid_values: PPChar;
            end;
        );
        2: (boolean: record
            default_value: integer;
            end;
        );
      end;
    has_default: integer;
  end;


var
  heif_error_ok: Theif_error; cvar;external libheif;
  heif_error_unsupported_parameter: Theif_error; cvar;external libheif;
  heif_error_invalid_parameter_value: Theif_error; cvar;external libheif;

  // === Konventiert am: 20-1-26 17:29:53 ===


implementation



end.
