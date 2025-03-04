unit parserInternals;

interface

uses
  ctypes, xml2_common, xmlstring, tree, encoding, HTMLparser, chvalid, entities;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

var
  xmlParserMaxDepth: dword; cvar;external libxml2;

const
  XML_MAX_TEXT_LENGTH = 10000000;
  XML_MAX_NAME_LENGTH = 50000;
  XML_MAX_DICTIONARY_LIMIT = 10000000;
  XML_MAX_LOOKUP_LIMIT = 10000000;
  XML_MAX_NAMELEN = 100;
  INPUT_CHUNK = 250;

var
  xmlStringText: PxmlChar; cvar;external libxml2;
  xmlStringTextNoenc: PxmlChar; cvar;external libxml2;
  xmlStringComment: PxmlChar; cvar;external libxml2;

function xmlIsLetter(c: longint): longint; cdecl; external libxml2;
function xmlCreateFileParserCtxt(filename: pchar): PxmlParserCtxt; cdecl; external libxml2;
function xmlCreateURLParserCtxt(filename: pchar; options: longint): PxmlParserCtxt; cdecl; external libxml2;
function xmlCreateMemoryParserCtxt(buffer: pchar; size: longint): PxmlParserCtxt; cdecl; external libxml2;
function xmlCreateEntityParserCtxt(URL: PxmlChar; ID: PxmlChar; base: PxmlChar): PxmlParserCtxt; cdecl; external libxml2;
function xmlSwitchEncoding(ctxt: PxmlParserCtxt; enc: TxmlCharEncoding): longint; cdecl; external libxml2;
function xmlSwitchToEncoding(ctxt: PxmlParserCtxt; handler: PxmlCharEncodingHandler): longint; cdecl; external libxml2;
function xmlSwitchInputEncoding(ctxt: PxmlParserCtxt; input: PxmlParserInput; handler: PxmlCharEncodingHandler): longint; cdecl; external libxml2;

