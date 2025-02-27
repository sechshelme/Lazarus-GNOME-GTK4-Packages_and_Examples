
unit xmlstring;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlstring.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlstring.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Plongint  = ^longint;
PxmlChar  = ^xmlChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: set of routines to process strings
 * Description: type and interfaces needed for the internal string handling
 *              of the library, especially UTF8 processing.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_STRING_H__}
{$define __XML_STRING_H__}
{$include <stdarg.h>}
{$include <libxml/xmlversion.h>}
{ C++ extern C conditionnal removed }
{*
 * xmlChar:
 *
 * This is a basic byte in an UTF-8 encoded string.
 * It's unsigned allowing to pinpoint case where char * are assigned
 * to xmlChar * (possibly making serialization back impossible).
  }
type
  PxmlChar = ^TxmlChar;
  TxmlChar = byte;
{*
 * BAD_CAST:
 *
 * Macro to cast a string to an xmlChar * when one know its safe.
  }
{#define BAD_CAST (xmlChar *) }
{
 * xmlChar handling
  }
(* Const before type ignored *)

function xmlStrdup(cur:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlStrndup(cur:PxmlChar; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlCharStrndup(cur:Pchar; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlCharStrdup(cur:Pchar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlStrsub(str:PxmlChar; start:longint; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrchr(str:PxmlChar; val:TxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrstr(str:PxmlChar; val:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrcasestr(str:PxmlChar; val:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrcmp(str1:PxmlChar; str2:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrncmp(str1:PxmlChar; str2:PxmlChar; len:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrcasecmp(str1:PxmlChar; str2:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrncasecmp(str1:PxmlChar; str2:PxmlChar; len:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrEqual(str1:PxmlChar; str2:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrQEqual(pref:PxmlChar; name:PxmlChar; str:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlStrlen(str:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlStrcat(cur:PxmlChar; add:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlStrncat(cur:PxmlChar; add:PxmlChar; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlStrncatNew(str1:PxmlChar; str2:PxmlChar; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlStrPrintf(buf:PxmlChar; len:longint; msg:Pchar; args:array of const):longint;cdecl;external;
function xmlStrPrintf(buf:PxmlChar; len:longint; msg:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlStrVPrintf(buf:PxmlChar; len:longint; msg:Pchar; ap:Tva_list):longint;cdecl;external;
(* Const before type ignored *)
function xmlGetUTF8Char(utf:Pbyte; len:Plongint):longint;cdecl;external;
(* Const before type ignored *)
function xmlCheckUTF8(utf:Pbyte):longint;cdecl;external;
(* Const before type ignored *)
function xmlUTF8Strsize(utf:PxmlChar; len:longint):longint;cdecl;external;
(* Const before type ignored *)
function xmlUTF8Strndup(utf:PxmlChar; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlUTF8Strpos(utf:PxmlChar; pos:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlUTF8Strloc(utf:PxmlChar; utfchar:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlUTF8Strsub(utf:PxmlChar; start:longint; len:longint):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlUTF8Strlen(utf:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlUTF8Size(utf:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlUTF8Charcmp(utf1:PxmlChar; utf2:PxmlChar):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_STRING_H__  }

implementation


end.
