
unit schematron;
interface

{
  Automatically converted by H2Pas 1.0.0 from schematron.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    schematron.h
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
PxmlSchematron  = ^xmlSchematron;
PxmlSchematronParserCtxt  = ^xmlSchematronParserCtxt;
PxmlSchematronParserCtxtPtr  = ^xmlSchematronParserCtxtPtr;
PxmlSchematronPtr  = ^xmlSchematronPtr;
PxmlSchematronValidCtxt  = ^xmlSchematronValidCtxt;
PxmlSchematronValidCtxtPtr  = ^xmlSchematronValidCtxtPtr;
PxmlSchematronValidOptions  = ^xmlSchematronValidOptions;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: XML Schemastron implementation
 * Description: interface to the XML Schematron validity checking.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_SCHEMATRON_H__}
{$define __XML_SCHEMATRON_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_SCHEMATRON_ENABLED}
{$include <libxml/tree.h>}
{ C++ extern C conditionnal removed }
{ quiet no report  }
{ build a textual report  }
{ output SVRL  }
{ output via xmlStructuredErrorFunc  }
{ output to a file descriptor  }
{ output to a buffer  }
{ output to I/O mechanism  }
type
  PxmlSchematronValidOptions = ^TxmlSchematronValidOptions;
  TxmlSchematronValidOptions =  Longint;
  Const
    XML_SCHEMATRON_OUT_QUIET = 1 shl 0;
    XML_SCHEMATRON_OUT_TEXT = 1 shl 1;
    XML_SCHEMATRON_OUT_XML = 1 shl 2;
    XML_SCHEMATRON_OUT_ERROR = 1 shl 3;
    XML_SCHEMATRON_OUT_FILE = 1 shl 8;
    XML_SCHEMATRON_OUT_BUFFER = 1 shl 9;
    XML_SCHEMATRON_OUT_IO = 1 shl 10;
;
{*
 * The schemas related types are kept internal
  }
type

  PxmlSchematronPtr = ^TxmlSchematronPtr;
  TxmlSchematronPtr = PxmlSchematron;
{*
 * xmlSchematronValidityErrorFunc:
 * @ctx: the validation context
 * @msg: the message
 * @...: extra arguments
 *
 * Signature of an error callback from a Schematron validation
  }
(* Const before type ignored *)

  TxmlSchematronValidityErrorFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
{*
 * xmlSchematronValidityWarningFunc:
 * @ctx: the validation context
 * @msg: the message
 * @...: extra arguments
 *
 * Signature of a warning callback from a Schematron validation
  }
(* Const before type ignored *)

  TxmlSchematronValidityWarningFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
{*
 * A schemas validation context
  }

  PxmlSchematronParserCtxtPtr = ^TxmlSchematronParserCtxtPtr;
  TxmlSchematronParserCtxtPtr = PxmlSchematronParserCtxt;

  PxmlSchematronValidCtxtPtr = ^TxmlSchematronValidCtxtPtr;
  TxmlSchematronValidCtxtPtr = PxmlSchematronValidCtxt;
{
 * Interfaces for parsing.
  }
(* Const before type ignored *)

function xmlSchematronNewParserCtxt(URL:Pchar):TxmlSchematronParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
function xmlSchematronNewMemParserCtxt(buffer:Pchar; size:longint):TxmlSchematronParserCtxtPtr;cdecl;external;
function xmlSchematronNewDocParserCtxt(doc:TxmlDocPtr):TxmlSchematronParserCtxtPtr;cdecl;external;
procedure xmlSchematronFreeParserCtxt(ctxt:TxmlSchematronParserCtxtPtr);cdecl;external;
{****
extern void 
	    xmlSchematronSetParserErrors(xmlSchematronParserCtxtPtr ctxt,
					 xmlSchematronValidityErrorFunc err,
					 xmlSchematronValidityWarningFunc warn,
					 void *ctx);
extern int 
		xmlSchematronGetParserErrors(xmlSchematronParserCtxtPtr ctxt,
					xmlSchematronValidityErrorFunc * err,
					xmlSchematronValidityWarningFunc * warn,
					void **ctx);
extern int 
		xmlSchematronIsValid	(xmlSchematronValidCtxtPtr ctxt);
 **** }
function xmlSchematronParse(ctxt:TxmlSchematronParserCtxtPtr):TxmlSchematronPtr;cdecl;external;
procedure xmlSchematronFree(schema:TxmlSchematronPtr);cdecl;external;
{
 * Interfaces for validating
  }
procedure xmlSchematronSetValidStructuredErrors(ctxt:TxmlSchematronValidCtxtPtr; serror:TxmlStructuredErrorFunc; ctx:pointer);cdecl;external;
{*****
extern void 
	    xmlSchematronSetValidErrors	(xmlSchematronValidCtxtPtr ctxt,
					 xmlSchematronValidityErrorFunc err,
					 xmlSchematronValidityWarningFunc warn,
					 void *ctx);
extern int 
	    xmlSchematronGetValidErrors	(xmlSchematronValidCtxtPtr ctxt,
					 xmlSchematronValidityErrorFunc *err,
					 xmlSchematronValidityWarningFunc *warn,
					 void **ctx);
extern int 
	    xmlSchematronSetValidOptions(xmlSchematronValidCtxtPtr ctxt,
					 int options);
extern int 
	    xmlSchematronValidCtxtGetOptions(xmlSchematronValidCtxtPtr ctxt);
extern int 
            xmlSchematronValidateOneElement (xmlSchematronValidCtxtPtr ctxt,
			                 xmlNodePtr elem);
 ****** }
function xmlSchematronNewValidCtxt(schema:TxmlSchematronPtr; options:longint):TxmlSchematronValidCtxtPtr;cdecl;external;
procedure xmlSchematronFreeValidCtxt(ctxt:TxmlSchematronValidCtxtPtr);cdecl;external;
function xmlSchematronValidateDoc(ctxt:TxmlSchematronValidCtxtPtr; instance:TxmlDocPtr):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_SCHEMATRON_ENABLED  }
{$endif}
{ __XML_SCHEMATRON_H__  }

implementation


end.
