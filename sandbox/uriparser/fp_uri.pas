unit fp_uri;

interface


const
  {$IFDEF Linux}
  luriparser = 'uriparser';
  {$ENDIF}

  {$IFDEF Windows}
  libchafa = 'libchafa-0.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // === UriDefsAnsi.h

type
  TURI_CHAR = char;
  PURI_CHAR = ^TURI_CHAR;
  PPURI_CHAR = ^PURI_CHAR;


  // === UriBase.h

const
  URI_BASE_H = 1;
  URI_VER_MAJOR = 0;
  URI_VER_MINOR = 9;
  URI_VER_RELEASE = 7;
  URI_VER_SUFFIX_ANSI = '';

type
  PUriBool = ^TUriBool;
  TUriBool = Boolean32;

const
  URI_TRUE = True;
  URI_FALSE = False;
  URI_SUCCESS = 0;
  URI_ERROR_SYNTAX = 1;
  URI_ERROR_NULL = 2;
  URI_ERROR_MALLOC = 3;
  URI_ERROR_OUTPUT_TOO_LARGE = 4;
  URI_ERROR_NOT_IMPLEMENTED = 8;
  URI_ERROR_RANGE_INVALID = 9;
  URI_ERROR_MEMORY_MANAGER_INCOMPLETE = 10;
  URI_ERROR_TOSTRING_TOO_LONG = URI_ERROR_OUTPUT_TOO_LARGE;
  URI_ERROR_ADDBASE_REL_BASE = 5;
  URI_ERROR_REMOVEBASE_REL_BASE = 6;
  URI_ERROR_REMOVEBASE_REL_SOURCE = 7;

type
  TUriIp4Struct = record
    data: array[0..3] of byte;
  end;
  PUriIp4Struct = ^TUriIp4Struct;
  TUriIp4 = TUriIp4Struct;
  PUriIp4 = ^TUriIp4;

  TUriIp6Struct = record
    data: array[0..15] of byte;
  end;
  PUriIp6Struct = ^TUriIp6Struct;
  TUriIp6 = TUriIp6Struct;
  PUriIp6 = ^TUriIp6;

  PUriMemoryManagerStruct = ^TUriMemoryManagerStruct;
  TUriFuncMalloc = function(para1: PUriMemoryManagerStruct; para2: Tsize_t): pointer; cdecl;
  TUriFuncCalloc = function(para1: PUriMemoryManagerStruct; para2: Tsize_t; para3: Tsize_t): pointer; cdecl;
  TUriFuncRealloc = function(para1: PUriMemoryManagerStruct; para2: pointer; para3: Tsize_t): pointer; cdecl;
  TUriFuncReallocarray = function(para1: PUriMemoryManagerStruct; para2: pointer; para3: Tsize_t; para4: Tsize_t): pointer; cdecl;
  TUriFuncFree = procedure(para1: PUriMemoryManagerStruct; para2: pointer); cdecl;

  TUriMemoryManagerStruct = record
    malloc: TUriFuncMalloc;
    calloc: TUriFuncCalloc;
    realloc: TUriFuncRealloc;
    reallocarray: TUriFuncReallocarray;
    free: TUriFuncFree;
    userData: pointer;
  end;
  TUriMemoryManager = TUriMemoryManagerStruct;
  PUriMemoryManager = ^TUriMemoryManager;

type
  PUriBreakConversionEnum = ^TUriBreakConversionEnum;
  TUriBreakConversionEnum = longint;

const
  URI_BR_TO_LF = 0;
  URI_BR_TO_CRLF = 1;
  URI_BR_TO_CR = 2;
  URI_BR_TO_UNIX = URI_BR_TO_LF;
  URI_BR_TO_WINDOWS = URI_BR_TO_CRLF;
  URI_BR_TO_MAC = URI_BR_TO_CR;
  URI_BR_DONT_TOUCH = (URI_BR_TO_CR) + 1;

type
  TUriBreakConversion = TUriBreakConversionEnum;
  PUriBreakConversion = ^TUriBreakConversion;

type
  PUriNormalizationMaskEnum = ^TUriNormalizationMaskEnum;
  TUriNormalizationMaskEnum = longint;

const
  URI_NORMALIZED = 0;
  URI_NORMALIZE_SCHEME = 1 shl 0;
  URI_NORMALIZE_USER_INFO = 1 shl 1;
  URI_NORMALIZE_HOST = 1 shl 2;
  URI_NORMALIZE_PATH = 1 shl 3;
  URI_NORMALIZE_QUERY = 1 shl 4;
  URI_NORMALIZE_FRAGMENT = 1 shl 5;

type
  TUriNormalizationMask = TUriNormalizationMaskEnum;
  PUriNormalizationMask = ^TUriNormalizationMask;

type
  PUriResolutionOptionsEnum = ^TUriResolutionOptionsEnum;
  TUriResolutionOptionsEnum = longint;

