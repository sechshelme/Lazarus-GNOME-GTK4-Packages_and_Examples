unit fp_gumbo;

interface

const
  {$IFDEF Linux}
  libgumbo = 'gumbo';
  {$ENDIF}

  {$IFDEF Windows}
  libgumbo = 'gumbo.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGumboSourcePosition = ^TGumboSourcePosition;
  TGumboSourcePosition = record
    line: dword;
    column: dword;
    offset: dword;
  end;

var
  kGumboEmptySourcePosition: TGumboSourcePosition; cvar;external libgumbo;

type
  PGumboStringPiece = ^TGumboStringPiece;
  TGumboStringPiece = record
    data: pchar;
    length: Tsize_t;
  end;

var
  kGumboEmptyString: TGumboStringPiece; cvar;external libgumbo;

function gumbo_string_equals(str1: PGumboStringPiece; str2: PGumboStringPiece): boolean; cdecl; external libgumbo;
function gumbo_string_equals_ignore_case(str1: PGumboStringPiece; str2: PGumboStringPiece): boolean; cdecl; external libgumbo;

type
  PGumboVector = ^TGumboVector;
  TGumboVector = record
    data: ^pointer;
    length: dword;
    capacity: dword;
  end;

var
  kGumboEmptyVector: TGumboVector; cvar;external libgumbo;

function gumbo_vector_index_of(vector: PGumboVector; element: pointer): longint; cdecl; external libgumbo;

type
  PGumboTag = ^TGumboTag;
  TGumboTag = longint;
