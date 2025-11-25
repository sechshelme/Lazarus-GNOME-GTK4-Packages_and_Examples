unit fp_expat;

interface

const
  {$IFDEF Linux}
  libexpat = 'libexpat';
  {$ENDIF}

  {$IFDEF Windows}
  libexpat = 'libexpat';                  // ??????????
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int64;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

  Tsize_t = SizeUInt;


  // ================ expat_external.h

const
  Expat_External_INCLUDED = 1;

const
  XML_ENABLE_VISIBILITY = 0;

type
  PPXML_Char = ^PXML_Char;
  PXML_Char = ^TXML_Char;
  TXML_Char = ansichar;

  PXML_LChar = ^TXML_LChar;
  TXML_LChar = ansichar;

type
  PXML_Index = ^TXML_Index;
  TXML_Index = Tclong;

  PXML_Size = ^TXML_Size;
  TXML_Size = Tculong;


  // ================ x86_64-linux-gnu/expat_config.h

const
  BYTEORDER = 1234;
  HAVE_ARC4RANDOM_BUF = 1;
  HAVE_CXX11 = 1;
  HAVE_DLFCN_H = 1;
  HAVE_FCNTL_H = 1;
  HAVE_GETPAGESIZE = 1;
  HAVE_GETRANDOM = 1;
  HAVE_INTTYPES_H = 1;
  HAVE_MMAP = 1;
  HAVE_STDINT_H = 1;
  HAVE_STDIO_H = 1;
  HAVE_STDLIB_H = 1;
  HAVE_STRINGS_H = 1;
  HAVE_STRING_H = 1;
  HAVE_SYSCALL_GETRANDOM = 1;
  HAVE_SYS_PARAM_H = 1;
  HAVE_SYS_STAT_H = 1;
  HAVE_SYS_TYPES_H = 1;
  HAVE_UNISTD_H = 1;
  LT_OBJDIR = '.libs/';
  PACKAGE = 'expat';
  PACKAGE_BUGREPORT = 'https://github.com/libexpat/libexpat/issues';
  PACKAGE_NAME = 'expat';
  PACKAGE_STRING = 'expat 2.6.1';
  PACKAGE_TARNAME = 'expat';
  PACKAGE_URL = '';
  PACKAGE_VERSION = '2.6.1';
  STDC_HEADERS = 1;
  VERSION = '2.6.1';

const
  WORDS_BIGENDIAN = 1;

const
  XML_CONTEXT_BYTES = 1024;
  XML_DEV_URANDOM = 1;
  XML_DTD = 1;
  XML_GE = 1;
  XML_NS = 1;


  // ================ expat.h

const
  Expat_INCLUDED = 1;

type
  PXML_ParserStruct = type Pointer;

  PXML_Parser = ^TXML_Parser;
  TXML_Parser = PXML_ParserStruct;

  PXML_Bool = ^TXML_Bool;
  TXML_Bool = UInt8;

const
  XML_TRUE = TXML_Bool(1);
  XML_FALSE = TXML_Bool(0);

type
  TXML_Status = longint;

const
  XML_STATUS_ERROR = 0;
  XML_STATUS_OK = 1;
  XML_STATUS_SUSPENDED = 2;

type
  TXML_Error = longint;

