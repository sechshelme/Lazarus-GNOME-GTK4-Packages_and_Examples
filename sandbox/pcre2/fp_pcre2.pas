unit fp_pcre2;

interface

const
  {$IFDEF Linux}
  libpcre2 = 'pcre2';
  {$ENDIF}

  {$IFDEF Windows}
  libpcre2 = 'pcre2-dll';  // ?????
  {$ENDIF}


type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  Tsize_t=SizeUInt;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  PCRE2_MAJOR = 10;  
  PCRE2_MINOR = 42;  

const
  PCRE2_ANCHORED = $80000000;  
  PCRE2_NO_UTF_CHECK = $40000000;  
  PCRE2_ENDANCHORED = $20000000;  
  PCRE2_ALLOW_EMPTY_CLASS = $00000001;
  PCRE2_ALT_BSUX = $00000002;
  PCRE2_AUTO_CALLOUT = $00000004;
  PCRE2_CASELESS = $00000008;
  PCRE2_DOLLAR_ENDONLY = $00000010;
  PCRE2_DOTALL = $00000020;
  PCRE2_DUPNAMES = $00000040;
  PCRE2_EXTENDED = $00000080;
  PCRE2_FIRSTLINE = $00000100;
  PCRE2_MATCH_UNSET_BACKREF = $00000200;
  PCRE2_MULTILINE = $00000400;
  PCRE2_NEVER_UCP = $00000800;
  PCRE2_NEVER_UTF = $00001000;
  PCRE2_NO_AUTO_CAPTURE = $00002000;
  PCRE2_NO_AUTO_POSSESS = $00004000;
  PCRE2_NO_DOTSTAR_ANCHOR = $00008000;
  PCRE2_NO_START_OPTIMIZE = $00010000;
  PCRE2_UCP = $00020000;
  PCRE2_UNGREEDY = $00040000;
  PCRE2_UTF = $00080000;
  PCRE2_NEVER_BACKSLASH_C = $00100000;
  PCRE2_ALT_CIRCUMFLEX = $00200000;
  PCRE2_ALT_VERBNAMES = $00400000;
  PCRE2_USE_OFFSET_LIMIT = $00800000;
  PCRE2_EXTENDED_MORE = $01000000;
  PCRE2_LITERAL = $02000000;
  PCRE2_MATCH_INVALID_UTF = $04000000;
  PCRE2_EXTRA_ALLOW_SURROGATE_ESCAPES = $00000001;
  PCRE2_EXTRA_BAD_ESCAPE_IS_LITERAL = $00000002;
  PCRE2_EXTRA_MATCH_WORD = $00000004;
  PCRE2_EXTRA_MATCH_LINE = $00000008;
  PCRE2_EXTRA_ESCAPED_CR_IS_LF = $00000010;
  PCRE2_EXTRA_ALT_BSUX = $00000020;
  PCRE2_EXTRA_ALLOW_LOOKAROUND_BSK = $00000040;
  PCRE2_JIT_COMPLETE = $00000001;
  PCRE2_JIT_PARTIAL_SOFT = $00000002;  
  PCRE2_JIT_PARTIAL_HARD = $00000004;  
  PCRE2_JIT_INVALID_UTF = $00000100;  
  PCRE2_NOTBOL = $00000001;
  PCRE2_NOTEOL = $00000002;  
  PCRE2_NOTEMPTY = $00000004;
  PCRE2_NOTEMPTY_ATSTART = $00000008;
  PCRE2_PARTIAL_SOFT = $00000010;  
  PCRE2_PARTIAL_HARD = $00000020;  
  PCRE2_DFA_RESTART = $00000040;
  PCRE2_DFA_SHORTEST = $00000080;
  PCRE2_SUBSTITUTE_GLOBAL = $00000100;
  PCRE2_SUBSTITUTE_EXTENDED = $00000200;
  PCRE2_SUBSTITUTE_UNSET_EMPTY = $00000400;
  PCRE2_SUBSTITUTE_UNKNOWN_UNSET = $00000800;
  PCRE2_SUBSTITUTE_OVERFLOW_LENGTH = $00001000;
  PCRE2_NO_JIT = $00002000;
  PCRE2_COPY_MATCHED_SUBJECT = $00004000;  
  PCRE2_SUBSTITUTE_LITERAL = $00008000;
  PCRE2_SUBSTITUTE_MATCHED = $00010000;
  PCRE2_SUBSTITUTE_REPLACEMENT_ONLY = $00020000;
  PCRE2_CONVERT_UTF = $00000001;
  PCRE2_CONVERT_NO_UTF_CHECK = $00000002;  
  PCRE2_CONVERT_POSIX_BASIC = $00000004;  
  PCRE2_CONVERT_POSIX_EXTENDED = $00000008;  
  PCRE2_CONVERT_GLOB = $00000010;  
  PCRE2_CONVERT_GLOB_NO_WILD_SEPARATOR = $00000030;  
  PCRE2_CONVERT_GLOB_NO_STARSTAR = $00000050;

  PCRE2_NEWLINE_CR = 1;
  PCRE2_NEWLINE_LF = 2;  
  PCRE2_NEWLINE_CRLF = 3;  
  PCRE2_NEWLINE_ANY = 4;  
  PCRE2_NEWLINE_ANYCRLF = 5;  
  PCRE2_NEWLINE_NUL = 6;  
  PCRE2_BSR_UNICODE = 1;  
  PCRE2_BSR_ANYCRLF = 2;

  PCRE2_ERROR_END_BACKSLASH = 101;
  PCRE2_ERROR_END_BACKSLASH_C = 102;  
  PCRE2_ERROR_UNKNOWN_ESCAPE = 103;  
  PCRE2_ERROR_QUANTIFIER_OUT_OF_ORDER = 104;  
  PCRE2_ERROR_QUANTIFIER_TOO_BIG = 105;  
  PCRE2_ERROR_MISSING_SQUARE_BRACKET = 106;  
  PCRE2_ERROR_ESCAPE_INVALID_IN_CLASS = 107;  
  PCRE2_ERROR_CLASS_RANGE_ORDER = 108;  
  PCRE2_ERROR_QUANTIFIER_INVALID = 109;  
  PCRE2_ERROR_INTERNAL_UNEXPECTED_REPEAT = 110;  
  PCRE2_ERROR_INVALID_AFTER_PARENS_QUERY = 111;  
  PCRE2_ERROR_POSIX_CLASS_NOT_IN_CLASS = 112;  
  PCRE2_ERROR_POSIX_NO_SUPPORT_COLLATING = 113;  
  PCRE2_ERROR_MISSING_CLOSING_PARENTHESIS = 114;  
  PCRE2_ERROR_BAD_SUBPATTERN_REFERENCE = 115;  
  PCRE2_ERROR_NULL_PATTERN = 116;  
  PCRE2_ERROR_BAD_OPTIONS = 117;  
  PCRE2_ERROR_MISSING_COMMENT_CLOSING = 118;  
  PCRE2_ERROR_PARENTHESES_NEST_TOO_DEEP = 119;  
  PCRE2_ERROR_PATTERN_TOO_LARGE = 120;  
  PCRE2_ERROR_HEAP_FAILED = 121;  
  PCRE2_ERROR_UNMATCHED_CLOSING_PARENTHESIS = 122;  
  PCRE2_ERROR_INTERNAL_CODE_OVERFLOW = 123;  
  PCRE2_ERROR_MISSING_CONDITION_CLOSING = 124;  
  PCRE2_ERROR_LOOKBEHIND_NOT_FIXED_LENGTH = 125;  
  PCRE2_ERROR_ZERO_RELATIVE_REFERENCE = 126;  
  PCRE2_ERROR_TOO_MANY_CONDITION_BRANCHES = 127;  
  PCRE2_ERROR_CONDITION_ASSERTION_EXPECTED = 128;  
  PCRE2_ERROR_BAD_RELATIVE_REFERENCE = 129;  
  PCRE2_ERROR_UNKNOWN_POSIX_CLASS = 130;  
  PCRE2_ERROR_INTERNAL_STUDY_ERROR = 131;  
  PCRE2_ERROR_UNICODE_NOT_SUPPORTED = 132;  
  PCRE2_ERROR_PARENTHESES_STACK_CHECK = 133;  
  PCRE2_ERROR_CODE_POINT_TOO_BIG = 134;  
  PCRE2_ERROR_LOOKBEHIND_TOO_COMPLICATED = 135;  
  PCRE2_ERROR_LOOKBEHIND_INVALID_BACKSLASH_C = 136;  
  PCRE2_ERROR_UNSUPPORTED_ESCAPE_SEQUENCE = 137;  
  PCRE2_ERROR_CALLOUT_NUMBER_TOO_BIG = 138;  
  PCRE2_ERROR_MISSING_CALLOUT_CLOSING = 139;  
  PCRE2_ERROR_ESCAPE_INVALID_IN_VERB = 140;  
  PCRE2_ERROR_UNRECOGNIZED_AFTER_QUERY_P = 141;  
  PCRE2_ERROR_MISSING_NAME_TERMINATOR = 142;  
  PCRE2_ERROR_DUPLICATE_SUBPATTERN_NAME = 143;  
  PCRE2_ERROR_INVALID_SUBPATTERN_NAME = 144;  
  PCRE2_ERROR_UNICODE_PROPERTIES_UNAVAILABLE = 145;  
  PCRE2_ERROR_MALFORMED_UNICODE_PROPERTY = 146;  
  PCRE2_ERROR_UNKNOWN_UNICODE_PROPERTY = 147;  
  PCRE2_ERROR_SUBPATTERN_NAME_TOO_LONG = 148;  
  PCRE2_ERROR_TOO_MANY_NAMED_SUBPATTERNS = 149;  
  PCRE2_ERROR_CLASS_INVALID_RANGE = 150;  
  PCRE2_ERROR_OCTAL_BYTE_TOO_BIG = 151;  
  PCRE2_ERROR_INTERNAL_OVERRAN_WORKSPACE = 152;  
  PCRE2_ERROR_INTERNAL_MISSING_SUBPATTERN = 153;  
  PCRE2_ERROR_DEFINE_TOO_MANY_BRANCHES = 154;  
  PCRE2_ERROR_BACKSLASH_O_MISSING_BRACE = 155;  
  PCRE2_ERROR_INTERNAL_UNKNOWN_NEWLINE = 156;  
  PCRE2_ERROR_BACKSLASH_G_SYNTAX = 157;  
  PCRE2_ERROR_PARENS_QUERY_R_MISSING_CLOSING = 158;  
  PCRE2_ERROR_VERB_ARGUMENT_NOT_ALLOWED = 159;
  PCRE2_ERROR_VERB_UNKNOWN = 160;  
  PCRE2_ERROR_SUBPATTERN_NUMBER_TOO_BIG = 161;  
  PCRE2_ERROR_SUBPATTERN_NAME_EXPECTED = 162;  
  PCRE2_ERROR_INTERNAL_PARSED_OVERFLOW = 163;  
  PCRE2_ERROR_INVALID_OCTAL = 164;  
  PCRE2_ERROR_SUBPATTERN_NAMES_MISMATCH = 165;  
  PCRE2_ERROR_MARK_MISSING_ARGUMENT = 166;  
  PCRE2_ERROR_INVALID_HEXADECIMAL = 167;  
  PCRE2_ERROR_BACKSLASH_C_SYNTAX = 168;  
  PCRE2_ERROR_BACKSLASH_K_SYNTAX = 169;  
  PCRE2_ERROR_INTERNAL_BAD_CODE_LOOKBEHINDS = 170;  
  PCRE2_ERROR_BACKSLASH_N_IN_CLASS = 171;  
  PCRE2_ERROR_CALLOUT_STRING_TOO_LONG = 172;  
  PCRE2_ERROR_UNICODE_DISALLOWED_CODE_POINT = 173;  
  PCRE2_ERROR_UTF_IS_DISABLED = 174;  
  PCRE2_ERROR_UCP_IS_DISABLED = 175;  
  PCRE2_ERROR_VERB_NAME_TOO_LONG = 176;  
  PCRE2_ERROR_BACKSLASH_U_CODE_POINT_TOO_BIG = 177;  
  PCRE2_ERROR_MISSING_OCTAL_OR_HEX_DIGITS = 178;  
  PCRE2_ERROR_VERSION_CONDITION_SYNTAX = 179;  
  PCRE2_ERROR_INTERNAL_BAD_CODE_AUTO_POSSESS = 180;  
  PCRE2_ERROR_CALLOUT_NO_STRING_DELIMITER = 181;  
  PCRE2_ERROR_CALLOUT_BAD_STRING_DELIMITER = 182;  
  PCRE2_ERROR_BACKSLASH_C_CALLER_DISABLED = 183;  
  PCRE2_ERROR_QUERY_BARJX_NEST_TOO_DEEP = 184;  
  PCRE2_ERROR_BACKSLASH_C_LIBRARY_DISABLED = 185;  
  PCRE2_ERROR_PATTERN_TOO_COMPLICATED = 186;  
  PCRE2_ERROR_LOOKBEHIND_TOO_LONG = 187;  
  PCRE2_ERROR_PATTERN_STRING_TOO_LONG = 188;  
  PCRE2_ERROR_INTERNAL_BAD_CODE = 189;  
  PCRE2_ERROR_INTERNAL_BAD_CODE_IN_SKIP = 190;  
  PCRE2_ERROR_NO_SURROGATES_IN_UTF16 = 191;  
  PCRE2_ERROR_BAD_LITERAL_OPTIONS = 192;  
  PCRE2_ERROR_SUPPORTED_ONLY_IN_UNICODE = 193;  
  PCRE2_ERROR_INVALID_HYPHEN_IN_OPTIONS = 194;  
  PCRE2_ERROR_ALPHA_ASSERTION_UNKNOWN = 195;  
  PCRE2_ERROR_SCRIPT_RUN_NOT_AVAILABLE = 196;  
  PCRE2_ERROR_TOO_MANY_CAPTURES = 197;  
  PCRE2_ERROR_CONDITION_ATOMIC_ASSERTION_EXPECTED = 198;  
  PCRE2_ERROR_BACKSLASH_K_IN_LOOKAROUND = 199;  
  PCRE2_ERROR_NOMATCH = -(1);
  PCRE2_ERROR_PARTIAL = -(2);  
  PCRE2_ERROR_UTF8_ERR1 = -(3);
  PCRE2_ERROR_UTF8_ERR2 = -(4);  
  PCRE2_ERROR_UTF8_ERR3 = -(5);  
  PCRE2_ERROR_UTF8_ERR4 = -(6);  
  PCRE2_ERROR_UTF8_ERR5 = -(7);  
  PCRE2_ERROR_UTF8_ERR6 = -(8);  
  PCRE2_ERROR_UTF8_ERR7 = -(9);  
  PCRE2_ERROR_UTF8_ERR8 = -(10);  
  PCRE2_ERROR_UTF8_ERR9 = -(11);  
  PCRE2_ERROR_UTF8_ERR10 = -(12);  
  PCRE2_ERROR_UTF8_ERR11 = -(13);  
  PCRE2_ERROR_UTF8_ERR12 = -(14);  
  PCRE2_ERROR_UTF8_ERR13 = -(15);  
  PCRE2_ERROR_UTF8_ERR14 = -(16);  
  PCRE2_ERROR_UTF8_ERR15 = -(17);  
  PCRE2_ERROR_UTF8_ERR16 = -(18);  
  PCRE2_ERROR_UTF8_ERR17 = -(19);  
  PCRE2_ERROR_UTF8_ERR18 = -(20);  
  PCRE2_ERROR_UTF8_ERR19 = -(21);  
  PCRE2_ERROR_UTF8_ERR20 = -(22);  
  PCRE2_ERROR_UTF8_ERR21 = -(23);  
  PCRE2_ERROR_UTF16_ERR1 = -(24);
  PCRE2_ERROR_UTF16_ERR2 = -(25);  
  PCRE2_ERROR_UTF16_ERR3 = -(26);  
  PCRE2_ERROR_UTF32_ERR1 = -(27);
  PCRE2_ERROR_UTF32_ERR2 = -(28);  
  PCRE2_ERROR_BADDATA = -(29);
  PCRE2_ERROR_MIXEDTABLES = -(30);
  PCRE2_ERROR_BADMAGIC = -(31);  
  PCRE2_ERROR_BADMODE = -(32);  
  PCRE2_ERROR_BADOFFSET = -(33);  
  PCRE2_ERROR_BADOPTION = -(34);  
  PCRE2_ERROR_BADREPLACEMENT = -(35);  
  PCRE2_ERROR_BADUTFOFFSET = -(36);  
  PCRE2_ERROR_CALLOUT = -(37);
  PCRE2_ERROR_DFA_BADRESTART = -(38);  
  PCRE2_ERROR_DFA_RECURSE = -(39);  
  PCRE2_ERROR_DFA_UCOND = -(40);  
  PCRE2_ERROR_DFA_UFUNC = -(41);  
  PCRE2_ERROR_DFA_UITEM = -(42);  
  PCRE2_ERROR_DFA_WSSIZE = -(43);  
  PCRE2_ERROR_INTERNAL = -(44);  
  PCRE2_ERROR_JIT_BADOPTION = -(45);  
  PCRE2_ERROR_JIT_STACKLIMIT = -(46);  
  PCRE2_ERROR_MATCHLIMIT = -(47);  
  PCRE2_ERROR_NOMEMORY = -(48);  
  PCRE2_ERROR_NOSUBSTRING = -(49);  
  PCRE2_ERROR_NOUNIQUESUBSTRING = -(50);  
  PCRE2_ERROR_NULL = -(51);  
  PCRE2_ERROR_RECURSELOOP = -(52);  
  PCRE2_ERROR_DEPTHLIMIT = -(53);  
  PCRE2_ERROR_RECURSIONLIMIT = -(53);
  PCRE2_ERROR_UNAVAILABLE = -(54);  
  PCRE2_ERROR_UNSET = -(55);  
  PCRE2_ERROR_BADOFFSETLIMIT = -(56);  
  PCRE2_ERROR_BADREPESCAPE = -(57);  
  PCRE2_ERROR_REPMISSINGBRACE = -(58);  
  PCRE2_ERROR_BADSUBSTITUTION = -(59);  
  PCRE2_ERROR_BADSUBSPATTERN = -(60);  
  PCRE2_ERROR_TOOMANYREPLACE = -(61);  
  PCRE2_ERROR_BADSERIALIZEDDATA = -(62);  
  PCRE2_ERROR_HEAPLIMIT = -(63);  
  PCRE2_ERROR_CONVERT_SYNTAX = -(64);  
  PCRE2_ERROR_INTERNAL_DUPMATCH = -(65);  
  PCRE2_ERROR_DFA_UINVALID_UTF = -(66);  
  PCRE2_INFO_ALLOPTIONS = 0;
  PCRE2_INFO_ARGOPTIONS = 1;  
  PCRE2_INFO_BACKREFMAX = 2;  
  PCRE2_INFO_BSR = 3;  
  PCRE2_INFO_CAPTURECOUNT = 4;  
  PCRE2_INFO_FIRSTCODEUNIT = 5;  
  PCRE2_INFO_FIRSTCODETYPE = 6;  
  PCRE2_INFO_FIRSTBITMAP = 7;  
  PCRE2_INFO_HASCRORLF = 8;  
  PCRE2_INFO_JCHANGED = 9;  
  PCRE2_INFO_JITSIZE = 10;  
  PCRE2_INFO_LASTCODEUNIT = 11;  
  PCRE2_INFO_LASTCODETYPE = 12;  
  PCRE2_INFO_MATCHEMPTY = 13;  
  PCRE2_INFO_MATCHLIMIT = 14;  
  PCRE2_INFO_MAXLOOKBEHIND = 15;  
  PCRE2_INFO_MINLENGTH = 16;  
  PCRE2_INFO_NAMECOUNT = 17;  
  PCRE2_INFO_NAMEENTRYSIZE = 18;  
  PCRE2_INFO_NAMETABLE = 19;  
  PCRE2_INFO_NEWLINE = 20;  
  PCRE2_INFO_DEPTHLIMIT = 21;  
  PCRE2_INFO_RECURSIONLIMIT = 21;
  PCRE2_INFO_SIZE = 22;  
  PCRE2_INFO_HASBACKSLASHC = 23;  
  PCRE2_INFO_FRAMESIZE = 24;  
  PCRE2_INFO_HEAPLIMIT = 25;  
  PCRE2_INFO_EXTRAOPTIONS = 26;  
  PCRE2_CONFIG_BSR = 0;
  PCRE2_CONFIG_JIT = 1;  
  PCRE2_CONFIG_JITTARGET = 2;  
  PCRE2_CONFIG_LINKSIZE = 3;  
  PCRE2_CONFIG_MATCHLIMIT = 4;  
  PCRE2_CONFIG_NEWLINE = 5;  
  PCRE2_CONFIG_PARENSLIMIT = 6;  
  PCRE2_CONFIG_DEPTHLIMIT = 7;  
  PCRE2_CONFIG_RECURSIONLIMIT = 7;
  PCRE2_CONFIG_STACKRECURSE = 8;
  PCRE2_CONFIG_UNICODE = 9;  
  PCRE2_CONFIG_UNICODE_VERSION = 10;  
  PCRE2_CONFIG_VERSION = 11;  
  PCRE2_CONFIG_HEAPLIMIT = 12;  
  PCRE2_CONFIG_NEVER_BACKSLASH_C = 13;  
  PCRE2_CONFIG_COMPILED_WIDTHS = 14;  
  PCRE2_CONFIG_TABLES_LENGTH = 15;  
