
unit xmlsave;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlsave.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlsave.h
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
PxmlSaveCtxt  = ^xmlSaveCtxt;
PxmlSaveCtxtPtr  = ^xmlSaveCtxtPtr;
PxmlSaveOption  = ^xmlSaveOption;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: the XML document serializer
 * Description: API to save document or subtree of document
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_XMLSAVE_H__}
{$define __XML_XMLSAVE_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{$include <libxml/encoding.h>}
{$include <libxml/xmlIO.h>}
{$ifdef LIBXML_OUTPUT_ENABLED}
{ C++ extern C conditionnal removed }
{*
 * xmlSaveOption:
 *
 * This is the set of XML save options that can be passed down
 * to the xmlSaveToFd() and similar calls.
  }
{ format save output  }
{ drop the xml declaration  }
{ no empty tags  }
{ disable XHTML1 specific rules  }
{ force XHTML1 specific rules  }
{ force XML serialization on HTML doc  }
{ force HTML serialization on XML doc  }
{ format with non-significant whitespace  }
type
  PxmlSaveOption = ^TxmlSaveOption;
  TxmlSaveOption =  Longint;
  Const
    XML_SAVE_FORMAT = 1 shl 0;
    XML_SAVE_NO_DECL = 1 shl 1;
    XML_SAVE_NO_EMPTY = 1 shl 2;
    XML_SAVE_NO_XHTML = 1 shl 3;
    XML_SAVE_XHTML = 1 shl 4;
    XML_SAVE_AS_XML = 1 shl 5;
    XML_SAVE_AS_HTML = 1 shl 6;
    XML_SAVE_WSNONSIG = 1 shl 7;
;
type

  PxmlSaveCtxtPtr = ^TxmlSaveCtxtPtr;
  TxmlSaveCtxtPtr = PxmlSaveCtxt;
(* Const before type ignored *)

function xmlSaveToFd(fd:longint; encoding:Pchar; options:longint):TxmlSaveCtxtPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSaveToFilename(filename:Pchar; encoding:Pchar; options:longint):TxmlSaveCtxtPtr;cdecl;external;
(* Const before type ignored *)
function xmlSaveToBuffer(buffer:TxmlBufferPtr; encoding:Pchar; options:longint):TxmlSaveCtxtPtr;cdecl;external;
(* Const before type ignored *)
function xmlSaveToIO(iowrite:TxmlOutputWriteCallback; ioclose:TxmlOutputCloseCallback; ioctx:pointer; encoding:Pchar; options:longint):TxmlSaveCtxtPtr;cdecl;external;
function xmlSaveDoc(ctxt:TxmlSaveCtxtPtr; doc:TxmlDocPtr):longint;cdecl;external;
function xmlSaveTree(ctxt:TxmlSaveCtxtPtr; node:TxmlNodePtr):longint;cdecl;external;
function xmlSaveFlush(ctxt:TxmlSaveCtxtPtr):longint;cdecl;external;
function xmlSaveClose(ctxt:TxmlSaveCtxtPtr):longint;cdecl;external;
function xmlSaveSetEscape(ctxt:TxmlSaveCtxtPtr; escape:TxmlCharEncodingOutputFunc):longint;cdecl;external;
function xmlSaveSetAttrEscape(ctxt:TxmlSaveCtxtPtr; escape:TxmlCharEncodingOutputFunc):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{$endif}
{ __XML_XMLSAVE_H__  }

implementation


end.