const
  GUMBO_TAG_HTML = 0;
  GUMBO_TAG_HEAD = 1;
  GUMBO_TAG_TITLE = 2;
  GUMBO_TAG_BASE = 3;
  GUMBO_TAG_LINK = 4;
  GUMBO_TAG_META = 5;
  GUMBO_TAG_STYLE = 6;
  GUMBO_TAG_SCRIPT = 7;
  GUMBO_TAG_NOSCRIPT = 8;
  GUMBO_TAG_TEMPLATE = 9;
  GUMBO_TAG_BODY = 10;
  GUMBO_TAG_ARTICLE = 11;
  GUMBO_TAG_SECTION = 12;
  GUMBO_TAG_NAV = 13;
  GUMBO_TAG_ASIDE = 14;
  GUMBO_TAG_H1 = 15;
  GUMBO_TAG_H2 = 16;
  GUMBO_TAG_H3 = 17;
  GUMBO_TAG_H4 = 18;
  GUMBO_TAG_H5 = 19;
  GUMBO_TAG_H6 = 20;
  GUMBO_TAG_HGROUP = 21;
  GUMBO_TAG_HEADER = 22;
  GUMBO_TAG_FOOTER = 23;
  GUMBO_TAG_ADDRESS = 24;
  GUMBO_TAG_P = 25;
  GUMBO_TAG_HR = 26;
  GUMBO_TAG_PRE = 27;
  GUMBO_TAG_BLOCKQUOTE = 28;
  GUMBO_TAG_OL = 29;
  GUMBO_TAG_UL = 30;
  GUMBO_TAG_LI = 31;
  GUMBO_TAG_DL = 32;
  GUMBO_TAG_DT = 33;
  GUMBO_TAG_DD = 34;
  GUMBO_TAG_FIGURE = 35;
  GUMBO_TAG_FIGCAPTION = 36;
  GUMBO_TAG_MAIN = 37;
  GUMBO_TAG_DIV = 38;
  GUMBO_TAG_A = 39;
  GUMBO_TAG_EM = 40;
  GUMBO_TAG_STRONG = 41;
  GUMBO_TAG_SMALL = 42;
  GUMBO_TAG_S = 43;
  GUMBO_TAG_CITE = 44;
  GUMBO_TAG_Q = 45;
  GUMBO_TAG_DFN = 46;
  GUMBO_TAG_ABBR = 47;
  GUMBO_TAG_DATA = 48;
  GUMBO_TAG_TIME = 49;
  GUMBO_TAG_CODE = 50;
  GUMBO_TAG_VAR = 51;
  GUMBO_TAG_SAMP = 52;
  GUMBO_TAG_KBD = 53;
  GUMBO_TAG_SUB = 54;
  GUMBO_TAG_SUP = 55;
  GUMBO_TAG_I = 56;
  GUMBO_TAG_B = 57;
  GUMBO_TAG_U = 58;
  GUMBO_TAG_MARK = 59;
  GUMBO_TAG_RUBY = 60;
  GUMBO_TAG_RT = 61;
  GUMBO_TAG_RP = 62;
  GUMBO_TAG_BDI = 63;
  GUMBO_TAG_BDO = 64;
  GUMBO_TAG_SPAN = 65;
  GUMBO_TAG_BR = 66;
  GUMBO_TAG_WBR = 67;
  GUMBO_TAG_INS = 68;
  GUMBO_TAG_DEL = 69;
  GUMBO_TAG_IMAGE = 70;
  GUMBO_TAG_IMG = 71;
  GUMBO_TAG_PICTURE = 72;
  GUMBO_TAG_IFRAME = 73;
  GUMBO_TAG_EMBED = 74;
  GUMBO_TAG_OBJECT = 75;
  GUMBO_TAG_PARAM = 76;
  GUMBO_TAG_VIDEO = 77;
  GUMBO_TAG_AUDIO = 78;
  GUMBO_TAG_SOURCE = 79;
  GUMBO_TAG_TRACK = 80;
  GUMBO_TAG_CANVAS = 81;
  GUMBO_TAG_MAP = 82;
  GUMBO_TAG_AREA = 83;
  GUMBO_TAG_MATH = 84;
  GUMBO_TAG_MI = 85;
  GUMBO_TAG_MO = 86;
  GUMBO_TAG_MN = 87;
  GUMBO_TAG_MS = 88;
  GUMBO_TAG_MTEXT = 89;
  GUMBO_TAG_MGLYPH = 90;
  GUMBO_TAG_MALIGNMARK = 91;
  GUMBO_TAG_ANNOTATION_XML = 92;
  GUMBO_TAG_SVG = 93;
  GUMBO_TAG_FOREIGNOBJECT = 94;
  GUMBO_TAG_DESC = 95;
  GUMBO_TAG_TABLE = 96;
  GUMBO_TAG_CAPTION = 97;
  GUMBO_TAG_COLGROUP = 98;
  GUMBO_TAG_COL = 99;
  GUMBO_TAG_TBODY = 100;
  GUMBO_TAG_THEAD = 101;
  GUMBO_TAG_TFOOT = 102;
  GUMBO_TAG_TR = 103;
  GUMBO_TAG_TD = 104;
  GUMBO_TAG_TH = 105;
  GUMBO_TAG_FORM = 106;
  GUMBO_TAG_FIELDSET = 107;
  GUMBO_TAG_LEGEND = 108;
  GUMBO_TAG_LABEL = 109;
  GUMBO_TAG_INPUT = 110;
  GUMBO_TAG_BUTTON = 111;
  GUMBO_TAG_SELECT = 112;
  GUMBO_TAG_DATALIST = 113;
  GUMBO_TAG_OPTGROUP = 114;
  GUMBO_TAG_OPTION = 115;
  GUMBO_TAG_TEXTAREA = 116;
  GUMBO_TAG_KEYGEN = 117;
  GUMBO_TAG_OUTPUT = 118;
  GUMBO_TAG_PROGRESS = 119;
  GUMBO_TAG_METER = 120;
  GUMBO_TAG_DETAILS = 121;
  GUMBO_TAG_SUMMARY = 122;
  GUMBO_TAG_MENU = 123;
  GUMBO_TAG_MENUITEM = 124;
  GUMBO_TAG_APPLET = 125;
  GUMBO_TAG_ACRONYM = 126;
  GUMBO_TAG_BGSOUND = 127;
  GUMBO_TAG_DIR = 128;
  GUMBO_TAG_FRAME = 129;
  GUMBO_TAG_FRAMESET = 130;
  GUMBO_TAG_NOFRAMES = 131;
  GUMBO_TAG_ISINDEX = 132;
  GUMBO_TAG_LISTING = 133;
  GUMBO_TAG_XMP = 134;
  GUMBO_TAG_NEXTID = 135;
  GUMBO_TAG_NOEMBED = 136;
  GUMBO_TAG_PLAINTEXT = 137;
  GUMBO_TAG_RB = 138;
  GUMBO_TAG_STRIKE = 139;
  GUMBO_TAG_BASEFONT = 140;
  GUMBO_TAG_BIG = 141;
  GUMBO_TAG_BLINK = 142;
  GUMBO_TAG_CENTER = 143;
  GUMBO_TAG_FONT = 144;
  GUMBO_TAG_MARQUEE = 145;
  GUMBO_TAG_MULTICOL = 146;
  GUMBO_TAG_NOBR = 147;
  GUMBO_TAG_SPACER = 148;
  GUMBO_TAG_DIALOG = 149;
  GUMBO_TAG_TT = 150;
  GUMBO_TAG_RTC = 151;
  GUMBO_TAG_UNKNOWN = 152;
  GUMBO_TAG_LAST = 153;