type
  PPCRE2_UCHAR8 = ^TPCRE2_UCHAR8;
  TPCRE2_UCHAR8 = Tuint8_t;

  PPCRE2_UCHAR16 = ^TPCRE2_UCHAR16;
  TPCRE2_UCHAR16 = Tuint16_t;

  PPCRE2_UCHAR32 = ^TPCRE2_UCHAR32;
  TPCRE2_UCHAR32 = Tuint32_t;

  PPCRE2_SPTR8 = ^TPCRE2_SPTR8;
  TPCRE2_SPTR8 = PPCRE2_UCHAR8;

  PPCRE2_SPTR16 = ^TPCRE2_SPTR16;
  TPCRE2_SPTR16 = PPCRE2_UCHAR16;

  PPCRE2_SPTR32 = ^TPCRE2_SPTR32;
  TPCRE2_SPTR32 = PPCRE2_UCHAR32;

type
  TPCRE2_SIZE = Tsize_t;
  PPCRE2_SIZE=^TPCRE2_SIZE;

const
  SIZE_MAX=18446744073709551615;
  PCRE2_SIZE_MAX = SIZE_MAX;

function PCRE2_ZERO_TERMINATED : longint;
function PCRE2_UNSET : longint;

type
  Ppcre2_general_context = type Pointer;
  Ppcre2_compile_context =type Pointer;
  Ppcre2_match_context = type Pointer;
  Ppcre2_convert_context = type Pointer;
  Ppcre2_code = type Pointer;
  Ppcre2_match_data = type Pointer;
  Ppcre2_jit_stack = type Pointer;

  Tpcre2_jit_callback = function (para1:pointer):Ppcre2_jit_stack;cdecl;

