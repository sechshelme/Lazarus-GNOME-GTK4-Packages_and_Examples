
unit xmlschemas;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlschemas.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlschemas.h
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
Pdword  = ^dword;
PFILE  = ^FILE;
PxmlSAXHandlerPtr  = ^xmlSAXHandlerPtr;
PxmlSchema  = ^xmlSchema;
PxmlSchemaParserCtxt  = ^xmlSchemaParserCtxt;
PxmlSchemaParserCtxtPtr  = ^xmlSchemaParserCtxtPtr;
PxmlSchemaPtr  = ^xmlSchemaPtr;
PxmlSchemaSAXPlugPtr  = ^xmlSchemaSAXPlugPtr;
PxmlSchemaSAXPlugStruct  = ^xmlSchemaSAXPlugStruct;
PxmlSchemaValidCtxt  = ^xmlSchemaValidCtxt;
PxmlSchemaValidCtxtPtr  = ^xmlSchemaValidCtxtPtr;
PxmlSchemaValidError  = ^xmlSchemaValidError;
PxmlSchemaValidityErrorFunc  = ^xmlSchemaValidityErrorFunc;
PxmlSchemaValidityWarningFunc  = ^xmlSchemaValidityWarningFunc;
PxmlSchemaValidOption  = ^xmlSchemaValidOption;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: incomplete XML Schemas structure implementation
 * Description: interface to the XML Schemas handling and schema validity
 *              checking, it is incomplete right now.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_SCHEMA_H__}
{$define __XML_SCHEMA_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_SCHEMAS_ENABLED}
{$include <libxml/tree.h>}
{ C++ extern C conditionnal removed }
{*
 * This error codes are obsolete; not used any more.
  }
type
  PxmlSchemaValidError = ^TxmlSchemaValidError;
  TxmlSchemaValidError =  Longint;
  Const
    XML_SCHEMAS_ERR_OK = 0;
    XML_SCHEMAS_ERR_NOROOT = 1;
    XML_SCHEMAS_ERR_UNDECLAREDELEM = 2;
    XML_SCHEMAS_ERR_NOTTOPLEVEL = 3;
    XML_SCHEMAS_ERR_MISSING = 4;
    XML_SCHEMAS_ERR_WRONGELEM = 5;
    XML_SCHEMAS_ERR_NOTYPE = 6;
    XML_SCHEMAS_ERR_NOROLLBACK = 7;
    XML_SCHEMAS_ERR_ISABSTRACT = 8;
    XML_SCHEMAS_ERR_NOTEMPTY = 9;
    XML_SCHEMAS_ERR_ELEMCONT = 10;
    XML_SCHEMAS_ERR_HAVEDEFAULT = 11;
    XML_SCHEMAS_ERR_NOTNILLABLE = 12;
    XML_SCHEMAS_ERR_EXTRACONTENT = 13;
    XML_SCHEMAS_ERR_INVALIDATTR = 14;
    XML_SCHEMAS_ERR_INVALIDELEM = 15;
    XML_SCHEMAS_ERR_NOTDETERMINIST = 16;
    XML_SCHEMAS_ERR_CONSTRUCT = 17;
    XML_SCHEMAS_ERR_INTERNAL = 18;
    XML_SCHEMAS_ERR_NOTSIMPLE = 19;
    XML_SCHEMAS_ERR_ATTRUNKNOWN = 20;
    XML_SCHEMAS_ERR_ATTRINVALID = 21;
    XML_SCHEMAS_ERR_VALUE = 22;
    XML_SCHEMAS_ERR_FACET = 23;
    XML_SCHEMAS_ERR_ = 24;
    XML_SCHEMAS_ERR_XXX = 25;
;
{
* ATTENTION: Change xmlSchemaSetValidOptions's check
* for invalid values, if adding to the validation
* options below.
 }
{*
 * xmlSchemaValidOption:
 *
 * This is the set of XML Schema validation options.
  }
{ Default/fixed: create an attribute node
	* or an element's text node on the instance.
	 }
type
  PxmlSchemaValidOption = ^TxmlSchemaValidOption;
  TxmlSchemaValidOption =  Longint;
  Const
    XML_SCHEMA_VAL_VC_I_CREATE = 1 shl 0;
;
{
    XML_SCHEMA_VAL_XSI_ASSEMBLE			= 1<<1,
	* assemble schemata using
	* xsi:schemaLocation and
	* xsi:noNamespaceSchemaLocation
 }
{*
 * The schemas related types are kept internal
  }
type

  PxmlSchemaPtr = ^TxmlSchemaPtr;
  TxmlSchemaPtr = PxmlSchema;
{*
 * xmlSchemaValidityErrorFunc:
 * @ctx: the validation context
 * @msg: the message
 * @...: extra arguments
 *
 * Signature of an error callback from an XSD validation
  }
(* Const before type ignored *)

  TxmlSchemaValidityErrorFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
{*
 * xmlSchemaValidityWarningFunc:
 * @ctx: the validation context
 * @msg: the message
 * @...: extra arguments
 *
 * Signature of a warning callback from an XSD validation
  }
(* Const before type ignored *)

  TxmlSchemaValidityWarningFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
{*
 * A schemas validation context
  }

  PxmlSchemaParserCtxtPtr = ^TxmlSchemaParserCtxtPtr;
  TxmlSchemaParserCtxtPtr = PxmlSchemaParserCtxt;

  PxmlSchemaValidCtxtPtr = ^TxmlSchemaValidCtxtPtr;
  TxmlSchemaValidCtxtPtr = PxmlSchemaValidCtxt;
{*
 * xmlSchemaValidityLocatorFunc:
 * @ctx: user provided context
 * @file: returned file information
 * @line: returned line information
 *
 * A schemas validation locator, a callback called by the validator.
 * This is used when file or node information are not available
 * to find out what file and line number are affected
 *
 * Returns: 0 in case of success and -1 in case of error
  }
