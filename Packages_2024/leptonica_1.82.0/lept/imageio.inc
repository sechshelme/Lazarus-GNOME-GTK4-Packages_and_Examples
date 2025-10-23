{$IFDEF read_interface}


const
  IFF_UNKNOWN = 0;
  IFF_BMP = 1;
  IFF_JFIF_JPEG = 2;
  IFF_PNG = 3;
  IFF_TIFF = 4;
  IFF_TIFF_PACKBITS = 5;
  IFF_TIFF_RLE = 6;
  IFF_TIFF_G3 = 7;
  IFF_TIFF_G4 = 8;
  IFF_TIFF_LZW = 9;
  IFF_TIFF_ZIP = 10;
  IFF_PNM = 11;
  IFF_PS = 12;
  IFF_GIF = 13;
  IFF_JP2 = 14;
  IFF_WEBP = 15;
  IFF_LPDF = 16;
  IFF_TIFF_JPEG = 17;
  IFF_DEFAULT = 18;
  IFF_SPIX = 19;

function L_FORMAT_IS_TIFF(f: integer): boolean; inline;

const
  BMP_ID = $4d42;
  TIFF_BIGEND_ID = $4d4d;
  TIFF_LITTLEEND_ID = $4949;

const
  L_JPEG_READ_LUMINANCE = 1;
  L_JPEG_CONTINUE_WITH_BAD_DATA = 2;

const
  L_J2K_CODEC = 1;
  L_JP2_CODEC = 2;

const
  L_DEFAULT_ENCODE = 0;
  L_JPEG_ENCODE = 1;
  L_G4_ENCODE = 2;
  L_FLATE_ENCODE = 3;
  L_JP2K_ENCODE = 4;

type
  TL_Compressed_Data = record
    _type: Tl_int32;
    datacomp: Pl_uint8;
    nbytescomp: Tsize_t;
    data85: pchar;
    nbytes85: Tsize_t;
    cmapdata85: pchar;
    cmapdatahex: pchar;
    ncolors: Tl_int32;
    w: Tl_int32;
    h: Tl_int32;
    bps: Tl_int32;
    spp: Tl_int32;
    minisblack: Tl_int32;
    predictor: Tl_int32;
    nbytes: Tsize_t;
    res: Tl_int32;
  end;
  PL_Compressed_Data = ^TL_Compressed_Data;

  TL_COMP_DATA = TL_Compressed_Data;
  PL_COMP_DATA = ^TL_COMP_DATA;
  PPL_COMP_DATA = ^PL_COMP_DATA;

const
  L_FIRST_IMAGE = 1;
  L_NEXT_IMAGE = 2;
  L_LAST_IMAGE = 3;

type
  TL_Pdf_Data = record
    title: pchar;
    n: Tl_int32;
    ncmap: Tl_int32;
    cida: PL_Ptra;
    id: pchar;
    obj1: pchar;
    obj2: pchar;
    obj3: pchar;
    obj4: pchar;
    obj5: pchar;
    poststream: pchar;
    trailer: pchar;
    xy: PPta;
    wh: PPta;
    mediabox: PBox;
    saprex: PSarray;
    sacmap: PSarray;
    objsize: PL_Dna;
    objloc: PL_Dna;
    xrefloc: Tl_int32;
  end;
  PL_PDF_DATA = ^TL_Pdf_Data;
  PPL_PDF_DATA = ^PL_PDF_DATA;

  // === Konventiert am: 17-8-25 13:40:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function L_FORMAT_IS_TIFF(f: integer): boolean; inline;
begin
  Result :=
    (f = IFF_TIFF) or (f = IFF_TIFF_PACKBITS) or (f = IFF_TIFF_RLE) or (f = IFF_TIFF_G3) or
    (f = IFF_TIFF_G4) or (f = IFF_TIFF_LZW) or (f = IFF_TIFF_ZIP) or (f = IFF_TIFF_JPEG);
end;



{$ENDIF read_implementation}