const
  XML_ERROR_NONE = 0;
  XML_ERROR_NO_MEMORY = 1;
  XML_ERROR_SYNTAX = 2;
  XML_ERROR_NO_ELEMENTS = 3;
  XML_ERROR_INVALID_TOKEN = 4;
  XML_ERROR_UNCLOSED_TOKEN = 5;
  XML_ERROR_PARTIAL_CHAR = 6;
  XML_ERROR_TAG_MISMATCH = 7;
  XML_ERROR_DUPLICATE_ATTRIBUTE = 8;
  XML_ERROR_JUNK_AFTER_DOC_ELEMENT = 9;
  XML_ERROR_PARAM_ENTITY_REF = 10;
  XML_ERROR_UNDEFINED_ENTITY = 11;
  XML_ERROR_RECURSIVE_ENTITY_REF = 12;
  XML_ERROR_ASYNC_ENTITY = 13;
  XML_ERROR_BAD_CHAR_REF = 14;
  XML_ERROR_BINARY_ENTITY_REF = 15;
  XML_ERROR_ATTRIBUTE_EXTERNAL_ENTITY_REF = 16;
  XML_ERROR_MISPLACED_XML_PI = 17;
  XML_ERROR_UNKNOWN_ENCODING = 18;
  XML_ERROR_INCORRECT_ENCODING = 19;
  XML_ERROR_UNCLOSED_CDATA_SECTION = 20;
  XML_ERROR_EXTERNAL_ENTITY_HANDLING = 21;
  XML_ERROR_NOT_STANDALONE = 22;
  XML_ERROR_UNEXPECTED_STATE = 23;
  XML_ERROR_ENTITY_DECLARED_IN_PE = 24;
  XML_ERROR_FEATURE_REQUIRES_XML_DTD = 25;
  XML_ERROR_CANT_CHANGE_FEATURE_ONCE_PARSING = 26;
  XML_ERROR_UNBOUND_PREFIX = 27;
  XML_ERROR_UNDECLARING_PREFIX = 28;
  XML_ERROR_INCOMPLETE_PE = 29;
  XML_ERROR_XML_DECL = 30;
  XML_ERROR_TEXT_DECL = 31;
  XML_ERROR_PUBLICID = 32;
  XML_ERROR_SUSPENDED = 33;
  XML_ERROR_NOT_SUSPENDED = 34;
  XML_ERROR_ABORTED = 35;
  XML_ERROR_FINISHED = 36;
  XML_ERROR_SUSPEND_PE = 37;
  XML_ERROR_RESERVED_PREFIX_XML = 38;
  XML_ERROR_RESERVED_PREFIX_XMLNS = 39;
  XML_ERROR_RESERVED_NAMESPACE_URI = 40;
  XML_ERROR_INVALID_ARGUMENT = 41;
  XML_ERROR_NO_BUFFER = 42;
  XML_ERROR_AMPLIFICATION_LIMIT_BREACH = 43;
  XML_ERROR_NOT_STARTED = 44;

type
  TXML_Content_Type = longint;

const
  XML_CTYPE_EMPTY = 1;
  XML_CTYPE_ANY = 2;
  XML_CTYPE_MIXED = 3;
  XML_CTYPE_NAME = 4;
  XML_CTYPE_CHOICE = 5;
  XML_CTYPE_SEQ = 6;

type
  TXML_Content_Quant = longint;

const
  XML_CQUANT_NONE = 0;
  XML_CQUANT_OPT = 1;
  XML_CQUANT_REP = 2;
  XML_CQUANT_PLUS = 3;

type
  PXML_Content = ^TXML_cp;

  PXML_cp = ^TXML_cp;

  TXML_cp = record
    _type: TXML_Content_Type;
    quant: TXML_Content_Quant;
    name: PXML_Char;
    numchildren: dword;
    children: PXML_Content;
  end;
  TXML_Content = TXML_cp;

  TXML_ElementDeclHandler = procedure(userData: pointer; name: PXML_Char; model: PXML_Content); cdecl;

procedure XML_SetElementDeclHandler(parser: TXML_Parser; eldecl: TXML_ElementDeclHandler); cdecl; external libexpat;

type
  TXML_AttlistDeclHandler = procedure(userData: pointer; elname: PXML_Char; attname: PXML_Char; att_type: PXML_Char; dflt: PXML_Char; isrequired: longint); cdecl;

procedure XML_SetAttlistDeclHandler(parser: TXML_Parser; attdecl: TXML_AttlistDeclHandler); cdecl; external libexpat;

type
  TXML_XmlDeclHandler = procedure(userData: pointer; version: PXML_Char; encoding: PXML_Char; standalone: longint); cdecl;

