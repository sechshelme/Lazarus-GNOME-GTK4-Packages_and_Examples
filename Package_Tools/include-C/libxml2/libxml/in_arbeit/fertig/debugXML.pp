
unit debugXML;
interface

{
  Automatically converted by H2Pas 1.0.0 from debugXML.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    debugXML.h
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
PxmlChar  = ^xmlChar;
PxmlShellCtxt  = ^xmlShellCtxt;
PxmlShellCtxtPtr  = ^xmlShellCtxtPtr;
PxmlShellReadlineFunc  = ^xmlShellReadlineFunc;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: Tree debugging APIs
 * Description: Interfaces to a set of routines used for debugging the tree
 *              produced by the XML parser.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __DEBUG_XML__}
{$define __DEBUG_XML__}
{$include <stdio.h>}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{$ifdef LIBXML_DEBUG_ENABLED}
{$include <libxml/xpath.h>}
{ C++ extern C conditionnal removed }
{
 * The standard Dump routines.
  }
(* Const before type ignored *)

procedure xmlDebugDumpString(output:PFILE; str:PxmlChar);cdecl;external;
procedure xmlDebugDumpAttr(output:PFILE; attr:TxmlAttrPtr; depth:longint);cdecl;external;
procedure xmlDebugDumpAttrList(output:PFILE; attr:TxmlAttrPtr; depth:longint);cdecl;external;
procedure xmlDebugDumpOneNode(output:PFILE; node:TxmlNodePtr; depth:longint);cdecl;external;
procedure xmlDebugDumpNode(output:PFILE; node:TxmlNodePtr; depth:longint);cdecl;external;
procedure xmlDebugDumpNodeList(output:PFILE; node:TxmlNodePtr; depth:longint);cdecl;external;
procedure xmlDebugDumpDocumentHead(output:PFILE; doc:TxmlDocPtr);cdecl;external;
procedure xmlDebugDumpDocument(output:PFILE; doc:TxmlDocPtr);cdecl;external;
procedure xmlDebugDumpDTD(output:PFILE; dtd:TxmlDtdPtr);cdecl;external;
procedure xmlDebugDumpEntities(output:PFILE; doc:TxmlDocPtr);cdecl;external;
{***************************************************************
 *								*
 *			Checking routines			*
 *								*
 *************************************************************** }
function xmlDebugCheckDocument(output:PFILE; doc:TxmlDocPtr):longint;cdecl;external;
{***************************************************************
 *								*
 *			XML shell helpers			*
 *								*
 *************************************************************** }
procedure xmlLsOneNode(output:PFILE; node:TxmlNodePtr);cdecl;external;
function xmlLsCountNode(node:TxmlNodePtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlBoolToText(boolval:longint):Pchar;cdecl;external;
{***************************************************************
 *								*
 *	 The XML shell related structures and functions		*
 *								*
 *************************************************************** }
{$ifdef LIBXML_XPATH_ENABLED}
{*
 * xmlShellReadlineFunc:
 * @prompt:  a string prompt
 *
 * This is a generic signature for the XML shell input function.
 *
 * Returns a string which will be freed by the Shell.
  }
type
  PxmlShellReadlineFunc = ^TxmlShellReadlineFunc;
  TxmlShellReadlineFunc = function (prompt:Pchar):Pchar;cdecl;
{*
 * xmlShellCtxt:
 *
 * A debugging shell context.
 * TODO: add the defined function tables.
  }

  PxmlShellCtxtPtr = ^TxmlShellCtxtPtr;
  TxmlShellCtxtPtr = PxmlShellCtxt;
  PxmlShellCtxt = ^TxmlShellCtxt;
  TxmlShellCtxt = record
      filename : Pchar;
      doc : TxmlDocPtr;
      node : TxmlNodePtr;
      pctxt : TxmlXPathContextPtr;
      loaded : longint;
      output : PFILE;
      input : TxmlShellReadlineFunc;
    end;

{*
 * xmlShellCmd:
 * @ctxt:  a shell context
 * @arg:  a string argument
 * @node:  a first node
 * @node2:  a second node
 *
 * This is a generic signature for the XML shell functions.
 *
 * Returns an int, negative returns indicating errors.
  }

  TxmlShellCmd = function (ctxt:TxmlShellCtxtPtr; arg:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;
(* Const before type ignored *)

procedure xmlShellPrintXPathError(errorType:longint; arg:Pchar);cdecl;external;
procedure xmlShellPrintXPathResult(list:TxmlXPathObjectPtr);cdecl;external;
function xmlShellList(ctxt:TxmlShellCtxtPtr; arg:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
function xmlShellBase(ctxt:TxmlShellCtxtPtr; arg:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
function xmlShellDir(ctxt:TxmlShellCtxtPtr; arg:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
function xmlShellLoad(ctxt:TxmlShellCtxtPtr; filename:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
procedure xmlShellPrintNode(node:TxmlNodePtr);cdecl;external;
function xmlShellCat(ctxt:TxmlShellCtxtPtr; arg:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
function xmlShellWrite(ctxt:TxmlShellCtxtPtr; filename:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
function xmlShellSave(ctxt:TxmlShellCtxtPtr; filename:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
{$ifdef LIBXML_VALID_ENABLED}

function xmlShellValidate(ctxt:TxmlShellCtxtPtr; dtd:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
{$endif}
{ LIBXML_VALID_ENABLED  }

function xmlShellDu(ctxt:TxmlShellCtxtPtr; arg:Pchar; tree:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
function xmlShellPwd(ctxt:TxmlShellCtxtPtr; buffer:Pchar; node:TxmlNodePtr; node2:TxmlNodePtr):longint;cdecl;external;
{
 * The Shell interface.
  }
procedure xmlShell(doc:TxmlDocPtr; filename:Pchar; input:TxmlShellReadlineFunc; output:PFILE);cdecl;external;
{$endif}
{ LIBXML_XPATH_ENABLED  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_DEBUG_ENABLED  }
{$endif}
{ __DEBUG_XML__  }

implementation


end.
