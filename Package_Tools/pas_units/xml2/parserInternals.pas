unit parserInternals;

interface

uses
  ctypes, xml2_common, xmlstring, tree, encoding, HTMLparser;

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

  //function IS_BYTE_CHAR(klass : longint) : longint;
  //function IS_CHAR(klass : longint) : longint;
  //function IS_CHAR_CH(klass : longint) : longint;
  //function IS_BLANK(klass : longint) : longint;
  //function IS_BLANK_CH(klass : longint) : longint;
  //function IS_BASECHAR(klass : longint) : longint;
  //function IS_DIGIT(klass : longint) : longint;
  //function IS_DIGIT_CH(klass : longint) : longint;
  //function IS_COMBINING(klass : longint) : longint;
  //function IS_COMBINING_CH(klass : longint) : longint;
  //function IS_EXTENDER(klass : longint) : longint;
  //function IS_EXTENDER_CH(klass : longint) : longint;
  //function IS_IDEOGRAPHIC(klass : longint) : longint;
  //function IS_LETTER(klass : longint) : longint;
  //function IS_LETTER_CH(klass : longint) : longint;
  //function IS_ASCII_LETTER(klass : longint) : longint;
  //function IS_ASCII_DIGIT(klass : longint) : longint;
  //function IS_PUBIDCHAR(klass : longint) : longint;
  //function IS_PUBIDCHAR_CH(klass : longint) : longint;
var
  xmlStringText: PxmlChar; cvar;external libxml2;
  xmlStringTextNoenc: PxmlChar; cvar;external libxml2;
  xmlStringComment: PxmlChar; cvar;external libxml2;

function xmlIsLetter(c: longint): longint; cdecl; external libxml2;
function xmlCreateFileParserCtxt(filename: pchar): TxmlParserCtxtPtr; cdecl; external libxml2;
function xmlCreateURLParserCtxt(filename: pchar; options: longint): TxmlParserCtxtPtr; cdecl; external libxml2;
function xmlCreateMemoryParserCtxt(buffer: pchar; size: longint): TxmlParserCtxtPtr; cdecl; external libxml2;
function xmlCreateEntityParserCtxt(URL: PxmlChar; ID: PxmlChar; base: PxmlChar): TxmlParserCtxtPtr; cdecl; external libxml2;
function xmlSwitchEncoding(ctxt: TxmlParserCtxtPtr; enc: TxmlCharEncoding): longint; cdecl; external libxml2;
function xmlSwitchToEncoding(ctxt: TxmlParserCtxtPtr; handler: TxmlCharEncodingHandlerPtr): longint; cdecl; external libxml2;
function xmlSwitchInputEncoding(ctxt: TxmlParserCtxtPtr; input: TxmlParserInputPtr; handler: TxmlCharEncodingHandlerPtr): longint; cdecl; external libxml2;