procedure XML_SetXmlDeclHandler(parser: TXML_Parser; xmldecl: TXML_XmlDeclHandler); cdecl; external libexpat;

type
  PXML_Memory_Handling_Suite = ^TXML_Memory_Handling_Suite;

  TXML_Memory_Handling_Suite = record
    malloc_fcn: function(size: Tsize_t): pointer; cdecl;
    realloc_fcn: function(ptr: pointer; size: Tsize_t): pointer; cdecl;
    free_fcn: procedure(ptr: pointer); cdecl;
  end;

function XML_ParserCreate(encoding: PXML_Char): TXML_Parser; cdecl; external libexpat;
function XML_ParserCreateNS(encoding: PXML_Char; namespaceSeparator: TXML_Char): TXML_Parser; cdecl; external libexpat;
function XML_ParserCreate_MM(encoding: PXML_Char; memsuite: PXML_Memory_Handling_Suite; namespaceSeparator: PXML_Char): TXML_Parser; cdecl; external libexpat;
function XML_ParserReset(parser: TXML_Parser; encoding: PXML_Char): TXML_Bool; cdecl; external libexpat;

type
  TXML_StartElementHandler = procedure(userData: pointer; name: PXML_Char; atts: PPXML_Char); cdecl;
  TXML_EndElementHandler = procedure(userData: pointer; name: PXML_Char); cdecl;
  TXML_CharacterDataHandler = procedure(userData: pointer; s: PXML_Char; len: longint); cdecl;
  TXML_ProcessingInstructionHandler = procedure(userData: pointer; target: PXML_Char; data: PXML_Char); cdecl;
  TXML_CommentHandler = procedure(userData: pointer; data: PXML_Char); cdecl;
  TXML_StartCdataSectionHandler = procedure(userData: pointer); cdecl;
  TXML_EndCdataSectionHandler = procedure(userData: pointer); cdecl;
  TXML_DefaultHandler = procedure(userData: pointer; s: PXML_Char; len: longint); cdecl;
  TXML_StartDoctypeDeclHandler = procedure(userData: pointer; doctypeName: PXML_Char; sysid: PXML_Char; pubid: PXML_Char; has_internal_subset: longint); cdecl;
  TXML_EndDoctypeDeclHandler = procedure(userData: pointer); cdecl;
  TXML_EntityDeclHandler = procedure(userData: pointer; entityName: PXML_Char; is_parameter_entity: longint; value: PXML_Char; value_length: longint; base: PXML_Char; systemId: PXML_Char; publicId: PXML_Char; notationName: PXML_Char); cdecl;

procedure XML_SetEntityDeclHandler(parser: TXML_Parser; handler: TXML_EntityDeclHandler); cdecl; external libexpat;

type
  TXML_UnparsedEntityDeclHandler = procedure(userData: pointer; entityName: PXML_Char; base: PXML_Char; systemId: PXML_Char; publicId: PXML_Char; notationName: PXML_Char); cdecl;
  TXML_NotationDeclHandler = procedure(userData: pointer; notationName: PXML_Char; base: PXML_Char; systemId: PXML_Char; publicId: PXML_Char); cdecl;
  TXML_StartNamespaceDeclHandler = procedure(userData: pointer; prefix: PXML_Char; uri: PXML_Char); cdecl;
  TXML_EndNamespaceDeclHandler = procedure(userData: pointer; prefix: PXML_Char); cdecl;
  TXML_NotStandaloneHandler = function(userData: pointer): longint; cdecl;
  TXML_ExternalEntityRefHandler = function(parser: TXML_Parser; context: PXML_Char; base: PXML_Char; systemId: PXML_Char; publicId: PXML_Char): longint; cdecl;
  TXML_SkippedEntityHandler = procedure(userData: pointer; entityName: PXML_Char; is_parameter_entity: longint); cdecl;

  TXML_Encoding = record
    map: array[0..255] of longint;
    data: pointer;
    convert: function(data: pointer; s: pchar): longint; cdecl;
    release: procedure(data: pointer); cdecl;
  end;
  PXML_Encoding = ^TXML_Encoding;

  TXML_UnknownEncodingHandler = function(encodingHandlerData: pointer; name: PXML_Char; info: PXML_Encoding): longint; cdecl;

