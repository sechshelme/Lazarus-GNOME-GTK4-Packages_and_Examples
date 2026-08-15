{$IFDEF read_interface}


type
  TJXL_BOOL = Boolean32;
const
  JXL_TRUE = True;
  JXL_FALSE = False;

type
  PJxlDataType = ^TJxlDataType;
  TJxlDataType = longint;
const
  JXL_TYPE_FLOAT = 0;
  JXL_TYPE_UINT8 = 2;
  JXL_TYPE_UINT16 = 3;
  JXL_TYPE_FLOAT16 = 5;

type
  PJxlEndianness = ^TJxlEndianness;
  TJxlEndianness = longint;
const
  JXL_NATIVE_ENDIAN = 0;
  JXL_LITTLE_ENDIAN = 1;
  JXL_BIG_ENDIAN = 2;

type
  PJxlPixelFormat = ^TJxlPixelFormat;
  TJxlPixelFormat = record
    num_channels: Tuint32_t;
    data_type: TJxlDataType;
    endianness: TJxlEndianness;
    align: Tsize_t;
  end;

  PJxlBoxType = ^TJxlBoxType;
  TJxlBoxType = array[0..3] of char;

type
  PJxlProgressiveDetail = ^TJxlProgressiveDetail;
  TJxlProgressiveDetail = longint;
const
  kFrames = 0;
  kDC = 1;
  kLastPasses = 2;
  kPasses = 3;
  kDCProgressive = 4;
  kDCGroups = 5;
  kGroups = 6;

  // === Konventiert am: 14-8-26 19:27:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
