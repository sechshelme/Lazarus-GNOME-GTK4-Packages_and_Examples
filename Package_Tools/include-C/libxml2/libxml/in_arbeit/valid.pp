
unit valid;
interface

{
  Automatically converted by H2Pas 1.0.0 from valid.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    valid.h
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
Plongint  = ^longint;
PxmlAttributeTable  = ^xmlAttributeTable;
PxmlAttributeTablePtr  = ^xmlAttributeTablePtr;
PxmlChar  = ^xmlChar;
PxmlElementContent  = ^xmlElementContent;
PxmlElementTable  = ^xmlElementTable;
PxmlElementTablePtr  = ^xmlElementTablePtr;
PxmlIDTable  = ^xmlIDTable;
PxmlIDTablePtr  = ^xmlIDTablePtr;
PxmlNode  = ^xmlNode;
PxmlNodePtr  = ^xmlNodePtr;
PxmlNotationTable  = ^xmlNotationTable;
PxmlNotationTablePtr  = ^xmlNotationTablePtr;
PxmlRefTable  = ^xmlRefTable;
PxmlRefTablePtr  = ^xmlRefTablePtr;
PxmlValidCtxt  = ^xmlValidCtxt;
PxmlValidCtxtPtr  = ^xmlValidCtxtPtr;
PxmlValidState  = ^xmlValidState;
PxmlValidStatePtr  = ^xmlValidStatePtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: The DTD validation
 * Description: API for the DTD handling and the validity checking
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_VALID_H__}
{$define __XML_VALID_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/xmlerror.h>}
{$include <libxml/tree.h>}
{$include <libxml/list.h>}
{$include <libxml/xmlautomata.h>}
{$include <libxml/xmlregexp.h>}
{ C++ extern C conditionnal removed }
{
 * Validation state added for non-determinist content model.
  }
type

  PxmlValidStatePtr = ^TxmlValidStatePtr;
  TxmlValidStatePtr = PxmlValidState;
{*
 * xmlValidityErrorFunc:
 * @ctx:  usually an xmlValidCtxtPtr to a validity error context,
 *        but comes from ctxt->userData (which normally contains such
 *        a pointer); ctxt->userData can be changed by the user.
 * @msg:  the string to format *printf like vararg
 * @...:  remaining arguments to the format
 *
 * Callback called when a validity error is found. This is a message
 * oriented function similar to an *printf function.
  }
(* Const before type ignored *)

  TxmlValidityErrorFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
{*
 * xmlValidityWarningFunc:
 * @ctx:  usually an xmlValidCtxtPtr to a validity error context,
 *        but comes from ctxt->userData (which normally contains such
 *        a pointer); ctxt->userData can be changed by the user.
 * @msg:  the string to format *printf like vararg
 * @...:  remaining arguments to the format
 *
 * Callback called when a validity warning is found. This is a message
 * oriented function similar to an *printf function.
  }
(* Const before type ignored *)

  TxmlValidityWarningFunc = procedure (ctx:pointer; msg:Pchar; args:array of const);cdecl;
{$ifdef IN_LIBXML}
{*
 * XML_CTXT_FINISH_DTD_0:
 *
 * Special value for finishDtd field when embedded in an xmlParserCtxt
  }

const
  XML_CTXT_FINISH_DTD_0 = $abcd1234;  
{*
 * XML_CTXT_FINISH_DTD_1:
 *
 * Special value for finishDtd field when embedded in an xmlParserCtxt
  }
  XML_CTXT_FINISH_DTD_1 = $abcd1235;  
{$endif}
{
 * xmlValidCtxt:
 * An xmlValidCtxt is used for error reporting when validating.
  }
