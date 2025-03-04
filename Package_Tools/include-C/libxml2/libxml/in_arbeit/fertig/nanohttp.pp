
unit nanohttp;
interface

{
  Automatically converted by H2Pas 1.0.0 from nanohttp.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    nanohttp.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: minimal HTTP implementation
 * Description: minimal HTTP implementation allowing to fetch resources
 *              like external subset.
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __NANO_HTTP_H__}
{$define __NANO_HTTP_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_HTTP_ENABLED}
{ C++ extern C conditionnal removed }

procedure xmlNanoHTTPInit;cdecl;external;
procedure xmlNanoHTTPCleanup;cdecl;external;
(* Const before type ignored *)
procedure xmlNanoHTTPScanProxy(URL:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNanoHTTPFetch(URL:Pchar; filename:Pchar; contentType:PPchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNanoHTTPMethod(URL:Pchar; method:Pchar; input:Pchar; contentType:PPchar; headers:Pchar; 
           ilen:longint):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlNanoHTTPMethodRedir(URL:Pchar; method:Pchar; input:Pchar; contentType:PPchar; redir:PPchar; 
           headers:Pchar; ilen:longint):pointer;cdecl;external;
(* Const before type ignored *)
function xmlNanoHTTPOpen(URL:Pchar; contentType:PPchar):pointer;cdecl;external;
(* Const before type ignored *)
function xmlNanoHTTPOpenRedir(URL:Pchar; contentType:PPchar; redir:PPchar):pointer;cdecl;external;
function xmlNanoHTTPReturnCode(ctx:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xmlNanoHTTPAuthHeader(ctx:pointer):Pchar;cdecl;external;
(* Const before type ignored *)
function xmlNanoHTTPRedir(ctx:pointer):Pchar;cdecl;external;
function xmlNanoHTTPContentLength(ctx:pointer):longint;cdecl;external;
(* Const before type ignored *)
function xmlNanoHTTPEncoding(ctx:pointer):Pchar;cdecl;external;
(* Const before type ignored *)
function xmlNanoHTTPMimeType(ctx:pointer):Pchar;cdecl;external;
function xmlNanoHTTPRead(ctx:pointer; dest:pointer; len:longint):longint;cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
(* Const before type ignored *)
function xmlNanoHTTPSave(ctxt:pointer; filename:Pchar):longint;cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }

procedure xmlNanoHTTPClose(ctx:pointer);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_HTTP_ENABLED  }
{$endif}
{ __NANO_HTTP_H__  }

implementation


end.
