/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 08-11-2024   19:15                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GDK_PIXBUF_MAGIC_NUMBER = $47646b50;

type
  PGdkPixdataType = ^TGdkPixdataType;
  TGdkPixdataType = longint;

const
  GDK_PIXDATA_COLOR_TYPE_RGB = $01;
  GDK_PIXDATA_COLOR_TYPE_RGBA = $02;
  GDK_PIXDATA_COLOR_TYPE_MASK = $ff;
  GDK_PIXDATA_SAMPLE_WIDTH_8 = $01 shl 16;
  GDK_PIXDATA_SAMPLE_WIDTH_MASK = $0f shl 16;
  GDK_PIXDATA_ENCODING_RAW = $01 shl 24;
  GDK_PIXDATA_ENCODING_RLE = $02 shl 24;
  GDK_PIXDATA_ENCODING_MASK = $0f shl 24;

type
  TGdkPixdata = record
    magic: Tguint32;
    length: Tgint32;
    pixdata_type: Tguint32;
    rowstride: Tguint32;
    Width: Tguint32;
    Height: Tguint32;
    pixel_data: Pguint8;
  end;
  PGdkPixdata = ^TGdkPixdata;

const
  GDK_PIXDATA_HEADER_LENGTH = 4 + 4 + 4 + 4 + 4 + 4;

function gdk_pixdata_serialize(pixdata: PGdkPixdata; stream_length_p: Pguint): Pguint8; cdecl; external libgdk_pixbuf2;
function gdk_pixdata_deserialize(pixdata: PGdkPixdata; stream_length: Tguint; stream: Pguint8; error: PPGError): Tgboolean; cdecl; external libgdk_pixbuf2;
function gdk_pixdata_from_pixbuf(pixdata: PGdkPixdata; pixbuf: PGdkPixbuf; use_rle: Tgboolean): Tgpointer; cdecl; external libgdk_pixbuf2;
function gdk_pixbuf_from_pixdata(pixdata: PGdkPixdata; copy_pixels: Tgboolean; error: PPGError): PGdkPixbuf; cdecl; external libgdk_pixbuf2;

type
  PGdkPixdataDumpType = ^TGdkPixdataDumpType;
  TGdkPixdataDumpType = longint;

const
  GDK_PIXDATA_DUMP_PIXDATA_STREAM = 0;
  GDK_PIXDATA_DUMP_PIXDATA_STRUCT = 1;
  GDK_PIXDATA_DUMP_MACROS = 2;
  GDK_PIXDATA_DUMP_GTYPES = 0;
  GDK_PIXDATA_DUMP_CTYPES = 1 shl 8;
  GDK_PIXDATA_DUMP_STATIC = 1 shl 9;
  GDK_PIXDATA_DUMP_CONST = 1 shl 10;
  GDK_PIXDATA_DUMP_RLE_DECODER = 1 shl 16;


function gdk_pixdata_to_csource(pixdata: PGdkPixdata; Name: Pgchar; dump_type: TGdkPixdataDumpType): PGString; cdecl; external libgdk_pixbuf2;

// === Konventiert am: 8-11-24 17:07:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