const
  PCRE2_CALLOUT_STARTMATCH = $00000001;  
{ Set after a backtrack  }
  PCRE2_CALLOUT_BACKTRACK = $00000002;  
type
  Ppcre2_callout_block = ^Tpcre2_callout_block;
  Tpcre2_callout_block = record
      version : Tuint32_t;
      callout_number : Tuint32_t;
      capture_top : Tuint32_t;
      capture_last : Tuint32_t;
      offset_vector : PPCRE2_SIZE;
      mark : TPCRE2_SPTR;
      subject : TPCRE2_SPTR;
      subject_length : TPCRE2_SIZE;
      start_match : TPCRE2_SIZE;
      current_position : TPCRE2_SIZE;
      pattern_position : TPCRE2_SIZE;
      next_item_length : TPCRE2_SIZE;
      callout_string_offset : TPCRE2_SIZE;
      callout_string_length : TPCRE2_SIZE;
      callout_string : TPCRE2_SPTR;
      callout_flags : Tuint32_t;
    end;

  Ppcre2_callout_enumerate_block = ^Tpcre2_callout_enumerate_block;
  Tpcre2_callout_enumerate_block = record
      version : Tuint32_t;
      pattern_position : TPCRE2_SIZE;
      next_item_length : TPCRE2_SIZE;
      callout_number : Tuint32_t;
      callout_string_offset : TPCRE2_SIZE;
      callout_string_length : TPCRE2_SIZE;
      callout_string : TPCRE2_SPTR;
    end;

  Ppcre2_substitute_callout_block = ^Tpcre2_substitute_callout_block;
  Tpcre2_substitute_callout_block = record
      version : Tuint32_t;
      input : TPCRE2_SPTR;
      output : TPCRE2_SPTR;
      output_offsets : array[0..1] of TPCRE2_SIZE;
      ovector : PPCRE2_SIZE;
      oveccount : Tuint32_t;
      subscount : Tuint32_t;
    end;
{ List the generic forms of all other functions in macros, which will be
expanded for each width below. Start with functions that give general
information.  }

