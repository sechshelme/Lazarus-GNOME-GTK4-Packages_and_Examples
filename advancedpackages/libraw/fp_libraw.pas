unit fp_libraw;

interface

const
  {$IFDEF Linux}
  libraw = 'libraw';
  {$ENDIF}

  {$IFDEF windows}
  libraw = 'libraw-23.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PFILE = type Pointer;

  Ttime_t = int64;

  Tsize_t = SizeUInt;


  // === Von C++ Header
type
  PLibRaw_abstract_datastream = Pointer;


  //
  // =================================== libraw_version.c
  //

  const
    LIBRAW_MAJOR_VERSION = 0;
    LIBRAW_MINOR_VERSION = 21;
    LIBRAW_PATCH_VERSION = 2;
    LIBRAW_SHLIB_CURRENT = 23;
    LIBRAW_SHLIB_REVISION = 0;
    LIBRAW_SHLIB_AGE = 0;


    //
    // ==================================================== libraw_const.h
    //

    const
      LIBRAW_DEFAULT_ADJUST_MAXIMUM_THRESHOLD = 0.75;
      LIBRAW_DEFAULT_AUTO_BRIGHTNESS_THRESHOLD = 0.01;

    const
      LIBRAW_MAX_ALLOC_MB_DEFAULT = 2048;
      LIBRAW_MAX_PROFILE_SIZE_MB = 256;
      LIBRAW_MAX_NONDNG_RAW_FILE_SIZE = 2147483647;
      LIBRAW_MAX_DNG_RAW_FILE_SIZE = 4294967295;
      //  LIBRAW_MAX_DNG_RAW_FILE_SIZE = 2147483647;

    const
      LIBRAW_MAX_THUMBNAIL_MB = 512;

    const
      LIBRAW_MAX_METADATA_BLOCKS = 1024;
      LIBRAW_CBLACK_SIZE = 4104;
      LIBRAW_IFD_MAXCOUNT = 10;
      LIBRAW_THUMBNAIL_MAXCOUNT = 8;
      LIBRAW_CRXTRACKS_MAXCOUNT = 16;
      LIBRAW_AFDATA_MAXCOUNT = 4;
      LIBRAW_AHD_TILE = 512;

    type
      TLibRaw_open_flags = longint;

    const
      LIBRAW_OPEN_BIGFILE = 1;
      LIBRAW_OPEN_FILE_ = 1 shl 1;

    type
      TLibRaw_openbayer_patterns = longint;

    const
      LIBRAW_OPENBAYER_RGGB = $94;
      LIBRAW_OPENBAYER_BGGR = $16;
      LIBRAW_OPENBAYER_GRBG = $61;
      LIBRAW_OPENBAYER_GBRG = $49;

    type
      TLibRaw_dngfields_marks = longint;

    const
      LIBRAW_DNGFM_FORWARDMATRIX = 1;
      LIBRAW_DNGFM_ILLUMINANT = 1 shl 1;
      LIBRAW_DNGFM_COLORMATRIX = 1 shl 2;
      LIBRAW_DNGFM_CALIBRATION = 1 shl 3;
      LIBRAW_DNGFM_ANALOGBALANCE = 1 shl 4;
      LIBRAW_DNGFM_BLACK = 1 shl 5;
      LIBRAW_DNGFM_WHITE = 1 shl 6;
      LIBRAW_DNGFM_OPCODE2 = 1 shl 7;
      LIBRAW_DNGFM_LINTABLE = 1 shl 8;
      LIBRAW_DNGFM_CROPORIGIN = 1 shl 9;
      LIBRAW_DNGFM_CROPSIZE = 1 shl 10;
      LIBRAW_DNGFM_PREVIEWCS = 1 shl 11;
      LIBRAW_DNGFM_ASSHOTNEUTRAL = 1 shl 12;
      LIBRAW_DNGFM_BASELINEEXPOSURE = 1 shl 13;
      LIBRAW_DNGFM_LINEARRESPONSELIMIT = 1 shl 14;
      LIBRAW_DNGFM_USERCROP = 1 shl 15;
      LIBRAW_DNGFM_OPCODE1 = 1 shl 16;
      LIBRAW_DNGFM_OPCODE3 = 1 shl 17;

    type
      TLibRaw_As_Shot_WB_Applied_codes = longint;

    const
      LIBRAW_ASWB_APPLIED = 1;
      LIBRAW_ASWB_CANON = 2;
      LIBRAW_ASWB_NIKON = 4;
      LIBRAW_ASWB_NIKON_SRAW = 8;
      LIBRAW_ASWB_PENTAX = 16;

    type
      TLibRaw_ExifTagTypes = longint;

    const
      LIBRAW_EXIFTAG_TYPE_UNKNOWN = 0;
      LIBRAW_EXIFTAG_TYPE_BYTE = 1;
      LIBRAW_EXIFTAG_TYPE_ASCII = 2;
      LIBRAW_EXIFTAG_TYPE_SHORT = 3;
      LIBRAW_EXIFTAG_TYPE_LONG = 4;
      LIBRAW_EXIFTAG_TYPE_RATIONAL = 5;
      LIBRAW_EXIFTAG_TYPE_SBYTE = 6;
      LIBRAW_EXIFTAG_TYPE_UNDEFINED = 7;
      LIBRAW_EXIFTAG_TYPE_SSHORT = 8;
      LIBRAW_EXIFTAG_TYPE_SLONG = 9;
      LIBRAW_EXIFTAG_TYPE_SRATIONAL = 10;
      LIBRAW_EXIFTAG_TYPE_FLOAT = 11;
      LIBRAW_EXIFTAG_TYPE_DOUBLE = 12;
      LIBRAW_EXIFTAG_TYPE_IFD = 13;
      LIBRAW_EXIFTAG_TYPE_UNICODE = 14;
      LIBRAW_EXIFTAG_TYPE_COMPLEX = 15;
      LIBRAW_EXIFTAG_TYPE_LONG8 = 16;
      LIBRAW_EXIFTAG_TYPE_SLONG8 = 17;
      LIBRAW_EXIFTAG_TYPE_IFD8 = 18;

    const
      LIBRAW_EXIFTOOLTAGTYPE_int8u = LIBRAW_EXIFTAG_TYPE_BYTE;
      LIBRAW_EXIFTOOLTAGTYPE_string = LIBRAW_EXIFTAG_TYPE_ASCII;
      LIBRAW_EXIFTOOLTAGTYPE_int16u = LIBRAW_EXIFTAG_TYPE_SHORT;
      LIBRAW_EXIFTOOLTAGTYPE_int32u = LIBRAW_EXIFTAG_TYPE_LONG;
      LIBRAW_EXIFTOOLTAGTYPE_rational64u = LIBRAW_EXIFTAG_TYPE_RATIONAL;
      LIBRAW_EXIFTOOLTAGTYPE_int8s = LIBRAW_EXIFTAG_TYPE_SBYTE;
      LIBRAW_EXIFTOOLTAGTYPE_undef = LIBRAW_EXIFTAG_TYPE_UNDEFINED;
      LIBRAW_EXIFTOOLTAGTYPE_binary = LIBRAW_EXIFTAG_TYPE_UNDEFINED;
      LIBRAW_EXIFTOOLTAGTYPE_int16s = LIBRAW_EXIFTAG_TYPE_SSHORT;
      LIBRAW_EXIFTOOLTAGTYPE_int32s = LIBRAW_EXIFTAG_TYPE_SLONG;
      LIBRAW_EXIFTOOLTAGTYPE_rational64s = LIBRAW_EXIFTAG_TYPE_SRATIONAL;
      LIBRAW_EXIFTOOLTAGTYPE_float = LIBRAW_EXIFTAG_TYPE_FLOAT;
      LIBRAW_EXIFTOOLTAGTYPE_double = LIBRAW_EXIFTAG_TYPE_DOUBLE;
      LIBRAW_EXIFTOOLTAGTYPE_ifd = LIBRAW_EXIFTAG_TYPE_IFD;
      LIBRAW_EXIFTOOLTAGTYPE_unicode = LIBRAW_EXIFTAG_TYPE_UNICODE;
      LIBRAW_EXIFTOOLTAGTYPE_complex = LIBRAW_EXIFTAG_TYPE_COMPLEX;
      LIBRAW_EXIFTOOLTAGTYPE_int64u = LIBRAW_EXIFTAG_TYPE_LONG8;
      LIBRAW_EXIFTOOLTAGTYPE_int64s = LIBRAW_EXIFTAG_TYPE_SLONG8;
      LIBRAW_EXIFTOOLTAGTYPE_ifd64 = LIBRAW_EXIFTAG_TYPE_IFD8;
      LIBRAW_LENS_NOT_SET = $ffffffffffffffff;

    type
      TLibRaw_whitebalance_code = longint;

    const
      LIBRAW_WBI_Unknown = 0;
      LIBRAW_WBI_Daylight = 1;
      LIBRAW_WBI_Fluorescent = 2;
      LIBRAW_WBI_Tungsten = 3;
      LIBRAW_WBI_Flash = 4;
      LIBRAW_WBI_FineWeather = 9;
      LIBRAW_WBI_Cloudy = 10;
      LIBRAW_WBI_Shade = 11;
      LIBRAW_WBI_FL_D = 12;
      LIBRAW_WBI_FL_N = 13;
      LIBRAW_WBI_FL_W = 14;
      LIBRAW_WBI_FL_WW = 15;
      LIBRAW_WBI_FL_L = 16;
      LIBRAW_WBI_Ill_A = 17;
      LIBRAW_WBI_Ill_B = 18;
      LIBRAW_WBI_Ill_C = 19;
      LIBRAW_WBI_D55 = 20;
      LIBRAW_WBI_D65 = 21;
      LIBRAW_WBI_D75 = 22;
      LIBRAW_WBI_D50 = 23;
      LIBRAW_WBI_StudioTungsten = 24;
      LIBRAW_WBI_Sunset = 64;
      LIBRAW_WBI_Underwater = 65;
      LIBRAW_WBI_FluorescentHigh = 66;
      LIBRAW_WBI_HT_Mercury = 67;
      LIBRAW_WBI_AsShot = 81;
      LIBRAW_WBI_Auto = 82;
      LIBRAW_WBI_Custom = 83;
      LIBRAW_WBI_Auto1 = 85;
      LIBRAW_WBI_Auto2 = 86;
      LIBRAW_WBI_Auto3 = 87;
      LIBRAW_WBI_Auto4 = 88;
      LIBRAW_WBI_Custom1 = 90;
      LIBRAW_WBI_Custom2 = 91;
      LIBRAW_WBI_Custom3 = 92;
      LIBRAW_WBI_Custom4 = 93;
      LIBRAW_WBI_Custom5 = 94;
      LIBRAW_WBI_Custom6 = 95;
      LIBRAW_WBI_PC_Set1 = 96;
      LIBRAW_WBI_PC_Set2 = 97;
      LIBRAW_WBI_PC_Set3 = 98;
      LIBRAW_WBI_PC_Set4 = 99;
      LIBRAW_WBI_PC_Set5 = 100;
      LIBRAW_WBI_Measured = 110;
      LIBRAW_WBI_BW = 120;
      LIBRAW_WBI_Kelvin = 254;
      LIBRAW_WBI_Other = 255;
      LIBRAW_WBI_None = $ffff;

    type
      TLibRaw_MultiExposure_related = longint;

    const
      LIBRAW_ME_NONE = 0;
      LIBRAW_ME_SIMPLE = 1;
      LIBRAW_ME_OVERLAY = 2;
      LIBRAW_ME_HDR = 3;

    type
      TLibRaw_dng_processing = longint;

    const
      LIBRAW_DNG_NONE = 0;
      LIBRAW_DNG_FLOAT = 1;
      LIBRAW_DNG_LINEAR = 2;
      LIBRAW_DNG_DEFLATE = 4;
      LIBRAW_DNG_XTRANS = 8;
      LIBRAW_DNG_OTHER = 16;
      LIBRAW_DNG_8BIT = 32;
      LIBRAW_DNG_ALL = ((((LIBRAW_DNG_FLOAT or LIBRAW_DNG_LINEAR) or LIBRAW_DNG_DEFLATE) or LIBRAW_DNG_XTRANS) or LIBRAW_DNG_8BIT) or LIBRAW_DNG_OTHER;
      LIBRAW_DNG_DEFAULT = ((LIBRAW_DNG_FLOAT or LIBRAW_DNG_LINEAR) or LIBRAW_DNG_DEFLATE) or LIBRAW_DNG_8BIT;

    type
      TLibRaw_output_flags = longint;

    const
      LIBRAW_OUTPUT_FLAGS_NONE = 0;
      LIBRAW_OUTPUT_FLAGS_PPMMETA = 1;

    type
      TLibRaw_runtime_capabilities = longint;

    const
      LIBRAW_CAPS_RAWSPEED = 1;
      LIBRAW_CAPS_DNGSDK = 1 shl 1;
      LIBRAW_CAPS_GPRSDK = 1 shl 2;
      LIBRAW_CAPS_UNICODEPATHS = 1 shl 3;
      LIBRAW_CAPS_X3FTOOLS = 1 shl 4;
      LIBRAW_CAPS_RPI6BY9 = 1 shl 5;
      LIBRAW_CAPS_ZLIB = 1 shl 6;
      LIBRAW_CAPS_JPEG = 1 shl 7;
      LIBRAW_CAPS_RAWSPEED3 = 1 shl 8;
      LIBRAW_CAPS_RAWSPEED_BITS = 1 shl 9;

    type
      TLibRaw_colorspace = longint;

    const
      LIBRAW_COLORSPACE_NotFound = 0;
      LIBRAW_COLORSPACE_sRGB = 1;
      LIBRAW_COLORSPACE_AdobeRGB = 2;
      LIBRAW_COLORSPACE_WideGamutRGB = 3;
      LIBRAW_COLORSPACE_ProPhotoRGB = 4;
      LIBRAW_COLORSPACE_ICC = 5;
      LIBRAW_COLORSPACE_Uncalibrated = 6;
      LIBRAW_COLORSPACE_CameraLinearUniWB = 7;
      LIBRAW_COLORSPACE_CameraLinear = 8;
      LIBRAW_COLORSPACE_CameraGammaUniWB = 9;
      LIBRAW_COLORSPACE_CameraGamma = 10;
      LIBRAW_COLORSPACE_MonochromeLinear = 11;
      LIBRAW_COLORSPACE_MonochromeGamma = 12;
      LIBRAW_COLORSPACE_Unknown = 255;

    type
      TLibRaw_cameramaker_index = longint;

    const
      LIBRAW_CAMERAMAKER_Unknown = 0;
      LIBRAW_CAMERAMAKER_Agfa = 1;
      LIBRAW_CAMERAMAKER_Alcatel = 2;
      LIBRAW_CAMERAMAKER_Apple = 3;
      LIBRAW_CAMERAMAKER_Aptina = 4;
      LIBRAW_CAMERAMAKER_AVT = 5;
      LIBRAW_CAMERAMAKER_Baumer = 6;
      LIBRAW_CAMERAMAKER_Broadcom = 7;
      LIBRAW_CAMERAMAKER_Canon = 8;
      LIBRAW_CAMERAMAKER_Casio = 9;
      LIBRAW_CAMERAMAKER_CINE = 10;
      LIBRAW_CAMERAMAKER_Clauss = 11;
      LIBRAW_CAMERAMAKER_Contax = 12;
      LIBRAW_CAMERAMAKER_Creative = 13;
      LIBRAW_CAMERAMAKER_DJI = 14;
      LIBRAW_CAMERAMAKER_DXO = 15;
      LIBRAW_CAMERAMAKER_Epson = 16;
      LIBRAW_CAMERAMAKER_Foculus = 17;
      LIBRAW_CAMERAMAKER_Fujifilm = 18;
      LIBRAW_CAMERAMAKER_Generic = 19;
      LIBRAW_CAMERAMAKER_Gione = 20;
      LIBRAW_CAMERAMAKER_GITUP = 21;
      LIBRAW_CAMERAMAKER_Google = 22;
      LIBRAW_CAMERAMAKER_GoPro = 23;
      LIBRAW_CAMERAMAKER_Hasselblad = 24;
      LIBRAW_CAMERAMAKER_HTC = 25;
      LIBRAW_CAMERAMAKER_I_Mobile = 26;
      LIBRAW_CAMERAMAKER_Imacon = 27;
      LIBRAW_CAMERAMAKER_JK_Imaging = 28;
      LIBRAW_CAMERAMAKER_Kodak = 29;
      LIBRAW_CAMERAMAKER_Konica = 30;
      LIBRAW_CAMERAMAKER_Leaf = 31;
      LIBRAW_CAMERAMAKER_Leica = 32;
      LIBRAW_CAMERAMAKER_Lenovo = 33;
      LIBRAW_CAMERAMAKER_LG = 34;
      LIBRAW_CAMERAMAKER_Logitech = 35;
      LIBRAW_CAMERAMAKER_Mamiya = 36;
      LIBRAW_CAMERAMAKER_Matrix = 37;
      LIBRAW_CAMERAMAKER_Meizu = 38;
      LIBRAW_CAMERAMAKER_Micron = 39;
      LIBRAW_CAMERAMAKER_Minolta = 40;
      LIBRAW_CAMERAMAKER_Motorola = 41;
      LIBRAW_CAMERAMAKER_NGM = 42;
      LIBRAW_CAMERAMAKER_Nikon = 43;
      LIBRAW_CAMERAMAKER_Nokia = 44;
      LIBRAW_CAMERAMAKER_Olympus = 45;
      LIBRAW_CAMERAMAKER_OmniVison = 46;
      LIBRAW_CAMERAMAKER_Panasonic = 47;
      LIBRAW_CAMERAMAKER_Parrot = 48;
      LIBRAW_CAMERAMAKER_Pentax = 49;
      LIBRAW_CAMERAMAKER_PhaseOne = 50;
      LIBRAW_CAMERAMAKER_PhotoControl = 51;
      LIBRAW_CAMERAMAKER_Photron = 52;
      LIBRAW_CAMERAMAKER_Pixelink = 53;
      LIBRAW_CAMERAMAKER_Polaroid = 54;
      LIBRAW_CAMERAMAKER_RED = 55;
      LIBRAW_CAMERAMAKER_Ricoh = 56;
      LIBRAW_CAMERAMAKER_Rollei = 57;
      LIBRAW_CAMERAMAKER_RoverShot = 58;
      LIBRAW_CAMERAMAKER_Samsung = 59;
      LIBRAW_CAMERAMAKER_Sigma = 60;
      LIBRAW_CAMERAMAKER_Sinar = 61;
      LIBRAW_CAMERAMAKER_SMaL = 62;
      LIBRAW_CAMERAMAKER_Sony = 63;
      LIBRAW_CAMERAMAKER_ST_Micro = 64;
      LIBRAW_CAMERAMAKER_THL = 65;
      LIBRAW_CAMERAMAKER_VLUU = 66;
      LIBRAW_CAMERAMAKER_Xiaomi = 67;
      LIBRAW_CAMERAMAKER_XIAOYI = 68;
      LIBRAW_CAMERAMAKER_YI = 69;
      LIBRAW_CAMERAMAKER_Yuneec = 70;
      LIBRAW_CAMERAMAKER_Zeiss = 71;
      LIBRAW_CAMERAMAKER_OnePlus = 72;
      LIBRAW_CAMERAMAKER_ISG = 73;
      LIBRAW_CAMERAMAKER_VIVO = 74;
      LIBRAW_CAMERAMAKER_HMD_Global = 75;
      LIBRAW_CAMERAMAKER_HUAWEI = 76;
      LIBRAW_CAMERAMAKER_RaspberryPi = 77;
      LIBRAW_CAMERAMAKER_OmDigital = 78;
      LIBRAW_CAMERAMAKER_TheLastOne = 79;

    type
      TLibRaw_camera_mounts = longint;

    const
      LIBRAW_MOUNT_Unknown = 0;
      LIBRAW_MOUNT_Alpa = 1;
      LIBRAW_MOUNT_C = 2;
      LIBRAW_MOUNT_Canon_EF_M = 3;
      LIBRAW_MOUNT_Canon_EF_S = 4;
      LIBRAW_MOUNT_Canon_EF = 5;
      LIBRAW_MOUNT_Canon_RF = 6;
      LIBRAW_MOUNT_Contax_N = 7;
      LIBRAW_MOUNT_Contax645 = 8;
      LIBRAW_MOUNT_FT = 9;
      LIBRAW_MOUNT_mFT = 10;
      LIBRAW_MOUNT_Fuji_GF = 11;
      LIBRAW_MOUNT_Fuji_GX = 12;
      LIBRAW_MOUNT_Fuji_X = 13;
      LIBRAW_MOUNT_Hasselblad_H = 14;
      LIBRAW_MOUNT_Hasselblad_V = 15;
      LIBRAW_MOUNT_Hasselblad_XCD = 16;
      LIBRAW_MOUNT_Leica_M = 17;
      LIBRAW_MOUNT_Leica_R = 18;
      LIBRAW_MOUNT_Leica_S = 19;
      LIBRAW_MOUNT_Leica_SL = 20;
      LIBRAW_MOUNT_Leica_TL = 21;
      LIBRAW_MOUNT_LPS_L = 22;
      LIBRAW_MOUNT_Mamiya67 = 23;
      LIBRAW_MOUNT_Mamiya645 = 24;
      LIBRAW_MOUNT_Minolta_A = 25;
      LIBRAW_MOUNT_Nikon_CX = 26;
      LIBRAW_MOUNT_Nikon_F = 27;
      LIBRAW_MOUNT_Nikon_Z = 28;
      LIBRAW_MOUNT_PhaseOne_iXM_MV = 29;
      LIBRAW_MOUNT_PhaseOne_iXM_RS = 30;
      LIBRAW_MOUNT_PhaseOne_iXM = 31;
      LIBRAW_MOUNT_Pentax_645 = 32;
      LIBRAW_MOUNT_Pentax_K = 33;
      LIBRAW_MOUNT_Pentax_Q = 34;
      LIBRAW_MOUNT_RicohModule = 35;
      LIBRAW_MOUNT_Rollei_bayonet = 36;
      LIBRAW_MOUNT_Samsung_NX_M = 37;
      LIBRAW_MOUNT_Samsung_NX = 38;
      LIBRAW_MOUNT_Sigma_X3F = 39;
      LIBRAW_MOUNT_Sony_E = 40;
      LIBRAW_MOUNT_LF = 41;
      LIBRAW_MOUNT_DigitalBack = 42;
      LIBRAW_MOUNT_FixedLens = 43;
      LIBRAW_MOUNT_IL_UM = 44;
      LIBRAW_MOUNT_TheLastOne = 45;

    type
      TLibRaw_camera_formats = longint;

    const
      LIBRAW_FORMAT_Unknown = 0;
      LIBRAW_FORMAT_APSC = 1;
      LIBRAW_FORMAT_FF = 2;
      LIBRAW_FORMAT_MF = 3;
      LIBRAW_FORMAT_APSH = 4;
      LIBRAW_FORMAT_1INCH = 5;
      LIBRAW_FORMAT_1div2p3INCH = 6;
      LIBRAW_FORMAT_1div1p7INCH = 7;
      LIBRAW_FORMAT_FT = 8;
      LIBRAW_FORMAT_CROP645 = 9;
      LIBRAW_FORMAT_LeicaS = 10;
      LIBRAW_FORMAT_645 = 11;
      LIBRAW_FORMAT_66 = 12;
      LIBRAW_FORMAT_69 = 13;
      LIBRAW_FORMAT_LF = 14;
      LIBRAW_FORMAT_Leica_DMR = 15;
      LIBRAW_FORMAT_67 = 16;
      LIBRAW_FORMAT_SigmaAPSC = 17;
      LIBRAW_FORMAT_SigmaMerrill = 18;
      LIBRAW_FORMAT_SigmaAPSH = 19;
      LIBRAW_FORMAT_3648 = 20;
      LIBRAW_FORMAT_68 = 21;
      LIBRAW_FORMAT_TheLastOne = 22;

    type
      TLibRawImageAspects = longint;

    const
      LIBRAW_IMAGE_ASPECT_UNKNOWN = 0;
      LIBRAW_IMAGE_ASPECT_OTHER = 1;
      LIBRAW_IMAGE_ASPECT_MINIMAL_REAL_ASPECT_VALUE = 99;
      LIBRAW_IMAGE_ASPECT_MAXIMAL_REAL_ASPECT_VALUE = 10000;
      LIBRAW_IMAGE_ASPECT_3to2 = (1000 * 3) / 2;
      LIBRAW_IMAGE_ASPECT_1to1 = 1000;
      LIBRAW_IMAGE_ASPECT_4to3 = (1000 * 4) / 3;
      LIBRAW_IMAGE_ASPECT_16to9 = (1000 * 16) / 9;
      LIBRAW_IMAGE_ASPECT_5to4 = (1000 * 5) / 4;
      LIBRAW_IMAGE_ASPECT_7to6 = (1000 * 7) / 6;
      LIBRAW_IMAGE_ASPECT_6to5 = (1000 * 6) / 5;
      LIBRAW_IMAGE_ASPECT_7to5 = (1000 * 7) / 5;

    type
      TLibRaw_lens_focal_types = longint;

    const
      LIBRAW_FT_UNDEFINED = 0;
      LIBRAW_FT_PRIME_LENS = 1;
      LIBRAW_FT_ZOOM_LENS = 2;
      LIBRAW_FT_ZOOM_LENS_CONSTANT_APERTURE = 3;
      LIBRAW_FT_ZOOM_LENS_VARIABLE_APERTURE = 4;

    type
      TLibRaw_Canon_RecordModes = longint;

    const
      LIBRAW_Canon_RecordMode_UNDEFINED = 0;
      LIBRAW_Canon_RecordMode_JPEG = 1;
      LIBRAW_Canon_RecordMode_CRW_THM = 2;
      LIBRAW_Canon_RecordMode_AVI_THM = 3;
      LIBRAW_Canon_RecordMode_TIF = 4;
      LIBRAW_Canon_RecordMode_TIF_JPEG = 5;
      LIBRAW_Canon_RecordMode_CR2 = 6;
      LIBRAW_Canon_RecordMode_CR2_JPEG = 7;
      LIBRAW_Canon_RecordMode_UNKNOWN = 8;
      LIBRAW_Canon_RecordMode_MOV = 9;
      LIBRAW_Canon_RecordMode_MP4 = 10;
      LIBRAW_Canon_RecordMode_CRM = 11;
      LIBRAW_Canon_RecordMode_CR3 = 12;
      LIBRAW_Canon_RecordMode_CR3_JPEG = 13;
      LIBRAW_Canon_RecordMode_HEIF = 14;
      LIBRAW_Canon_RecordMode_CR3_HEIF = 15;
      LIBRAW_Canon_RecordMode_TheLastOne = 16;

    type
      TLibRaw_minolta_storagemethods = longint;

    const
      LIBRAW_MINOLTA_UNPACKED = $52;
      LIBRAW_MINOLTA_PACKED = $59;

    type
      TLibRaw_minolta_bayerpatterns = longint;

    const
      LIBRAW_MINOLTA_RGGB = $01;
      LIBRAW_MINOLTA_G2BRG1 = $04;

    type
      TLibRaw_sony_cameratypes = longint;

    const
      LIBRAW_SONY_DSC = 1;
      LIBRAW_SONY_DSLR = 2;
      LIBRAW_SONY_NEX = 3;
      LIBRAW_SONY_SLT = 4;
      LIBRAW_SONY_ILCE = 5;
      LIBRAW_SONY_ILCA = 6;
      LIBRAW_SONY_CameraType_UNKNOWN = $ffff;

    type
      TLibRaw_Sony_0x2010_Type = longint;

    const
      LIBRAW_SONY_Tag2010None = 0;
      LIBRAW_SONY_Tag2010a = 1;
      LIBRAW_SONY_Tag2010b = 2;
      LIBRAW_SONY_Tag2010c = 3;
      LIBRAW_SONY_Tag2010d = 4;
      LIBRAW_SONY_Tag2010e = 5;
      LIBRAW_SONY_Tag2010f = 6;
      LIBRAW_SONY_Tag2010g = 7;
      LIBRAW_SONY_Tag2010h = 8;
      LIBRAW_SONY_Tag2010i = 9;

    type
      TLibRaw_Sony_0x9050_Type = longint;

    const
      LIBRAW_SONY_Tag9050None = 0;
      LIBRAW_SONY_Tag9050a = 1;
      LIBRAW_SONY_Tag9050b = 2;
      LIBRAW_SONY_Tag9050c = 3;

    type
      TLIBRAW_SONY_FOCUSMODEmodes = longint;

    const
      LIBRAW_SONY_FOCUSMODE_MF = 0;
      LIBRAW_SONY_FOCUSMODE_AF_S = 2;
      LIBRAW_SONY_FOCUSMODE_AF_C = 3;
      LIBRAW_SONY_FOCUSMODE_AF_A = 4;
      LIBRAW_SONY_FOCUSMODE_DMF = 6;
      LIBRAW_SONY_FOCUSMODE_AF_D = 7;
      LIBRAW_SONY_FOCUSMODE_AF = 101;
      LIBRAW_SONY_FOCUSMODE_PERMANENT_AF = 104;
      LIBRAW_SONY_FOCUSMODE_SEMI_MF = 105;
      LIBRAW_SONY_FOCUSMODE_UNKNOWN = -(1);

    type
      TLibRaw_KodakSensors = longint;

    const
      LIBRAW_Kodak_UnknownSensor = 0;
      LIBRAW_Kodak_M1 = 1;
      LIBRAW_Kodak_M15 = 2;
      LIBRAW_Kodak_M16 = 3;
      LIBRAW_Kodak_M17 = 4;
      LIBRAW_Kodak_M2 = 5;
      LIBRAW_Kodak_M23 = 6;
      LIBRAW_Kodak_M24 = 7;
      LIBRAW_Kodak_M3 = 8;
      LIBRAW_Kodak_M5 = 9;
      LIBRAW_Kodak_M6 = 10;
      LIBRAW_Kodak_C14 = 11;
      LIBRAW_Kodak_X14 = 12;
      LIBRAW_Kodak_M11 = 13;

    type
      TLibRaw_HasselbladFormatCodes = longint;

    const
      LIBRAW_HF_Unknown = 0;
      LIBRAW_HF_3FR = 1;
      LIBRAW_HF_FFF = 2;
      LIBRAW_HF_Imacon = 3;
      LIBRAW_HF_HasselbladDNG = 4;
      LIBRAW_HF_AdobeDNG = 5;
      LIBRAW_HF_AdobeDNG_fromPhocusDNG = 6;

    type
      TLibRaw_rawspecial_t = longint;

    const
      LIBRAW_RAWSPECIAL_SONYARW2_NONE = 0;
      LIBRAW_RAWSPECIAL_SONYARW2_BASEONLY = 1;
      LIBRAW_RAWSPECIAL_SONYARW2_DELTAONLY = 1 shl 1;
      LIBRAW_RAWSPECIAL_SONYARW2_DELTAZEROBASE = 1 shl 2;
      LIBRAW_RAWSPECIAL_SONYARW2_DELTATOVALUE = 1 shl 3;
      LIBRAW_RAWSPECIAL_SONYARW2_ALLFLAGS = ((LIBRAW_RAWSPECIAL_SONYARW2_BASEONLY + LIBRAW_RAWSPECIAL_SONYARW2_DELTAONLY) + LIBRAW_RAWSPECIAL_SONYARW2_DELTAZEROBASE) + LIBRAW_RAWSPECIAL_SONYARW2_DELTATOVALUE;
      LIBRAW_RAWSPECIAL_NODP2Q_INTERPOLATERG = 1 shl 4;
      LIBRAW_RAWSPECIAL_NODP2Q_INTERPOLATEAF = 1 shl 5;
      LIBRAW_RAWSPECIAL_SRAW_NO_RGB = 1 shl 6;
      LIBRAW_RAWSPECIAL_SRAW_NO_INTERPOLATE = 1 shl 7;

    type
      TLibRaw_rawspeed_bits_t = longint;

    const
      LIBRAW_RAWSPEEDV1_USE = 1;
      LIBRAW_RAWSPEEDV1_FAILONUNKNOWN = 1 shl 1;
      LIBRAW_RAWSPEEDV1_IGNOREERRORS = 1 shl 2;
      LIBRAW_RAWSPEEDV3_USE = 1 shl 8;
      LIBRAW_RAWSPEEDV3_FAILONUNKNOWN = 1 shl 9;
      LIBRAW_RAWSPEEDV3_IGNOREERRORS = 1 shl 10;

    type
      TLibRaw_processing_options = longint;

    const
      LIBRAW_RAWOPTIONS_PENTAX_PS_ALLFRAMES = 1;
      LIBRAW_RAWOPTIONS_CONVERTFLOAT_TO_INT = 1 shl 1;
      LIBRAW_RAWOPTIONS_ARQ_SKIP_CHANNEL_SWAP = 1 shl 2;
      LIBRAW_RAWOPTIONS_NO_ROTATE_FOR_KODAK_THUMBNAILS = 1 shl 3;
      LIBRAW_RAWOPTIONS_USE_PPM16_THUMBS = 1 shl 5;
      LIBRAW_RAWOPTIONS_DONT_CHECK_DNG_ILLUMINANT = 1 shl 6;
      LIBRAW_RAWOPTIONS_DNGSDK_ZEROCOPY = 1 shl 7;
      LIBRAW_RAWOPTIONS_ZEROFILTERS_FOR_MONOCHROMETIFFS = 1 shl 8;
      LIBRAW_RAWOPTIONS_DNG_ADD_ENHANCED = 1 shl 9;
      LIBRAW_RAWOPTIONS_DNG_ADD_PREVIEWS = 1 shl 10;
      LIBRAW_RAWOPTIONS_DNG_PREFER_LARGEST_IMAGE = 1 shl 11;
      LIBRAW_RAWOPTIONS_DNG_STAGE2 = 1 shl 12;
      LIBRAW_RAWOPTIONS_DNG_STAGE3 = 1 shl 13;
      LIBRAW_RAWOPTIONS_DNG_ALLOWSIZECHANGE = 1 shl 14;
      LIBRAW_RAWOPTIONS_DNG_DISABLEWBADJUST = 1 shl 15;
      LIBRAW_RAWOPTIONS_PROVIDE_NONSTANDARD_WB = 1 shl 16;
      LIBRAW_RAWOPTIONS_CAMERAWB_FALLBACK_TO_DAYLIGHT = 1 shl 17;
      LIBRAW_RAWOPTIONS_CHECK_THUMBNAILS_KNOWN_VENDORS = 1 shl 18;
      LIBRAW_RAWOPTIONS_CHECK_THUMBNAILS_ALL_VENDORS = 1 shl 19;
      LIBRAW_RAWOPTIONS_DNG_STAGE2_IFPRESENT = 1 shl 20;
      LIBRAW_RAWOPTIONS_DNG_STAGE3_IFPRESENT = 1 shl 21;
      LIBRAW_RAWOPTIONS_DNG_ADD_MASKS = 1 shl 22;
      LIBRAW_RAWOPTIONS_CANON_IGNORE_MAKERNOTES_ROTATION = 1 shl 23;

    type
      TLibRaw_decoder_flags = longint;

    const
      LIBRAW_DECODER_HASCURVE = 1 shl 4;
      LIBRAW_DECODER_SONYARW2 = 1 shl 5;
      LIBRAW_DECODER_TRYRAWSPEED = 1 shl 6;
      LIBRAW_DECODER_OWNALLOC = 1 shl 7;
      LIBRAW_DECODER_FIXEDMAXC = 1 shl 8;
      LIBRAW_DECODER_ADOBECOPYPIXEL = 1 shl 9;
      LIBRAW_DECODER_LEGACY_WITH_MARGINS = 1 shl 10;
      LIBRAW_DECODER_3CHANNEL = 1 shl 11;
      LIBRAW_DECODER_SINAR4SHOT = 1 shl 11;
      LIBRAW_DECODER_FLATDATA = 1 shl 12;
      LIBRAW_DECODER_FLAT_BG2_SWAPPED = 1 shl 13;
      LIBRAW_DECODER_UNSUPPORTED_FORMAT = 1 shl 14;
      LIBRAW_DECODER_NOTSET = 1 shl 15;
      LIBRAW_DECODER_TRYRAWSPEED3 = 1 shl 16;

      LIBRAW_XTRANS = 9;

    type
      TLibRaw_constructor_flags = longint;

    const
      LIBRAW_OPTIONS_NONE = 0;
      LIBRAW_OPTIONS_NO_DATAERR_CALLBACK = 1 shl 1;
      LIBRAW_OPIONS_NO_DATAERR_CALLBACK = LIBRAW_OPTIONS_NO_DATAERR_CALLBACK;

    type
      TLibRaw_warnings = longint;

    const
      LIBRAW_WARN_NONE = 0;
      LIBRAW_WARN_BAD_CAMERA_WB = 1 shl 2;
      LIBRAW_WARN_NO_METADATA = 1 shl 3;
      LIBRAW_WARN_NO_JPEGLIB = 1 shl 4;
      LIBRAW_WARN_NO_EMBEDDED_PROFILE = 1 shl 5;
      LIBRAW_WARN_NO_INPUT_PROFILE = 1 shl 6;
      LIBRAW_WARN_BAD_OUTPUT_PROFILE = 1 shl 7;
      LIBRAW_WARN_NO_BADPIXELMAP = 1 shl 8;
      LIBRAW_WARN_BAD_DARKFRAME_FILE = 1 shl 9;
      LIBRAW_WARN_BAD_DARKFRAME_DIM = 1 shl 10;
      LIBRAW_WARN_NO_JASPER = 1 shl 11;
      LIBRAW_WARN_RAWSPEED_PROBLEM = 1 shl 12;
      LIBRAW_WARN_RAWSPEED_UNSUPPORTED = 1 shl 13;
      LIBRAW_WARN_RAWSPEED_PROCESSED = 1 shl 14;
      LIBRAW_WARN_FALLBACK_TO_AHD = 1 shl 15;
      LIBRAW_WARN_PARSEFUJI_PROCESSED = 1 shl 16;
      LIBRAW_WARN_DNGSDK_PROCESSED = 1 shl 17;
      LIBRAW_WARN_DNG_IMAGES_REORDERED = 1 shl 18;
      LIBRAW_WARN_DNG_STAGE2_APPLIED = 1 shl 19;
      LIBRAW_WARN_DNG_STAGE3_APPLIED = 1 shl 20;
      LIBRAW_WARN_RAWSPEED3_PROBLEM = 1 shl 21;
      LIBRAW_WARN_RAWSPEED3_UNSUPPORTED = 1 shl 22;
      LIBRAW_WARN_RAWSPEED3_PROCESSED = 1 shl 23;
      LIBRAW_WARN_RAWSPEED3_NOTLISTED = 1 shl 24;

    type
      TLibRaw_exceptions = longint;

    const
      LIBRAW_EXCEPTION_NONE = 0;
      LIBRAW_EXCEPTION_ALLOC = 1;
      LIBRAW_EXCEPTION_DECODE_RAW = 2;
      LIBRAW_EXCEPTION_DECODE_JPEG = 3;
      LIBRAW_EXCEPTION_IO_EOF = 4;
      LIBRAW_EXCEPTION_IO_CORRUPT = 5;
      LIBRAW_EXCEPTION_CANCELLED_BY_CALLBACK = 6;
      LIBRAW_EXCEPTION_BAD_CROP = 7;
      LIBRAW_EXCEPTION_IO_BADFILE = 8;
      LIBRAW_EXCEPTION_DECODE_JPEG2000 = 9;
      LIBRAW_EXCEPTION_TOOBIG = 10;
      LIBRAW_EXCEPTION_MEMPOOL = 11;
      LIBRAW_EXCEPTION_UNSUPPORTED_FORMAT = 12;

    type
      TLibRaw_progress = longint;

    const
      LIBRAW_PROGRESS_START = 0;
      LIBRAW_PROGRESS_OPEN = 1;
      LIBRAW_PROGRESS_IDENTIFY = 1 shl 1;
      LIBRAW_PROGRESS_SIZE_ADJUST = 1 shl 2;
      LIBRAW_PROGRESS_LOAD_RAW = 1 shl 3;
      LIBRAW_PROGRESS_RAW2_IMAGE = 1 shl 4;
      LIBRAW_PROGRESS_REMOVE_ZEROES = 1 shl 5;
      LIBRAW_PROGRESS_BAD_PIXELS = 1 shl 6;
      LIBRAW_PROGRESS_DARK_FRAME = 1 shl 7;
      LIBRAW_PROGRESS_FOVEON_INTERPOLATE = 1 shl 8;
      LIBRAW_PROGRESS_SCALE_COLORS = 1 shl 9;
      LIBRAW_PROGRESS_PRE_INTERPOLATE = 1 shl 10;
      LIBRAW_PROGRESS_INTERPOLATE = 1 shl 11;
      LIBRAW_PROGRESS_MIX_GREEN = 1 shl 12;
      LIBRAW_PROGRESS_MEDIAN_FILTER = 1 shl 13;
      LIBRAW_PROGRESS_HIGHLIGHTS = 1 shl 14;
      LIBRAW_PROGRESS_FUJI_ROTATE = 1 shl 15;
      LIBRAW_PROGRESS_FLIP = 1 shl 16;
      LIBRAW_PROGRESS_APPLY_PROFILE = 1 shl 17;
      LIBRAW_PROGRESS_CONVERT_RGB = 1 shl 18;
      LIBRAW_PROGRESS_STRETCH = 1 shl 19;
      LIBRAW_PROGRESS_STAGE20 = 1 shl 20;
      LIBRAW_PROGRESS_STAGE21 = 1 shl 21;
      LIBRAW_PROGRESS_STAGE22 = 1 shl 22;
      LIBRAW_PROGRESS_STAGE23 = 1 shl 23;
      LIBRAW_PROGRESS_STAGE24 = 1 shl 24;
      LIBRAW_PROGRESS_STAGE25 = 1 shl 25;
      LIBRAW_PROGRESS_STAGE26 = 1 shl 26;
      LIBRAW_PROGRESS_STAGE27 = 1 shl 27;
      LIBRAW_PROGRESS_THUMB_LOAD = 1 shl 28;
      LIBRAW_PROGRESS_TRESERVED1 = 1 shl 29;
      LIBRAW_PROGRESS_TRESERVED2 = 1 shl 30;

      LIBRAW_PROGRESS_THUMB_MASK = $0fffffff;

    type
      TLibRaw_errors = longint;

    const
      LIBRAW_SUCCESS = 0;
      LIBRAW_UNSPECIFIED_ERROR = -(1);
      LIBRAW_FILE_UNSUPPORTED = -(2);
      LIBRAW_REQUEST_FOR_NONEXISTENT_IMAGE = -(3);
      LIBRAW_OUT_OF_ORDER_CALL = -(4);
      LIBRAW_NO_THUMBNAIL = -(5);
      LIBRAW_UNSUPPORTED_THUMBNAIL = -(6);
      LIBRAW_INPUT_CLOSED = -(7);
      LIBRAW_NOT_IMPLEMENTED = -(8);
      LIBRAW_REQUEST_FOR_NONEXISTENT_THUMBNAIL = -(9);
      LIBRAW_UNSUFFICIENT_MEMORY = -(100007);
      LIBRAW_DATA_ERROR = -(100008);
      LIBRAW_IO_ERROR = -(100009);
      LIBRAW_CANCELLED_BY_CALLBACK = -(100010);
      LIBRAW_BAD_CROP = -(100011);
      LIBRAW_TOO_BIG = -(100012);
      LIBRAW_MEMPOOL_OVERFLOW = -(100013);

    function LIBRAW_FATAL_ERROR(ec: longint): boolean;

    type
      TLibRaw_internal_thumbnail_formats = longint;

    const
      LIBRAW_INTERNAL_THUMBNAIL_UNKNOWN = 0;
      LIBRAW_INTERNAL_THUMBNAIL_KODAK_THUMB = 1;
      LIBRAW_INTERNAL_THUMBNAIL_KODAK_YCBCR = 2;
      LIBRAW_INTERNAL_THUMBNAIL_KODAK_RGB = 3;
      LIBRAW_INTERNAL_THUMBNAIL_JPEG = 4;
      LIBRAW_INTERNAL_THUMBNAIL_LAYER = 5;
      LIBRAW_INTERNAL_THUMBNAIL_ROLLEI = 6;
      LIBRAW_INTERNAL_THUMBNAIL_PPM = 7;
      LIBRAW_INTERNAL_THUMBNAIL_PPM16 = 8;
      LIBRAW_INTERNAL_THUMBNAIL_X3F = 9;

    type
      TLibRaw_thumbnail_formats = longint;

    const
      LIBRAW_THUMBNAIL_UNKNOWN = 0;
      LIBRAW_THUMBNAIL_JPEG = 1;
      LIBRAW_THUMBNAIL_BITMAP = 2;
      LIBRAW_THUMBNAIL_BITMAP16 = 3;
      LIBRAW_THUMBNAIL_LAYER = 4;
      LIBRAW_THUMBNAIL_ROLLEI = 5;
      LIBRAW_THUMBNAIL_H265 = 6;

    type
      TLibRaw_image_formats = longint;

    const
      LIBRAW_IMAGE_JPEG = 1;
      LIBRAW_IMAGE_BITMAP = 2;


  //
  // =============================== libraw_types.h
  //

  type
    Pint8_t = ^Tint8_t;
    Tint8_t = int8;

    Puint8_t = ^Tuint8_t;
    Tuint8_t = uint8;

    Pint16_t = ^Tint16_t;
    Tint16_t = int16;

    Puint16_t = ^Tuint16_t;
    Tuint16_t = uint16;

    Pint32_t = ^Tint32_t;
    Tint32_t = int32;

    Puint32_t = ^Tuint32_t;
    Tuint32_t = uint32;

    Pint64_t = ^Tint64_t;
    Tint64_t = int64;

    Puint64_t = ^Tuint64_t;
    Tuint64_t = uint64;

  type
    PINT64 = ^TINT64;
    TINT64 = int64;

    PUINT64 = ^TUINT64;
    TUINT64 = qword;

  type
    Puchar = ^Tuchar;
    Tuchar = byte;

    Pushort = ^Tushort;
    Tushort = word;

    Tlibraw_decoder_info_t = record
      decoder_name: pchar;
      decoder_flags: dword;
    end;
    Plibraw_decoder_info_t = ^Tlibraw_decoder_info_t;

    Tlibraw_internal_output_params_t = record
      mix_green: dword;
      raw_color: dword;
      zero_is_bad: dword;
      shrink: Tushort;
      fuji_width: Tushort;
    end;
    Plibraw_internal_output_params_t = ^Tlibraw_internal_output_params_t;

    Tmemory_callback = procedure(data: pointer; file_: pchar; where: pchar); cdecl;
    Texif_parser_callback = procedure(context: pointer; tag: longint; _type: longint; len: longint; ord: dword; ifp: pointer; base: TINT64); cdecl;
    Tdata_callback = procedure(data: pointer; file_: pchar; offset: longint); cdecl;

  procedure default_data_callback(data: pointer; file_: pchar; offset: longint); cdecl; external libraw;

  type
    Tprogress_callback = function(data: pointer; stage: TLibRaw_progress; iteration: longint; expected: longint): longint; cdecl;
    Tpre_identify_callback = function(ctx: pointer): longint; cdecl;
    Tpost_identify_callback = procedure(ctx: pointer); cdecl;
    Tprocess_step_callback = procedure(ctx: pointer); cdecl;

    Tlibraw_callbacks_t = record
      data_cb: Tdata_callback;
      datacb_data: pointer;
      progress_cb: Tprogress_callback;
      progresscb_data: pointer;
      exif_cb: Texif_parser_callback;
      exifparser_data: pointer;
      pre_identify_cb: Tpre_identify_callback;
      post_identify_cb: Tpost_identify_callback;
      pre_subtractblack_cb: Tprocess_step_callback;
      pre_scalecolors_cb: Tprocess_step_callback;
      pre_preinterpolate_cb: Tprocess_step_callback;
      pre_interpolate_cb: Tprocess_step_callback;
      interpolate_bayer_cb: Tprocess_step_callback;
      interpolate_xtrans_cb: Tprocess_step_callback;
      post_interpolate_cb: Tprocess_step_callback;
      pre_converttorgb_cb: Tprocess_step_callback;
      post_converttorgb_cb: Tprocess_step_callback;
    end;
    Plibraw_callbacks_t = ^Tlibraw_callbacks_t;

    Tlibraw_processed_image_t = record
      _type: TLibRaw_image_formats;
      height: Tushort;
      width: Tushort;
      colors: Tushort;
      bits: Tushort;
      data_size: dword;
      data: array[0..0] of byte;
    end;
    Plibraw_processed_image_t = ^Tlibraw_processed_image_t;

    Tlibraw_iparams_t = record
      guard: array[0..3] of char;
      make: array[0..63] of char;
      model: array[0..63] of char;
      software: array[0..63] of char;
      normalized_make: array[0..63] of char;
      normalized_model: array[0..63] of char;
      maker_index: dword;
      raw_count: dword;
      dng_version: dword;
      is_foveon: dword;
      colors: longint;
      filters: dword;
      xtrans: array[0..5] of array[0..5] of char;
      xtrans_abs: array[0..5] of array[0..5] of char;
      cdesc: array[0..4] of char;
      xmplen: dword;
      xmpdata: pchar;
    end;
    Plibraw_iparams_t = ^Tlibraw_iparams_t;

    Tlibraw_raw_inset_crop_t = record
      cleft: Tushort;
      ctop: Tushort;
      cwidth: Tushort;
      cheight: Tushort;
    end;
    Plibraw_raw_inset_crop_t = ^Tlibraw_raw_inset_crop_t;

    Tlibraw_image_sizes_t = record
      raw_height: Tushort;
      raw_width: Tushort;
      height: Tushort;
      width: Tushort;
      top_margin: Tushort;
      left_margin: Tushort;
      iheight: Tushort;
      iwidth: Tushort;
      raw_pitch: dword;
      pixel_aspect: double;
      flip: longint;
      mask: array[0..7] of array[0..3] of longint;
      raw_aspect: Tushort;
      raw_inset_crops: array[0..1] of Tlibraw_raw_inset_crop_t;
    end;
    Plibraw_image_sizes_t = ^Tlibraw_image_sizes_t;

    Tlibraw_area_t = record
      t: smallint;
      l: smallint;
      b: smallint;
      r: smallint;
    end;
    Plibraw_area_t = ^Tlibraw_area_t;

    Tph1_t = record
      format: longint;
      key_off: longint;
      tag_21a: longint;
      t_black: longint;
      split_col: longint;
      black_col: longint;
      split_row: longint;
      black_row: longint;
      tag_210: single;
    end;
    Pph1_t = ^Tph1_t;

    Tlibraw_dng_color_t = record
      parsedfields: dword;
      illuminant: Tushort;
      calibration: array[0..3] of array[0..3] of single;
      colormatrix: array[0..3] of array[0..2] of single;
      forwardmatrix: array[0..2] of array[0..3] of single;
    end;
    Plibraw_dng_color_t = ^Tlibraw_dng_color_t;

    Tlibraw_dng_levels_t = record
      parsedfields: dword;
      dng_cblack: array[0..(LIBRAW_CBLACK_SIZE) - 1] of dword;
      dng_black: dword;
      dng_fcblack: array[0..(LIBRAW_CBLACK_SIZE) - 1] of single;
      dng_fblack: single;
      dng_whitelevel: array[0..3] of dword;
      default_crop: array[0..3] of Tushort;
      user_crop: array[0..3] of single;
      preview_colorspace: dword;
      analogbalance: array[0..3] of single;
      asshotneutral: array[0..3] of single;
      baseline_exposure: single;
      LinearResponseLimit: single;
    end;
    Plibraw_dng_levels_t = ^Tlibraw_dng_levels_t;

    Tlibraw_P1_color_t = record
      romm_cam: array[0..8] of single;
    end;
    Plibraw_P1_color_t = ^Tlibraw_P1_color_t;

    Tlibraw_canon_makernotes_t = record
      ColorDataVer: longint;
      ColorDataSubVer: longint;
      SpecularWhiteLevel: longint;
      NormalWhiteLevel: longint;
      ChannelBlackLevel: array[0..3] of longint;
      AverageBlackLevel: longint;
      multishot: array[0..3] of dword;
      MeteringMode: smallint;
      SpotMeteringMode: smallint;
      FlashMeteringMode: Tuchar;
      FlashExposureLock: smallint;
      ExposureMode: smallint;
      AESetting: smallint;
      ImageStabilization: smallint;
      FlashMode: smallint;
      FlashActivity: smallint;
      FlashBits: smallint;
      ManualFlashOutput: smallint;
      FlashOutput: smallint;
      FlashGuideNumber: smallint;
      ContinuousDrive: smallint;
      SensorWidth: smallint;
      SensorHeight: smallint;
      AFMicroAdjMode: longint;
      AFMicroAdjValue: single;
      MakernotesFlip: smallint;
      RecordMode: smallint;
      SRAWQuality: smallint;
      wbi: dword;
      RF_lensID: smallint;
      AutoLightingOptimizer: longint;
      HighlightTonePriority: longint;
      Quality: smallint;
      CanonLog: longint;
      DefaultCropAbsolute: Tlibraw_area_t;
      RecommendedImageArea: Tlibraw_area_t;
      LeftOpticalBlack: Tlibraw_area_t;
      UpperOpticalBlack: Tlibraw_area_t;
      ActiveArea: Tlibraw_area_t;
      ISOgain: array[0..1] of smallint;
    end;
    Plibraw_canon_makernotes_t = ^Tlibraw_canon_makernotes_t;

    Tlibraw_hasselblad_makernotes_t = record
      BaseISO: longint;
      Gain: double;
      Sensor: array[0..7] of char;
      SensorUnit: array[0..63] of char;
      HostBody: array[0..63] of char;
      SensorCode: longint;
      SensorSubCode: longint;
      CoatingCode: longint;
      uncropped: longint;
      CaptureSequenceInitiator: array[0..31] of char;
      SensorUnitConnector: array[0..63] of char;
      format: longint;
      nIFD_CM: array[0..1] of longint;
      RecommendedCrop: array[0..1] of longint;
      mnColorMatrix: array[0..3] of array[0..2] of double;
    end;
    Plibraw_hasselblad_makernotes_t = ^Tlibraw_hasselblad_makernotes_t;

    Tlibraw_fuji_info_t = record
      ExpoMidPointShift: single;
      DynamicRange: Tushort;
      FilmMode: Tushort;
      DynamicRangeSetting: Tushort;
      DevelopmentDynamicRange: Tushort;
      AutoDynamicRange: Tushort;
      DRangePriority: Tushort;
      DRangePriorityAuto: Tushort;
      DRangePriorityFixed: Tushort;
      BrightnessCompensation: single;
      FocusMode: Tushort;
      AFMode: Tushort;
      FocusPixel: array[0..1] of Tushort;
      PrioritySettings: Tushort;
      FocusSettings: dword;
      AF_C_Settings: dword;
      FocusWarning: Tushort;
      ImageStabilization: array[0..2] of Tushort;
      FlashMode: Tushort;
      WB_Preset: Tushort;
      ShutterType: Tushort;
      ExrMode: Tushort;
      Macro: Tushort;
      Rating: dword;
      CropMode: Tushort;
      SerialSignature: array[0..($0c + 1) - 1] of char;
      SensorID: array[0..(4 + 1) - 1] of char;
      RAFVersion: array[0..(4 + 1) - 1] of char;
      RAFDataGeneration: longint;
      RAFDataVersion: Tushort;
      isTSNERDTS: longint;
      DriveMode: smallint;
      BlackLevel: array[0..8] of Tushort;
      RAFData_ImageSizeTable: array[0..31] of dword;
      AutoBracketing: longint;
      SequenceNumber: longint;
      SeriesLength: longint;
      PixelShiftOffset: array[0..1] of single;
      ImageCount: longint;
    end;
    Plibraw_fuji_info_t = ^Tlibraw_fuji_info_t;

    Tlibraw_sensor_highspeed_crop_t = record
      cleft: Tushort;
      ctop: Tushort;
      cwidth: Tushort;
      cheight: Tushort;
    end;
    Plibraw_sensor_highspeed_crop_t = ^Tlibraw_sensor_highspeed_crop_t;

    Tlibraw_nikon_makernotes_t = record
      ExposureBracketValue: double;
      ActiveDLighting: Tushort;
      ShootingMode: Tushort;
      ImageStabilization: array[0..6] of Tuchar;
      VibrationReduction: Tuchar;
      VRMode: Tuchar;
      FlashSetting: array[0..12] of char;
      FlashType: array[0..19] of char;
      FlashExposureCompensation: array[0..3] of Tuchar;
      ExternalFlashExposureComp: array[0..3] of Tuchar;
      FlashExposureBracketValue: array[0..3] of Tuchar;
      FlashMode: Tuchar;
      FlashExposureCompensation2: char;
      FlashExposureCompensation3: char;
      FlashExposureCompensation4: char;
      FlashSource: Tuchar;
      FlashFirmware: array[0..1] of Tuchar;
      ExternalFlashFlags: Tuchar;
      FlashControlCommanderMode: Tuchar;
      FlashOutputAndCompensation: Tuchar;
      FlashFocalLength: Tuchar;
      FlashGNDistance: Tuchar;
      FlashGroupControlMode: array[0..3] of Tuchar;
      FlashGroupOutputAndCompensation: array[0..3] of Tuchar;
      FlashColorFilter: Tuchar;
      NEFCompression: Tushort;
      ExposureMode: longint;
      ExposureProgram: longint;
      nMEshots: longint;
      MEgainOn: longint;
      ME_WB: array[0..3] of double;
      AFFineTune: Tuchar;
      AFFineTuneIndex: Tuchar;
      AFFineTuneAdj: Tint8_t;
      LensDataVersion: dword;
      FlashInfoVersion: dword;
      ColorBalanceVersion: dword;
      key: Tuchar;
      NEFBitDepth: array[0..3] of Tushort;
      HighSpeedCropFormat: Tushort;
      SensorHighSpeedCrop: Tlibraw_sensor_highspeed_crop_t;
      SensorWidth: Tushort;
      SensorHeight: Tushort;
      Active_D_Lighting: Tushort;
      ShotInfoVersion: dword;
      MakernotesFlip: smallint;
      RollAngle: double;
      PitchAngle: double;
      YawAngle: double;
    end;
    Plibraw_nikon_makernotes_t = ^Tlibraw_nikon_makernotes_t;

    Tlibraw_olympus_makernotes_t = record
      CameraType2: array[0..5] of char;
      ValidBits: Tushort;
      SensorCalibration: array[0..1] of longint;
      DriveMode: array[0..4] of Tushort;
      ColorSpace: Tushort;
      FocusMode: array[0..1] of Tushort;
      AutoFocus: Tushort;
      AFPoint: Tushort;
      AFAreas: array[0..63] of dword;
      AFPointSelected: array[0..4] of double;
      AFResult: Tushort;
      AFFineTune: Tuchar;
      AFFineTuneAdj: array[0..2] of smallint;
      SpecialMode: array[0..2] of dword;
      ZoomStepCount: Tushort;
      FocusStepCount: Tushort;
      FocusStepInfinity: Tushort;
      FocusStepNear: Tushort;
      FocusDistance: double;
      AspectFrame: array[0..3] of Tushort;
      StackedImage: array[0..1] of dword;
      isLiveND: Tuchar;
      LiveNDfactor: dword;
      Panorama_mode: Tushort;
      Panorama_frameNum: Tushort;
    end;
    Plibraw_olympus_makernotes_t = ^Tlibraw_olympus_makernotes_t;

    Tlibraw_panasonic_makernotes_t = record
      Compression: Tushort;
      BlackLevelDim: Tushort;
      BlackLevel: array[0..7] of single;
      Multishot: dword;
      gamma: single;
      HighISOMultiplier: array[0..2] of longint;
      FocusStepNear: smallint;
      FocusStepCount: smallint;
      ZoomPosition: dword;
      LensManufacturer: dword;
    end;
    Plibraw_panasonic_makernotes_t = ^Tlibraw_panasonic_makernotes_t;

    Tlibraw_pentax_makernotes_t = record
      DriveMode: array[0..3] of Tuchar;
      FocusMode: array[0..1] of Tushort;
      AFPointSelected: array[0..1] of Tushort;
      AFPointSelected_Area: Tushort;
      AFPointsInFocus_version: longint;
      AFPointsInFocus: dword;
      FocusPosition: Tushort;
      AFAdjustment: smallint;
      AFPointMode: Tuchar;
      MultiExposure: Tuchar;
      Quality: Tushort;
    end;
    Plibraw_pentax_makernotes_t = ^Tlibraw_pentax_makernotes_t;

    Tlibraw_ricoh_makernotes_t = record
      AFStatus: Tushort;
      AFAreaXPosition: array[0..1] of dword;
      AFAreaYPosition: array[0..1] of dword;
      AFAreaMode: Tushort;
      SensorWidth: dword;
      SensorHeight: dword;
      CroppedImageWidth: dword;
      CroppedImageHeight: dword;
      WideAdapter: Tushort;
      CropMode: Tushort;
      NDFilter: Tushort;
      AutoBracketing: Tushort;
      MacroMode: Tushort;
      FlashMode: Tushort;
      FlashExposureComp: double;
      ManualFlashOutput: double;
    end;
    Plibraw_ricoh_makernotes_t = ^Tlibraw_ricoh_makernotes_t;

    Tlibraw_samsung_makernotes_t = record
      ImageSizeFull: array[0..3] of dword;
      ImageSizeCrop: array[0..3] of dword;
      ColorSpace: array[0..1] of longint;
      key: array[0..10] of dword;
      DigitalGain: double;
      DeviceType: longint;
      LensFirmware: array[0..31] of char;
    end;
    Plibraw_samsung_makernotes_t = ^Tlibraw_samsung_makernotes_t;

    Tlibraw_kodak_makernotes_t = record
      BlackLevelTop: Tushort;
      BlackLevelBottom: Tushort;
      offset_left: smallint;
      offset_top: smallint;
      clipBlack: Tushort;
      clipWhite: Tushort;
      romm_camDaylight: array[0..2] of array[0..2] of single;
      romm_camTungsten: array[0..2] of array[0..2] of single;
      romm_camFluorescent: array[0..2] of array[0..2] of single;
      romm_camFlash: array[0..2] of array[0..2] of single;
      romm_camCustom: array[0..2] of array[0..2] of single;
      romm_camAuto: array[0..2] of array[0..2] of single;
      val018percent: Tushort;
      val100percent: Tushort;
      val170percent: Tushort;
      MakerNoteKodak8a: smallint;
      ISOCalibrationGain: single;
      AnalogISO: single;
    end;
    Plibraw_kodak_makernotes_t = ^Tlibraw_kodak_makernotes_t;

    Tlibraw_p1_makernotes_t = record
      Software: array[0..63] of char;
      SystemType: array[0..63] of char;
      FirmwareString: array[0..255] of char;
      SystemModel: array[0..63] of char;
    end;
    Plibraw_p1_makernotes_t = ^Tlibraw_p1_makernotes_t;

    Tlibraw_sony_info_t = record
      CameraType: Tushort;
      Sony0x9400_version: Tuchar;
      Sony0x9400_ReleaseMode2: Tuchar;
      Sony0x9400_SequenceImageNumber: dword;
      Sony0x9400_SequenceLength1: Tuchar;
      Sony0x9400_SequenceFileNumber: dword;
      Sony0x9400_SequenceLength2: Tuchar;
      AFAreaModeSetting: Tuint8_t;
      AFAreaMode: Tuint16_t;
      FlexibleSpotPosition: array[0..1] of Tushort;
      AFPointSelected: Tuint8_t;
      AFPointSelected_0x201e: Tuint8_t;
      nAFPointsUsed: smallint;
      AFPointsUsed: array[0..9] of Tuint8_t;
      AFTracking: Tuint8_t;
      AFType: Tuint8_t;
      FocusLocation: array[0..3] of Tushort;
      FocusPosition: Tushort;
      AFMicroAdjValue: Tint8_t;
      AFMicroAdjOn: Tint8_t;
      AFMicroAdjRegisteredLenses: Tuchar;
      VariableLowPassFilter: Tushort;
      LongExposureNoiseReduction: dword;
      HighISONoiseReduction: Tushort;
      HDR: array[0..1] of Tushort;
      group2010: Tushort;
      group9050: Tushort;
      real_iso_offset: Tushort;
      MeteringMode_offset: Tushort;
      ExposureProgram_offset: Tushort;
      ReleaseMode2_offset: Tushort;
      MinoltaCamID: dword;
      firmware: single;
      ImageCount3_offset: Tushort;
      ImageCount3: dword;
      ElectronicFrontCurtainShutter: dword;
      MeteringMode2: Tushort;
      SonyDateTime: array[0..19] of char;
      ShotNumberSincePowerUp: dword;
      PixelShiftGroupPrefix: Tushort;
      PixelShiftGroupID: dword;
      nShotsInPixelShiftGroup: char;
      numInPixelShiftGroup: char;
      prd_ImageHeight: Tushort;
      prd_ImageWidth: Tushort;
      prd_Total_bps: Tushort;
      prd_Active_bps: Tushort;
      prd_StorageMethod: Tushort;
      prd_BayerPattern: Tushort;
      SonyRawFileType: Tushort;
      RAWFileType: Tushort;
      RawSizeType: Tushort;
      Quality: dword;
      FileFormat: Tushort;
      MetaVersion: array[0..15] of char;
    end;
    Plibraw_sony_info_t = ^Tlibraw_sony_info_t;

    Tlibraw_colordata_t = record
      curve: array[0..65535] of Tushort;
      cblack: array[0..(LIBRAW_CBLACK_SIZE) - 1] of dword;
      black: dword;
      data_maximum: dword;
      maximum: dword;
      linear_max: array[0..3] of longint;
      fmaximum: single;
      fnorm: single;
      white: array[0..7] of array[0..7] of Tushort;
      cam_mul: array[0..3] of single;
      pre_mul: array[0..3] of single;
      cmatrix: array[0..2] of array[0..3] of single;
      ccm: array[0..2] of array[0..3] of single;
      rgb_cam: array[0..2] of array[0..3] of single;
      cam_xyz: array[0..3] of array[0..2] of single;
      phase_one_data: Tph1_t;
      flash_used: single;
      canon_ev: single;
      model2: array[0..63] of char;
      UniqueCameraModel: array[0..63] of char;
      LocalizedCameraModel: array[0..63] of char;
      ImageUniqueID: array[0..63] of char;
      RawDataUniqueID: array[0..16] of char;
      OriginalRawFileName: array[0..63] of char;
      profile: pointer;
      profile_length: dword;
      black_stat: array[0..7] of dword;
      dng_color: array[0..1] of Tlibraw_dng_color_t;
      dng_levels: Tlibraw_dng_levels_t;
      WB_Coeffs: array[0..255] of array[0..3] of longint;
      WBCT_Coeffs: array[0..63] of array[0..4] of single;
      as_shot_wb_applied: longint;
      P1_color: array[0..1] of Tlibraw_P1_color_t;
      raw_bps: dword;
      ExifColorSpace: longint;
    end;
    Plibraw_colordata_t = ^Tlibraw_colordata_t;

    Tlibraw_thumbnail_t = record
      tformat: TLibRaw_thumbnail_formats;
      twidth: Tushort;
      theight: Tushort;
      tlength: dword;
      tcolors: longint;
      thumb: pchar;
    end;
    Plibraw_thumbnail_t = ^Tlibraw_thumbnail_t;

    Tlibraw_thumbnail_item_t = record
      tformat: TLibRaw_internal_thumbnail_formats;
      twidth: Tushort;
      theight: Tushort;
      tflip: Tushort;
      tlength: dword;
      tmisc: dword;
      toffset: TINT64;
    end;
    Plibraw_thumbnail_item_t = ^Tlibraw_thumbnail_item_t;

    Tlibraw_thumbnail_list_t = record
      thumbcount: longint;
      thumblist: array[0..(LIBRAW_THUMBNAIL_MAXCOUNT) - 1] of Tlibraw_thumbnail_item_t;
    end;
    Plibraw_thumbnail_list_t = ^Tlibraw_thumbnail_list_t;

    Tlibraw_gps_info_t = record
      latitude: array[0..2] of single;
      longitude: array[0..2] of single;
      gpstimestamp: array[0..2] of single;
      altitude: single;
      altref: char;
      latref: char;
      longref: char;
      gpsstatus: char;
      gpsparsed: char;
    end;
    Plibraw_gps_info_t = ^Tlibraw_gps_info_t;

    Tlibraw_imgother_t = record
      iso_speed: single;
      shutter: single;
      aperture: single;
      focal_len: single;
      timestamp: Ttime_t;
      shot_order: dword;
      gpsdata: array[0..31] of dword;
      parsed_gps: Tlibraw_gps_info_t;
      desc: array[0..511] of char;
      artist: array[0..63] of char;
      analogbalance: array[0..3] of single;
    end;
    Plibraw_imgother_t = ^Tlibraw_imgother_t;

    Tlibraw_afinfo_item_t = record
      AFInfoData_tag: dword;
      AFInfoData_order: smallint;
      AFInfoData_version: dword;
      AFInfoData_length: dword;
      AFInfoData: Puchar;
    end;
    Plibraw_afinfo_item_t = ^Tlibraw_afinfo_item_t;

    Tlibraw_metadata_common_t = record
      FlashEC: single;
      FlashGN: single;
      CameraTemperature: single;
      SensorTemperature: single;
      SensorTemperature2: single;
      LensTemperature: single;
      AmbientTemperature: single;
      BatteryTemperature: single;
      exifAmbientTemperature: single;
      exifHumidity: single;
      exifPressure: single;
      exifWaterDepth: single;
      exifAcceleration: single;
      exifCameraElevationAngle: single;
      real_ISO: single;
      exifExposureIndex: single;
      ColorSpace: Tushort;
      firmware: array[0..127] of char;
      ExposureCalibrationShift: single;
      afdata: array[0..(LIBRAW_AFDATA_MAXCOUNT) - 1] of Tlibraw_afinfo_item_t;
      afcount: longint;
    end;
    Plibraw_metadata_common_t = ^Tlibraw_metadata_common_t;

    Tlibraw_output_params_t = record
      greybox: array[0..3] of dword;
      cropbox: array[0..3] of dword;
      aber: array[0..3] of double;
      gamm: array[0..5] of double;
      user_mul: array[0..3] of single;
      bright: single;
      threshold: single;
      half_size: longint;
      four_color_rgb: longint;
      highlight: longint;
      use_auto_wb: longint;
      use_camera_wb: longint;
      use_camera_matrix: longint;
      output_color: longint;
      output_profile: pchar;
      camera_profile: pchar;
      bad_pixels: pchar;
      dark_frame: pchar;
      output_bps: longint;
      output_tiff: longint;
      output_flags: longint;
      user_flip: longint;
      user_qual: longint;
      user_black: longint;
      user_cblack: array[0..3] of longint;
      user_sat: longint;
      med_passes: longint;
      auto_bright_thr: single;
      adjust_maximum_thr: single;
      no_auto_bright: longint;
      use_fuji_rotate: longint;
      green_matching: longint;
      dcb_iterations: longint;
      dcb_enhance_fl: longint;
      fbdd_noiserd: longint;
      exp_correc: longint;
      exp_shift: single;
      exp_preser: single;
      no_auto_scale: longint;
      no_interpolation: longint;
    end;
    Plibraw_output_params_t = ^Tlibraw_output_params_t;

    Tlibraw_raw_unpack_params_t = record
      use_rawspeed: longint;
      use_dngsdk: longint;
      options: dword;
      shot_select: dword;
      specials: dword;
      max_raw_memory_mb: dword;
      sony_arw2_posterization_thr: longint;
      coolscan_nef_gamma: single;
      p4shot_order: array[0..4] of char;
      custom_camera_strings: ^pchar;
    end;
    Plibraw_raw_unpack_params_t = ^Tlibraw_raw_unpack_params_t;

  type
    Tcolor4arr = array[0..3] of Tushort;
    Tcolor3arr = array[0..2] of Tushort;
    Tfloat3arr = array[0..2] of single;
    Tfloat4arr = array[0..3] of single;
    Tph1arr = array[0..1] of smallint;

    Tlibraw_rawdata_t = record
      raw_alloc: pointer;
      raw_image: Pushort;
      color4_image: ^Tcolor4arr;
      color3_image: ^Tcolor3arr;
      float_image: Psingle;
      float3_image: ^Tfloat3arr;
      float4_image: ^Tfloat4arr;
      ph1_cblack: ^Tph1arr;
      ph1_rblack: ^Tph1arr;
      iparams: Tlibraw_iparams_t;
      sizes: Tlibraw_image_sizes_t;
      ioparams: Tlibraw_internal_output_params_t;
      color: Tlibraw_colordata_t;
    end;
    Plibraw_rawdata_t = ^Tlibraw_rawdata_t;

    Tlibraw_makernotes_lens_t = record
      LensID: qword;
      Lens: array[0..127] of char;
      LensFormat: Tushort;
      LensMount: Tushort;
      CamID: qword;
      CameraFormat: Tushort;
      CameraMount: Tushort;
      body: array[0..63] of char;
      FocalType: smallint;
      LensFeatures_pre: array[0..15] of char;
      LensFeatures_suf: array[0..15] of char;
      MinFocal: single;
      MaxFocal: single;
      MaxAp4MinFocal: single;
      MaxAp4MaxFocal: single;
      MinAp4MinFocal: single;
      MinAp4MaxFocal: single;
      MaxAp: single;
      MinAp: single;
      CurFocal: single;
      CurAp: single;
      MaxAp4CurFocal: single;
      MinAp4CurFocal: single;
      MinFocusDistance: single;
      FocusRangeIndex: single;
      LensFStops: single;
      TeleconverterID: qword;
      Teleconverter: array[0..127] of char;
      AdapterID: qword;
      Adapter: array[0..127] of char;
      AttachmentID: qword;
      Attachment: array[0..127] of char;
      FocalUnits: Tushort;
      FocalLengthIn35mmFormat: single;
    end;
    Plibraw_makernotes_lens_t = ^Tlibraw_makernotes_lens_t;

    Tlibraw_nikonlens_t = record
      EffectiveMaxAp: single;
      LensIDNumber: Tuchar;
      LensFStops: Tuchar;
      MCUVersion: Tuchar;
      LensType: Tuchar;
    end;
    Plibraw_nikonlens_t = ^Tlibraw_nikonlens_t;

    Tlibraw_dnglens_t = record
      MinFocal: single;
      MaxFocal: single;
      MaxAp4MinFocal: single;
      MaxAp4MaxFocal: single;
    end;
    Plibraw_dnglens_t = ^Tlibraw_dnglens_t;

    Tlibraw_lensinfo_t = record
      MinFocal: single;
      MaxFocal: single;
      MaxAp4MinFocal: single;
      MaxAp4MaxFocal: single;
      EXIF_MaxAp: single;
      LensMake: array[0..127] of char;
      Lens: array[0..127] of char;
      LensSerial: array[0..127] of char;
      InternalLensSerial: array[0..127] of char;
      FocalLengthIn35mmFormat: Tushort;
      nikon: Tlibraw_nikonlens_t;
      dng: Tlibraw_dnglens_t;
      makernotes: Tlibraw_makernotes_lens_t;
    end;
    Plibraw_lensinfo_t = ^Tlibraw_lensinfo_t;

    Tlibraw_makernotes_t = record
      canon: Tlibraw_canon_makernotes_t;
      nikon: Tlibraw_nikon_makernotes_t;
      hasselblad: Tlibraw_hasselblad_makernotes_t;
      fuji: Tlibraw_fuji_info_t;
      olympus: Tlibraw_olympus_makernotes_t;
      sony: Tlibraw_sony_info_t;
      kodak: Tlibraw_kodak_makernotes_t;
      panasonic: Tlibraw_panasonic_makernotes_t;
      pentax: Tlibraw_pentax_makernotes_t;
      phaseone: Tlibraw_p1_makernotes_t;
      ricoh: Tlibraw_ricoh_makernotes_t;
      samsung: Tlibraw_samsung_makernotes_t;
      common: Tlibraw_metadata_common_t;
    end;
    Plibraw_makernotes_t = ^Tlibraw_makernotes_t;

    Tlibraw_shootinginfo_t = record
      DriveMode: smallint;
      FocusMode: smallint;
      MeteringMode: smallint;
      AFPoint: smallint;
      ExposureMode: smallint;
      ExposureProgram: smallint;
      ImageStabilization: smallint;
      BodySerial: array[0..63] of char;
      InternalBodySerial: array[0..63] of char;
    end;
    Plibraw_shootinginfo_t = ^Tlibraw_shootinginfo_t;

    Tlibraw_custom_camera_t = record
      fsize: dword;
      rw: Tushort;
      rh: Tushort;
      lm: Tuchar;
      tm: Tuchar;
      rm: Tuchar;
      bm: Tuchar;
      lf: Tushort;
      cf: Tuchar;
      max: Tuchar;
      flags: Tuchar;
      t_make: array[0..9] of char;
      t_model: array[0..19] of char;
      offset: Tushort;
    end;
    Plibraw_custom_camera_t = ^Tlibraw_custom_camera_t;

    Timagearr = array[0..3] of Tushort;

    Tlibraw_data_t = record
      image: ^Timagearr;
      sizes: Tlibraw_image_sizes_t;
      idata: Tlibraw_iparams_t;
      lens: Tlibraw_lensinfo_t;
      makernotes: Tlibraw_makernotes_t;
      shootinginfo: Tlibraw_shootinginfo_t;
      params: Tlibraw_output_params_t;
      rawparams: Tlibraw_raw_unpack_params_t;
      progress_flags: dword;
      process_warnings: dword;
      color: Tlibraw_colordata_t;
      other: Tlibraw_imgother_t;
      thumbnail: Tlibraw_thumbnail_t;
      thumbs_list: Tlibraw_thumbnail_list_t;
      rawdata: Tlibraw_rawdata_t;
      parent_class: pointer;
    end;
    Plibraw_data_t = ^Tlibraw_data_t;

    Tfuji_q_table = record
      q_table: Pint8_t;
      raw_bits: longint;
      total_values: longint;
      max_grad: longint;
      q_grad_mult: longint;
      q_base: longint;
    end;
    Pfuji_q_table = ^Tfuji_q_table;

    Tfuji_compressed_params = record
      qt: array[0..3] of Tfuji_q_table;
      buf: pointer;
      max_bits: longint;
      min_value: longint;
      max_value: longint;
      line_width: Tushort;
    end;
    Pfuji_compressed_params = ^Tfuji_compressed_params;


      //
      // ====================================== libraw.h
      //

      const
        _FILE_OFFSET_BITS = 64;

      const
        LIBRAW_USE_STREAMS_DATASTREAM_MAXSIZE = (250 * 1024) * 1024;

      function libraw_strerror(errorcode: longint): pchar; cdecl; external libraw;
      function libraw_strprogress(para1: TLibRaw_progress): pchar; cdecl; external libraw;
      function libraw_init(flags: dword): Plibraw_data_t; cdecl; external libraw;
      function libraw_open_file(para1: Plibraw_data_t; para2: pchar): longint; cdecl; external libraw;
      function libraw_open_file_ex(para1: Plibraw_data_t; para2: pchar; max_buff_sz: TINT64): longint; cdecl; external libraw;

      {$ifdef windows}
      function libraw_open_wfile(para1: Plibraw_data_t; para2: Pwchar_t): longint; cdecl; external libraw;
      function libraw_open_wfile_ex(para1: Plibraw_data_t; para2: Pwchar_t; max_buff_sz: TINT64): longint; cdecl; external libraw;
      {$endif}

      function libraw_open_buffer(para1: Plibraw_data_t; buffer: pointer; size: Tsize_t): longint; cdecl; external libraw;
      function libraw_open_bayer(lr: Plibraw_data_t; data: pbyte; datalen: dword; _raw_width: Tushort; _raw_height: Tushort;
        _left_margin: Tushort; _top_margin: Tushort; _right_margin: Tushort; _bottom_margin: Tushort; procflags: byte;
        bayer_battern: byte; unused_bits: dword; otherflags: dword; black_level: dword): longint; cdecl; external libraw;
      function libraw_unpack(para1: Plibraw_data_t): longint; cdecl; external libraw;
      function libraw_unpack_thumb(para1: Plibraw_data_t): longint; cdecl; external libraw;
      function libraw_unpack_thumb_ex(para1: Plibraw_data_t; para2: longint): longint; cdecl; external libraw;
      procedure libraw_recycle_datastream(para1: Plibraw_data_t); cdecl; external libraw;
      procedure libraw_recycle(para1: Plibraw_data_t); cdecl; external libraw;
      procedure libraw_close(para1: Plibraw_data_t); cdecl; external libraw;
      procedure libraw_subtract_black(para1: Plibraw_data_t); cdecl; external libraw;
      function libraw_raw2image(para1: Plibraw_data_t): longint; cdecl; external libraw;
      procedure libraw_free_image(para1: Plibraw_data_t); cdecl; external libraw;
      function libraw_version: pchar; cdecl; external libraw;
      function libraw_versionNumber: longint; cdecl; external libraw;
      function libraw_cameraList: PPChar; cdecl; external libraw;
      function libraw_cameraCount: longint; cdecl; external libraw;
      procedure libraw_set_exifparser_handler(para1: Plibraw_data_t; cb: Texif_parser_callback; datap: pointer); cdecl; external libraw;
      procedure libraw_set_dataerror_handler(para1: Plibraw_data_t; func: Tdata_callback; datap: pointer); cdecl; external libraw;
      procedure libraw_set_progress_handler(para1: Plibraw_data_t; cb: Tprogress_callback; datap: pointer); cdecl; external libraw;
      function libraw_unpack_function_name(lr: Plibraw_data_t): pchar; cdecl; external libraw;
      function libraw_get_decoder_info(lr: Plibraw_data_t; d: Plibraw_decoder_info_t): longint; cdecl; external libraw;
      function libraw_COLOR(para1: Plibraw_data_t; row: longint; col: longint): longint; cdecl; external libraw;
      function libraw_capabilities: dword; cdecl; external libraw;
      function libraw_adjust_sizes_info_only(para1: Plibraw_data_t): longint; cdecl; external libraw;
      function libraw_dcraw_ppm_tiff_writer(lr: Plibraw_data_t; filename: pchar): longint; cdecl; external libraw;
      function libraw_dcraw_thumb_writer(lr: Plibraw_data_t; fname: pchar): longint; cdecl; external libraw;
      function libraw_dcraw_process(lr: Plibraw_data_t): longint; cdecl; external libraw;
      function libraw_dcraw_make_mem_image(lr: Plibraw_data_t; errc: Plongint): Plibraw_processed_image_t; cdecl; external libraw;
      function libraw_dcraw_make_mem_thumb(lr: Plibraw_data_t; errc: Plongint): Plibraw_processed_image_t; cdecl; external libraw;
      procedure libraw_dcraw_clear_mem(para1: Plibraw_processed_image_t); cdecl; external libraw;
      procedure libraw_set_demosaic(lr: Plibraw_data_t; value: longint); cdecl; external libraw;
      procedure libraw_set_output_color(lr: Plibraw_data_t; value: longint); cdecl; external libraw;
      procedure libraw_set_adjust_maximum_thr(lr: Plibraw_data_t; value: single); cdecl; external libraw;
      procedure libraw_set_user_mul(lr: Plibraw_data_t; index: longint; val: single); cdecl; external libraw;
      procedure libraw_set_output_bps(lr: Plibraw_data_t; value: longint); cdecl; external libraw;
      procedure libraw_set_gamma(lr: Plibraw_data_t; index: longint; value: single); cdecl; external libraw;
      procedure libraw_set_no_auto_bright(lr: Plibraw_data_t; value: longint); cdecl; external libraw;
      procedure libraw_set_bright(lr: Plibraw_data_t; value: single); cdecl; external libraw;
      procedure libraw_set_highlight(lr: Plibraw_data_t; value: longint); cdecl; external libraw;
      procedure libraw_set_fbdd_noiserd(lr: Plibraw_data_t; value: longint); cdecl; external libraw;
      function libraw_get_raw_height(lr: Plibraw_data_t): longint; cdecl; external libraw;
      function libraw_get_raw_width(lr: Plibraw_data_t): longint; cdecl; external libraw;
      function libraw_get_iheight(lr: Plibraw_data_t): longint; cdecl; external libraw;
      function libraw_get_iwidth(lr: Plibraw_data_t): longint; cdecl; external libraw;
      function libraw_get_cam_mul(lr: Plibraw_data_t; index: longint): single; cdecl; external libraw;
      function libraw_get_pre_mul(lr: Plibraw_data_t; index: longint): single; cdecl; external libraw;
      function libraw_get_rgb_cam(lr: Plibraw_data_t; index1: longint; index2: longint): single; cdecl; external libraw;
      function libraw_get_color_maximum(lr: Plibraw_data_t): longint; cdecl; external libraw;
      procedure libraw_set_output_tif(lr: Plibraw_data_t; value: longint); cdecl; external libraw;
      function libraw_get_iparams(lr: Plibraw_data_t): Plibraw_iparams_t; cdecl; external libraw;
      function libraw_get_lensinfo(lr: Plibraw_data_t): Plibraw_lensinfo_t; cdecl; external libraw;
      function libraw_get_imgother(lr: Plibraw_data_t): Plibraw_imgother_t; cdecl; external libraw;
      // === Konventiert am: 31-7-25 17:04:56 ===


    implementation


    function LIBRAW_FATAL_ERROR(ec: longint): boolean;
    begin
      LIBRAW_FATAL_ERROR := ec < (-(100000));
    end;

end.
