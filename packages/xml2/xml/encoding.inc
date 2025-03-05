{$IFDEF read_interface}

type
  PxmlCharEncoding = ^TxmlCharEncoding;
  TxmlCharEncoding = longint;

const
  XML_CHAR_ENCODING_ERROR = -(1);
  XML_CHAR_ENCODING_NONE = 0;
  XML_CHAR_ENCODING_UTF8 = 1;
  XML_CHAR_ENCODING_UTF16LE = 2;
  XML_CHAR_ENCODING_UTF16BE = 3;
  XML_CHAR_ENCODING_UCS4LE = 4;
  XML_CHAR_ENCODING_UCS4BE = 5;
  XML_CHAR_ENCODING_EBCDIC = 6;
  XML_CHAR_ENCODING_UCS4_2143 = 7;
  XML_CHAR_ENCODING_UCS4_3412 = 8;
  XML_CHAR_ENCODING_UCS2 = 9;
  XML_CHAR_ENCODING_8859_1 = 10;
  XML_CHAR_ENCODING_8859_2 = 11;
  XML_CHAR_ENCODING_8859_3 = 12;
  XML_CHAR_ENCODING_8859_4 = 13;
  XML_CHAR_ENCODING_8859_5 = 14;
  XML_CHAR_ENCODING_8859_6 = 15;
  XML_CHAR_ENCODING_8859_7 = 16;
  XML_CHAR_ENCODING_8859_8 = 17;
  XML_CHAR_ENCODING_8859_9 = 18;
  XML_CHAR_ENCODING_2022_JP = 19;
  XML_CHAR_ENCODING_SHIFT_JIS = 20;
  XML_CHAR_ENCODING_EUC_JP = 21;
  XML_CHAR_ENCODING_ASCII = 22;

type
  TxmlCharEncodingInputFunc = function(out_: pbyte; outlen: Plongint; in_: pbyte; inlen: Plongint): longint; cdecl;
  TxmlCharEncodingOutputFunc = function(out_: pbyte; outlen: Plongint; in_: pbyte; inlen: Plongint): longint; cdecl;

const
  ICU_PIVOT_BUF_SIZE = 1024;

type
  Tuconv_t = record
    uconv: PUConverter;
    utf8: PUConverter;
    pivot_buf: array[0..(ICU_PIVOT_BUF_SIZE) - 1] of TUChar;
    pivot_source: PUChar;
    pivot_target: PUChar;
  end;
  Puconv_t = ^Tuconv_t;

type
  TxmlCharEncodingHandler = record
    Name: pchar;
    input: TxmlCharEncodingInputFunc;
    output: TxmlCharEncodingOutputFunc;
    iconv_in: Ticonv_t;
    iconv_out: Ticonv_t;
    uconv_in: Puconv_t;
    uconv_out: Puconv_t;
  end;
  PxmlCharEncodingHandler = ^TxmlCharEncodingHandler;

procedure xmlInitCharEncodingHandlers; cdecl; external libxml2;
procedure xmlCleanupCharEncodingHandlers; cdecl; external libxml2;
procedure xmlRegisterCharEncodingHandler(handler: PxmlCharEncodingHandler); cdecl; external libxml2;
function xmlGetCharEncodingHandler(enc: TxmlCharEncoding): PxmlCharEncodingHandler; cdecl; external libxml2;
function xmlFindCharEncodingHandler(Name: pchar): PxmlCharEncodingHandler; cdecl; external libxml2;
function xmlNewCharEncodingHandler(Name: pchar; input: TxmlCharEncodingInputFunc; output: TxmlCharEncodingOutputFunc): PxmlCharEncodingHandler; cdecl; external libxml2;
function xmlAddEncodingAlias(Name: pchar; alias: pchar): longint; cdecl; external libxml2;
function xmlDelEncodingAlias(alias: pchar): longint; cdecl; external libxml2;
function xmlGetEncodingAlias(alias: pchar): pchar; cdecl; external libxml2;
procedure xmlCleanupEncodingAliases; cdecl; external libxml2;
function xmlParseCharEncoding(Name: pchar): TxmlCharEncoding; cdecl; external libxml2;
function xmlGetCharEncodingName(enc: TxmlCharEncoding): pchar; cdecl; external libxml2;
function xmlDetectCharEncoding(in_: pbyte; len: longint): TxmlCharEncoding; cdecl; external libxml2;
function xmlCharEncOutFunc(handler: PxmlCharEncodingHandler; out_: PxmlBuffer; in_: PxmlBuffer): longint; cdecl; external libxml2;
function xmlCharEncInFunc(handler: PxmlCharEncodingHandler; out_: PxmlBuffer; in_: PxmlBuffer): longint; cdecl; external libxml2;
function xmlCharEncFirstLine(handler: PxmlCharEncodingHandler; out_: PxmlBuffer; in_: PxmlBuffer): longint; cdecl; external libxml2;
function xmlCharEncCloseFunc(handler: PxmlCharEncodingHandler): longint; cdecl; external libxml2;
function UTF8Toisolat1(out_: pbyte; outlen: Plongint; in_: pbyte; inlen: Plongint): longint; cdecl; external libxml2;
function isolat1ToUTF8(out_: pbyte; outlen: Plongint; in_: pbyte; inlen: Plongint): longint; cdecl; external libxml2;

// === Konventiert am: 26-2-25 16:56:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
