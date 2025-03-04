
unit xinclude;
interface

{
  Automatically converted by H2Pas 1.0.0 from xinclude.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xinclude.h
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
PxmlXIncludeCtxt  = ^xmlXIncludeCtxt;
PxmlXIncludeCtxtPtr  = ^xmlXIncludeCtxtPtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: implementation of XInclude
 * Description: API to handle XInclude processing,
 * implements the
 * World Wide Web Consortium Last Call Working Draft 10 November 2003
 * http://www.w3.org/TR/2003/WD-xinclude-20031110
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_XINCLUDE_H__}
{$define __XML_XINCLUDE_H__}
{$include <libxml/xmlversion.h>}
{$include <libxml/tree.h>}
{$ifdef LIBXML_XINCLUDE_ENABLED}
{ C++ extern C conditionnal removed }
{*
 * XINCLUDE_NS:
 *
 * Macro defining the Xinclude namespace: http://www.w3.org/2003/XInclude
  }
(* Const before type ignored *)

{ was #define dname def_expr }
function XINCLUDE_NS : PxmlChar;  

{*
 * XINCLUDE_OLD_NS:
 *
 * Macro defining the draft Xinclude namespace: http://www.w3.org/2001/XInclude
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XINCLUDE_OLD_NS : PxmlChar;  

{*
 * XINCLUDE_NODE:
 *
 * Macro defining "include"
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XINCLUDE_NODE : PxmlChar;  

{*
 * XINCLUDE_FALLBACK:
 *
 * Macro defining "fallback"
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XINCLUDE_FALLBACK : PxmlChar;  

{*
 * XINCLUDE_HREF:
 *
 * Macro defining "href"
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XINCLUDE_HREF : PxmlChar;  

{*
 * XINCLUDE_PARSE:
 *
 * Macro defining "parse"
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XINCLUDE_PARSE : PxmlChar;  

{*
 * XINCLUDE_PARSE_XML:
 *
 * Macro defining "xml"
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XINCLUDE_PARSE_XML : PxmlChar;  

{*
 * XINCLUDE_PARSE_TEXT:
 *
 * Macro defining "text"
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XINCLUDE_PARSE_TEXT : PxmlChar;  

{*
 * XINCLUDE_PARSE_ENCODING:
 *
 * Macro defining "encoding"
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XINCLUDE_PARSE_ENCODING : PxmlChar;  

{*
 * XINCLUDE_PARSE_XPOINTER:
 *
 * Macro defining "xpointer"
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XINCLUDE_PARSE_XPOINTER : PxmlChar;  

type

  PxmlXIncludeCtxtPtr = ^TxmlXIncludeCtxtPtr;
  TxmlXIncludeCtxtPtr = PxmlXIncludeCtxt;
{
 * standalone processing
  }

function xmlXIncludeProcess(doc:TxmlDocPtr):longint;cdecl;external;
function xmlXIncludeProcessFlags(doc:TxmlDocPtr; flags:longint):longint;cdecl;external;
function xmlXIncludeProcessFlagsData(doc:TxmlDocPtr; flags:longint; data:pointer):longint;cdecl;external;
function xmlXIncludeProcessTreeFlagsData(tree:TxmlNodePtr; flags:longint; data:pointer):longint;cdecl;external;
function xmlXIncludeProcessTree(tree:TxmlNodePtr):longint;cdecl;external;
function xmlXIncludeProcessTreeFlags(tree:TxmlNodePtr; flags:longint):longint;cdecl;external;
{
 * contextual processing
  }
function xmlXIncludeNewContext(doc:TxmlDocPtr):TxmlXIncludeCtxtPtr;cdecl;external;
function xmlXIncludeSetFlags(ctxt:TxmlXIncludeCtxtPtr; flags:longint):longint;cdecl;external;
procedure xmlXIncludeFreeContext(ctxt:TxmlXIncludeCtxtPtr);cdecl;external;
function xmlXIncludeProcessNode(ctxt:TxmlXIncludeCtxtPtr; tree:TxmlNodePtr):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_XINCLUDE_ENABLED  }
{$endif}
{ __XML_XINCLUDE_H__  }

implementation

{ was #define dname def_expr }
function XINCLUDE_NS : PxmlChar;
  begin
    XINCLUDE_NS:=PxmlChar('http://www.w3.org/2003/XInclude');
  end;

{ was #define dname def_expr }
function XINCLUDE_OLD_NS : PxmlChar;
  begin
    XINCLUDE_OLD_NS:=PxmlChar('http://www.w3.org/2001/XInclude');
  end;

{ was #define dname def_expr }
function XINCLUDE_NODE : PxmlChar;
  begin
    XINCLUDE_NODE:=PxmlChar('include');
  end;

{ was #define dname def_expr }
function XINCLUDE_FALLBACK : PxmlChar;
  begin
    XINCLUDE_FALLBACK:=PxmlChar('fallback');
  end;

{ was #define dname def_expr }
function XINCLUDE_HREF : PxmlChar;
  begin
    XINCLUDE_HREF:=PxmlChar('href');
  end;

{ was #define dname def_expr }
function XINCLUDE_PARSE : PxmlChar;
  begin
    XINCLUDE_PARSE:=PxmlChar('parse');
  end;

{ was #define dname def_expr }
function XINCLUDE_PARSE_XML : PxmlChar;
  begin
    XINCLUDE_PARSE_XML:=PxmlChar('xml');
  end;

{ was #define dname def_expr }
function XINCLUDE_PARSE_TEXT : PxmlChar;
  begin
    XINCLUDE_PARSE_TEXT:=PxmlChar('text');
  end;

{ was #define dname def_expr }
function XINCLUDE_PARSE_ENCODING : PxmlChar;
  begin
    XINCLUDE_PARSE_ENCODING:=PxmlChar('encoding');
  end;

{ was #define dname def_expr }
function XINCLUDE_PARSE_XPOINTER : PxmlChar;
  begin
    XINCLUDE_PARSE_XPOINTER:=PxmlChar('xpointer');
  end;


end.
