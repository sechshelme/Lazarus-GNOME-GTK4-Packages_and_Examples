unit xmlwriter;

interface

uses
  ctypes, xml2_common, xmlstring, tree;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TxmlTextWriter = record
  end;
  PxmlTextWriter = ^TxmlTextWriter;

  PxmlTextWriterPtr = ^TxmlTextWriterPtr;
  TxmlTextWriterPtr = PxmlTextWriter;

function xmlNewTextWriter(out_: TxmlOutputBufferPtr): TxmlTextWriterPtr; cdecl; external libxml2;
function xmlNewTextWriterFilename(uri: pchar; compression: longint): TxmlTextWriterPtr; cdecl; external libxml2;
function xmlNewTextWriterMemory(buf: TxmlBufferPtr; compression: longint): TxmlTextWriterPtr; cdecl; external libxml2;
function xmlNewTextWriterPushParser(ctxt: TxmlParserCtxtPtr; compression: longint): TxmlTextWriterPtr; cdecl; external libxml2;
function xmlNewTextWriterDoc(doc: PxmlDocPtr; compression: longint): TxmlTextWriterPtr; cdecl; external libxml2;
function xmlNewTextWriterTree(doc: TxmlDocPtr; node: TxmlNodePtr; compression: longint): TxmlTextWriterPtr; cdecl; external libxml2;
procedure xmlFreeTextWriter(writer: TxmlTextWriterPtr); cdecl; external libxml2;
function xmlTextWriterStartDocument(writer: TxmlTextWriterPtr; version: pchar; encoding: pchar; standalone: pchar): longint; cdecl; external libxml2;
function xmlTextWriterEndDocument(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterStartComment(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterEndComment(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatComment(writer: TxmlTextWriterPtr; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatComment(writer: TxmlTextWriterPtr; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatComment(writer: TxmlTextWriterPtr; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteComment(writer: TxmlTextWriterPtr; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartElement(writer: TxmlTextWriterPtr; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartElementNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndElement(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterFullEndElement(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatElement(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatElement(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatElement(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteElement(writer: TxmlTextWriterPtr; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatElementNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar;
  args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatElementNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatElementNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar;
  argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteElementNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatRaw(writer: TxmlTextWriterPtr; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatRaw(writer: TxmlTextWriterPtr; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatRaw(writer: TxmlTextWriterPtr; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteRawLen(writer: TxmlTextWriterPtr; content: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlTextWriterWriteRaw(writer: TxmlTextWriterPtr; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatString(writer: TxmlTextWriterPtr; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatString(writer: TxmlTextWriterPtr; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatString(writer: TxmlTextWriterPtr; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteString(writer: TxmlTextWriterPtr; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteBase64(writer: TxmlTextWriterPtr; Data: pchar; start: longint; len: longint): longint; cdecl; external libxml2;
function xmlTextWriterWriteBinHex(writer: TxmlTextWriterPtr; Data: pchar; start: longint; len: longint): longint; cdecl; external libxml2;
function xmlTextWriterStartAttribute(writer: TxmlTextWriterPtr; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartAttributeNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndAttribute(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatAttribute(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatAttribute(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatAttribute(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteAttribute(writer: TxmlTextWriterPtr; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatAttributeNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar;
  args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatAttributeNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatAttributeNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar;
  argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteAttributeNS(writer: TxmlTextWriterPtr; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartPI(writer: TxmlTextWriterPtr; target: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndPI(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatPI(writer: TxmlTextWriterPtr; target: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatPI(writer: TxmlTextWriterPtr; target: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatPI(writer: TxmlTextWriterPtr; target: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWritePI(writer: TxmlTextWriterPtr; target: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
//const
//  xmlTextWriterWriteProcessingInstruction = xmlTextWriterWritePI;  
function xmlTextWriterWriteProcessingInstruction(writer: TxmlTextWriterPtr; target: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2 name 'xmlTextWriterWritePI';

function xmlTextWriterStartCDATA(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterEndCDATA(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatCDATA(writer: TxmlTextWriterPtr; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatCDATA(writer: TxmlTextWriterPtr; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatCDATA(writer: TxmlTextWriterPtr; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteCDATA(writer: TxmlTextWriterPtr; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartDTD(writer: TxmlTextWriterPtr; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndDTD(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTD(writer: TxmlTextWriterPtr; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; format: pchar;
  args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTD(writer: TxmlTextWriterPtr; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatDTD(writer: TxmlTextWriterPtr; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; format: pchar;
  argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTD(writer: TxmlTextWriterPtr; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; subset: PxmlChar): longint; cdecl; external libxml2;
//const
//  xmlTextWriterWriteDocType = xmlTextWriterWriteDTD;  
function xmlTextWriterWriteDocType(writer: TxmlTextWriterPtr; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; subset: PxmlChar): longint; cdecl;external libxml2 name 'xmlTextWriterWriteDTD';

function xmlTextWriterStartDTDElement(writer: TxmlTextWriterPtr; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndDTDElement(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDElement(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDElement(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatDTDElement(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDElement(writer: TxmlTextWriterPtr; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartDTDAttlist(writer: TxmlTextWriterPtr; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndDTDAttlist(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDAttlist(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDAttlist(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatDTDAttlist(writer: TxmlTextWriterPtr; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDAttlist(writer: TxmlTextWriterPtr; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartDTDEntity(writer: TxmlTextWriterPtr; pe: longint; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndDTDEntity(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDInternalEntity(writer: TxmlTextWriterPtr; pe: longint; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDInternalEntity(writer: TxmlTextWriterPtr; pe: longint; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatDTDInternalEntity(writer: TxmlTextWriterPtr; pe: longint; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDInternalEntity(writer: TxmlTextWriterPtr; pe: longint; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDExternalEntity(writer: TxmlTextWriterPtr; pe: longint; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar;
  ndataid: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDExternalEntityContents(writer: TxmlTextWriterPtr; pubid: PxmlChar; sysid: PxmlChar; ndataid: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDEntity(writer: TxmlTextWriterPtr; pe: longint; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar;
  ndataid: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDNotation(writer: TxmlTextWriterPtr; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterSetIndent(writer: TxmlTextWriterPtr; indent: longint): longint; cdecl; external libxml2;
function xmlTextWriterSetIndentString(writer: TxmlTextWriterPtr; str: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterSetQuoteChar(writer: TxmlTextWriterPtr; quotechar: TxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterFlush(writer: TxmlTextWriterPtr): longint; cdecl; external libxml2;

// === Konventiert am: 2-3-25 17:35:25 ===


implementation



end.
