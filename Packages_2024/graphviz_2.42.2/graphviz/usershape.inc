{$IFDEF read_interface}


type
  Pimagetype_t = ^Timagetype_t;
  Timagetype_t = longint;

const
  FT_NULL = 0;
  FT_BMP = 1;
  FT_GIF = 2;
  FT_PNG = 3;
  FT_JPEG = 4;
  FT_PDF = 5;
  FT_PS = 6;
  FT_EPS = 7;
  FT_SVG = 8;
  FT_XML = 9;
  FT_RIFF = 10;
  FT_WEBP = 11;
  FT_ICO = 12;
  FT_TIFF = 13;

type
  Pimagescale_t = ^Timagescale_t;
  Timagescale_t = longint;

const
  IMAGESCALE_FALSE = 0;
  IMAGESCALE_TRUE = 1;
  IMAGESCALE_WIDTH = 2;
  IMAGESCALE_HEIGHT = 3;
  IMAGESCALE_BOTH = 4;

type
  Pimagepos_t = ^Timagepos_t;
  Timagepos_t = longint;

const
  IMAGEPOS_TOP_LEFT = 0;
  IMAGEPOS_TOP_CENTER = 1;
  IMAGEPOS_TOP_RIGHT = 2;
  IMAGEPOS_MIDDLE_LEFT = 3;
  IMAGEPOS_MIDDLE_CENTER = 4;
  IMAGEPOS_MIDDLE_RIGHT = 5;
  IMAGEPOS_BOTTOM_LEFT = 6;
  IMAGEPOS_BOTTOM_CENTER = 7;
  IMAGEPOS_BOTTOM_RIGHT = 8;

type
  Pusershape_t = type Pointer;

  // === Konventiert am: 3-12-25 15:07:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
