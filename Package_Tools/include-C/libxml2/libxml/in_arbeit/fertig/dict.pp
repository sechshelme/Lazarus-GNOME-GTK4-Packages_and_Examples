
unit dict;
interface

{
  Automatically converted by H2Pas 1.0.0 from dict.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    dict.h
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
PxmlChar  = ^xmlChar;
PxmlDict  = ^xmlDict;
PxmlDictPtr  = ^xmlDictPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: string dictionary
 * Description: dictionary of reusable strings, just used to avoid allocation
 *         and freeing operations.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_DICT_H__}
{$define __XML_DICT_H__}
{$include <stddef.h>}
{$include <libxml/xmlversion.h>}
{ C++ extern C conditionnal removed }
{
 * The dictionary.
  }
type

  PxmlDictPtr = ^TxmlDictPtr;
  TxmlDictPtr = PxmlDict;
{
 * Initializer
  }

function xmlInitializeDict:longint;cdecl;external;
{
 * Constructor and destructor.
  }
function xmlDictCreate:TxmlDictPtr;cdecl;external;
function xmlDictSetLimit(dict:TxmlDictPtr; limit:Tsize_t):Tsize_t;cdecl;external;
function xmlDictGetUsage(dict:TxmlDictPtr):Tsize_t;cdecl;external;
function xmlDictCreateSub(sub:TxmlDictPtr):TxmlDictPtr;cdecl;external;
function xmlDictReference(dict:TxmlDictPtr):longint;cdecl;external;
procedure xmlDictFree(dict:TxmlDictPtr);cdecl;external;
{
 * Lookup of entry in the dictionary.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlDictLookup(dict:TxmlDictPtr; name:PxmlChar; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlDictExists(dict:TxmlDictPtr; name:PxmlChar; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlDictQLookup(dict:TxmlDictPtr; prefix:PxmlChar; name:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlDictOwns(dict:TxmlDictPtr; str:PxmlChar):longint;cdecl;external;
function xmlDictSize(dict:TxmlDictPtr):longint;cdecl;external;
{
 * Cleanup function
  }
procedure xmlDictCleanup;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! __XML_DICT_H__  }

implementation


end.