function xmlNewStringInputStream(ctxt: PxmlParserCtxt; buffer: PxmlChar): PxmlParserInput; cdecl; external libxml2;
function xmlNewEntityInputStream(ctxt: PxmlParserCtxt; entity: PxmlEntity): PxmlParserInput; cdecl; external libxml2;
function xmlPushInput(ctxt: PxmlParserCtxt; input: PxmlParserInput): longint; cdecl; external libxml2;
function xmlPopInput(ctxt: PxmlParserCtxt): TxmlChar; cdecl; external libxml2;
procedure xmlFreeInputStream(input: PxmlParserInput); cdecl; external libxml2;
function xmlNewInputFromFile(ctxt: PxmlParserCtxt; filename: pchar): PxmlParserInput; cdecl; external libxml2;
function xmlNewInputStream(ctxt: PxmlParserCtxt): PxmlParserInput; cdecl; external libxml2;
function xmlSplitQName(ctxt: PxmlParserCtxt; Name: PxmlChar; prefix: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlParseName(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlParseNmtoken(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlParseEntityValue(ctxt: PxmlParserCtxt; orig: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlParseAttValue(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlParseSystemLiteral(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlParsePubidLiteral(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
procedure xmlParseCharData(ctxt: PxmlParserCtxt; cdata: longint); cdecl; external libxml2;
function xmlParseExternalID(ctxt: PxmlParserCtxt; publicID: PPxmlChar; strict: longint): PxmlChar; cdecl; external libxml2;
procedure xmlParseComment(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlParsePITarget(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
procedure xmlParsePI(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParseNotationDecl(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParseEntityDecl(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlParseDefaultDecl(ctxt: PxmlParserCtxt; Value: PPxmlChar): longint; cdecl; external libxml2;
function xmlParseNotationType(ctxt: PxmlParserCtxt): PxmlEnumeration; cdecl; external libxml2;
function xmlParseEnumerationType(ctxt: PxmlParserCtxt): PxmlEnumeration; cdecl; external libxml2;
function xmlParseEnumeratedType(ctxt: PxmlParserCtxt; tree: PPxmlEnumeration): longint; cdecl; external libxml2;
function xmlParseAttributeType(ctxt: PxmlParserCtxt; tree: PPxmlEnumeration): longint; cdecl; external libxml2;
procedure xmlParseAttributeListDecl(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlParseElementMixedContentDecl(ctxt: PxmlParserCtxt; inputchk: longint): PxmlElementContent; cdecl; external libxml2;
function xmlParseElementChildrenContentDecl(ctxt: PxmlParserCtxt; inputchk: longint): PxmlElementContent; cdecl; external libxml2;
function xmlParseElementContentDecl(ctxt: PxmlParserCtxt; Name: PxmlChar; Result: PPxmlElementContent): longint; cdecl; external libxml2;
function xmlParseElementDecl(ctxt: PxmlParserCtxt): longint; cdecl; external libxml2;
procedure xmlParseMarkupDecl(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlParseCharRef(ctxt: PxmlParserCtxt): longint; cdecl; external libxml2;
function xmlParseEntityRef(ctxt: PxmlParserCtxt): PxmlEntity; cdecl; external libxml2;
procedure xmlParseReference(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParsePEReference(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParseDocTypeDecl(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlParseAttribute(ctxt: PxmlParserCtxt; Value: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlParseStartTag(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
procedure xmlParseEndTag(ctxt: PxmlParserCtxt); cdecl; external libxml2;

procedure xmlParseCDSect(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParseContent(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParseElement(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlParseVersionNum(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlParseVersionInfo(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlParseEncName(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlParseEncodingDecl(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlParseSDDecl(ctxt: PxmlParserCtxt): longint; cdecl; external libxml2;
procedure xmlParseXMLDecl(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParseTextDecl(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParseMisc(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParseExternalSubset(ctxt: PxmlParserCtxt; ExternalID: PxmlChar; SystemID: PxmlChar); cdecl; external libxml2;

const
  XML_SUBSTITUTE_NONE = 0;
  XML_SUBSTITUTE_REF = 1;
  XML_SUBSTITUTE_PEREF = 2;
  XML_SUBSTITUTE_BOTH = 3;

function xmlStringDecodeEntities(ctxt: PxmlParserCtxt; str: PxmlChar; what: longint; end_: TxmlChar; end2: TxmlChar;
  end3: TxmlChar): PxmlChar; cdecl; external libxml2;
function xmlStringLenDecodeEntities(ctxt: PxmlParserCtxt; str: PxmlChar; len: longint; what: longint; end_: TxmlChar;
  end2: TxmlChar; end3: TxmlChar): PxmlChar; cdecl; external libxml2;
function nodePush(ctxt: PxmlParserCtxt; Value: PxmlNode): longint; cdecl; external libxml2;
function nodePop(ctxt: PxmlParserCtxt): PxmlNode; cdecl; external libxml2;
function inputPush(ctxt: PxmlParserCtxt; Value: PxmlParserInput): longint; cdecl; external libxml2;
function inputPop(ctxt: PxmlParserCtxt): PxmlParserInput; cdecl; external libxml2;
function namePop(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function namePush(ctxt: PxmlParserCtxt; Value: PxmlChar): longint; cdecl; external libxml2;
function xmlSkipBlankChars(ctxt: PxmlParserCtxt): longint; cdecl; external libxml2;
function xmlStringCurrentChar(ctxt: PxmlParserCtxt; cur: PxmlChar; len: Plongint): longint; cdecl; external libxml2;
procedure xmlParserHandlePEReference(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlCheckLanguageID(lang: PxmlChar): longint; cdecl; external libxml2;
function xmlCurrentChar(ctxt: PxmlParserCtxt; len: Plongint): longint; cdecl; external libxml2;
function xmlCopyCharMultiByte(out_: PxmlChar; val: longint): longint; cdecl; external libxml2;
function xmlCopyChar(len: longint; out_: PxmlChar; val: longint): longint; cdecl; external libxml2;
procedure xmlNextChar(ctxt: PxmlParserCtxt); cdecl; external libxml2;
procedure xmlParserInputShrink(in_: PxmlParserInput); cdecl; external libxml2;
procedure htmlInitAutoClose; cdecl; external libxml2;
function htmlCreateFileParserCtxt(filename: pchar; encoding: pchar): PhtmlParserCtxt; cdecl; external libxml2;

type
  TxmlEntityReferenceFunc = procedure(ent: PxmlEntity; firstNode: PxmlNode; lastNode: PxmlNode); cdecl;

procedure xmlSetEntityReferenceFunc(func: TxmlEntityReferenceFunc); cdecl; external libxml2;
function xmlParseQuotedString(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
procedure xmlParseNamespace(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlNamespaceParseNSDef(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlScanName(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
function xmlNamespaceParseNCName(ctxt: PxmlParserCtxt): PxmlChar; cdecl; external libxml2;
procedure xmlParserHandleReference(ctxt: PxmlParserCtxt); cdecl; external libxml2;
function xmlNamespaceParseQName(ctxt: PxmlParserCtxt; prefix: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlDecodeEntities(ctxt: PxmlParserCtxt; len: longint; what: longint; end_: TxmlChar; end2: TxmlChar;
  end3: TxmlChar): PxmlChar; cdecl; external libxml2;
procedure xmlHandleEntity(ctxt: PxmlParserCtxt; entity: PxmlEntity); cdecl; external libxml2;
procedure xmlErrMemory(ctxt: PxmlParserCtxt; extra: pchar); cdecl; external libxml2;

function IS_BYTE_CHAR(c: LongInt): boolean;
function IS_CHAR(c: LongInt): boolean;
function IS_CHAR_CH(c: LongInt): boolean;
function IS_BLANK(c: LongInt): boolean;
function IS_BLANK_CH(c: LongInt): boolean;
function IS_BASECHAR(c: LongInt): boolean;
function IS_DIGIT(c: LongInt): boolean;
function IS_DIGIT_CH(c: LongInt): boolean;
function IS_COMBINING(c: LongInt): boolean;
function IS_COMBINING_CH(c: LongInt): boolean;
function IS_EXTENDER(c: LongInt): boolean;
function IS_EXTENDER_CH(c: LongInt): boolean;
function IS_IDEOGRAPHIC(c: LongInt): boolean;
function IS_LETTER(c: LongInt): boolean;
function IS_LETTER_CH(c: LongInt): boolean;
function IS_ASCII_LETTER(c: LongInt): boolean;
function IS_ASCII_DIGIT(c: LongInt): boolean;
function IS_PUBIDCHAR(c: LongInt): boolean;
function IS_PUBIDCHAR_CH(c: LongInt): boolean;


// === Konventiert am: 2-3-25 19:06:28 ===

implementation


function IS_BYTE_CHAR(c: LongInt): boolean;
begin
  IS_BYTE_CHAR := xmlIsChar_ch(c);
end;

function IS_CHAR(c: LongInt): boolean;
begin
  IS_CHAR := xmlIsCharQ(c);
end;

function IS_CHAR_CH(c: LongInt): boolean;
begin
  IS_CHAR_CH := xmlIsChar_ch(c);
end;

function IS_BLANK(c: LongInt): boolean;
begin
  IS_BLANK := xmlIsBlankQ(c);
end;

function IS_BLANK_CH(c: LongInt): boolean;
begin
  IS_BLANK_CH := xmlIsBlank_ch(c);
end;

function IS_BASECHAR(c: LongInt): boolean;
begin
  IS_BASECHAR := xmlIsBaseCharQ(c);
end;

function IS_DIGIT(c: LongInt): boolean;
begin
  IS_DIGIT := xmlIsDigitQ(c);
end;

function IS_DIGIT_CH(c: LongInt): boolean;
begin
  IS_DIGIT_CH := xmlIsDigit_ch(c);
end;

function IS_COMBINING(c: LongInt): boolean;
begin
  IS_COMBINING := xmlIsCombiningQ(c);
end;

function IS_COMBINING_CH(c: LongInt): boolean;
begin
  IS_COMBINING_CH := False;
end;

function IS_EXTENDER(c: LongInt): boolean;
begin
  IS_EXTENDER := xmlIsExtenderQ(c);
end;

function IS_EXTENDER_CH(c: LongInt): boolean;
begin
  IS_EXTENDER_CH := xmlIsExtender_ch(c);
end;

function IS_IDEOGRAPHIC(c: LongInt): boolean;
begin
  IS_IDEOGRAPHIC := xmlIsIdeographicQ(c);
end;

function IS_LETTER(c: LongInt): boolean;
begin
  IS_LETTER := (IS_BASECHAR(c)) or (IS_IDEOGRAPHIC(c));
end;

function IS_LETTER_CH(c: LongInt): boolean;
begin
  IS_LETTER_CH := xmlIsBaseChar_ch(c);
end;

function IS_ASCII_LETTER(c: LongInt): boolean;
begin
  IS_ASCII_LETTER := (($41 <= c) and (c <= $5a)) or (($61 <= c) and (c <= $7a));
end;

function IS_ASCII_DIGIT(c: LongInt): boolean;
begin
  IS_ASCII_DIGIT := ($30 <= c) and (c <= $39);
end;

function IS_PUBIDCHAR(c: LongInt): boolean;
begin
  IS_PUBIDCHAR := xmlIsPubidCharQ(c);
end;

function IS_PUBIDCHAR_CH(c: LongInt): boolean;
begin
  IS_PUBIDCHAR_CH := xmlIsPubidChar_ch(c);
end;


end.
