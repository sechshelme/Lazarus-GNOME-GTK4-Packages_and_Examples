
unit xmlregexp;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlregexp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlregexp.h
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
PxmlExpCtxt  = ^xmlExpCtxt;
PxmlExpCtxtPtr  = ^xmlExpCtxtPtr;
PxmlExpNode  = ^xmlExpNode;
PxmlExpNodePtr  = ^xmlExpNodePtr;
PxmlExpNodeType  = ^xmlExpNodeType;
PxmlRegExecCtxt  = ^xmlRegExecCtxt;
PxmlRegExecCtxtPtr  = ^xmlRegExecCtxtPtr;
PxmlRegexp  = ^xmlRegexp;
PxmlRegexpPtr  = ^xmlRegexpPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: regular expressions handling
 * Description: basic API for libxml regular expressions handling used
 *              for XML Schemas and validation.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_REGEXP_H__}
{$define __XML_REGEXP_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_REGEXP_ENABLED}
{ C++ extern C conditionnal removed }
{*
 * xmlRegexpPtr:
 *
 * A libxml regular expression, they can actually be far more complex
 * thank the POSIX regex expressions.
  }
type

  PxmlRegexpPtr = ^TxmlRegexpPtr;
  TxmlRegexpPtr = PxmlRegexp;
{*
 * xmlRegExecCtxtPtr:
 *
 * A libxml progressive regular expression evaluation context
  }

  PxmlRegExecCtxtPtr = ^TxmlRegExecCtxtPtr;
  TxmlRegExecCtxtPtr = PxmlRegExecCtxt;
{ C++ end of extern C conditionnal removed }
{$include <libxml/tree.h>}
{$include <libxml/dict.h>}
{ C++ extern C conditionnal removed }
{
 * The POSIX like API
  }
(* Const before type ignored *)

function xmlRegexpCompile(regexp:PxmlChar):TxmlRegexpPtr;cdecl;external;
procedure xmlRegFreeRegexp(regexp:TxmlRegexpPtr);cdecl;external;
(* Const before type ignored *)
function xmlRegexpExec(comp:TxmlRegexpPtr; value:PxmlChar):longint;cdecl;external;
procedure xmlRegexpPrint(output:PFILE; regexp:TxmlRegexpPtr);cdecl;external;
function xmlRegexpIsDeterminist(comp:TxmlRegexpPtr):longint;cdecl;external;
{*
 * xmlRegExecCallbacks:
 * @exec: the regular expression context
 * @token: the current token string
 * @transdata: transition data
 * @inputdata: input data
 *
 * Callback function when doing a transition in the automata
  }
(* Const before type ignored *)
type

  TxmlRegExecCallbacks = procedure (exec:TxmlRegExecCtxtPtr; token:PxmlChar; transdata:pointer; inputdata:pointer);cdecl;
{
 * The progressive API
  }

