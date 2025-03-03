
unit HTMLtree;
interface

{
  Automatically converted by H2Pas 1.0.0 from HTMLtree.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    HTMLtree.h
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
PFILE  = ^FILE;
Plongint  = ^longint;
PxmlChar  = ^xmlChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: specific APIs to process HTML tree, especially serialization
 * Description: this module implements a few function needed to process
 *              tree in an HTML specific way.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __HTML_TREE_H__}
{$define __HTML_TREE_H__}
{$include <stdio.h>}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{$include <libxml/HTMLparser.h>}
{$ifdef LIBXML_HTML_ENABLED}
{ C++ extern C conditionnal removed }
{*
 * HTML_TEXT_NODE:
 *
 * Macro. A text node in a HTML document is really implemented
 * the same way as a text node in an XML document.
  }

const
  HTML_TEXT_NODE = XML_TEXT_NODE;  
{*
 * HTML_ENTITY_REF_NODE:
 *
 * Macro. An entity reference in a HTML document is really implemented
 * the same way as an entity reference in an XML document.
  }
  HTML_ENTITY_REF_NODE = XML_ENTITY_REF_NODE;  
{*
 * HTML_COMMENT_NODE:
 *
 * Macro. A comment in a HTML document is really implemented
 * the same way as a comment in an XML document.
  }
  HTML_COMMENT_NODE = XML_COMMENT_NODE;  
{*
 * HTML_PRESERVE_NODE:
 *
 * Macro. A preserved node in a HTML document is really implemented
 * the same way as a CDATA section in an XML document.
  }
  HTML_PRESERVE_NODE = XML_CDATA_SECTION_NODE;  
{*
 * HTML_PI_NODE:
 *
 * Macro. A processing instruction in a HTML document is really implemented
 * the same way as a processing instruction in an XML document.
  }
  HTML_PI_NODE = XML_PI_NODE;  
(* Const before type ignored *)
(* Const before type ignored *)

function htmlNewDoc(URI:PxmlChar; ExternalID:PxmlChar):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlNewDocNoDtD(URI:PxmlChar; ExternalID:PxmlChar):ThtmlDocPtr;cdecl;external;
(* Const before type ignored *)
function htmlGetMetaEncoding(doc:ThtmlDocPtr):PxmlChar;cdecl;external;
(* Const before type ignored *)
function htmlSetMetaEncoding(doc:ThtmlDocPtr; encoding:PxmlChar):longint;cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
procedure htmlDocDumpMemory(cur:TxmlDocPtr; mem:PPxmlChar; size:Plongint);cdecl;external;
procedure htmlDocDumpMemoryFormat(cur:TxmlDocPtr; mem:PPxmlChar; size:Plongint; format:longint);cdecl;external;
function htmlDocDump(f:PFILE; cur:TxmlDocPtr):longint;cdecl;external;
(* Const before type ignored *)
function htmlSaveFile(filename:Pchar; cur:TxmlDocPtr):longint;cdecl;external;
function htmlNodeDump(buf:TxmlBufferPtr; doc:TxmlDocPtr; cur:TxmlNodePtr):longint;cdecl;external;
procedure htmlNodeDumpFile(out:PFILE; doc:TxmlDocPtr; cur:TxmlNodePtr);cdecl;external;
(* Const before type ignored *)
function htmlNodeDumpFileFormat(out:PFILE; doc:TxmlDocPtr; cur:TxmlNodePtr; encoding:Pchar; format:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlSaveFileEnc(filename:Pchar; cur:TxmlDocPtr; encoding:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function htmlSaveFileFormat(filename:Pchar; cur:TxmlDocPtr; encoding:Pchar; format:longint):longint;cdecl;external;
(* Const before type ignored *)
procedure htmlNodeDumpFormatOutput(buf:TxmlOutputBufferPtr; doc:TxmlDocPtr; cur:TxmlNodePtr; encoding:Pchar; format:longint);cdecl;external;
(* Const before type ignored *)
procedure htmlDocContentDumpOutput(buf:TxmlOutputBufferPtr; cur:TxmlDocPtr; encoding:Pchar);cdecl;external;
(* Const before type ignored *)
procedure htmlDocContentDumpFormatOutput(buf:TxmlOutputBufferPtr; cur:TxmlDocPtr; encoding:Pchar; format:longint);cdecl;external;
(* Const before type ignored *)
procedure htmlNodeDumpOutput(buf:TxmlOutputBufferPtr; doc:TxmlDocPtr; cur:TxmlNodePtr; encoding:Pchar);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
(* Const before type ignored *)

function htmlIsBooleanAttr(name:PxmlChar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_HTML_ENABLED  }
{$endif}
{ __HTML_TREE_H__  }

implementation


end.
