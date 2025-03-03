
unit c14n;
interface

{
  Automatically converted by H2Pas 1.0.0 from c14n.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    c14n.h
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
PxmlC14NMode  = ^xmlC14NMode;
PxmlChar  = ^xmlChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: Provide Canonical XML and Exclusive XML Canonicalization
 * Description: the c14n modules provides a
 *
 * "Canonical XML" implementation
 * http://www.w3.org/TR/xml-c14n
 *
 * and an
 *
 * "Exclusive XML Canonicalization" implementation
 * http://www.w3.org/TR/xml-exc-c14n

 * Copy: See Copyright for the status of this software.
 *
 * Author: Aleksey Sanin <aleksey@aleksey.com>
  }
{$ifndef __XML_C14N_H__}
{$define __XML_C14N_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_C14N_ENABLED}
{$ifdef LIBXML_OUTPUT_ENABLED}
{$include <libxml/tree.h>}
{$include <libxml/xpath.h>}
{ C++ extern C conditionnal removed }
{ __cplusplus  }
{
 * XML Canonicalization
 * http://www.w3.org/TR/xml-c14n
 *
 * Exclusive XML Canonicalization
 * http://www.w3.org/TR/xml-exc-c14n
 *
 * Canonical form of an XML document could be created if and only if
 *  a) default attributes (if any) are added to all nodes
 *  b) all character and parsed entity references are resolved
 * In order to achieve this in libxml2 the document MUST be loaded with
 * following global settings:
 *
 *    xmlLoadExtDtdDefaultValue = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
 *    xmlSubstituteEntitiesDefault(1);
 *
 * or corresponding parser context setting:
 *    xmlParserCtxtPtr ctxt;
 *
 *    ...
 *    ctxt->loadsubset = XML_DETECT_IDS | XML_COMPLETE_ATTRS;
 *    ctxt->replaceEntities = 1;
 *    ...
  }
{
 * xmlC14NMode:
 *
 * Predefined values for C14N modes
 *
  }
{ Original C14N 1.0 spec  }
{ Exclusive C14N 1.0 spec  }
{ C14N 1.1 spec  }
type
  PxmlC14NMode = ^TxmlC14NMode;
  TxmlC14NMode =  Longint;
  Const
    XML_C14N_1_0 = 0;
    XML_C14N_EXCLUSIVE_1_0 = 1;
    XML_C14N_1_1 = 2;
;
{ a xmlC14NMode  }

function xmlC14NDocSaveTo(doc:TxmlDocPtr; nodes:TxmlNodeSetPtr; mode:longint; inclusive_ns_prefixes:PPxmlChar; with_comments:longint; 
           buf:TxmlOutputBufferPtr):longint;cdecl;external;
{ a xmlC14NMode  }
function xmlC14NDocDumpMemory(doc:TxmlDocPtr; nodes:TxmlNodeSetPtr; mode:longint; inclusive_ns_prefixes:PPxmlChar; with_comments:longint; 
           doc_txt_ptr:PPxmlChar):longint;cdecl;external;
{ a xmlC14NMode  }
(* Const before type ignored *)
function xmlC14NDocSave(doc:TxmlDocPtr; nodes:TxmlNodeSetPtr; mode:longint; inclusive_ns_prefixes:PPxmlChar; with_comments:longint; 
           filename:Pchar; compression:longint):longint;cdecl;external;
{*
 * This is the core C14N function
  }
{*
 * xmlC14NIsVisibleCallback:
 * @user_data: user data
 * @node: the current node
 * @parent: the parent node
 *
 * Signature for a C14N callback on visible nodes
 *
 * Returns 1 if the node should be included
  }
type

  TxmlC14NIsVisibleCallback = function (user_data:pointer; node:TxmlNodePtr; parent:TxmlNodePtr):longint;cdecl;
{ a xmlC14NMode  }

function xmlC14NExecute(doc:TxmlDocPtr; is_visible_callback:TxmlC14NIsVisibleCallback; user_data:pointer; mode:longint; inclusive_ns_prefixes:PPxmlChar; 
           with_comments:longint; buf:TxmlOutputBufferPtr):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{$endif}
{ LIBXML_C14N_ENABLED  }
{$endif}
{ __XML_C14N_H__  }

implementation


end.