function xmlRegNewExecCtxt(comp:TxmlRegexpPtr; callback:TxmlRegExecCallbacks; data:pointer):TxmlRegExecCtxtPtr;cdecl;external;
procedure xmlRegFreeExecCtxt(exec:TxmlRegExecCtxtPtr);cdecl;external;
(* Const before type ignored *)
function xmlRegExecPushString(exec:TxmlRegExecCtxtPtr; value:PxmlChar; data:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlRegExecPushString2(exec:TxmlRegExecCtxtPtr; value:PxmlChar; value2:PxmlChar; data:pointer):longint;cdecl;external;
function xmlRegExecNextValues(exec:TxmlRegExecCtxtPtr; nbval:Plongint; nbneg:Plongint; values:PPxmlChar; terminal:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function xmlRegExecErrInfo(exec:TxmlRegExecCtxtPtr; _string:PPxmlChar; nbval:Plongint; nbneg:Plongint; values:PPxmlChar; 
           terminal:Plongint):longint;cdecl;external;
{$ifdef LIBXML_EXPR_ENABLED}
{
 * Formal regular expression handling
 * Its goal is to do some formal work on content models
  }
{ expressions are used within a context  }
type

  PxmlExpCtxtPtr = ^TxmlExpCtxtPtr;
  TxmlExpCtxtPtr = PxmlExpCtxt;

procedure xmlExpFreeCtxt(ctxt:TxmlExpCtxtPtr);cdecl;external;
function xmlExpNewCtxt(maxNodes:longint; dict:TxmlDictPtr):TxmlExpCtxtPtr;cdecl;external;
function xmlExpCtxtNbNodes(ctxt:TxmlExpCtxtPtr):longint;cdecl;external;
function xmlExpCtxtNbCons(ctxt:TxmlExpCtxtPtr):longint;cdecl;external;
{ Expressions are trees but the tree is opaque  }
type

  PxmlExpNodePtr = ^TxmlExpNodePtr;
  TxmlExpNodePtr = PxmlExpNode;

  PxmlExpNodeType = ^TxmlExpNodeType;
  TxmlExpNodeType =  Longint;
  Const
    XML_EXP_EMPTY = 0;
    XML_EXP_FORBID = 1;
    XML_EXP_ATOM = 2;
    XML_EXP_SEQ = 3;
    XML_EXP_OR = 4;
    XML_EXP_COUNT = 5;
;
{
 * 2 core expressions shared by all for the empty language set
 * and for the set with just the empty token
  }
  var
    forbiddenExp : TxmlExpNodePtr;cvar;external;
    emptyExp : TxmlExpNodePtr;cvar;external;
{
 * Expressions are reference counted internally
  }

procedure xmlExpFree(ctxt:TxmlExpCtxtPtr; expr:TxmlExpNodePtr);cdecl;external;
procedure xmlExpRef(expr:TxmlExpNodePtr);cdecl;external;
{
 * constructors can be either manual or from a string
  }
(* Const before type ignored *)
function xmlExpParse(ctxt:TxmlExpCtxtPtr; expr:Pchar):TxmlExpNodePtr;cdecl;external;
(* Const before type ignored *)
function xmlExpNewAtom(ctxt:TxmlExpCtxtPtr; name:PxmlChar; len:longint):TxmlExpNodePtr;cdecl;external;
function xmlExpNewOr(ctxt:TxmlExpCtxtPtr; left:TxmlExpNodePtr; right:TxmlExpNodePtr):TxmlExpNodePtr;cdecl;external;
function xmlExpNewSeq(ctxt:TxmlExpCtxtPtr; left:TxmlExpNodePtr; right:TxmlExpNodePtr):TxmlExpNodePtr;cdecl;external;
function xmlExpNewRange(ctxt:TxmlExpCtxtPtr; subset:TxmlExpNodePtr; min:longint; max:longint):TxmlExpNodePtr;cdecl;external;
{
 * The really interesting APIs
  }
function xmlExpIsNillable(expr:TxmlExpNodePtr):longint;cdecl;external;
function xmlExpMaxToken(expr:TxmlExpNodePtr):longint;cdecl;external;
(* Const before type ignored *)
function xmlExpGetLanguage(ctxt:TxmlExpCtxtPtr; expr:TxmlExpNodePtr; langList:PPxmlChar; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlExpGetStart(ctxt:TxmlExpCtxtPtr; expr:TxmlExpNodePtr; tokList:PPxmlChar; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlExpStringDerive(ctxt:TxmlExpCtxtPtr; expr:TxmlExpNodePtr; str:PxmlChar; len:longint):TxmlExpNodePtr;cdecl;external;
function xmlExpExpDerive(ctxt:TxmlExpCtxtPtr; expr:TxmlExpNodePtr; sub:TxmlExpNodePtr):TxmlExpNodePtr;cdecl;external;
function xmlExpSubsume(ctxt:TxmlExpCtxtPtr; expr:TxmlExpNodePtr; sub:TxmlExpNodePtr):longint;cdecl;external;
procedure xmlExpDump(buf:TxmlBufferPtr; expr:TxmlExpNodePtr);cdecl;external;
{$endif}
{ LIBXML_EXPR_ENABLED  }
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_REGEXP_ENABLED  }
{$endif}
{__XML_REGEXP_H__  }

implementation


end.