type

  PxmlValidCtxtPtr = ^TxmlValidCtxtPtr;
  TxmlValidCtxtPtr = PxmlValidCtxt;
{ user specific data block  }
{ the callback in case of errors  }
{ the callback in case of warning  }
{ Node analysis stack used when validating within entities  }
{ Current parsed Node  }
{ Depth of the parsing stack  }
{ Max depth of the parsing stack  }
{ array of nodes  }
{ finished validating the Dtd ?  }
{ the document  }
{ temporary validity check result  }
{ state state used for non-determinist content validation  }
{ current state  }
{ Depth of the validation stack  }
{ Max depth of the validation stack  }
{ array of validation states  }
{$ifdef LIBXML_REGEXP_ENABLED}
{ the automata  }
{ used to build the automata  }
{$else}
{$endif}
type
  PxmlValidCtxt = ^TxmlValidCtxt;
  TxmlValidCtxt = record
      userData : pointer;
      error : TxmlValidityErrorFunc;
      warning : TxmlValidityWarningFunc;
      node : TxmlNodePtr;
      nodeNr : longint;
      nodeMax : longint;
      nodeTab : PxmlNodePtr;
      finishDtd : dword;
      doc : TxmlDocPtr;
      valid : longint;
      vstate : PxmlValidState;
      vstateNr : longint;
      vstateMax : longint;
      vstateTab : PxmlValidState;
      am : TxmlAutomataPtr;
      state : TxmlAutomataStatePtr;
      am : pointer;
      state : pointer;
    end;

{
 * ALL notation declarations are stored in a table.
 * There is one table per DTD.
  }
  TxmlHashTable = TxmlNotationTable;

  PxmlNotationTablePtr = ^TxmlNotationTablePtr;
  TxmlNotationTablePtr = PxmlNotationTable;
{
 * ALL element declarations are stored in a table.
 * There is one table per DTD.
  }
  TxmlHashTable = TxmlElementTable;

  PxmlElementTablePtr = ^TxmlElementTablePtr;
  TxmlElementTablePtr = PxmlElementTable;
{
 * ALL attribute declarations are stored in a table.
 * There is one table per DTD.
  }
  TxmlHashTable = TxmlAttributeTable;

  PxmlAttributeTablePtr = ^TxmlAttributeTablePtr;
  TxmlAttributeTablePtr = PxmlAttributeTable;
{
 * ALL IDs attributes are stored in a table.
 * There is one table per document.
  }
  TxmlHashTable = TxmlIDTable;

  PxmlIDTablePtr = ^TxmlIDTablePtr;
  TxmlIDTablePtr = PxmlIDTable;
{
 * ALL Refs attributes are stored in a table.
 * There is one table per document.
  }
  TxmlHashTable = TxmlRefTable;

  PxmlRefTablePtr = ^TxmlRefTablePtr;
  TxmlRefTablePtr = PxmlRefTable;
{ Notation  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function xmlAddNotationDecl(ctxt:TxmlValidCtxtPtr; dtd:TxmlDtdPtr; name:PxmlChar; PublicID:PxmlChar; SystemID:PxmlChar):TxmlNotationPtr;cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
function xmlCopyNotationTable(table:TxmlNotationTablePtr):TxmlNotationTablePtr;cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }

procedure xmlFreeNotationTable(table:TxmlNotationTablePtr);cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
procedure xmlDumpNotationDecl(buf:TxmlBufferPtr; nota:TxmlNotationPtr);cdecl;external;
procedure xmlDumpNotationTable(buf:TxmlBufferPtr; table:TxmlNotationTablePtr);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{ Element Content  }
{ the non Doc version are being deprecated  }
(* Const before type ignored *)

function xmlNewElementContent(name:PxmlChar; _type:TxmlElementContentType):TxmlElementContentPtr;cdecl;external;
function xmlCopyElementContent(content:TxmlElementContentPtr):TxmlElementContentPtr;cdecl;external;
procedure xmlFreeElementContent(cur:TxmlElementContentPtr);cdecl;external;
{ the new versions with doc argument  }
(* Const before type ignored *)
function xmlNewDocElementContent(doc:TxmlDocPtr; name:PxmlChar; _type:TxmlElementContentType):TxmlElementContentPtr;cdecl;external;
function xmlCopyDocElementContent(doc:TxmlDocPtr; content:TxmlElementContentPtr):TxmlElementContentPtr;cdecl;external;
procedure xmlFreeDocElementContent(doc:TxmlDocPtr; cur:TxmlElementContentPtr);cdecl;external;
procedure xmlSnprintfElementContent(buf:Pchar; size:longint; content:TxmlElementContentPtr; englob:longint);cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
{ DEPRECATED  }
procedure xmlSprintfElementContent(buf:Pchar; content:TxmlElementContentPtr; englob:longint);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{ DEPRECATED  }
{ Element  }
(* Const before type ignored *)

