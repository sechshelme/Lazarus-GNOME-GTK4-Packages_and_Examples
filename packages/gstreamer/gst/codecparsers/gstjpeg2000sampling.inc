/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   14:42                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  PGstJPEG2000Sampling = ^TGstJPEG2000Sampling;
  TGstJPEG2000Sampling = longint;

const
  GST_JPEG2000_SAMPLING_NONE = 0;
  GST_JPEG2000_SAMPLING_RGB = 1;
  GST_JPEG2000_SAMPLING_BGR = 2;
  GST_JPEG2000_SAMPLING_RGBA = 3;
  GST_JPEG2000_SAMPLING_BGRA = 4;
  GST_JPEG2000_SAMPLING_YBR444 = 5;
  GST_JPEG2000_SAMPLING_YBR422 = 6;
  GST_JPEG2000_SAMPLING_YBR420 = 7;
  GST_JPEG2000_SAMPLING_YBR410 = 8;
  GST_JPEG2000_SAMPLING_GRAYSCALE = 9;
  GST_JPEG2000_SAMPLING_YBRA4444_EXT = 10;
  GST_JPEG2000_SAMPLING_YBR411 = 11;

function gst_jpeg2000_sampling_to_string(sampling: TGstJPEG2000Sampling): Pgchar; cdecl; external libgstcodecparsers;
function gst_jpeg2000_sampling_from_string(sampling_string: Pgchar): TGstJPEG2000Sampling; cdecl; external libgstcodecparsers;
function gst_jpeg2000_sampling_is_rgb(sampling: TGstJPEG2000Sampling): Tgboolean; cdecl; external libgstcodecparsers;
function gst_jpeg2000_sampling_is_yuv(sampling: TGstJPEG2000Sampling): Tgboolean; cdecl; external libgstcodecparsers;
function gst_jpeg2000_sampling_is_mono(sampling: TGstJPEG2000Sampling): Tgboolean; cdecl; external libgstcodecparsers;

type
  PGstJPEG2000Colorspace = ^TGstJPEG2000Colorspace;
  TGstJPEG2000Colorspace = longint;

const
  GST_JPEG2000_COLORSPACE_NONE = 0;
  GST_JPEG2000_COLORSPACE_RGB = 1;
  GST_JPEG2000_COLORSPACE_YUV = 2;
  GST_JPEG2000_COLORSPACE_GRAY = 3;

function gst_jpeg2000_colorspace_to_string(colorspace: TGstJPEG2000Colorspace): Pgchar; cdecl; external libgstcodecparsers;
function gst_jpeg2000_colorspace_from_string(colorspace_string: Pgchar): TGstJPEG2000Colorspace; cdecl; external libgstcodecparsers;

// === Konventiert am: 7-10-24 11:29:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
