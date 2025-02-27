
unit xmlautomata;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlautomata.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlautomata.h
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
PxmlAutomata  = ^xmlAutomata;
PxmlAutomataPtr  = ^xmlAutomataPtr;
PxmlAutomataState  = ^xmlAutomataState;
PxmlAutomataStatePtr  = ^xmlAutomataStatePtr;
PxmlChar  = ^xmlChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: API to build regexp automata
 * Description: the API to build regexp automata
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_AUTOMATA_H__}
{$define __XML_AUTOMATA_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{$ifdef LIBXML_REGEXP_ENABLED}
{$ifdef LIBXML_AUTOMATA_ENABLED}
{$include <libxml/xmlregexp.h>}
{ C++ extern C conditionnal removed }
{*
 * xmlAutomataPtr:
 *
 * A libxml automata description, It can be compiled into a regexp
  }
type

  PxmlAutomataPtr = ^TxmlAutomataPtr;
  TxmlAutomataPtr = PxmlAutomata;
{*
 * xmlAutomataStatePtr:
 *
 * A state int the automata description,
  }

  PxmlAutomataStatePtr = ^TxmlAutomataStatePtr;
  TxmlAutomataStatePtr = PxmlAutomataState;
{
 * Building API
  }

function xmlNewAutomata:TxmlAutomataPtr;cdecl;external;
procedure xmlFreeAutomata(am:TxmlAutomataPtr);cdecl;external;
function xmlAutomataGetInitState(am:TxmlAutomataPtr):TxmlAutomataStatePtr;cdecl;external;
function xmlAutomataSetFinalState(am:TxmlAutomataPtr; state:TxmlAutomataStatePtr):longint;cdecl;external;
function xmlAutomataNewState(am:TxmlAutomataPtr):TxmlAutomataStatePtr;cdecl;external;
(* Const before type ignored *)
function xmlAutomataNewTransition(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; token:PxmlChar; data:pointer):TxmlAutomataStatePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlAutomataNewTransition2(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; token:PxmlChar; token2:PxmlChar; 
           data:pointer):TxmlAutomataStatePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlAutomataNewNegTrans(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; token:PxmlChar; token2:PxmlChar; 
           data:pointer):TxmlAutomataStatePtr;cdecl;external;
(* Const before type ignored *)
function xmlAutomataNewCountTrans(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; token:PxmlChar; min:longint; 
           max:longint; data:pointer):TxmlAutomataStatePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlAutomataNewCountTrans2(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; token:PxmlChar; token2:PxmlChar; 
           min:longint; max:longint; data:pointer):TxmlAutomataStatePtr;cdecl;external;
(* Const before type ignored *)
function xmlAutomataNewOnceTrans(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; token:PxmlChar; min:longint; 
           max:longint; data:pointer):TxmlAutomataStatePtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlAutomataNewOnceTrans2(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; token:PxmlChar; token2:PxmlChar; 
           min:longint; max:longint; data:pointer):TxmlAutomataStatePtr;cdecl;external;
function xmlAutomataNewAllTrans(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; lax:longint):TxmlAutomataStatePtr;cdecl;external;
function xmlAutomataNewEpsilon(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr):TxmlAutomataStatePtr;cdecl;external;
function xmlAutomataNewCountedTrans(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; counter:longint):TxmlAutomataStatePtr;cdecl;external;
function xmlAutomataNewCounterTrans(am:TxmlAutomataPtr; from:TxmlAutomataStatePtr; to:TxmlAutomataStatePtr; counter:longint):TxmlAutomataStatePtr;cdecl;external;
function xmlAutomataNewCounter(am:TxmlAutomataPtr; min:longint; max:longint):longint;cdecl;external;
function xmlAutomataCompile(am:TxmlAutomataPtr):TxmlRegexpPtr;cdecl;external;
function xmlAutomataIsDeterminist(am:TxmlAutomataPtr):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_AUTOMATA_ENABLED  }
{$endif}
{ LIBXML_REGEXP_ENABLED  }
{$endif}
{ __XML_AUTOMATA_H__  }

implementation


end.