function gumbo_normalized_tagname(tag: TGumboTag): pchar; cdecl; external libgumbo;
procedure gumbo_tag_from_original_text(text: PGumboStringPiece); cdecl; external libgumbo;
function gumbo_normalize_svg_tagname(tagname: PGumboStringPiece): pchar; cdecl; external libgumbo;

function gumbo_tag_enum(tagname: pchar): TGumboTag; cdecl; external libgumbo;
function gumbo_tagn_enum(tagname: pchar; length: dword): TGumboTag; cdecl; external libgumbo;

type
  PGumboAttributeNamespaceEnum = ^TGumboAttributeNamespaceEnum;
  TGumboAttributeNamespaceEnum = longint;
const
  GUMBO_ATTR_NAMESPACE_NONE = 0;
  GUMBO_ATTR_NAMESPACE_XLINK = 1;
  GUMBO_ATTR_NAMESPACE_XML = 2;
  GUMBO_ATTR_NAMESPACE_XMLNS = 3;

type
  PGumboAttribute = ^TGumboAttribute;
  TGumboAttribute = record
    attr_namespace: TGumboAttributeNamespaceEnum;
    name: pchar;
    original_name: TGumboStringPiece;
    value: pchar;
    original_value: TGumboStringPiece;
    name_start: TGumboSourcePosition;
    name_end: TGumboSourcePosition;
    value_start: TGumboSourcePosition;
    value_end: TGumboSourcePosition;
  end;

function gumbo_get_attribute(attrs: PGumboVector; name: pchar): PGumboAttribute; cdecl; external libgumbo;

type
  PGumboNodeType = ^TGumboNodeType;
  TGumboNodeType = longint;
const
  GUMBO_NODE_DOCUMENT = 0;
  GUMBO_NODE_ELEMENT = 1;
  GUMBO_NODE_TEXT = 2;
  GUMBO_NODE_CDATA = 3;
  GUMBO_NODE_COMMENT = 4;
  GUMBO_NODE_WHITESPACE = 5;
  GUMBO_NODE_TEMPLATE = 6;

type
  PGumboQuirksModeEnum = ^TGumboQuirksModeEnum;
  TGumboQuirksModeEnum = longint;
const
  GUMBO_DOCTYPE_NO_QUIRKS = 0;
  GUMBO_DOCTYPE_QUIRKS = 1;
  GUMBO_DOCTYPE_LIMITED_QUIRKS = 2;

type
  PGumboNamespaceEnum = ^TGumboNamespaceEnum;
  TGumboNamespaceEnum = longint;
const
  GUMBO_NAMESPACE_HTML = 0;
  GUMBO_NAMESPACE_SVG = 1;
  GUMBO_NAMESPACE_MATHML = 2;

