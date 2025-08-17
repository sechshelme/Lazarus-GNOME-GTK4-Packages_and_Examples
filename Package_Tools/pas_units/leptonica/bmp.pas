unit bmp;

interface

uses
  fp_lept, environ;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TBMP_FileHeader = record
    bfType: array[0..1] of Tl_uint8;
    bfSize: array[0..3] of Tl_uint8;
    bfReserved1: array[0..1] of Tl_uint8;
    bfReserved2: array[0..1] of Tl_uint8;
    bfOffBits: array[0..3] of Tl_uint8;
  end;
  PBMP_FileHeader = ^TBMP_FileHeader;

  TBMP_FH = TBMP_FileHeader;

const
  BMP_FHBYTES = sizeof(TBMP_FH);

type
  TBMP_InfoHeader = record
    biSize: Tl_int32;
    biWidth: Tl_int32;
    biHeight: Tl_int32;
    biPlanes: Tl_int16;
    biBitCount: Tl_int16;
    biCompression: Tl_int32;
    biSizeImage: Tl_int32;
    biXPelsPerMeter: Tl_int32;
    biYPelsPerMeter: Tl_int32;
    biClrUsed: Tl_int32;
    biClrImportant: Tl_int32;
  end;
  PBMP_InfoHeader = ^TBMP_InfoHeader;

  TBMP_IH = TBMP_InfoHeader;

const
  BMP_IHBYTES = sizeof(TBMP_IH);

type
  TBMP_HEADER = record
    bmpfh: TBMP_FH;
    bmpih: TBMP_IH;
  end;
  PBMP_HEADER = ^TBMP_HEADER;

  // === Konventiert am: 17-8-25 13:39:55 ===


implementation

end.