procedure XML_SetElementHandler(parser: TXML_Parser; start: TXML_StartElementHandler; end_: TXML_EndElementHandler); cdecl; external libexpat;
procedure XML_SetStartElementHandler(parser: TXML_Parser; handler: TXML_StartElementHandler); cdecl; external libexpat;
procedure XML_SetEndElementHandler(parser: TXML_Parser; handler: TXML_EndElementHandler); cdecl; external libexpat;
procedure XML_SetCharacterDataHandler(parser: TXML_Parser; handler: TXML_CharacterDataHandler); cdecl; external libexpat;
procedure XML_SetProcessingInstructionHandler(parser: TXML_Parser; handler: TXML_ProcessingInstructionHandler); cdecl; external libexpat;
procedure XML_SetCommentHandler(parser: TXML_Parser; handler: TXML_CommentHandler); cdecl; external libexpat;
procedure XML_SetCdataSectionHandler(parser: TXML_Parser; start: TXML_StartCdataSectionHandler; end_: TXML_EndCdataSectionHandler); cdecl; external libexpat;
procedure XML_SetStartCdataSectionHandler(parser: TXML_Parser; start: TXML_StartCdataSectionHandler); cdecl; external libexpat;
procedure XML_SetEndCdataSectionHandler(parser: TXML_Parser; end_: TXML_EndCdataSectionHandler); cdecl; external libexpat;
procedure XML_SetDefaultHandler(parser: TXML_Parser; handler: TXML_DefaultHandler); cdecl; external libexpat;
procedure XML_SetDefaultHandlerExpand(parser: TXML_Parser; handler: TXML_DefaultHandler); cdecl; external libexpat;
procedure XML_SetDoctypeDeclHandler(parser: TXML_Parser; start: TXML_StartDoctypeDeclHandler; end_: TXML_EndDoctypeDeclHandler); cdecl; external libexpat;
procedure XML_SetStartDoctypeDeclHandler(parser: TXML_Parser; start: TXML_StartDoctypeDeclHandler); cdecl; external libexpat;
procedure XML_SetEndDoctypeDeclHandler(parser: TXML_Parser; end_: TXML_EndDoctypeDeclHandler); cdecl; external libexpat;
procedure XML_SetUnparsedEntityDeclHandler(parser: TXML_Parser; handler: TXML_UnparsedEntityDeclHandler); cdecl; external libexpat;
procedure XML_SetNotationDeclHandler(parser: TXML_Parser; handler: TXML_NotationDeclHandler); cdecl; external libexpat;
procedure XML_SetNamespaceDeclHandler(parser: TXML_Parser; start: TXML_StartNamespaceDeclHandler; end_: TXML_EndNamespaceDeclHandler); cdecl; external libexpat;
procedure XML_SetStartNamespaceDeclHandler(parser: TXML_Parser; start: TXML_StartNamespaceDeclHandler); cdecl; external libexpat;
procedure XML_SetEndNamespaceDeclHandler(parser: TXML_Parser; end_: TXML_EndNamespaceDeclHandler); cdecl; external libexpat;
procedure XML_SetNotStandaloneHandler(parser: TXML_Parser; handler: TXML_NotStandaloneHandler); cdecl; external libexpat;
procedure XML_SetExternalEntityRefHandler(parser: TXML_Parser; handler: TXML_ExternalEntityRefHandler); cdecl; external libexpat;
procedure XML_SetExternalEntityRefHandlerArg(parser: TXML_Parser; arg: pointer); cdecl; external libexpat;
procedure XML_SetSkippedEntityHandler(parser: TXML_Parser; handler: TXML_SkippedEntityHandler); cdecl; external libexpat;
procedure XML_SetUnknownEncodingHandler(parser: TXML_Parser; handler: TXML_UnknownEncodingHandler; encodingHandlerData: pointer); cdecl; external libexpat;
procedure XML_DefaultCurrent(parser: TXML_Parser); cdecl; external libexpat;
procedure XML_SetReturnNSTriplet(parser: TXML_Parser; do_nst: longint); cdecl; external libexpat;
procedure XML_SetUserData(parser: TXML_Parser; userData: pointer); cdecl; external libexpat;
function XML_SetEncoding(parser: TXML_Parser; encoding: PXML_Char): TXML_Status; cdecl; external libexpat;
procedure XML_UseParserAsHandlerArg(parser: TXML_Parser); cdecl; external libexpat;
function XML_UseForeignDTD(parser: TXML_Parser; useDTD: TXML_Bool): TXML_Error; cdecl; external libexpat;
function XML_SetBase(parser: TXML_Parser; base: PXML_Char): TXML_Status; cdecl; external libexpat;
function XML_GetBase(parser: TXML_Parser): PXML_Char; cdecl; external libexpat;
function XML_GetSpecifiedAttributeCount(parser: TXML_Parser): longint; cdecl; external libexpat;
function XML_GetIdAttributeIndex(parser: TXML_Parser): longint; cdecl; external libexpat;