type
  PGumboParseFlags = ^TGumboParseFlags;
  TGumboParseFlags = longint;
const
  GUMBO_INSERTION_NORMAL = 0;
  GUMBO_INSERTION_BY_PARSER = 1 shl 0;
  GUMBO_INSERTION_IMPLICIT_END_TAG = 1 shl 1;
  GUMBO_INSERTION_IMPLIED = 1 shl 3;
  GUMBO_INSERTION_CONVERTED_FROM_END_TAG = 1 shl 4;
  GUMBO_INSERTION_FROM_ISINDEX = 1 shl 5;
  GUMBO_INSERTION_FROM_IMAGE = 1 shl 6;
  GUMBO_INSERTION_RECONSTRUCTED_FORMATTING_ELEMENT = 1 shl 7;
  GUMBO_INSERTION_ADOPTION_AGENCY_CLONED = 1 shl 8;
  GUMBO_INSERTION_ADOPTION_AGENCY_MOVED = 1 shl 9;
  GUMBO_INSERTION_FOSTER_PARENTED = 1 shl 10;

type
  PGumboDocument = ^TGumboDocument;
  TGumboDocument = record
    children: TGumboVector;
    has_doctype: boolean;
    name: pchar;
    public_identifier: pchar;
    system_identifier: pchar;
    doc_type_quirks_mode: TGumboQuirksModeEnum;
  end;

  PGumboText = ^TGumboText;
  TGumboText = record
    text: pchar;
    original_text: TGumboStringPiece;
    start_pos: TGumboSourcePosition;
  end;

  PGumboElement = ^TGumboElement;
  TGumboElement = record
    children: TGumboVector;
    tag: TGumboTag;
    tag_namespace: TGumboNamespaceEnum;
    original_tag: TGumboStringPiece;
    original_end_tag: TGumboStringPiece;
    start_pos: TGumboSourcePosition;
    end_pos: TGumboSourcePosition;
    attributes: TGumboVector;
  end;

  PGumboInternalNode = ^TGumboInternalNode;
  PGumboNode = PGumboInternalNode;
  TGumboInternalNode = record
    _type: TGumboNodeType;
    parent: PGumboNode;
    index_within_parent: Tsize_t;
    parse_flags: TGumboParseFlags;
    v: record
      case longint of
        0: (document: TGumboDocument);
        1: (element: TGumboElement);
        2: (text: TGumboText);
      end;
  end;

  TGumboAllocatorFunction = function(userdata: pointer; size: Tsize_t): pointer; cdecl;
  TGumboDeallocatorFunction = procedure(userdata: pointer; ptr: pointer); cdecl;

  PGumboInternalOptions = ^TGumboInternalOptions;
  TGumboInternalOptions = record
    allocator: TGumboAllocatorFunction;
    deallocator: TGumboDeallocatorFunction;
    userdata: pointer;
    tab_stop: longint;
    stop_on_first_error: boolean;
    max_errors: longint;
    fragment_context: TGumboTag;
    fragment_namespace: TGumboNamespaceEnum;
  end;
  TGumboOptions = TGumboInternalOptions;
  PGumboOptions = ^TGumboOptions;

var
  kGumboDefaultOptions: TGumboOptions; cvar;external libgumbo;

type
  PGumboInternalOutput = ^TGumboInternalOutput;
  TGumboInternalOutput = record
    document: PGumboNode;
    root: PGumboNode;
    errors: TGumboVector;
  end;
  TGumboOutput = TGumboInternalOutput;
  PGumboOutput = ^TGumboOutput;

function gumbo_parse(buffer: pchar): PGumboOutput; cdecl; external libgumbo;
function gumbo_parse_with_options(options: PGumboOptions; buffer: pchar; buffer_length: Tsize_t): PGumboOutput; cdecl; external libgumbo;
procedure gumbo_destroy_output(options: PGumboOptions; output: PGumboOutput); cdecl; external libgumbo;

// === Konventiert am: 9-8-26 17:08:24 ===


implementation

end.
