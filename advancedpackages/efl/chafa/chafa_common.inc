{$IFDEF read_interface}

type
  PChafaPixelType = ^TChafaPixelType;
  TChafaPixelType = longint;

const
  CHAFA_PIXEL_RGBA8_PREMULTIPLIED = 0;
  CHAFA_PIXEL_BGRA8_PREMULTIPLIED = 1;
  CHAFA_PIXEL_ARGB8_PREMULTIPLIED = 2;
  CHAFA_PIXEL_ABGR8_PREMULTIPLIED = 3;
  CHAFA_PIXEL_RGBA8_UNASSOCIATED = 4;
  CHAFA_PIXEL_BGRA8_UNASSOCIATED = 5;
  CHAFA_PIXEL_ARGB8_UNASSOCIATED = 6;
  CHAFA_PIXEL_ABGR8_UNASSOCIATED = 7;
  CHAFA_PIXEL_RGB8 = 8;
  CHAFA_PIXEL_BGR8 = 9;
  CHAFA_PIXEL_MAX = 10;

type
  PChafaAlign = ^TChafaAlign;
  TChafaAlign = longint;

const
  CHAFA_ALIGN_START = 0;
  CHAFA_ALIGN_END = 1;
  CHAFA_ALIGN_CENTER = 2;
  CHAFA_ALIGN_MAX = 3;

type
  PChafaTuck = ^TChafaTuck;
  TChafaTuck = longint;

const
  CHAFA_TUCK_STRETCH = 0;
  CHAFA_TUCK_FIT = 1;
  CHAFA_TUCK_SHRINK_TO_FIT = 2;
  CHAFA_TUCK_MAX = 3;

  // === Konventiert am: 29-1-25 18:53:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
