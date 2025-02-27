
unit hash;
interface

{
  Automatically converted by H2Pas 1.0.0 from hash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hash.h
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
PxmlHashCopier  = ^xmlHashCopier;
PxmlHashTable  = ^xmlHashTable;
PxmlHashTablePtr  = ^xmlHashTablePtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: Chained hash tables
 * Description: This module implements the hash table support used in
 *		various places in the library.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Bjorn Reese <bjorn.reese@systematic.dk>
  }
{$ifndef __XML_HASH_H__}
{$define __XML_HASH_H__}
{ C++ extern C conditionnal removed }
{
 * The hash table.
  }
type

  PxmlHashTablePtr = ^TxmlHashTablePtr;
  TxmlHashTablePtr = PxmlHashTable;
{ C++ end of extern C conditionnal removed }
{$include <libxml/xmlversion.h>}
{$include <libxml/parser.h>}
{$include <libxml/dict.h>}
{ C++ extern C conditionnal removed }
{
 * Recent version of gcc produce a warning when a function pointer is assigned
 * to an object pointer, or vice versa.  The following macro is a dirty hack
 * to allow suppression of the warning.  If your architecture has function
 * pointers which are a different size than a void pointer, there may be some
 * serious trouble within the library.
  }
{*
 * XML_CAST_FPTR:
 * @fptr:  pointer to a function
 *
 * Macro to do a casting from an object pointer to a
 * function pointer without encountering a warning from
 * gcc
 *
 * #define XML_CAST_FPTR(fptr) (*(void **)(&fptr))
 * This macro violated ISO C aliasing rules (gcc4 on s390 broke)
 * so it is disabled now
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function XML_CAST_FPTR(fptr : longint) : longint;

{
 * function types:
  }
{*
 * xmlHashDeallocator:
 * @payload:  the data in the hash
 * @name:  the name associated
 *
 * Callback to free data from a hash.
  }
(* Const before type ignored *)
type

  TxmlHashDeallocator = procedure (payload:pointer; name:PxmlChar);cdecl;
{*
 * xmlHashCopier:
 * @payload:  the data in the hash
 * @name:  the name associated
 *
 * Callback to copy data from a hash.
 *
 * Returns a copy of the data or NULL in case of error.
  }
(* Const before type ignored *)

  PxmlHashCopier = ^TxmlHashCopier;
  TxmlHashCopier = function (payload:pointer; name:PxmlChar):pointer;cdecl;
{*
 * xmlHashScanner:
 * @payload:  the data in the hash
 * @data:  extra scanner data
 * @name:  the name associated
 *
 * Callback when scanning data in a hash with the simple scanner.
  }
(* Const before type ignored *)

  TxmlHashScanner = procedure (payload:pointer; data:pointer; name:PxmlChar);cdecl;
{*
 * xmlHashScannerFull:
 * @payload:  the data in the hash
 * @data:  extra scanner data
 * @name:  the name associated
 * @name2:  the second name associated
 * @name3:  the third name associated
 *
 * Callback when scanning data in a hash with the full scanner.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TxmlHashScannerFull = procedure (payload:pointer; data:pointer; name:PxmlChar; name2:PxmlChar; name3:PxmlChar);cdecl;
{
 * Constructor and destructor.
  }

function xmlHashCreate(size:longint):TxmlHashTablePtr;cdecl;external;
function xmlHashCreateDict(size:longint; dict:TxmlDictPtr):TxmlHashTablePtr;cdecl;external;
procedure xmlHashFree(table:TxmlHashTablePtr; f:TxmlHashDeallocator);cdecl;external;
(* Const before type ignored *)
procedure xmlHashDefaultDeallocator(entry:pointer; name:PxmlChar);cdecl;external;
{
 * Add a new entry to the hash table.
  }
(* Const before type ignored *)
function xmlHashAddEntry(table:TxmlHashTablePtr; name:PxmlChar; userdata:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xmlHashUpdateEntry(table:TxmlHashTablePtr; name:PxmlChar; userdata:pointer; f:TxmlHashDeallocator):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashAddEntry2(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar; userdata:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashUpdateEntry2(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar; userdata:pointer; f:TxmlHashDeallocator):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashAddEntry3(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar; name3:PxmlChar; userdata:pointer):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashUpdateEntry3(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar; name3:PxmlChar; userdata:pointer; 
           f:TxmlHashDeallocator):longint;cdecl;external;
{
 * Remove an entry from the hash table.
  }
(* Const before type ignored *)
function xmlHashRemoveEntry(table:TxmlHashTablePtr; name:PxmlChar; f:TxmlHashDeallocator):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashRemoveEntry2(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar; f:TxmlHashDeallocator):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashRemoveEntry3(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar; name3:PxmlChar; f:TxmlHashDeallocator):longint;cdecl;external;
{
 * Retrieve the userdata.
  }
(* Const before type ignored *)
function xmlHashLookup(table:TxmlHashTablePtr; name:PxmlChar):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashLookup2(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashLookup3(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar; name3:PxmlChar):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashQLookup(table:TxmlHashTablePtr; name:PxmlChar; prefix:PxmlChar):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashQLookup2(table:TxmlHashTablePtr; name:PxmlChar; prefix:PxmlChar; name2:PxmlChar; prefix2:PxmlChar):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlHashQLookup3(table:TxmlHashTablePtr; name:PxmlChar; prefix:PxmlChar; name2:PxmlChar; prefix2:PxmlChar; 
           name3:PxmlChar; prefix3:PxmlChar):pointer;cdecl;external;
{
 * Helpers.
  }
function xmlHashCopy(table:TxmlHashTablePtr; f:TxmlHashCopier):TxmlHashTablePtr;cdecl;external;
function xmlHashSize(table:TxmlHashTablePtr):longint;cdecl;external;
procedure xmlHashScan(table:TxmlHashTablePtr; f:TxmlHashScanner; data:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlHashScan3(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar; name3:PxmlChar; f:TxmlHashScanner; 
            data:pointer);cdecl;external;
procedure xmlHashScanFull(table:TxmlHashTablePtr; f:TxmlHashScannerFull; data:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure xmlHashScanFull3(table:TxmlHashTablePtr; name:PxmlChar; name2:PxmlChar; name3:PxmlChar; f:TxmlHashScannerFull; 
            data:pointer);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ ! __XML_HASH_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function XML_CAST_FPTR(fptr : longint) : longint;
begin
  XML_CAST_FPTR:=fptr;
end;


end.