function xmlNewStringInputStream(ctxt: TxmlParserCtxtPtr; buffer: PxmlChar): TxmlParserInputPtr; cdecl; external libxml2;
function xmlNewEntityInputStream(ctxt: TxmlParserCtxtPtr; entity: TxmlEntityPtr): TxmlParserInputPtr; cdecl; external libxml2;
function xmlPushInput(ctxt: TxmlParserCtxtPtr; input: TxmlParserInputPtr): longint; cdecl; external libxml2;
function xmlPopInput(ctxt: TxmlParserCtxtPtr): TxmlChar; cdecl; external libxml2;
procedure xmlFreeInputStream(input: TxmlParserInputPtr); cdecl; external libxml2;
function xmlNewInputFromFile(ctxt: TxmlParserCtxtPtr; filename: pchar): TxmlParserInputPtr; cdecl; external libxml2;
function xmlNewInputStream(ctxt: TxmlParserCtxtPtr): TxmlParserInputPtr; cdecl; external libxml2;
function xmlSplitQName(ctxt: TxmlParserCtxtPtr; Name: PxmlChar; prefix: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlParseName(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlParseNmtoken(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlParseEntityValue(ctxt: TxmlParserCtxtPtr; orig: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlParseAttValue(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlParseSystemLiteral(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlParsePubidLiteral(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
procedure xmlParseCharData(ctxt: TxmlParserCtxtPtr; cdata: longint); cdecl; external libxml2;
function xmlParseExternalID(ctxt: TxmlParserCtxtPtr; publicID: PPxmlChar; strict: longint): PxmlChar; cdecl; external libxml2;
procedure xmlParseComment(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
function xmlParsePITarget(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
procedure xmlParsePI(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParseNotationDecl(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParseEntityDecl(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
function xmlParseDefaultDecl(ctxt: TxmlParserCtxtPtr; Value: PPxmlChar): longint; cdecl; external libxml2;
function xmlParseNotationType(ctxt: TxmlParserCtxtPtr): TxmlEnumerationPtr; cdecl; external libxml2;
function xmlParseEnumerationType(ctxt: TxmlParserCtxtPtr): TxmlEnumerationPtr; cdecl; external libxml2;
function xmlParseEnumeratedType(ctxt: TxmlParserCtxtPtr; tree: PxmlEnumerationPtr): longint; cdecl; external libxml2;
function xmlParseAttributeType(ctxt: TxmlParserCtxtPtr; tree: PxmlEnumerationPtr): longint; cdecl; external libxml2;
procedure xmlParseAttributeListDecl(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
function xmlParseElementMixedContentDecl(ctxt: TxmlParserCtxtPtr; inputchk: longint): TxmlElementContentPtr; cdecl; external libxml2;
function xmlParseElementChildrenContentDecl(ctxt: TxmlParserCtxtPtr; inputchk: longint): TxmlElementContentPtr; cdecl; external libxml2;
function xmlParseElementContentDecl(ctxt: TxmlParserCtxtPtr; Name: PxmlChar; Result: PxmlElementContentPtr): longint; cdecl; external libxml2;
function xmlParseElementDecl(ctxt: TxmlParserCtxtPtr): longint; cdecl; external libxml2;
procedure xmlParseMarkupDecl(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
function xmlParseCharRef(ctxt: TxmlParserCtxtPtr): longint; cdecl; external libxml2;
function xmlParseEntityRef(ctxt: TxmlParserCtxtPtr): TxmlEntityPtr; cdecl; external libxml2;
procedure xmlParseReference(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParsePEReference(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParseDocTypeDecl(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
function xmlParseAttribute(ctxt: TxmlParserCtxtPtr; Value: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlParseStartTag(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
procedure xmlParseEndTag(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;

procedure xmlParseCDSect(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParseContent(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParseElement(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
function xmlParseVersionNum(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlParseVersionInfo(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlParseEncName(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlParseEncodingDecl(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlParseSDDecl(ctxt: TxmlParserCtxtPtr): longint; cdecl; external libxml2;
procedure xmlParseXMLDecl(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParseTextDecl(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParseMisc(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParseExternalSubset(ctxt: TxmlParserCtxtPtr; ExternalID: PxmlChar; SystemID: PxmlChar); cdecl; external libxml2;

const
  XML_SUBSTITUTE_NONE = 0;
  XML_SUBSTITUTE_REF = 1;
  XML_SUBSTITUTE_PEREF = 2;
  XML_SUBSTITUTE_BOTH = 3;

function xmlStringDecodeEntities(ctxt: TxmlParserCtxtPtr; str: PxmlChar; what: longint; end_: TxmlChar; end2: TxmlChar;
  end3: TxmlChar): PxmlChar; cdecl; external libxml2;
function xmlStringLenDecodeEntities(ctxt: TxmlParserCtxtPtr; str: PxmlChar; len: longint; what: longint; end_: TxmlChar;
  end2: TxmlChar; end3: TxmlChar): PxmlChar; cdecl; external libxml2;
function nodePush(ctxt: TxmlParserCtxtPtr; Value: TxmlNodePtr): longint; cdecl; external libxml2;
function nodePop(ctxt: TxmlParserCtxtPtr): TxmlNodePtr; cdecl; external libxml2;
function inputPush(ctxt: TxmlParserCtxtPtr; Value: TxmlParserInputPtr): longint; cdecl; external libxml2;
function inputPop(ctxt: TxmlParserCtxtPtr): TxmlParserInputPtr; cdecl; external libxml2;
function namePop(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function namePush(ctxt: TxmlParserCtxtPtr; Value: PxmlChar): longint; cdecl; external libxml2;
function xmlSkipBlankChars(ctxt: TxmlParserCtxtPtr): longint; cdecl; external libxml2;
function xmlStringCurrentChar(ctxt: TxmlParserCtxtPtr; cur: PxmlChar; len: Plongint): longint; cdecl; external libxml2;
procedure xmlParserHandlePEReference(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
function xmlCheckLanguageID(lang: PxmlChar): longint; cdecl; external libxml2;
function xmlCurrentChar(ctxt: TxmlParserCtxtPtr; len: Plongint): longint; cdecl; external libxml2;
function xmlCopyCharMultiByte(out_: PxmlChar; val: longint): longint; cdecl; external libxml2;
function xmlCopyChar(len: longint; out_: PxmlChar; val: longint): longint; cdecl; external libxml2;
procedure xmlNextChar(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
procedure xmlParserInputShrink(in_: TxmlParserInputPtr); cdecl; external libxml2;
procedure htmlInitAutoClose; cdecl; external libxml2;
function htmlCreateFileParserCtxt(filename: pchar; encoding: pchar): ThtmlParserCtxtPtr; cdecl; external libxml2;

type
  TxmlEntityReferenceFunc = procedure(ent: TxmlEntityPtr; firstNode: TxmlNodePtr; lastNode: TxmlNodePtr); cdecl;

procedure xmlSetEntityReferenceFunc(func: TxmlEntityReferenceFunc); cdecl; external libxml2;
function xmlParseQuotedString(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
procedure xmlParseNamespace(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
function xmlNamespaceParseNSDef(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlScanName(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
function xmlNamespaceParseNCName(ctxt: TxmlParserCtxtPtr): PxmlChar; cdecl; external libxml2;
procedure xmlParserHandleReference(ctxt: TxmlParserCtxtPtr); cdecl; external libxml2;
function xmlNamespaceParseQName(ctxt: TxmlParserCtxtPtr; prefix: PPxmlChar): PxmlChar; cdecl; external libxml2;
function xmlDecodeEntities(ctxt: TxmlParserCtxtPtr; len: longint; what: longint; end_: TxmlChar; end2: TxmlChar;
  end3: TxmlChar): PxmlChar; cdecl; external libxml2;
procedure xmlHandleEntity(ctxt: TxmlParserCtxtPtr; entity: TxmlEntityPtr); cdecl; external libxml2;
procedure xmlErrMemory(ctxt: TxmlParserCtxtPtr; extra: pchar); cdecl; external libxml2;

// === Konventiert am: 2-3-25 19:06:28 ===

implementation


//function IS_BYTE_CHAR(klass: longint): longint;
//begin
//  IS_BYTE_CHAR := xmlIsChar_ch(c);
//end;
//
//function IS_CHAR(klass: longint): longint;
//begin
//  IS_CHAR := xmlIsCharQ(c);
//end;
//
//function IS_CHAR_CH(klass: longint): longint;
//begin
//  IS_CHAR_CH := xmlIsChar_ch(c);
//end;
//
//function IS_BLANK(klass: longint): longint;
//begin
//  IS_BLANK := xmlIsBlankQ(c);
//end;
//
//function IS_BLANK_CH(klass: longint): longint;
//begin
//  IS_BLANK_CH := xmlIsBlank_ch(c);
//end;
//
//function IS_BASECHAR(klass: longint): longint;
//begin
//  IS_BASECHAR := xmlIsBaseCharQ(c);
//end;
//
//function IS_DIGIT(klass: longint): longint;
//begin
//  IS_DIGIT := xmlIsDigitQ(c);
//end;
//
//function IS_DIGIT_CH(klass: longint): longint;
//begin
//  IS_DIGIT_CH := xmlIsDigit_ch(c);
//end;
//
//function IS_COMBINING(klass: longint): longint;
//begin
//  IS_COMBINING := xmlIsCombiningQ(c);
//end;
//
//function IS_COMBINING_CH(klass: longint): longint;
//begin
//  IS_COMBINING_CH := 0;
//end;
//
//function IS_EXTENDER(klass: longint): longint;
//begin
//  IS_EXTENDER := xmlIsExtenderQ(c);
//end;
//
//function IS_EXTENDER_CH(klass: longint): longint;
//begin
//  IS_EXTENDER_CH := xmlIsExtender_ch(c);
//end;
//
//function IS_IDEOGRAPHIC(klass: longint): longint;
//begin
//  IS_IDEOGRAPHIC := xmlIsIdeographicQ(c);
//end;
//
//function IS_LETTER(klass: longint): longint;
//begin
//  IS_LETTER := (IS_BASECHAR(c)) or (IS_IDEOGRAPHIC(c));
//end;
//
//function IS_LETTER_CH(klass: longint): longint;
//begin
//  IS_LETTER_CH := xmlIsBaseChar_ch(c);
//end;
//
//function IS_ASCII_LETTER(klass: longint): longint;
//begin
//  IS_ASCII_LETTER := (($41 <= c) and (@(c <= $5a))) or (($61 <= c) and (@(c <= $7a)));
//end;
//
//function IS_ASCII_DIGIT(klass: longint): longint;
//begin
//  IS_ASCII_DIGIT := ($30 <= c) and (@(c <= $39));
//end;
//
//function IS_PUBIDCHAR(klass: longint): longint;
//begin
//  IS_PUBIDCHAR := xmlIsPubidCharQ(c);
//end;
//
//function IS_PUBIDCHAR_CH(klass: longint): longint;
//begin
//  IS_PUBIDCHAR_CH := xmlIsPubidChar_ch(c);
//end;


end.