const
  URI_RESOLVE_STRICTLY = 0;
  URI_RESOLVE_IDENTICAL_SCHEME_COMPAT = 1 shl 0;

type
  TUriResolutionOptions = TUriResolutionOptionsEnum;
  PUriResolutionOptions = ^TUriResolutionOptions;

function uriCompleteMemoryManagerA(memory: PUriMemoryManager; backend: PUriMemoryManager): longint; cdecl; external luriparser;
function uriEmulateCallocA(memory: PUriMemoryManager; nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external luriparser;
function uriEmulateReallocarrayA(memory: PUriMemoryManager; ptr: pointer; nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external luriparser;
function uriTestMemoryManagerA(memory: PUriMemoryManager): longint; cdecl; external luriparser;


// === Uri.h

type
  TTextRangeStruct = record
    first: PURI_CHAR;
    afterLast: PURI_CHAR;
  end;
  PTextRangeStruct = ^TTextRangeStruct;

  TTextRange = TTextRangeStruct;
  PTextRange = ^TTextRange;

  PPathSegmentStruct = ^TPathSegmentStruct;

  TPathSegmentStruct = record
    text: TTextRange;
    next: PPathSegmentStruct;
    reserved: pointer;
  end;
  TPathSegment = TPathSegmentStruct;
  PPathSegment = ^TPathSegment;

  THostDataStruct = record
    ip4: PUriIp4;
    ip6: PUriIp6;
    ipFuture: TTextRange;
  end;
  PHostDataStruct = ^THostDataStruct;
  THostData = THostDataStruct;
  PHostData = ^THostData;

  TUriStruct = record
    scheme: TTextRange;
    userInfo: TTextRange;
    hostText: TTextRange;
    hostData: THostData;
    portText: TTextRange;
    pathHead: PPathSegment;
    pathTail: PPathSegment;
    query: TTextRange;
    fragment: TTextRange;
    absolutePath: TUriBool;
    owner: TUriBool;
    reserved: pointer;
  end;
  PUriStruct = ^TUriStruct;
  TUri = TUriStruct;
  PUri = ^TUri;

  TParserStateStruct = record
    uri: PUri;
    errorCode: longint;
    errorPos: PURI_CHAR;
    reserved: pointer;
  end;
  PParserStateStruct = ^TParserStateStruct;
  TParserState = TParserStateStruct;
  PParserState = ^TParserState;

  PQueryListStruct = ^TQueryListStruct;

  TQueryListStruct = record
    key: PURI_CHAR;
    value: PURI_CHAR;
    next: PQueryListStruct;
  end;
  TQueryList = TQueryListStruct;
  PQueryList = ^TQueryList;
  PPQueryList = ^PQueryList;

function uriParseUriExA(state: PParserState; first: PURI_CHAR; afterLast: PURI_CHAR): longint; cdecl; external luriparser;
function uriParseUriA(state: PParserState; text: PURI_CHAR): longint; cdecl; external luriparser;
function uriParseSingleUriA(uri: PUri; text: PURI_CHAR; errorPos: PPURI_CHAR): longint; cdecl; external luriparser;
function uriParseSingleUriExA(uri: PUri; first: PURI_CHAR; afterLast: PURI_CHAR; errorPos: PPURI_CHAR): longint; cdecl; external luriparser;
function uriParseSingleUriExMmA(uri: PUri; first: PURI_CHAR; afterLast: PURI_CHAR; errorPos: PPURI_CHAR; memory: PUriMemoryManager): longint; cdecl; external luriparser;
procedure uriFreeUriMembersA(uri: PUri); cdecl; external luriparser;
function uriFreeUriMembersMmA(uri: PUri; memory: PUriMemoryManager): longint; cdecl; external luriparser;
function uriEscapeExA(inFirst: PURI_CHAR; inAfterLast: PURI_CHAR; out_: PURI_CHAR; spaceToPlus: TUriBool; normalizeBreaks: TUriBool): PURI_CHAR; cdecl; external luriparser;
function uriEscapeA(in_: PURI_CHAR; out_: PURI_CHAR; spaceToPlus: TUriBool; normalizeBreaks: TUriBool): PURI_CHAR; cdecl; external luriparser;
function uriUnescapeInPlaceExA(inout: PURI_CHAR; plusToSpace: TUriBool; breakConversion: TUriBreakConversion): PURI_CHAR; cdecl; external luriparser;
function uriUnescapeInPlaceA(inout: PURI_CHAR): PURI_CHAR; cdecl; external luriparser;
function uriAddBaseUriA(absoluteDest: PUri; relativeSource: PUri; absoluteBase: PUri): longint; cdecl; external luriparser;
function uriAddBaseUriExA(absoluteDest: PUri; relativeSource: PUri; absoluteBase: PUri; options: TUriResolutionOptions): longint; cdecl; external luriparser;
function uriAddBaseUriExMmA(absoluteDest: PUri; relativeSource: PUri; absoluteBase: PUri; options: TUriResolutionOptions; memory: PUriMemoryManager): longint; cdecl; external luriparser;
function uriRemoveBaseUriA(dest: PUri; absoluteSource: PUri; absoluteBase: PUri; domainRootMode: TUriBool): longint; cdecl; external luriparser;
function uriRemoveBaseUriMmA(dest: PUri; absoluteSource: PUri; absoluteBase: PUri; domainRootMode: TUriBool; memory: PUriMemoryManager): longint; cdecl; external luriparser;
function uriEqualsUriA(a: PUri; b: PUri): TUriBool; cdecl; external luriparser;
function uriToStringCharsRequiredA(uri: PUri; charsRequired: Plongint): longint; cdecl; external luriparser;
function uriToStringA(dest: PURI_CHAR; uri: PUri; maxChars: longint; charsWritten: Plongint): longint; cdecl; external luriparser;
function uriNormalizeSyntaxMaskRequiredA(uri: PUri): dword; cdecl; external luriparser;
function uriNormalizeSyntaxMaskRequiredExA(uri: PUri; outMask: Pdword): longint; cdecl; external luriparser;
function uriNormalizeSyntaxExA(uri: PUri; mask: dword): longint; cdecl; external luriparser;
function uriNormalizeSyntaxExMmA(uri: PUri; mask: dword; memory: PUriMemoryManager): longint; cdecl; external luriparser;
function uriNormalizeSyntaxA(uri: PUri): longint; cdecl; external luriparser;
function uriUnixFilenameToUriStringA(filename: PURI_CHAR; uriString: PURI_CHAR): longint; cdecl; external luriparser;
function uriWindowsFilenameToUriStringA(filename: PURI_CHAR; uriString: PURI_CHAR): longint; cdecl; external luriparser;
function uriUriStringToUnixFilenameA(uriString: PURI_CHAR; filename: PURI_CHAR): longint; cdecl; external luriparser;
function uriUriStringToWindowsFilenameA(uriString: PURI_CHAR; filename: PURI_CHAR): longint; cdecl; external luriparser;
function uriComposeQueryCharsRequiredA(queryList: PQueryList; charsRequired: Plongint): longint; cdecl; external luriparser;
function uriComposeQueryCharsRequiredExA(queryList: PQueryList; charsRequired: Plongint; spaceToPlus: TUriBool; normalizeBreaks: TUriBool): longint; cdecl; external luriparser;
function uriComposeQueryA(dest: PURI_CHAR; queryList: PQueryList; maxChars: longint; charsWritten: Plongint): longint; cdecl; external luriparser;
function uriComposeQueryExA(dest: PURI_CHAR; queryList: PQueryList; maxChars: longint; charsWritten: Plongint; spaceToPlus: TUriBool; normalizeBreaks: TUriBool): longint; cdecl; external luriparser;
function uriComposeQueryMallocA(dest: PPURI_CHAR; queryList: PQueryList): longint; cdecl; external luriparser;
function uriComposeQueryMallocExA(dest: PPURI_CHAR; queryList: PQueryList; spaceToPlus: TUriBool; normalizeBreaks: TUriBool): longint; cdecl; external luriparser;
function uriComposeQueryMallocExMmA(dest: PPURI_CHAR; queryList: PQueryList; spaceToPlus: TUriBool; normalizeBreaks: TUriBool; memory: PUriMemoryManager): longint; cdecl; external luriparser;
function uriDissectQueryMallocA(dest: PPQueryList; itemCount: Plongint; first: PURI_CHAR; afterLast: PURI_CHAR): longint; cdecl; external luriparser;
function uriDissectQueryMallocExA(dest: PPQueryList; itemCount: Plongint; first: PURI_CHAR; afterLast: PURI_CHAR; plusToSpace: TUriBool; breakConversion: TUriBreakConversion): longint; cdecl; external luriparser;
function uriDissectQueryMallocExMmA(dest: PPQueryList; itemCount: Plongint; first: PURI_CHAR; afterLast: PURI_CHAR; plusToSpace: TUriBool; breakConversion: TUriBreakConversion; memory: PUriMemoryManager): longint; cdecl; external luriparser;
procedure uriFreeQueryListA(queryList: PQueryList); cdecl; external luriparser;
function uriFreeQueryListMmA(queryList: PQueryList; memory: PUriMemoryManager): longint; cdecl; external luriparser;
function uriMakeOwnerA(uri: PUri): longint; cdecl; external luriparser;
function uriMakeOwnerMmA(uri: PUri; memory: PUriMemoryManager): longint; cdecl; external luriparser;


// === UriIp4.h

function uriParseIpFourAddressA(octetOutput: pbyte; first: PURI_CHAR; afterLast: PURI_CHAR): longint; cdecl; external luriparser;




// === Konventiert am: 31-5-26 19:33:48 ===


implementation



end.
