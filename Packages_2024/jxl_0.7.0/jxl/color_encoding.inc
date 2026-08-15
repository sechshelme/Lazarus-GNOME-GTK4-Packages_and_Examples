{$IFDEF read_interface}


type
  PJxlColorSpace = ^TJxlColorSpace;
  TJxlColorSpace = longint;
const
  JXL_COLOR_SPACE_RGB = 0;
  JXL_COLOR_SPACE_GRAY = 1;
  JXL_COLOR_SPACE_XYB = 2;
  JXL_COLOR_SPACE_UNKNOWN = 3;

type
  PJxlWhitePoint = ^TJxlWhitePoint;
  TJxlWhitePoint = longint;
const
  JXL_WHITE_POINT_D65 = 1;
  JXL_WHITE_POINT_CUSTOM = 2;
  JXL_WHITE_POINT_E = 10;
  JXL_WHITE_POINT_DCI = 11;

type
  PJxlPrimaries = ^TJxlPrimaries;
  TJxlPrimaries = longint;
const
  JXL_PRIMARIES_SRGB = 1;
  JXL_PRIMARIES_CUSTOM = 2;
  JXL_PRIMARIES_2100 = 9;
  JXL_PRIMARIES_P3 = 11;

type
  PJxlTransferFunction = ^TJxlTransferFunction;
  TJxlTransferFunction = longint;
const
  JXL_TRANSFER_FUNCTION_709 = 1;
  JXL_TRANSFER_FUNCTION_UNKNOWN = 2;
  JXL_TRANSFER_FUNCTION_LINEAR = 8;
  JXL_TRANSFER_FUNCTION_SRGB = 13;
  JXL_TRANSFER_FUNCTION_PQ = 16;
  JXL_TRANSFER_FUNCTION_DCI = 17;
  JXL_TRANSFER_FUNCTION_HLG = 18;
  JXL_TRANSFER_FUNCTION_GAMMA = 65535;

type
  PJxlRenderingIntent = ^TJxlRenderingIntent;
  TJxlRenderingIntent = longint;
const
  JXL_RENDERING_INTENT_PERCEPTUAL = 0;
  JXL_RENDERING_INTENT_RELATIVE = 1;
  JXL_RENDERING_INTENT_SATURATION = 2;
  JXL_RENDERING_INTENT_ABSOLUTE = 3;

type
  PJxlColorEncoding = ^TJxlColorEncoding;
  TJxlColorEncoding = record
    color_space: TJxlColorSpace;
    white_point: TJxlWhitePoint;
    white_point_xy: array[0..1] of double;
    primaries: TJxlPrimaries;
    primaries_red_xy: array[0..1] of double;
    primaries_green_xy: array[0..1] of double;
    primaries_blue_xy: array[0..1] of double;
    transfer_function: TJxlTransferFunction;
    gamma: double;
    rendering_intent: TJxlRenderingIntent;
  end;

  // === Konventiert am: 14-8-26 19:29:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