function xmlAddElementDecl(ctxt:TxmlValidCtxtPtr; dtd:TxmlDtdPtr; name:PxmlChar; _type:TxmlElementTypeVal; content:TxmlElementContentPtr):TxmlElementPtr;cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
function xmlCopyElementTable(table:TxmlElementTablePtr):TxmlElementTablePtr;cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }

procedure xmlFreeElementTable(table:TxmlElementTablePtr);cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
procedure xmlDumpElementTable(buf:TxmlBufferPtr; table:TxmlElementTablePtr);cdecl;external;
procedure xmlDumpElementDecl(buf:TxmlBufferPtr; elem:TxmlElementPtr);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{ Enumeration  }
(* Const before type ignored *)

function xmlCreateEnumeration(name:PxmlChar):TxmlEnumerationPtr;cdecl;external;
procedure xmlFreeEnumeration(cur:TxmlEnumerationPtr);cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
function xmlCopyEnumeration(cur:TxmlEnumerationPtr):TxmlEnumerationPtr;cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }
{ Attribute  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function xmlAddAttributeDecl(ctxt:TxmlValidCtxtPtr; dtd:TxmlDtdPtr; elem:PxmlChar; name:PxmlChar; ns:PxmlChar; 
           _type:TxmlAttributeType; def:TxmlAttributeDefault; defaultValue:PxmlChar; tree:TxmlEnumerationPtr):TxmlAttributePtr;cdecl;external;
{$ifdef LIBXML_TREE_ENABLED}
function xmlCopyAttributeTable(table:TxmlAttributeTablePtr):TxmlAttributeTablePtr;cdecl;external;
{$endif}
{ LIBXML_TREE_ENABLED  }

procedure xmlFreeAttributeTable(table:TxmlAttributeTablePtr);cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
procedure xmlDumpAttributeTable(buf:TxmlBufferPtr; table:TxmlAttributeTablePtr);cdecl;external;
procedure xmlDumpAttributeDecl(buf:TxmlBufferPtr; attr:TxmlAttributePtr);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{ IDs  }
(* Const before type ignored *)

function xmlAddID(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; value:PxmlChar; attr:TxmlAttrPtr):TxmlIDPtr;cdecl;external;
procedure xmlFreeIDTable(table:TxmlIDTablePtr);cdecl;external;
(* Const before type ignored *)
function xmlGetID(doc:TxmlDocPtr; ID:PxmlChar):TxmlAttrPtr;cdecl;external;
function xmlIsID(doc:TxmlDocPtr; elem:TxmlNodePtr; attr:TxmlAttrPtr):longint;cdecl;external;
function xmlRemoveID(doc:TxmlDocPtr; attr:TxmlAttrPtr):longint;cdecl;external;
{ IDREFs  }
(* Const before type ignored *)
function xmlAddRef(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; value:PxmlChar; attr:TxmlAttrPtr):TxmlRefPtr;cdecl;external;
procedure xmlFreeRefTable(table:TxmlRefTablePtr);cdecl;external;
function xmlIsRef(doc:TxmlDocPtr; elem:TxmlNodePtr; attr:TxmlAttrPtr):longint;cdecl;external;
function xmlRemoveRef(doc:TxmlDocPtr; attr:TxmlAttrPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlGetRefs(doc:TxmlDocPtr; ID:PxmlChar):TxmlListPtr;cdecl;external;
{*
 * The public function calls related to validity checking.
  }
{$ifdef LIBXML_VALID_ENABLED}
{ Allocate/Release Validation Contexts  }
function xmlNewValidCtxt:TxmlValidCtxtPtr;cdecl;external;
procedure xmlFreeValidCtxt(para1:TxmlValidCtxtPtr);cdecl;external;
function xmlValidateRoot(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr):longint;cdecl;external;
function xmlValidateElementDecl(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlElementPtr):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlValidNormalizeAttributeValue(doc:TxmlDocPtr; elem:TxmlNodePtr; name:PxmlChar; value:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlValidCtxtNormalizeAttributeValue(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr; name:PxmlChar; value:PxmlChar):PxmlChar;cdecl;external;
function xmlValidateAttributeDecl(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; attr:TxmlAttributePtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidateAttributeValue(_type:TxmlAttributeType; value:PxmlChar):longint;cdecl;external;
function xmlValidateNotationDecl(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; nota:TxmlNotationPtr):longint;cdecl;external;
function xmlValidateDtd(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; dtd:TxmlDtdPtr):longint;cdecl;external;
function xmlValidateDtdFinal(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr):longint;cdecl;external;
function xmlValidateDocument(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr):longint;cdecl;external;
function xmlValidateElement(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr):longint;cdecl;external;
function xmlValidateOneElement(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidateOneAttribute(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr; attr:TxmlAttrPtr; value:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlValidateOneNamespace(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr; prefix:PxmlChar; ns:TxmlNsPtr; 
           value:PxmlChar):longint;cdecl;external;
function xmlValidateDocumentFinal(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr):longint;cdecl;external;
{$endif}
{ LIBXML_VALID_ENABLED  }
{$if defined(LIBXML_VALID_ENABLED) || defined(LIBXML_SCHEMAS_ENABLED)}
(* Const before type ignored *)

function xmlValidateNotationUse(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; notationName:PxmlChar):longint;cdecl;external;
{$endif}
{ LIBXML_VALID_ENABLED or LIBXML_SCHEMAS_ENABLED  }
(* Const before type ignored *)

function xmlIsMixedElement(doc:TxmlDocPtr; name:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlGetDtdAttrDesc(dtd:TxmlDtdPtr; elem:PxmlChar; name:PxmlChar):TxmlAttributePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlGetDtdQAttrDesc(dtd:TxmlDtdPtr; elem:PxmlChar; name:PxmlChar; prefix:PxmlChar):TxmlAttributePtr;cdecl;external;
(* Const before type ignored *)
function xmlGetDtdNotationDesc(dtd:TxmlDtdPtr; name:PxmlChar):TxmlNotationPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlGetDtdQElementDesc(dtd:TxmlDtdPtr; name:PxmlChar; prefix:PxmlChar):TxmlElementPtr;cdecl;external;
(* Const before type ignored *)
function xmlGetDtdElementDesc(dtd:TxmlDtdPtr; name:PxmlChar):TxmlElementPtr;cdecl;external;
{$ifdef LIBXML_VALID_ENABLED}
(* Const before type ignored *)
function xmlValidGetPotentialChildren(ctree:PxmlElementContent; names:PPxmlChar; len:Plongint; max:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidGetValidElements(prev:PxmlNode; next:PxmlNode; names:PPxmlChar; max:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidateNameValue(value:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidateNamesValue(value:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidateNmtokenValue(value:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidateNmtokensValue(value:PxmlChar):longint;cdecl;external;
{$ifdef LIBXML_REGEXP_ENABLED}
{
 * Validation based on the regexp support
  }
function xmlValidBuildContentModel(ctxt:TxmlValidCtxtPtr; elem:TxmlElementPtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidatePushElement(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr; qname:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidatePushCData(ctxt:TxmlValidCtxtPtr; data:PxmlChar; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlValidatePopElement(ctxt:TxmlValidCtxtPtr; doc:TxmlDocPtr; elem:TxmlNodePtr; qname:PxmlChar):longint;cdecl;external;
{$endif}
{ LIBXML_REGEXP_ENABLED  }
{$endif}
{ LIBXML_VALID_ENABLED  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_VALID_H__  }

implementation


end.
