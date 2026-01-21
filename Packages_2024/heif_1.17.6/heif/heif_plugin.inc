{$IFDEF read_interface}


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

const
  heif_encoder_parameter_name_quality = 'quality';
  heif_encoder_parameter_name_lossless = 'lossless';


  // === Konventiert am: 20-1-26 17:29:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