type
  TXML_AttrInfo = record
    nameStart: TXML_Index;
    nameEnd: TXML_Index;
    valueStart: TXML_Index;
    valueEnd: TXML_Index;
  end;
  PXML_AttrInfo = ^TXML_AttrInfo;

function XML_GetAttributeInfo(parser: TXML_Parser): PXML_AttrInfo; cdecl; external libexpat;

function XML_Parse(parser: TXML_Parser; s: pchar; len: longint; isFinal: longint): TXML_Status; cdecl; external libexpat;
function XML_GetBuffer(parser: TXML_Parser; len: longint): pointer; cdecl; external libexpat;
function XML_ParseBuffer(parser: TXML_Parser; len: longint; isFinal: longint): TXML_Status; cdecl; external libexpat;
function XML_StopParser(parser: TXML_Parser; resumable: TXML_Bool): TXML_Status; cdecl; external libexpat;
function XML_ResumeParser(parser: TXML_Parser): TXML_Status; cdecl; external libexpat;

type
  TXML_Parsing = longint;

const
  XML_INITIALIZED = 0;
  XML_PARSING = 1;
  XML_FINISHED = 2;
  XML_SUSPENDED = 3;

type
  TXML_ParsingStatus = record
    parsing: TXML_Parsing;
    finalBuffer: TXML_Bool;
  end;
  PXML_ParsingStatus = ^TXML_ParsingStatus;

procedure XML_GetParsingStatus(parser: TXML_Parser; status: PXML_ParsingStatus); cdecl; external libexpat;
function XML_ExternalEntityParserCreate(parser: TXML_Parser; context: PXML_Char; encoding: PXML_Char): TXML_Parser; cdecl; external libexpat;

type
  TXML_ParamEntityParsing = longint;

const
  XML_PARAM_ENTITY_PARSING_NEVER = 0;
  XML_PARAM_ENTITY_PARSING_UNLESS_STANDALONE = 1;
  XML_PARAM_ENTITY_PARSING_ALWAYS = 2;