function pcre2_config(para1:Tuint32_t; para2:pointer):longint;cdecl;external libpcre2;
{ Functions for manipulating contexts.  }
function pcre2_general_context_copy(para1:Ppcre2_general_context):Ppcre2_general_context;cdecl;external libpcre2;
function pcre2_general_context_create(para1:Pprocedure (para1:TPCRE2_SIZE; para2:pointer); para2:procedure (para1:pointer; para2:pointer); para3:pointer):Ppcre2_general_context;cdecl;external libpcre2;
procedure pcre2_general_context_free(para1:Ppcre2_general_context);cdecl;external libpcre2;
function pcre2_compile_context_copy(para1:Ppcre2_compile_context):Ppcre2_compile_context;cdecl;external libpcre2;
function pcre2_compile_context_create(para1:Ppcre2_general_context):Ppcre2_compile_context;cdecl;external libpcre2;
procedure pcre2_compile_context_free(para1:Ppcre2_compile_context);cdecl;external libpcre2;
function pcre2_set_bsr(para1:Ppcre2_compile_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_set_character_tables(para1:Ppcre2_compile_context; para2:Puint8_t):longint;cdecl;external libpcre2;
function pcre2_set_compile_extra_options(para1:Ppcre2_compile_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_set_max_pattern_length(para1:Ppcre2_compile_context; para2:TPCRE2_SIZE):longint;cdecl;external libpcre2;
function pcre2_set_newline(para1:Ppcre2_compile_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_set_parens_nest_limit(para1:Ppcre2_compile_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_set_compile_recursion_guard(para1:Ppcre2_compile_context; para2:function (para1:Tuint32_t; para2:pointer):longint; para3:pointer):longint;cdecl;external libpcre2;
function pcre2_match_context_copy(para1:Ppcre2_match_context):Ppcre2_match_context;cdecl;external libpcre2;
function pcre2_match_context_create(para1:Ppcre2_general_context):Ppcre2_match_context;cdecl;external libpcre2;
procedure pcre2_match_context_free(para1:Ppcre2_match_context);cdecl;external libpcre2;
function pcre2_set_callout(para1:Ppcre2_match_context; para2:function (para1:Ppcre2_callout_block; para2:pointer):longint; para3:pointer):longint;cdecl;external libpcre2;
function pcre2_set_substitute_callout(para1:Ppcre2_match_context; para2:function (para1:Ppcre2_substitute_callout_block; para2:pointer):longint; para3:pointer):longint;cdecl;external libpcre2;
function pcre2_set_depth_limit(para1:Ppcre2_match_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_set_heap_limit(para1:Ppcre2_match_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_set_match_limit(para1:Ppcre2_match_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_set_offset_limit(para1:Ppcre2_match_context; para2:TPCRE2_SIZE):longint;cdecl;external libpcre2;
function pcre2_set_recursion_limit(para1:Ppcre2_match_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_set_recursion_memory_management(para1:Ppcre2_match_context; para2:Pprocedure (para1:TPCRE2_SIZE; para2:pointer); para3:procedure (para1:pointer; para2:pointer); para4:pointer):longint;cdecl;external libpcre2;
function pcre2_convert_context_copy(para1:Ppcre2_convert_context):Ppcre2_convert_context;cdecl;external libpcre2;
function pcre2_convert_context_create(para1:Ppcre2_general_context):Ppcre2_convert_context;cdecl;external libpcre2;
procedure pcre2_convert_context_free(para1:Ppcre2_convert_context);cdecl;external libpcre2;
function pcre2_set_glob_escape(para1:Ppcre2_convert_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_set_glob_separator(para1:Ppcre2_convert_context; para2:Tuint32_t):longint;cdecl;external libpcre2;
{ Functions concerned with compiling a pattern to PCRE internal code.  }
function pcre2_compile(para1:TPCRE2_SPTR; para2:TPCRE2_SIZE; para3:Tuint32_t; para4:Plongint; para5:PPCRE2_SIZE; 
           para6:Ppcre2_compile_context):Ppcre2_code;cdecl;external libpcre2;
procedure pcre2_code_free(para1:Ppcre2_code);cdecl;external libpcre2;
function pcre2_code_copy(para1:Ppcre2_code):Ppcre2_code;cdecl;external libpcre2;
function pcre2_code_copy_with_tables(para1:Ppcre2_code):Ppcre2_code;cdecl;external libpcre2;
{ Functions that give information about a compiled pattern.  }
function pcre2_pattern_info(para1:Ppcre2_code; para2:Tuint32_t; para3:pointer):longint;cdecl;external libpcre2;
function pcre2_callout_enumerate(para1:Ppcre2_code; para2:function (para1:Ppcre2_callout_enumerate_block; para2:pointer):longint; para3:pointer):longint;cdecl;external libpcre2;
{ Functions for running a match and inspecting the result.  }
function pcre2_match_data_create(para1:Tuint32_t; para2:Ppcre2_general_context):Ppcre2_match_data;cdecl;external libpcre2;
function pcre2_match_data_create_from_pattern(para1:Ppcre2_code; para2:Ppcre2_general_context):Ppcre2_match_data;cdecl;external libpcre2;
function pcre2_dfa_match(para1:Ppcre2_code; para2:TPCRE2_SPTR; para3:TPCRE2_SIZE; para4:TPCRE2_SIZE; para5:Tuint32_t; 
           para6:Ppcre2_match_data; para7:Ppcre2_match_context; para8:Plongint; para9:TPCRE2_SIZE):longint;cdecl;external libpcre2;
function pcre2_match(para1:Ppcre2_code; para2:TPCRE2_SPTR; para3:TPCRE2_SIZE; para4:TPCRE2_SIZE; para5:Tuint32_t; 
           para6:Ppcre2_match_data; para7:Ppcre2_match_context):longint;cdecl;external libpcre2;
procedure pcre2_match_data_free(para1:Ppcre2_match_data);cdecl;external libpcre2;
function pcre2_get_mark(para1:Ppcre2_match_data):TPCRE2_SPTR;cdecl;external libpcre2;
function pcre2_get_match_data_size(para1:Ppcre2_match_data):TPCRE2_SIZE;cdecl;external libpcre2;
function pcre2_get_ovector_count(para1:Ppcre2_match_data):Tuint32_t;cdecl;external libpcre2;
function pcre2_get_ovector_pointer(para1:Ppcre2_match_data):PPCRE2_SIZE;cdecl;external libpcre2;
function pcre2_get_startchar(para1:Ppcre2_match_data):TPCRE2_SIZE;cdecl;external libpcre2;
{ Convenience functions for handling matched substrings.  }
function pcre2_substring_copy_byname(para1:Ppcre2_match_data; para2:TPCRE2_SPTR; para3:PPCRE2_UCHAR; para4:PPCRE2_SIZE):longint;cdecl;external libpcre2;
function pcre2_substring_copy_bynumber(para1:Ppcre2_match_data; para2:Tuint32_t; para3:PPCRE2_UCHAR; para4:PPCRE2_SIZE):longint;cdecl;external libpcre2;
procedure pcre2_substring_free(para1:PPCRE2_UCHAR);cdecl;external libpcre2;
function pcre2_substring_get_byname(para1:Ppcre2_match_data; para2:TPCRE2_SPTR; para3:PPPCRE2_UCHAR; para4:PPCRE2_SIZE):longint;cdecl;external libpcre2;
function pcre2_substring_get_bynumber(para1:Ppcre2_match_data; para2:Tuint32_t; para3:PPPCRE2_UCHAR; para4:PPCRE2_SIZE):longint;cdecl;external libpcre2;
function pcre2_substring_length_byname(para1:Ppcre2_match_data; para2:TPCRE2_SPTR; para3:PPCRE2_SIZE):longint;cdecl;external libpcre2;
function pcre2_substring_length_bynumber(para1:Ppcre2_match_data; para2:Tuint32_t; para3:PPCRE2_SIZE):longint;cdecl;external libpcre2;
function pcre2_substring_nametable_scan(para1:Ppcre2_code; para2:TPCRE2_SPTR; para3:PPCRE2_SPTR; para4:PPCRE2_SPTR):longint;cdecl;external libpcre2;
function pcre2_substring_number_from_name(para1:Ppcre2_code; para2:TPCRE2_SPTR):longint;cdecl;external libpcre2;
procedure pcre2_substring_list_free(para1:PPCRE2_SPTR);cdecl;external libpcre2;
function pcre2_substring_list_get(para1:Ppcre2_match_data; para2:PPPPCRE2_UCHAR; para3:PPPCRE2_SIZE):longint;cdecl;external libpcre2;
{ Functions for serializing / deserializing compiled patterns.  }
function pcre2_serialize_encode(para1:PPpcre2_code; para2:Tint32_t; para3:PPuint8_t; para4:PPCRE2_SIZE; para5:Ppcre2_general_context):Tint32_t;cdecl;external libpcre2;
function pcre2_serialize_decode(para1:PPpcre2_code; para2:Tint32_t; para3:Puint8_t; para4:Ppcre2_general_context):Tint32_t;cdecl;external libpcre2;
function pcre2_serialize_get_number_of_codes(para1:Puint8_t):Tint32_t;cdecl;external libpcre2;
procedure pcre2_serialize_free(para1:Puint8_t);cdecl;external libpcre2;
{ Convenience function for match + substitute.  }
function pcre2_substitute(para1:Ppcre2_code; para2:TPCRE2_SPTR; para3:TPCRE2_SIZE; para4:TPCRE2_SIZE; para5:Tuint32_t; 
           para6:Ppcre2_match_data; para7:Ppcre2_match_context; para8:TPCRE2_SPTR; para9:TPCRE2_SIZE; para10:PPCRE2_UCHAR; 
           para11:PPCRE2_SIZE):longint;cdecl;external libpcre2;
{ Functions for converting pattern source strings.  }
function pcre2_pattern_convert(para1:TPCRE2_SPTR; para2:TPCRE2_SIZE; para3:Tuint32_t; para4:PPPCRE2_UCHAR; para5:PPCRE2_SIZE; 
           para6:Ppcre2_convert_context):longint;cdecl;external libpcre2;
procedure pcre2_converted_pattern_free(para1:PPCRE2_UCHAR);cdecl;external libpcre2;
{ Functions for JIT processing  }
function pcre2_jit_compile(para1:Ppcre2_code; para2:Tuint32_t):longint;cdecl;external libpcre2;
function pcre2_jit_match(para1:Ppcre2_code; para2:TPCRE2_SPTR; para3:TPCRE2_SIZE; para4:TPCRE2_SIZE; para5:Tuint32_t; 
           para6:Ppcre2_match_data; para7:Ppcre2_match_context):longint;cdecl;external libpcre2;
procedure pcre2_jit_free_unused_memory(para1:Ppcre2_general_context);cdecl;external libpcre2;
function pcre2_jit_stack_create(para1:TPCRE2_SIZE; para2:TPCRE2_SIZE; para3:Ppcre2_general_context):Ppcre2_jit_stack;cdecl;external libpcre2;
procedure pcre2_jit_stack_assign(para1:Ppcre2_match_context; para2:Tpcre2_jit_callback; para3:pointer);cdecl;external libpcre2;
procedure pcre2_jit_stack_free(para1:Ppcre2_jit_stack);cdecl;external libpcre2;
{ Other miscellaneous functions.  }
function pcre2_get_error_message(para1:longint; para2:PPCRE2_UCHAR; para3:TPCRE2_SIZE):longint;cdecl;external libpcre2;
function pcre2_maketables(para1:Ppcre2_general_context):Puint8_t;cdecl;external libpcre2;
procedure pcre2_maketables_free(para1:Ppcre2_general_context; para2:Puint8_t);cdecl;external libpcre2;
{ Define macros that generate width-specific names from generic versions. The
three-level macro scheme is necessary to get the macros expanded when we want
them to be. First we get the width from PCRE2_LOCAL_WIDTH, which is used for
generating three versions of everything below. After that, PCRE2_SUFFIX will be
re-defined to use PCRE2_CODE_UNIT_WIDTH, for use when macros such as
pcre2_compile are called by application code.  }
{ Data types  }
{ was #define dname def_expr }
function PCRE2_UCHAR : longint; { return type might be wrong }

{ was #define dname def_expr }
function PCRE2_SPTR : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_code : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_jit_callback : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_jit_stack : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_real_code : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_real_general_context : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_real_compile_context : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_real_convert_context : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_real_match_context : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_real_jit_stack : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_real_match_data : longint; { return type might be wrong }

{ Data blocks  }
{ was #define dname def_expr }
function pcre2_callout_block : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_callout_enumerate_block : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substitute_callout_block : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_general_context : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_compile_context : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_convert_context : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_match_context : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_match_data : longint; { return type might be wrong }

{ Functions: the complete list in alphabetical order  }
{ was #define dname def_expr }
function pcre2_callout_enumerate : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_code_copy : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_code_copy_with_tables : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_code_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_compile : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_compile_context_copy : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_compile_context_create : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_compile_context_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_config : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_convert_context_copy : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_convert_context_create : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_convert_context_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_converted_pattern_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_dfa_match : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_general_context_copy : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_general_context_create : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_general_context_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_get_error_message : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_get_mark : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_get_match_data_size : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_get_ovector_pointer : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_get_ovector_count : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_get_startchar : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_jit_compile : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_jit_match : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_jit_free_unused_memory : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_jit_stack_assign : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_jit_stack_create : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_jit_stack_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_maketables : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_maketables_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_match : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_match_context_copy : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_match_context_create : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_match_context_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_match_data_create : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_match_data_create_from_pattern : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_match_data_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_pattern_convert : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_pattern_info : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_serialize_decode : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_serialize_encode : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_serialize_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_serialize_get_number_of_codes : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_bsr : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_callout : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_character_tables : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_compile_extra_options : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_compile_recursion_guard : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_depth_limit : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_glob_escape : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_glob_separator : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_heap_limit : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_match_limit : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_max_pattern_length : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_newline : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_parens_nest_limit : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_offset_limit : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_set_substitute_callout : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substitute : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_copy_byname : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_copy_bynumber : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_get_byname : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_get_bynumber : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_length_byname : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_length_bynumber : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_list_get : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_list_free : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_nametable_scan : longint; { return type might be wrong }

{ was #define dname def_expr }
function pcre2_substring_number_from_name : longint; { return type might be wrong }

{ Keep this old function name for backwards compatibility  }
{ was #define dname def_expr }
function pcre2_set_recursion_limit : longint; { return type might be wrong }

{ Keep this obsolete function for backwards compatibility: it is now a noop.  }
{ was #define dname def_expr }
function pcre2_set_recursion_memory_management : longint; { return type might be wrong }

{ Now generate all three sets of width-specific structures and function
prototypes.  }
{ Undefine the list macros; they are no longer needed.  }
{ PCRE2_CODE_UNIT_WIDTH must be defined. If it is 8, 16, or 32, redefine
PCRE2_SUFFIX to use it. If it is 0, undefine the other macros and make
PCRE2_SUFFIX a no-op. Otherwise, generate an error.  }
{$endif}
{ PCRE2_H_IDEMPOTENT_GUARD  }
{ End of pcre2.h  }

// === Konventiert am: 3-1-26 19:49:49 ===


implementation


{ was #define dname def_expr }
function PCRE2_ZERO_TERMINATED : longint; { return type might be wrong }
  begin
    PCRE2_ZERO_TERMINATED:= not (TPCRE2_SIZE(0));
  end;

{ was #define dname def_expr }
function PCRE2_UNSET : longint; { return type might be wrong }
  begin
    PCRE2_UNSET:= not (TPCRE2_SIZE(0));
  end;

{ was #define dname def_expr }
function PCRE2_UCHAR : longint; { return type might be wrong }
  begin
    PCRE2_UCHAR:=PCRE2_SUFFIX(PCRE2_UCHAR);
  end;

{ was #define dname def_expr }
function PCRE2_SPTR : longint; { return type might be wrong }
  begin
    PCRE2_SPTR:=PCRE2_SUFFIX(PCRE2_SPTR);
  end;

{ was #define dname def_expr }
function pcre2_code : longint; { return type might be wrong }
  begin
    pcre2_code:=PCRE2_SUFFIX(pcre2_code_);
  end;

{ was #define dname def_expr }
function pcre2_jit_callback : longint; { return type might be wrong }
  begin
    pcre2_jit_callback:=PCRE2_SUFFIX(pcre2_jit_callback_);
  end;

{ was #define dname def_expr }
function pcre2_jit_stack : longint; { return type might be wrong }
  begin
    pcre2_jit_stack:=PCRE2_SUFFIX(pcre2_jit_stack_);
  end;

{ was #define dname def_expr }
function pcre2_real_code : longint; { return type might be wrong }
  begin
    pcre2_real_code:=PCRE2_SUFFIX(pcre2_real_code_);
  end;

{ was #define dname def_expr }
function pcre2_real_general_context : longint; { return type might be wrong }
  begin
    pcre2_real_general_context:=PCRE2_SUFFIX(pcre2_real_general_context_);
  end;

{ was #define dname def_expr }
function pcre2_real_compile_context : longint; { return type might be wrong }
  begin
    pcre2_real_compile_context:=PCRE2_SUFFIX(pcre2_real_compile_context_);
  end;

{ was #define dname def_expr }
function pcre2_real_convert_context : longint; { return type might be wrong }
  begin
    pcre2_real_convert_context:=PCRE2_SUFFIX(pcre2_real_convert_context_);
  end;

{ was #define dname def_expr }
function pcre2_real_match_context : longint; { return type might be wrong }
  begin
    pcre2_real_match_context:=PCRE2_SUFFIX(pcre2_real_match_context_);
  end;

{ was #define dname def_expr }
function pcre2_real_jit_stack : longint; { return type might be wrong }
  begin
    pcre2_real_jit_stack:=PCRE2_SUFFIX(pcre2_real_jit_stack_);
  end;

{ was #define dname def_expr }
function pcre2_real_match_data : longint; { return type might be wrong }
  begin
    pcre2_real_match_data:=PCRE2_SUFFIX(pcre2_real_match_data_);
  end;

{ was #define dname def_expr }
function pcre2_callout_block : longint; { return type might be wrong }
  begin
    pcre2_callout_block:=PCRE2_SUFFIX(pcre2_callout_block_);
  end;

{ was #define dname def_expr }
function pcre2_callout_enumerate_block : longint; { return type might be wrong }
  begin
    pcre2_callout_enumerate_block:=PCRE2_SUFFIX(pcre2_callout_enumerate_block_);
  end;

{ was #define dname def_expr }
function pcre2_substitute_callout_block : longint; { return type might be wrong }
  begin
    pcre2_substitute_callout_block:=PCRE2_SUFFIX(pcre2_substitute_callout_block_);
  end;

{ was #define dname def_expr }
function pcre2_general_context : longint; { return type might be wrong }
  begin
    pcre2_general_context:=PCRE2_SUFFIX(pcre2_general_context_);
  end;

{ was #define dname def_expr }
function pcre2_compile_context : longint; { return type might be wrong }
  begin
    pcre2_compile_context:=PCRE2_SUFFIX(pcre2_compile_context_);
  end;

{ was #define dname def_expr }
function pcre2_convert_context : longint; { return type might be wrong }
  begin
    pcre2_convert_context:=PCRE2_SUFFIX(pcre2_convert_context_);
  end;

{ was #define dname def_expr }
function pcre2_match_context : longint; { return type might be wrong }
  begin
    pcre2_match_context:=PCRE2_SUFFIX(pcre2_match_context_);
  end;

{ was #define dname def_expr }
function pcre2_match_data : longint; { return type might be wrong }
  begin
    pcre2_match_data:=PCRE2_SUFFIX(pcre2_match_data_);
  end;

{ was #define dname def_expr }
function pcre2_callout_enumerate : longint; { return type might be wrong }
  begin
    pcre2_callout_enumerate:=PCRE2_SUFFIX(pcre2_callout_enumerate_);
  end;

{ was #define dname def_expr }
function pcre2_code_copy : longint; { return type might be wrong }
  begin
    pcre2_code_copy:=PCRE2_SUFFIX(pcre2_code_copy_);
  end;

{ was #define dname def_expr }
function pcre2_code_copy_with_tables : longint; { return type might be wrong }
  begin
    pcre2_code_copy_with_tables:=PCRE2_SUFFIX(pcre2_code_copy_with_tables_);
  end;

{ was #define dname def_expr }
function pcre2_code_free : longint; { return type might be wrong }
  begin
    pcre2_code_free:=PCRE2_SUFFIX(pcre2_code_free_);
  end;

{ was #define dname def_expr }
function pcre2_compile : longint; { return type might be wrong }
  begin
    pcre2_compile:=PCRE2_SUFFIX(pcre2_compile_);
  end;

{ was #define dname def_expr }
function pcre2_compile_context_copy : longint; { return type might be wrong }
  begin
    pcre2_compile_context_copy:=PCRE2_SUFFIX(pcre2_compile_context_copy_);
  end;

{ was #define dname def_expr }
function pcre2_compile_context_create : longint; { return type might be wrong }
  begin
    pcre2_compile_context_create:=PCRE2_SUFFIX(pcre2_compile_context_create_);
  end;

{ was #define dname def_expr }
function pcre2_compile_context_free : longint; { return type might be wrong }
  begin
    pcre2_compile_context_free:=PCRE2_SUFFIX(pcre2_compile_context_free_);
  end;

{ was #define dname def_expr }
function pcre2_config : longint; { return type might be wrong }
  begin
    pcre2_config:=PCRE2_SUFFIX(pcre2_config_);
  end;

{ was #define dname def_expr }
function pcre2_convert_context_copy : longint; { return type might be wrong }
  begin
    pcre2_convert_context_copy:=PCRE2_SUFFIX(pcre2_convert_context_copy_);
  end;

{ was #define dname def_expr }
function pcre2_convert_context_create : longint; { return type might be wrong }
  begin
    pcre2_convert_context_create:=PCRE2_SUFFIX(pcre2_convert_context_create_);
  end;

{ was #define dname def_expr }
function pcre2_convert_context_free : longint; { return type might be wrong }
  begin
    pcre2_convert_context_free:=PCRE2_SUFFIX(pcre2_convert_context_free_);
  end;

{ was #define dname def_expr }
function pcre2_converted_pattern_free : longint; { return type might be wrong }
  begin
    pcre2_converted_pattern_free:=PCRE2_SUFFIX(pcre2_converted_pattern_free_);
  end;

{ was #define dname def_expr }
function pcre2_dfa_match : longint; { return type might be wrong }
  begin
    pcre2_dfa_match:=PCRE2_SUFFIX(pcre2_dfa_match_);
  end;

{ was #define dname def_expr }
function pcre2_general_context_copy : longint; { return type might be wrong }
  begin
    pcre2_general_context_copy:=PCRE2_SUFFIX(pcre2_general_context_copy_);
  end;

{ was #define dname def_expr }
function pcre2_general_context_create : longint; { return type might be wrong }
  begin
    pcre2_general_context_create:=PCRE2_SUFFIX(pcre2_general_context_create_);
  end;

{ was #define dname def_expr }
function pcre2_general_context_free : longint; { return type might be wrong }
  begin
    pcre2_general_context_free:=PCRE2_SUFFIX(pcre2_general_context_free_);
  end;

{ was #define dname def_expr }
function pcre2_get_error_message : longint; { return type might be wrong }
  begin
    pcre2_get_error_message:=PCRE2_SUFFIX(pcre2_get_error_message_);
  end;

{ was #define dname def_expr }
function pcre2_get_mark : longint; { return type might be wrong }
  begin
    pcre2_get_mark:=PCRE2_SUFFIX(pcre2_get_mark_);
  end;

{ was #define dname def_expr }
function pcre2_get_match_data_size : longint; { return type might be wrong }
  begin
    pcre2_get_match_data_size:=PCRE2_SUFFIX(pcre2_get_match_data_size_);
  end;

{ was #define dname def_expr }
function pcre2_get_ovector_pointer : longint; { return type might be wrong }
  begin
    pcre2_get_ovector_pointer:=PCRE2_SUFFIX(pcre2_get_ovector_pointer_);
  end;

{ was #define dname def_expr }
function pcre2_get_ovector_count : longint; { return type might be wrong }
  begin
    pcre2_get_ovector_count:=PCRE2_SUFFIX(pcre2_get_ovector_count_);
  end;

{ was #define dname def_expr }
function pcre2_get_startchar : longint; { return type might be wrong }
  begin
    pcre2_get_startchar:=PCRE2_SUFFIX(pcre2_get_startchar_);
  end;

{ was #define dname def_expr }
function pcre2_jit_compile : longint; { return type might be wrong }
  begin
    pcre2_jit_compile:=PCRE2_SUFFIX(pcre2_jit_compile_);
  end;

{ was #define dname def_expr }
function pcre2_jit_match : longint; { return type might be wrong }
  begin
    pcre2_jit_match:=PCRE2_SUFFIX(pcre2_jit_match_);
  end;

{ was #define dname def_expr }
function pcre2_jit_free_unused_memory : longint; { return type might be wrong }
  begin
    pcre2_jit_free_unused_memory:=PCRE2_SUFFIX(pcre2_jit_free_unused_memory_);
  end;

{ was #define dname def_expr }
function pcre2_jit_stack_assign : longint; { return type might be wrong }
  begin
    pcre2_jit_stack_assign:=PCRE2_SUFFIX(pcre2_jit_stack_assign_);
  end;

{ was #define dname def_expr }
function pcre2_jit_stack_create : longint; { return type might be wrong }
  begin
    pcre2_jit_stack_create:=PCRE2_SUFFIX(pcre2_jit_stack_create_);
  end;

{ was #define dname def_expr }
function pcre2_jit_stack_free : longint; { return type might be wrong }
  begin
    pcre2_jit_stack_free:=PCRE2_SUFFIX(pcre2_jit_stack_free_);
  end;

{ was #define dname def_expr }
function pcre2_maketables : longint; { return type might be wrong }
  begin
    pcre2_maketables:=PCRE2_SUFFIX(pcre2_maketables_);
  end;

{ was #define dname def_expr }
function pcre2_maketables_free : longint; { return type might be wrong }
  begin
    pcre2_maketables_free:=PCRE2_SUFFIX(pcre2_maketables_free_);
  end;

{ was #define dname def_expr }
function pcre2_match : longint; { return type might be wrong }
  begin
    pcre2_match:=PCRE2_SUFFIX(pcre2_match_);
  end;

{ was #define dname def_expr }
function pcre2_match_context_copy : longint; { return type might be wrong }
  begin
    pcre2_match_context_copy:=PCRE2_SUFFIX(pcre2_match_context_copy_);
  end;

{ was #define dname def_expr }
function pcre2_match_context_create : longint; { return type might be wrong }
  begin
    pcre2_match_context_create:=PCRE2_SUFFIX(pcre2_match_context_create_);
  end;

{ was #define dname def_expr }
function pcre2_match_context_free : longint; { return type might be wrong }
  begin
    pcre2_match_context_free:=PCRE2_SUFFIX(pcre2_match_context_free_);
  end;

{ was #define dname def_expr }
function pcre2_match_data_create : longint; { return type might be wrong }
  begin
    pcre2_match_data_create:=PCRE2_SUFFIX(pcre2_match_data_create_);
  end;

{ was #define dname def_expr }
function pcre2_match_data_create_from_pattern : longint; { return type might be wrong }
  begin
    pcre2_match_data_create_from_pattern:=PCRE2_SUFFIX(pcre2_match_data_create_from_pattern_);
  end;

{ was #define dname def_expr }
function pcre2_match_data_free : longint; { return type might be wrong }
  begin
    pcre2_match_data_free:=PCRE2_SUFFIX(pcre2_match_data_free_);
  end;

{ was #define dname def_expr }
function pcre2_pattern_convert : longint; { return type might be wrong }
  begin
    pcre2_pattern_convert:=PCRE2_SUFFIX(pcre2_pattern_convert_);
  end;

{ was #define dname def_expr }
function pcre2_pattern_info : longint; { return type might be wrong }
  begin
    pcre2_pattern_info:=PCRE2_SUFFIX(pcre2_pattern_info_);
  end;

{ was #define dname def_expr }
function pcre2_serialize_decode : longint; { return type might be wrong }
  begin
    pcre2_serialize_decode:=PCRE2_SUFFIX(pcre2_serialize_decode_);
  end;

{ was #define dname def_expr }
function pcre2_serialize_encode : longint; { return type might be wrong }
  begin
    pcre2_serialize_encode:=PCRE2_SUFFIX(pcre2_serialize_encode_);
  end;

{ was #define dname def_expr }
function pcre2_serialize_free : longint; { return type might be wrong }
  begin
    pcre2_serialize_free:=PCRE2_SUFFIX(pcre2_serialize_free_);
  end;

{ was #define dname def_expr }
function pcre2_serialize_get_number_of_codes : longint; { return type might be wrong }
  begin
    pcre2_serialize_get_number_of_codes:=PCRE2_SUFFIX(pcre2_serialize_get_number_of_codes_);
  end;

{ was #define dname def_expr }
function pcre2_set_bsr : longint; { return type might be wrong }
  begin
    pcre2_set_bsr:=PCRE2_SUFFIX(pcre2_set_bsr_);
  end;

{ was #define dname def_expr }
function pcre2_set_callout : longint; { return type might be wrong }
  begin
    pcre2_set_callout:=PCRE2_SUFFIX(pcre2_set_callout_);
  end;

{ was #define dname def_expr }
function pcre2_set_character_tables : longint; { return type might be wrong }
  begin
    pcre2_set_character_tables:=PCRE2_SUFFIX(pcre2_set_character_tables_);
  end;

{ was #define dname def_expr }
function pcre2_set_compile_extra_options : longint; { return type might be wrong }
  begin
    pcre2_set_compile_extra_options:=PCRE2_SUFFIX(pcre2_set_compile_extra_options_);
  end;

{ was #define dname def_expr }
function pcre2_set_compile_recursion_guard : longint; { return type might be wrong }
  begin
    pcre2_set_compile_recursion_guard:=PCRE2_SUFFIX(pcre2_set_compile_recursion_guard_);
  end;

{ was #define dname def_expr }
function pcre2_set_depth_limit : longint; { return type might be wrong }
  begin
    pcre2_set_depth_limit:=PCRE2_SUFFIX(pcre2_set_depth_limit_);
  end;

{ was #define dname def_expr }
function pcre2_set_glob_escape : longint; { return type might be wrong }
  begin
    pcre2_set_glob_escape:=PCRE2_SUFFIX(pcre2_set_glob_escape_);
  end;

{ was #define dname def_expr }
function pcre2_set_glob_separator : longint; { return type might be wrong }
  begin
    pcre2_set_glob_separator:=PCRE2_SUFFIX(pcre2_set_glob_separator_);
  end;

{ was #define dname def_expr }
function pcre2_set_heap_limit : longint; { return type might be wrong }
  begin
    pcre2_set_heap_limit:=PCRE2_SUFFIX(pcre2_set_heap_limit_);
  end;

{ was #define dname def_expr }
function pcre2_set_match_limit : longint; { return type might be wrong }
  begin
    pcre2_set_match_limit:=PCRE2_SUFFIX(pcre2_set_match_limit_);
  end;

{ was #define dname def_expr }
function pcre2_set_max_pattern_length : longint; { return type might be wrong }
  begin
    pcre2_set_max_pattern_length:=PCRE2_SUFFIX(pcre2_set_max_pattern_length_);
  end;

{ was #define dname def_expr }
function pcre2_set_newline : longint; { return type might be wrong }
  begin
    pcre2_set_newline:=PCRE2_SUFFIX(pcre2_set_newline_);
  end;

{ was #define dname def_expr }
function pcre2_set_parens_nest_limit : longint; { return type might be wrong }
  begin
    pcre2_set_parens_nest_limit:=PCRE2_SUFFIX(pcre2_set_parens_nest_limit_);
  end;

{ was #define dname def_expr }
function pcre2_set_offset_limit : longint; { return type might be wrong }
  begin
    pcre2_set_offset_limit:=PCRE2_SUFFIX(pcre2_set_offset_limit_);
  end;

{ was #define dname def_expr }
function pcre2_set_substitute_callout : longint; { return type might be wrong }
  begin
    pcre2_set_substitute_callout:=PCRE2_SUFFIX(pcre2_set_substitute_callout_);
  end;

{ was #define dname def_expr }
function pcre2_substitute : longint; { return type might be wrong }
  begin
    pcre2_substitute:=PCRE2_SUFFIX(pcre2_substitute_);
  end;

{ was #define dname def_expr }
function pcre2_substring_copy_byname : longint; { return type might be wrong }
  begin
    pcre2_substring_copy_byname:=PCRE2_SUFFIX(pcre2_substring_copy_byname_);
  end;

{ was #define dname def_expr }
function pcre2_substring_copy_bynumber : longint; { return type might be wrong }
  begin
    pcre2_substring_copy_bynumber:=PCRE2_SUFFIX(pcre2_substring_copy_bynumber_);
  end;

{ was #define dname def_expr }
function pcre2_substring_free : longint; { return type might be wrong }
  begin
    pcre2_substring_free:=PCRE2_SUFFIX(pcre2_substring_free_);
  end;

{ was #define dname def_expr }
function pcre2_substring_get_byname : longint; { return type might be wrong }
  begin
    pcre2_substring_get_byname:=PCRE2_SUFFIX(pcre2_substring_get_byname_);
  end;

{ was #define dname def_expr }
function pcre2_substring_get_bynumber : longint; { return type might be wrong }
  begin
    pcre2_substring_get_bynumber:=PCRE2_SUFFIX(pcre2_substring_get_bynumber_);
  end;

{ was #define dname def_expr }
function pcre2_substring_length_byname : longint; { return type might be wrong }
  begin
    pcre2_substring_length_byname:=PCRE2_SUFFIX(pcre2_substring_length_byname_);
  end;

{ was #define dname def_expr }
function pcre2_substring_length_bynumber : longint; { return type might be wrong }
  begin
    pcre2_substring_length_bynumber:=PCRE2_SUFFIX(pcre2_substring_length_bynumber_);
  end;

{ was #define dname def_expr }
function pcre2_substring_list_get : longint; { return type might be wrong }
  begin
    pcre2_substring_list_get:=PCRE2_SUFFIX(pcre2_substring_list_get_);
  end;

{ was #define dname def_expr }
function pcre2_substring_list_free : longint; { return type might be wrong }
  begin
    pcre2_substring_list_free:=PCRE2_SUFFIX(pcre2_substring_list_free_);
  end;

{ was #define dname def_expr }
function pcre2_substring_nametable_scan : longint; { return type might be wrong }
  begin
    pcre2_substring_nametable_scan:=PCRE2_SUFFIX(pcre2_substring_nametable_scan_);
  end;

{ was #define dname def_expr }
function pcre2_substring_number_from_name : longint; { return type might be wrong }
  begin
    pcre2_substring_number_from_name:=PCRE2_SUFFIX(pcre2_substring_number_from_name_);
  end;

{ was #define dname def_expr }
function pcre2_set_recursion_limit : longint; { return type might be wrong }
  begin
    pcre2_set_recursion_limit:=PCRE2_SUFFIX(pcre2_set_recursion_limit_);
  end;

{ was #define dname def_expr }
function pcre2_set_recursion_memory_management : longint; { return type might be wrong }
  begin
    pcre2_set_recursion_memory_management:=PCRE2_SUFFIX(pcre2_set_recursion_memory_management_);
  end;


end.
