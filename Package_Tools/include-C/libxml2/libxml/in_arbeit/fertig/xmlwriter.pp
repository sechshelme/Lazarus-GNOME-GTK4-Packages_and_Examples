
unit xmlwriter;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlwriter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlwriter.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
PxmlChar  = ^xmlChar;
PxmlDocPtr  = ^xmlDocPtr;
PxmlTextWriter  = ^xmlTextWriter;
PxmlTextWriterPtr  = ^xmlTextWriterPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: text writing API for XML
 * Description: text writing API for XML
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Alfred Mickautsch <alfred@mickautsch.de>
  }
{$ifndef __XML_XMLWRITER_H__}
{$define __XML_XMLWRITER_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_WRITER_ENABLED}
{$include <stdarg.h>}
{$include <libxml/xmlIO.h>}
{$include <libxml/list.h>}
{$include <libxml/xmlstring.h>}
{ C++ extern C conditionnal removed }
type

  PxmlTextWriterPtr = ^TxmlTextWriterPtr;
  TxmlTextWriterPtr = PxmlTextWriter;
{
 * Constructors & Destructor
  }

function xmlNewTextWriter(out:TxmlOutputBufferPtr):TxmlTextWriterPtr;cdecl;external;
(* Const before type ignored *)
function xmlNewTextWriterFilename(uri:Pchar; compression:longint):TxmlTextWriterPtr;cdecl;external;
function xmlNewTextWriterMemory(buf:TxmlBufferPtr; compression:longint):TxmlTextWriterPtr;cdecl;external;
function xmlNewTextWriterPushParser(ctxt:TxmlParserCtxtPtr; compression:longint):TxmlTextWriterPtr;cdecl;external;
function xmlNewTextWriterDoc(doc:PxmlDocPtr; compression:longint):TxmlTextWriterPtr;cdecl;external;
function xmlNewTextWriterTree(doc:TxmlDocPtr; node:TxmlNodePtr; compression:longint):TxmlTextWriterPtr;cdecl;external;
procedure xmlFreeTextWriter(writer:TxmlTextWriterPtr);cdecl;external;
{
 * Functions
  }
{
 * Document
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterStartDocument(writer:TxmlTextWriterPtr; version:Pchar; encoding:Pchar; standalone:Pchar):longint;cdecl;external;
function xmlTextWriterEndDocument(writer:TxmlTextWriterPtr):longint;cdecl;external;
{
 * Comments
  }
function xmlTextWriterStartComment(writer:TxmlTextWriterPtr):longint;cdecl;external;
function xmlTextWriterEndComment(writer:TxmlTextWriterPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteFormatComment(writer:TxmlTextWriterPtr; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatComment(writer:TxmlTextWriterPtr; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteVFormatComment(writer:TxmlTextWriterPtr; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteComment(writer:TxmlTextWriterPtr; content:PxmlChar):longint;cdecl;external;
{
 * Elements
  }
(* Const before type ignored *)
function xmlTextWriterStartElement(writer:TxmlTextWriterPtr; name:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterStartElementNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar):longint;cdecl;external;
function xmlTextWriterEndElement(writer:TxmlTextWriterPtr):longint;cdecl;external;
function xmlTextWriterFullEndElement(writer:TxmlTextWriterPtr):longint;cdecl;external;
{
 * Elements conveniency functions
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteFormatElement(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatElement(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteVFormatElement(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteElement(writer:TxmlTextWriterPtr; name:PxmlChar; content:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteFormatElementNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar; format:Pchar; 
           args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatElementNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteVFormatElementNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar; format:Pchar; 
           argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteElementNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar; content:PxmlChar):longint;cdecl;external;
{
 * Text
  }
(* Const before type ignored *)
function xmlTextWriterWriteFormatRaw(writer:TxmlTextWriterPtr; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatRaw(writer:TxmlTextWriterPtr; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteVFormatRaw(writer:TxmlTextWriterPtr; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteRawLen(writer:TxmlTextWriterPtr; content:PxmlChar; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteRaw(writer:TxmlTextWriterPtr; content:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteFormatString(writer:TxmlTextWriterPtr; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatString(writer:TxmlTextWriterPtr; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteVFormatString(writer:TxmlTextWriterPtr; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteString(writer:TxmlTextWriterPtr; content:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteBase64(writer:TxmlTextWriterPtr; data:Pchar; start:longint; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteBinHex(writer:TxmlTextWriterPtr; data:Pchar; start:longint; len:longint):longint;cdecl;external;
{
 * Attributes
  }
(* Const before type ignored *)
function xmlTextWriterStartAttribute(writer:TxmlTextWriterPtr; name:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterStartAttributeNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar):longint;cdecl;external;
function xmlTextWriterEndAttribute(writer:TxmlTextWriterPtr):longint;cdecl;external;
{
 * Attributes conveniency functions
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteFormatAttribute(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatAttribute(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteVFormatAttribute(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteAttribute(writer:TxmlTextWriterPtr; name:PxmlChar; content:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteFormatAttributeNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar; format:Pchar; 
           args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatAttributeNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteVFormatAttributeNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar; format:Pchar; 
           argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteAttributeNS(writer:TxmlTextWriterPtr; prefix:PxmlChar; name:PxmlChar; namespaceURI:PxmlChar; content:PxmlChar):longint;cdecl;external;
{
 * PI's
  }
(* Const before type ignored *)
function xmlTextWriterStartPI(writer:TxmlTextWriterPtr; target:PxmlChar):longint;cdecl;external;
function xmlTextWriterEndPI(writer:TxmlTextWriterPtr):longint;cdecl;external;
{
 * PI conveniency functions
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteFormatPI(writer:TxmlTextWriterPtr; target:PxmlChar; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatPI(writer:TxmlTextWriterPtr; target:PxmlChar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteVFormatPI(writer:TxmlTextWriterPtr; target:PxmlChar; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWritePI(writer:TxmlTextWriterPtr; target:PxmlChar; content:PxmlChar):longint;cdecl;external;
{*
 * xmlTextWriterWriteProcessingInstruction:
 *
 * This macro maps to xmlTextWriterWritePI
  }
const
  xmlTextWriterWriteProcessingInstruction = xmlTextWriterWritePI;  
{
 * CDATA
  }

function xmlTextWriterStartCDATA(writer:TxmlTextWriterPtr):longint;cdecl;external;
function xmlTextWriterEndCDATA(writer:TxmlTextWriterPtr):longint;cdecl;external;
{
 * CDATA conveniency functions
  }
(* Const before type ignored *)
function xmlTextWriterWriteFormatCDATA(writer:TxmlTextWriterPtr; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatCDATA(writer:TxmlTextWriterPtr; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteVFormatCDATA(writer:TxmlTextWriterPtr; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterWriteCDATA(writer:TxmlTextWriterPtr; content:PxmlChar):longint;cdecl;external;
{
 * DTD
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterStartDTD(writer:TxmlTextWriterPtr; name:PxmlChar; pubid:PxmlChar; sysid:PxmlChar):longint;cdecl;external;
function xmlTextWriterEndDTD(writer:TxmlTextWriterPtr):longint;cdecl;external;
{
 * DTD conveniency functions
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteFormatDTD(writer:TxmlTextWriterPtr; name:PxmlChar; pubid:PxmlChar; sysid:PxmlChar; format:Pchar; 
           args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatDTD(writer:TxmlTextWriterPtr; name:PxmlChar; pubid:PxmlChar; sysid:PxmlChar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteVFormatDTD(writer:TxmlTextWriterPtr; name:PxmlChar; pubid:PxmlChar; sysid:PxmlChar; format:Pchar; 
           argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteDTD(writer:TxmlTextWriterPtr; name:PxmlChar; pubid:PxmlChar; sysid:PxmlChar; subset:PxmlChar):longint;cdecl;external;
{*
 * xmlTextWriterWriteDocType:
 *
 * this macro maps to xmlTextWriterWriteDTD
  }
const
  xmlTextWriterWriteDocType = xmlTextWriterWriteDTD;  
{
 * DTD element definition
  }
(* Const before type ignored *)

function xmlTextWriterStartDTDElement(writer:TxmlTextWriterPtr; name:PxmlChar):longint;cdecl;external;
function xmlTextWriterEndDTDElement(writer:TxmlTextWriterPtr):longint;cdecl;external;
{
 * DTD element definition conveniency functions
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteFormatDTDElement(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatDTDElement(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteVFormatDTDElement(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteDTDElement(writer:TxmlTextWriterPtr; name:PxmlChar; content:PxmlChar):longint;cdecl;external;
{
 * DTD attribute list definition
  }
(* Const before type ignored *)
function xmlTextWriterStartDTDAttlist(writer:TxmlTextWriterPtr; name:PxmlChar):longint;cdecl;external;
function xmlTextWriterEndDTDAttlist(writer:TxmlTextWriterPtr):longint;cdecl;external;
{
 * DTD attribute list definition conveniency functions
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteFormatDTDAttlist(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatDTDAttlist(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteVFormatDTDAttlist(writer:TxmlTextWriterPtr; name:PxmlChar; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteDTDAttlist(writer:TxmlTextWriterPtr; name:PxmlChar; content:PxmlChar):longint;cdecl;external;
{
 * DTD entity definition
  }
(* Const before type ignored *)
function xmlTextWriterStartDTDEntity(writer:TxmlTextWriterPtr; pe:longint; name:PxmlChar):longint;cdecl;external;
function xmlTextWriterEndDTDEntity(writer:TxmlTextWriterPtr):longint;cdecl;external;
{
 * DTD entity definition conveniency functions
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteFormatDTDInternalEntity(writer:TxmlTextWriterPtr; pe:longint; name:PxmlChar; format:Pchar; args:array of const):longint;cdecl;external;
function xmlTextWriterWriteFormatDTDInternalEntity(writer:TxmlTextWriterPtr; pe:longint; name:PxmlChar; format:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteVFormatDTDInternalEntity(writer:TxmlTextWriterPtr; pe:longint; name:PxmlChar; format:Pchar; argptr:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteDTDInternalEntity(writer:TxmlTextWriterPtr; pe:longint; name:PxmlChar; content:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteDTDExternalEntity(writer:TxmlTextWriterPtr; pe:longint; name:PxmlChar; pubid:PxmlChar; sysid:PxmlChar; 
           ndataid:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteDTDExternalEntityContents(writer:TxmlTextWriterPtr; pubid:PxmlChar; sysid:PxmlChar; ndataid:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteDTDEntity(writer:TxmlTextWriterPtr; pe:longint; name:PxmlChar; pubid:PxmlChar; sysid:PxmlChar; 
           ndataid:PxmlChar; content:PxmlChar):longint;cdecl;external;
{
 * DTD notation definition
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlTextWriterWriteDTDNotation(writer:TxmlTextWriterPtr; name:PxmlChar; pubid:PxmlChar; sysid:PxmlChar):longint;cdecl;external;
{
 * Indentation
  }
function xmlTextWriterSetIndent(writer:TxmlTextWriterPtr; indent:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlTextWriterSetIndentString(writer:TxmlTextWriterPtr; str:PxmlChar):longint;cdecl;external;
function xmlTextWriterSetQuoteChar(writer:TxmlTextWriterPtr; quotechar:TxmlChar):longint;cdecl;external;
{
 * misc
  }
function xmlTextWriterFlush(writer:TxmlTextWriterPtr):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_WRITER_ENABLED  }
{$endif}
{ __XML_XMLWRITER_H__  }

implementation


end.