function XML_SetParamEntityParsing(parser: TXML_Parser; parsing: TXML_ParamEntityParsing): longint; cdecl; external libexpat;
function XML_SetHashSalt(parser: TXML_Parser; hash_salt: Tculong): longint; cdecl; external libexpat;
function XML_GetErrorCode(parser: TXML_Parser): TXML_Error; cdecl; external libexpat;
function XML_GetCurrentLineNumber(parser: TXML_Parser): TXML_Size; cdecl; external libexpat;
function XML_GetCurrentColumnNumber(parser: TXML_Parser): TXML_Size; cdecl; external libexpat;
function XML_GetCurrentByteIndex(parser: TXML_Parser): TXML_Index; cdecl; external libexpat;
function XML_GetCurrentByteCount(parser: TXML_Parser): longint; cdecl; external libexpat;
function XML_GetInputContext(parser: TXML_Parser; offset: Plongint; size: Plongint): pchar; cdecl; external libexpat;

function XML_GetErrorLineNumber(parser: TXML_Parser): TXML_Size; cdecl; external libexpat name 'XML_GetCurrentLineNumber';
function XML_GetErrorColumnNumber(parser: TXML_Parser): TXML_Size; cdecl; external libexpat name 'XML_GetCurrentColumnNumber';
function XML_GetErrorByteIndex(parser: TXML_Parser): TXML_Index; cdecl; external libexpat name 'XML_GetCurrentByteIndex';

procedure XML_FreeContentModel(parser: TXML_Parser; model: PXML_Content); cdecl; external libexpat;
function XML_MemMalloc(parser: TXML_Parser; size: Tsize_t): pointer; cdecl; external libexpat;
function XML_MemRealloc(parser: TXML_Parser; ptr: pointer; size: Tsize_t): pointer; cdecl; external libexpat;
procedure XML_MemFree(parser: TXML_Parser; ptr: pointer); cdecl; external libexpat;
procedure XML_ParserFree(parser: TXML_Parser); cdecl; external libexpat;
function XML_ErrorString(code: TXML_Error): PXML_LChar; cdecl; external libexpat;
function XML_ExpatVersion: PXML_LChar; cdecl; external libexpat;

type
  TXML_Expat_Version = record
    major: longint;
    minor: longint;
    micro: longint;
  end;
  PXML_Expat_Version = ^TXML_Expat_Version;

function XML_ExpatVersionInfo: TXML_Expat_Version; cdecl; external libexpat;

type
  TXML_FeatureEnum = longint;

const
  XML_FEATURE_END = 0;
  XML_FEATURE_UNICODE = 1;
  XML_FEATURE_UNICODE_WCHAR_T = 2;
  XML_FEATURE_DTD = 3;
  XML_FEATURE_CONTEXT_BYTES = 4;
  XML_FEATURE_MIN_SIZE = 5;
  XML_FEATURE_SIZEOF_XML_CHAR = 6;
  XML_FEATURE_SIZEOF_XML_LCHAR = 7;
  XML_FEATURE_NS = 8;
  XML_FEATURE_LARGE_SIZE = 9;
  XML_FEATURE_ATTR_INFO = 10;
  XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_MAXIMUM_AMPLIFICATION_DEFAULT = 11;
  XML_FEATURE_BILLION_LAUGHS_ATTACK_PROTECTION_ACTIVATION_THRESHOLD_DEFAULT = 12;
  XML_FEATURE_GE = 13;

type
  TXML_Feature = record
    feature: TXML_FeatureEnum;
    name: PXML_LChar;
    value: Tclong;
  end;
  PXML_Feature = ^TXML_Feature;

function XML_GetFeatureList: PXML_Feature; cdecl; external libexpat;

function XML_SetBillionLaughsAttackProtectionMaximumAmplification(parser: TXML_Parser; maximumAmplificationFactor: single): TXML_Bool; cdecl; external libexpat;
function XML_SetBillionLaughsAttackProtectionActivationThreshold(parser: TXML_Parser; activationThresholdBytes: Tculong): TXML_Bool; cdecl; external libexpat;

function XML_SetReparseDeferralEnabled(parser: TXML_Parser; enabled: TXML_Bool): TXML_Bool; cdecl; external libexpat;

const
  XML_MAJOR_VERSION = 2;
  XML_MINOR_VERSION = 6;
  XML_MICRO_VERSION = 1;

implementation


end.
