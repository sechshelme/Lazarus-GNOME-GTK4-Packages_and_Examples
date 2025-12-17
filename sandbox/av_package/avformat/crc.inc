{$IFDEF read_interface}


type
  PAVCRC = ^TAVCRC;
  TAVCRC = Tuint32_t;

type
  PAVCRCId = ^TAVCRCId;
  TAVCRCId = longint;

const
  AV_CRC_8_ATM = 0;
  AV_CRC_16_ANSI = 1;
  AV_CRC_16_CCITT = 2;
  AV_CRC_32_IEEE = 3;
  AV_CRC_32_IEEE_LE = 4;
  AV_CRC_16_ANSI_LE = 5;
  AV_CRC_24_IEEE = 6;
  AV_CRC_8_EBU = 7;
  AV_CRC_MAX = 8;

function av_crc_init(ctx: PAVCRC; le: longint; bits: longint; poly: Tuint32_t; ctx_size: longint): longint; cdecl; external libavutil;
function av_crc_get_table(crc_id: TAVCRCId): PAVCRC; cdecl; external libavutil;
function av_crc(ctx: PAVCRC; crc: Tuint32_t; buffer: Puint8_t; length: Tsize_t): Tuint32_t; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
