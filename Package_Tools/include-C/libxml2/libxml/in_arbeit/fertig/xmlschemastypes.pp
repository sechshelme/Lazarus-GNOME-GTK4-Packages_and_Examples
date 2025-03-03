
unit xmlschemastypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlschemastypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlschemastypes.h
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
Pdword  = ^dword;
PxmlChar  = ^xmlChar;
PxmlSchemaValPtr  = ^xmlSchemaValPtr;
PxmlSchemaWhitespaceValueType  = ^xmlSchemaWhitespaceValueType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: implementation of XML Schema Datatypes
 * Description: module providing the XML Schema Datatypes implementation
 *              both definition and validity checking
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_SCHEMA_TYPES_H__}
{$define __XML_SCHEMA_TYPES_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_SCHEMAS_ENABLED}
{$include <libxml/schemasInternals.h>}
{$include <libxml/xmlschemas.h>}
{ C++ extern C conditionnal removed }
type
  PxmlSchemaWhitespaceValueType = ^TxmlSchemaWhitespaceValueType;
  TxmlSchemaWhitespaceValueType =  Longint;
  Const
    XML_SCHEMA_WHITESPACE_UNKNOWN = 0;
    XML_SCHEMA_WHITESPACE_PRESERVE = 1;
    XML_SCHEMA_WHITESPACE_REPLACE = 2;
    XML_SCHEMA_WHITESPACE_COLLAPSE = 3;
;

procedure xmlSchemaInitTypes;cdecl;external;
procedure xmlSchemaCleanupTypes;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSchemaGetPredefinedType(name:PxmlChar; ns:PxmlChar):TxmlSchemaTypePtr;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValidatePredefinedType(_type:TxmlSchemaTypePtr; value:PxmlChar; val:PxmlSchemaValPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValPredefTypeNode(_type:TxmlSchemaTypePtr; value:PxmlChar; val:PxmlSchemaValPtr; node:TxmlNodePtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValidateFacet(base:TxmlSchemaTypePtr; facet:TxmlSchemaFacetPtr; value:PxmlChar; val:TxmlSchemaValPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValidateFacetWhtsp(facet:TxmlSchemaFacetPtr; fws:TxmlSchemaWhitespaceValueType; valType:TxmlSchemaValType; value:PxmlChar; val:TxmlSchemaValPtr; 
           ws:TxmlSchemaWhitespaceValueType):longint;cdecl;external;
procedure xmlSchemaFreeValue(val:TxmlSchemaValPtr);cdecl;external;
function xmlSchemaNewFacet:TxmlSchemaFacetPtr;cdecl;external;
(* Const before type ignored *)
function xmlSchemaCheckFacet(facet:TxmlSchemaFacetPtr; typeDecl:TxmlSchemaTypePtr; ctxt:TxmlSchemaParserCtxtPtr; name:PxmlChar):longint;cdecl;external;
procedure xmlSchemaFreeFacet(facet:TxmlSchemaFacetPtr);cdecl;external;
function xmlSchemaCompareValues(x:TxmlSchemaValPtr; y:TxmlSchemaValPtr):longint;cdecl;external;
function xmlSchemaGetBuiltInListSimpleTypeItemType(_type:TxmlSchemaTypePtr):TxmlSchemaTypePtr;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValidateListSimpleTypeFacet(facet:TxmlSchemaFacetPtr; value:PxmlChar; actualLen:dword; expectedLen:Pdword):longint;cdecl;external;
function xmlSchemaGetBuiltInType(_type:TxmlSchemaValType):TxmlSchemaTypePtr;cdecl;external;
function xmlSchemaIsBuiltInTypeFacet(_type:TxmlSchemaTypePtr; facetType:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaCollapseString(value:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlSchemaWhiteSpaceReplace(value:PxmlChar):PxmlChar;cdecl;external;
function xmlSchemaGetFacetValueAsULong(facet:TxmlSchemaFacetPtr):dword;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValidateLengthFacet(_type:TxmlSchemaTypePtr; facet:TxmlSchemaFacetPtr; value:PxmlChar; val:TxmlSchemaValPtr; length:Pdword):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValidateLengthFacetWhtsp(facet:TxmlSchemaFacetPtr; valType:TxmlSchemaValType; value:PxmlChar; val:TxmlSchemaValPtr; length:Pdword; 
           ws:TxmlSchemaWhitespaceValueType):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValPredefTypeNodeNoNorm(_type:TxmlSchemaTypePtr; value:PxmlChar; val:PxmlSchemaValPtr; node:TxmlNodePtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaGetCanonValue(val:TxmlSchemaValPtr; retValue:PPxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaGetCanonValueWhtsp(val:TxmlSchemaValPtr; retValue:PPxmlChar; ws:TxmlSchemaWhitespaceValueType):longint;cdecl;external;
function xmlSchemaValueAppend(prev:TxmlSchemaValPtr; cur:TxmlSchemaValPtr):longint;cdecl;external;
function xmlSchemaValueGetNext(cur:TxmlSchemaValPtr):TxmlSchemaValPtr;cdecl;external;
(* Const before type ignored *)
function xmlSchemaValueGetAsString(val:TxmlSchemaValPtr):PxmlChar;cdecl;external;
function xmlSchemaValueGetAsBoolean(val:TxmlSchemaValPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlSchemaNewStringValue(_type:TxmlSchemaValType; value:PxmlChar):TxmlSchemaValPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSchemaNewNOTATIONValue(name:PxmlChar; ns:PxmlChar):TxmlSchemaValPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlSchemaNewQNameValue(namespaceName:PxmlChar; localName:PxmlChar):TxmlSchemaValPtr;cdecl;external;
function xmlSchemaCompareValuesWhtsp(x:TxmlSchemaValPtr; xws:TxmlSchemaWhitespaceValueType; y:TxmlSchemaValPtr; yws:TxmlSchemaWhitespaceValueType):longint;cdecl;external;
function xmlSchemaCopyValue(val:TxmlSchemaValPtr):TxmlSchemaValPtr;cdecl;external;
function xmlSchemaGetValType(val:TxmlSchemaValPtr):TxmlSchemaValType;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_SCHEMAS_ENABLED  }
{$endif}
{ __XML_SCHEMA_TYPES_H__  }

implementation


end.
