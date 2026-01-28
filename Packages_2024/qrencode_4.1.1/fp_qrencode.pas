unit fp_qrencode;

interface

const
  {$IFDEF Linux}
  libqrencode = 'qrencode';
  {$ENDIF}

  {$IFDEF Windows}
  libqrencode = 'libqrencode.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PQRencodeMode = ^TQRencodeMode;
  TQRencodeMode = longint;

const
  QR_MODE_NUL = -(1);
  QR_MODE_NUM = 0;
  QR_MODE_AN = 1;
  QR_MODE_8 = 2;
  QR_MODE_KANJI = 3;
  QR_MODE_STRUCTURE = 4;
  QR_MODE_ECI = 5;
  QR_MODE_FNC1FIRST = 6;
  QR_MODE_FNC1SECOND = 7;

type
  PQRecLevel = ^TQRecLevel;
  TQRecLevel = longint;

const
  QR_ECLEVEL_L = 0;
  QR_ECLEVEL_M = 1;
  QR_ECLEVEL_Q = 2;
  QR_ECLEVEL_H = 3;

const
  QRSPEC_VERSION_MAX = 40;
  MQRSPEC_VERSION_MAX = 4;

type
  PQRinput = type Pointer;

function QRinput_new: PQRinput; cdecl; external libqrencode;
function QRinput_new2(version: longint; level: TQRecLevel): PQRinput; cdecl; external libqrencode;
function QRinput_newMQR(version: longint; level: TQRecLevel): PQRinput; cdecl; external libqrencode;
function QRinput_append(input: PQRinput; mode: TQRencodeMode; size: longint; data: pbyte): longint; cdecl; external libqrencode;
function QRinput_appendECIheader(input: PQRinput; ecinum: dword): longint; cdecl; external libqrencode;
function QRinput_getVersion(input: PQRinput): longint; cdecl; external libqrencode;
function QRinput_setVersion(input: PQRinput; version: longint): longint; cdecl; external libqrencode;
function QRinput_getErrorCorrectionLevel(input: PQRinput): TQRecLevel; cdecl; external libqrencode;
function QRinput_setErrorCorrectionLevel(input: PQRinput; level: TQRecLevel): longint; cdecl; external libqrencode;
function QRinput_setVersionAndErrorCorrectionLevel(input: PQRinput; version: longint; level: TQRecLevel): longint; cdecl; external libqrencode;
procedure QRinput_free(input: PQRinput); cdecl; external libqrencode;
function QRinput_check(mode: TQRencodeMode; size: longint; data: pbyte): longint; cdecl; external libqrencode;

type
  PQRinput_Struct = type Pointer;

function QRinput_Struct_new: PQRinput_Struct; cdecl; external libqrencode;
procedure QRinput_Struct_setParity(s: PQRinput_Struct; parity: byte); cdecl; external libqrencode;
function QRinput_Struct_appendInput(s: PQRinput_Struct; input: PQRinput): longint; cdecl; external libqrencode;
procedure QRinput_Struct_free(s: PQRinput_Struct); cdecl; external libqrencode;
function QRinput_splitQRinputToStruct(input: PQRinput): PQRinput_Struct; cdecl; external libqrencode;
function QRinput_Struct_insertStructuredAppendHeaders(s: PQRinput_Struct): longint; cdecl; external libqrencode;
function QRinput_setFNC1First(input: PQRinput): longint; cdecl; external libqrencode;
function QRinput_setFNC1Second(input: PQRinput; appid: byte): longint; cdecl; external libqrencode;

type
  TQRcode = record
    version: longint;
    width: longint;
    data: pbyte;
  end;
  PQRcode = ^TQRcode;

  PQRcode_List = ^TQRcode_List;

  TQRcode_List = record
    code: PQRcode;
    next: PQRcode_List;
  end;

function QRcode_encodeInput(input: PQRinput): PQRcode; cdecl; external libqrencode;
function QRcode_encodeString(_string: pchar; version: longint; level: TQRecLevel; hint: TQRencodeMode; casesensitive: longint): PQRcode; cdecl; external libqrencode;
function QRcode_encodeString8bit(_string: pchar; version: longint; level: TQRecLevel): PQRcode; cdecl; external libqrencode;
function QRcode_encodeStringMQR(_string: pchar; version: longint; level: TQRecLevel; hint: TQRencodeMode; casesensitive: longint): PQRcode; cdecl; external libqrencode;
function QRcode_encodeString8bitMQR(_string: pchar; version: longint; level: TQRecLevel): PQRcode; cdecl; external libqrencode;
function QRcode_encodeData(size: longint; data: pbyte; version: longint; level: TQRecLevel): PQRcode; cdecl; external libqrencode;
function QRcode_encodeDataMQR(size: longint; data: pbyte; version: longint; level: TQRecLevel): PQRcode; cdecl; external libqrencode;
procedure QRcode_free(qrcode: PQRcode); cdecl; external libqrencode;
function QRcode_encodeInputStructured(s: PQRinput_Struct): PQRcode_List; cdecl; external libqrencode;
function QRcode_encodeStringStructured(_string: pchar; version: longint; level: TQRecLevel; hint: TQRencodeMode; casesensitive: longint): PQRcode_List; cdecl; external libqrencode;
function QRcode_encodeString8bitStructured(_string: pchar; version: longint; level: TQRecLevel): PQRcode_List; cdecl; external libqrencode;
function QRcode_encodeDataStructured(size: longint; data: pbyte; version: longint; level: TQRecLevel): PQRcode_List; cdecl; external libqrencode;
function QRcode_List_size(qrlist: PQRcode_List): longint; cdecl; external libqrencode;
procedure QRcode_List_free(qrlist: PQRcode_List); cdecl; external libqrencode;
procedure QRcode_APIVersion(major_version: Plongint; minor_version: Plongint; micro_version: Plongint); cdecl; external libqrencode;
function QRcode_APIVersionString: pchar; cdecl; external libqrencode;
procedure QRcode_clearCache; cdecl; external libqrencode;

// === Konventiert am: 28-1-26 19:16:14 ===


implementation



end.