(* Const before type ignored *)

  TxmlSchemaValidityLocatorFunc = function (ctx:pointer; file:PPchar; line:Pdword):longint;cdecl;
{
 * Interfaces for parsing.
  }
(* Const before type ignored *)

function xmlSchemaNewParserCtxt(URL:Pchar):TxmlSchemaParserCtxtPtr;cdecl;external;
(* Const before type ignored *)
function xmlSchemaNewMemParserCtxt(buffer:Pchar; size:longint):TxmlSchemaParserCtxtPtr;cdecl;external;
function xmlSchemaNewDocParserCtxt(doc:TxmlDocPtr):TxmlSchemaParserCtxtPtr;cdecl;external;
procedure xmlSchemaFreeParserCtxt(ctxt:TxmlSchemaParserCtxtPtr);cdecl;external;
procedure xmlSchemaSetParserErrors(ctxt:TxmlSchemaParserCtxtPtr; err:TxmlSchemaValidityErrorFunc; warn:TxmlSchemaValidityWarningFunc; ctx:pointer);cdecl;external;
procedure xmlSchemaSetParserStructuredErrors(ctxt:TxmlSchemaParserCtxtPtr; serror:TxmlStructuredErrorFunc; ctx:pointer);cdecl;external;
function xmlSchemaGetParserErrors(ctxt:TxmlSchemaParserCtxtPtr; err:PxmlSchemaValidityErrorFunc; warn:PxmlSchemaValidityWarningFunc; ctx:Ppointer):longint;cdecl;external;
function xmlSchemaIsValid(ctxt:TxmlSchemaValidCtxtPtr):longint;cdecl;external;
function xmlSchemaParse(ctxt:TxmlSchemaParserCtxtPtr):TxmlSchemaPtr;cdecl;external;
procedure xmlSchemaFree(schema:TxmlSchemaPtr);cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
procedure xmlSchemaDump(output:PFILE; schema:TxmlSchemaPtr);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{
 * Interfaces for validating
  }

procedure xmlSchemaSetValidErrors(ctxt:TxmlSchemaValidCtxtPtr; err:TxmlSchemaValidityErrorFunc; warn:TxmlSchemaValidityWarningFunc; ctx:pointer);cdecl;external;
procedure xmlSchemaSetValidStructuredErrors(ctxt:TxmlSchemaValidCtxtPtr; serror:TxmlStructuredErrorFunc; ctx:pointer);cdecl;external;
function xmlSchemaGetValidErrors(ctxt:TxmlSchemaValidCtxtPtr; err:PxmlSchemaValidityErrorFunc; warn:PxmlSchemaValidityWarningFunc; ctx:Ppointer):longint;cdecl;external;
function xmlSchemaSetValidOptions(ctxt:TxmlSchemaValidCtxtPtr; options:longint):longint;cdecl;external;
(* Const before type ignored *)
procedure xmlSchemaValidateSetFilename(vctxt:TxmlSchemaValidCtxtPtr; filename:Pchar);cdecl;external;
function xmlSchemaValidCtxtGetOptions(ctxt:TxmlSchemaValidCtxtPtr):longint;cdecl;external;
function xmlSchemaNewValidCtxt(schema:TxmlSchemaPtr):TxmlSchemaValidCtxtPtr;cdecl;external;
procedure xmlSchemaFreeValidCtxt(ctxt:TxmlSchemaValidCtxtPtr);cdecl;external;
function xmlSchemaValidateDoc(ctxt:TxmlSchemaValidCtxtPtr; instance:TxmlDocPtr):longint;cdecl;external;
function xmlSchemaValidateOneElement(ctxt:TxmlSchemaValidCtxtPtr; elem:TxmlNodePtr):longint;cdecl;external;
function xmlSchemaValidateStream(ctxt:TxmlSchemaValidCtxtPtr; input:TxmlParserInputBufferPtr; enc:TxmlCharEncoding; sax:TxmlSAXHandlerPtr; user_data:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValidateFile(ctxt:TxmlSchemaValidCtxtPtr; filename:Pchar; options:longint):longint;cdecl;external;
function xmlSchemaValidCtxtGetParserCtxt(ctxt:TxmlSchemaValidCtxtPtr):TxmlParserCtxtPtr;cdecl;external;
{
 * Interface to insert Schemas SAX validation in a SAX stream
  }
type
  TxmlSchemaSAXPlug = TxmlSchemaSAXPlugStruct;

  PxmlSchemaSAXPlugPtr = ^TxmlSchemaSAXPlugPtr;
  TxmlSchemaSAXPlugPtr = PxmlSchemaSAXPlugStruct;

function xmlSchemaSAXPlug(ctxt:TxmlSchemaValidCtxtPtr; sax:PxmlSAXHandlerPtr; user_data:Ppointer):TxmlSchemaSAXPlugPtr;cdecl;external;
function xmlSchemaSAXUnplug(plug:TxmlSchemaSAXPlugPtr):longint;cdecl;external;
procedure xmlSchemaValidateSetLocator(vctxt:TxmlSchemaValidCtxtPtr; f:TxmlSchemaValidityLocatorFunc; ctxt:pointer);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_SCHEMAS_ENABLED  }
{$endif}
{ __XML_SCHEMA_H__  }

implementation


end.
