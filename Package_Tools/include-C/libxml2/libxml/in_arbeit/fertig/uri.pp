
unit uri;
interface

{
  Automatically converted by H2Pas 1.0.0 from uri.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    uri.h
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
PxmlURI  = ^xmlURI;
PxmlURIPtr  = ^xmlURIPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Summary: library of generic URI related routines
 * Description: library of generic URI related routines
 *              Implements RFC 2396
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_URI_H__}
{$define __XML_URI_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{ C++ extern C conditionnal removed }
{*
 * xmlURI:
 *
 * A parsed URI reference. This is a struct containing the various fields
 * as described in RFC 2396 but separated for further processing.
 *
 * Note: query is a deprecated field which is incorrectly unescaped.
 * query_raw takes precedence over query if the former is set.
 * See: http://mail.gnome.org/archives/xml/2007-April/thread.html#00127
  }
type

  PxmlURIPtr = ^TxmlURIPtr;
  TxmlURIPtr = PxmlURI;
{ the URI scheme  }
{ opaque part  }
{ the authority part  }
{ the server part  }
{ the user part  }
{ the port number  }
{ the path string  }
{ the query string (deprecated - use with caution)  }
{ the fragment identifier  }
{ parsing potentially unclean URI  }
{ the query string (as it appears in the URI)  }
  PxmlURI = ^TxmlURI;
  TxmlURI = record
      scheme : Pchar;
      opaque : Pchar;
      authority : Pchar;
      server : Pchar;
      user : Pchar;
      port : longint;
      path : Pchar;
      query : Pchar;
      fragment : Pchar;
      cleanup : longint;
      query_raw : Pchar;
    end;

{
 * This function is in tree.h:
 * xmlChar *	xmlNodeGetBase	(xmlDocPtr doc,
 *                               xmlNodePtr cur);
  }

function xmlCreateURI:TxmlURIPtr;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlBuildURI(URI:PxmlChar; base:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlBuildRelativeURI(URI:PxmlChar; base:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlParseURI(str:Pchar):TxmlURIPtr;cdecl;external;
(* Const before type ignored *)
function xmlParseURIRaw(str:Pchar; raw:longint):TxmlURIPtr;cdecl;external;
(* Const before type ignored *)
function xmlParseURIReference(uri:TxmlURIPtr; str:Pchar):longint;cdecl;external;
function xmlSaveUri(uri:TxmlURIPtr):PxmlChar;cdecl;external;
procedure xmlPrintURI(stream:PFILE; uri:TxmlURIPtr);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlURIEscapeStr(str:PxmlChar; list:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlURIUnescapeString(str:Pchar; len:longint; target:Pchar):Pchar;cdecl;external;
function xmlNormalizeURIPath(path:Pchar):longint;cdecl;external;
(* Const before type ignored *)
function xmlURIEscape(str:PxmlChar):PxmlChar;cdecl;external;
procedure xmlFreeURI(uri:TxmlURIPtr);cdecl;external;
(* Const before type ignored *)
function xmlCanonicPath(path:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlPathToURI(path:PxmlChar):PxmlChar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ __XML_URI_H__  }

implementation


end.
