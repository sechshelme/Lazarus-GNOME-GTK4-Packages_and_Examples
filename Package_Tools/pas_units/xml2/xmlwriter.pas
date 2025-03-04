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

function xmlNewTextWriter(out_: TxmlOutputBufferPtr): PxmlTextWriter; cdecl; external libxml2;
function xmlNewTextWriterFilename(uri: pchar; compression: longint): PxmlTextWriter; cdecl; external libxml2;
function xmlNewTextWriterMemory(buf: TxmlBufferPtr; compression: longint): PxmlTextWriter; cdecl; external libxml2;
function xmlNewTextWriterPushParser(ctxt: TxmlParserCtxtPtr; compression: longint): PxmlTextWriter; cdecl; external libxml2;
function xmlNewTextWriterDoc(doc: PxmlDocPtr; compression: longint): PxmlTextWriter; cdecl; external libxml2;
function xmlNewTextWriterTree(doc: TxmlDocPtr; node: TxmlNodePtr; compression: longint): PxmlTextWriter; cdecl; external libxml2;
procedure xmlFreeTextWriter(writer: PxmlTextWriter); cdecl; external libxml2;
function xmlTextWriterStartDocument(writer: PxmlTextWriter; version: pchar; encoding: pchar; standalone: pchar): longint; cdecl; external libxml2;
function xmlTextWriterEndDocument(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterStartComment(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterEndComment(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatComment(writer: PxmlTextWriter; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatComment(writer: PxmlTextWriter; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatComment(writer: PxmlTextWriter; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteComment(writer: PxmlTextWriter; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartElement(writer: PxmlTextWriter; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartElementNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndElement(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterFullEndElement(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatElement(writer: PxmlTextWriter; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatElement(writer: PxmlTextWriter; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatElement(writer: PxmlTextWriter; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteElement(writer: PxmlTextWriter; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatElementNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar;
  args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatElementNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatElementNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar;
  argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteElementNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatRaw(writer: PxmlTextWriter; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatRaw(writer: PxmlTextWriter; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatRaw(writer: PxmlTextWriter; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteRawLen(writer: PxmlTextWriter; content: PxmlChar; len: longint): longint; cdecl; external libxml2;
function xmlTextWriterWriteRaw(writer: PxmlTextWriter; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatString(writer: PxmlTextWriter; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatString(writer: PxmlTextWriter; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatString(writer: PxmlTextWriter; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteString(writer: PxmlTextWriter; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteBase64(writer: PxmlTextWriter; Data: pchar; start: longint; len: longint): longint; cdecl; external libxml2;
function xmlTextWriterWriteBinHex(writer: PxmlTextWriter; Data: pchar; start: longint; len: longint): longint; cdecl; external libxml2;
function xmlTextWriterStartAttribute(writer: PxmlTextWriter; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartAttributeNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndAttribute(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatAttribute(writer: PxmlTextWriter; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatAttribute(writer: PxmlTextWriter; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatAttribute(writer: PxmlTextWriter; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteAttribute(writer: PxmlTextWriter; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatAttributeNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar;
  args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatAttributeNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatAttributeNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; format: pchar;
  argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteAttributeNS(writer: PxmlTextWriter; prefix: PxmlChar; Name: PxmlChar; namespaceURI: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartPI(writer: PxmlTextWriter; target: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndPI(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatPI(writer: PxmlTextWriter; target: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatPI(writer: PxmlTextWriter; target: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatPI(writer: PxmlTextWriter; target: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWritePI(writer: PxmlTextWriter; target: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteProcessingInstruction(writer: PxmlTextWriter; target: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2 name 'xmlTextWriterWritePI';

function xmlTextWriterStartCDATA(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterEndCDATA(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatCDATA(writer: PxmlTextWriter; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatCDATA(writer: PxmlTextWriter; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatCDATA(writer: PxmlTextWriter; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteCDATA(writer: PxmlTextWriter; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartDTD(writer: PxmlTextWriter; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndDTD(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTD(writer: PxmlTextWriter; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; format: pchar;
  args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTD(writer: PxmlTextWriter; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatDTD(writer: PxmlTextWriter; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; format: pchar;
  argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTD(writer: PxmlTextWriter; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; subset: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteDocType(writer: PxmlTextWriter; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar; subset: PxmlChar): longint; cdecl;external libxml2 name 'xmlTextWriterWriteDTD';

function xmlTextWriterStartDTDElement(writer: PxmlTextWriter; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndDTDElement(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDElement(writer: PxmlTextWriter; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDElement(writer: PxmlTextWriter; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatDTDElement(writer: PxmlTextWriter; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDElement(writer: PxmlTextWriter; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartDTDAttlist(writer: PxmlTextWriter; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndDTDAttlist(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDAttlist(writer: PxmlTextWriter; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDAttlist(writer: PxmlTextWriter; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatDTDAttlist(writer: PxmlTextWriter; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDAttlist(writer: PxmlTextWriter; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterStartDTDEntity(writer: PxmlTextWriter; pe: longint; Name: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterEndDTDEntity(writer: PxmlTextWriter): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDInternalEntity(writer: PxmlTextWriter; pe: longint; Name: PxmlChar; format: pchar; args: array of const): longint; cdecl; external libxml2;
function xmlTextWriterWriteFormatDTDInternalEntity(writer: PxmlTextWriter; pe: longint; Name: PxmlChar; format: pchar): longint; cdecl; external libxml2;
function xmlTextWriterWriteVFormatDTDInternalEntity(writer: PxmlTextWriter; pe: longint; Name: PxmlChar; format: pchar; argptr: Tva_list): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDInternalEntity(writer: PxmlTextWriter; pe: longint; Name: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDExternalEntity(writer: PxmlTextWriter; pe: longint; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar;
  ndataid: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDExternalEntityContents(writer: PxmlTextWriter; pubid: PxmlChar; sysid: PxmlChar; ndataid: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDEntity(writer: PxmlTextWriter; pe: longint; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar;
  ndataid: PxmlChar; content: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterWriteDTDNotation(writer: PxmlTextWriter; Name: PxmlChar; pubid: PxmlChar; sysid: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterSetIndent(writer: PxmlTextWriter; indent: longint): longint; cdecl; external libxml2;
function xmlTextWriterSetIndentString(writer: PxmlTextWriter; str: PxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterSetQuoteChar(writer: PxmlTextWriter; quotechar: TxmlChar): longint; cdecl; external libxml2;
function xmlTextWriterFlush(writer: PxmlTextWriter): longint; cdecl; external libxml2;

// === Konventiert am: 2-3-25 17:35:25 ===


implementation



end.
