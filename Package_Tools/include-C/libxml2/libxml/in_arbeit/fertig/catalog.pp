
unit catalog;
interface

{
  Automatically converted by H2Pas 1.0.0 from catalog.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    catalog.h
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
PxmlCatalog  = ^xmlCatalog;
PxmlCatalogAllow  = ^xmlCatalogAllow;
PxmlCatalogPrefer  = ^xmlCatalogPrefer;
PxmlCatalogPtr  = ^xmlCatalogPtr;
PxmlChar  = ^xmlChar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{*
 * Summary: interfaces to the Catalog handling system
 * Description: the catalog module implements the support for
 * XML Catalogs and SGML catalogs
 *
 * SGML Open Technical Resolution TR9401:1997.
 * http://www.jclark.com/sp/catalog.htm
 *
 * XML Catalogs Working Draft 06 August 2001
 * http://www.oasis-open.org/committees/entity/spec-2001-08-06.html
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Daniel Veillard
  }
{$ifndef __XML_CATALOG_H__}
{$define __XML_CATALOG_H__}
{$include <stdio.h>}
{$include <libxml/xmlversion.h>}
{$include <libxml/xmlstring.h>}
{$include <libxml/tree.h>}
{$ifdef LIBXML_CATALOG_ENABLED}
{ C++ extern C conditionnal removed }
{*
 * XML_CATALOGS_NAMESPACE:
 *
 * The namespace for the XML Catalogs elements.
  }
(* Const before type ignored *)

{ was #define dname def_expr }
function XML_CATALOGS_NAMESPACE : PxmlChar;  

{*
 * XML_CATALOG_PI:
 *
 * The specific XML Catalog Processing Instruction name.
  }
(* Const before type ignored *)
{ was #define dname def_expr }
function XML_CATALOG_PI : PxmlChar;  

{
 * The API is voluntarily limited to general cataloging.
  }
type
  PxmlCatalogPrefer = ^TxmlCatalogPrefer;
  TxmlCatalogPrefer =  Longint;
  Const
    XML_CATA_PREFER_NONE = 0;
    XML_CATA_PREFER_PUBLIC = 1;
    XML_CATA_PREFER_SYSTEM = 2;
;
type
  PxmlCatalogAllow = ^TxmlCatalogAllow;
  TxmlCatalogAllow =  Longint;
  Const
    XML_CATA_ALLOW_NONE = 0;
    XML_CATA_ALLOW_GLOBAL = 1;
    XML_CATA_ALLOW_DOCUMENT = 2;
    XML_CATA_ALLOW_ALL = 3;
;
type

  PxmlCatalogPtr = ^TxmlCatalogPtr;
  TxmlCatalogPtr = PxmlCatalog;
{
 * Operations on a given catalog.
  }

function xmlNewCatalog(sgml:longint):TxmlCatalogPtr;cdecl;external;
(* Const before type ignored *)
function xmlLoadACatalog(filename:Pchar):TxmlCatalogPtr;cdecl;external;
(* Const before type ignored *)
function xmlLoadSGMLSuperCatalog(filename:Pchar):TxmlCatalogPtr;cdecl;external;
function xmlConvertSGMLCatalog(catal:TxmlCatalogPtr):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlACatalogAdd(catal:TxmlCatalogPtr; _type:PxmlChar; orig:PxmlChar; replace:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlACatalogRemove(catal:TxmlCatalogPtr; value:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlACatalogResolve(catal:TxmlCatalogPtr; pubID:PxmlChar; sysID:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlACatalogResolveSystem(catal:TxmlCatalogPtr; sysID:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlACatalogResolvePublic(catal:TxmlCatalogPtr; pubID:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlACatalogResolveURI(catal:TxmlCatalogPtr; URI:PxmlChar):PxmlChar;cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
procedure xmlACatalogDump(catal:TxmlCatalogPtr; out:PFILE);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }

procedure xmlFreeCatalog(catal:TxmlCatalogPtr);cdecl;external;
function xmlCatalogIsEmpty(catal:TxmlCatalogPtr):longint;cdecl;external;
{
 * Global operations.
  }
procedure xmlInitializeCatalog;cdecl;external;
(* Const before type ignored *)
function xmlLoadCatalog(filename:Pchar):longint;cdecl;external;
(* Const before type ignored *)
procedure xmlLoadCatalogs(paths:Pchar);cdecl;external;
procedure xmlCatalogCleanup;cdecl;external;
{$ifdef LIBXML_OUTPUT_ENABLED}
procedure xmlCatalogDump(out:PFILE);cdecl;external;
{$endif}
{ LIBXML_OUTPUT_ENABLED  }
(* Const before type ignored *)
(* Const before type ignored *)

function xmlCatalogResolve(pubID:PxmlChar; sysID:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlCatalogResolveSystem(sysID:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlCatalogResolvePublic(pubID:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlCatalogResolveURI(URI:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCatalogAdd(_type:PxmlChar; orig:PxmlChar; replace:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlCatalogRemove(value:PxmlChar):longint;cdecl;external;
(* Const before type ignored *)
function xmlParseCatalogFile(filename:Pchar):TxmlDocPtr;cdecl;external;
function xmlCatalogConvert:longint;cdecl;external;
{
 * Strictly minimal interfaces for per-document catalogs used
 * by the parser.
  }
procedure xmlCatalogFreeLocal(catalogs:pointer);cdecl;external;
(* Const before type ignored *)
function xmlCatalogAddLocal(catalogs:pointer; URL:PxmlChar):pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCatalogLocalResolve(catalogs:pointer; pubID:PxmlChar; sysID:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
function xmlCatalogLocalResolveURI(catalogs:pointer; URI:PxmlChar):PxmlChar;cdecl;external;
{
 * Preference settings.
  }
function xmlCatalogSetDebug(level:longint):longint;cdecl;external;
function xmlCatalogSetDefaultPrefer(prefer:TxmlCatalogPrefer):TxmlCatalogPrefer;cdecl;external;
procedure xmlCatalogSetDefaults(allow:TxmlCatalogAllow);cdecl;external;
function xmlCatalogGetDefaults:TxmlCatalogAllow;cdecl;external;
{ DEPRECATED interfaces  }
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCatalogGetSystem(sysID:PxmlChar):PxmlChar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function xmlCatalogGetPublic(pubID:PxmlChar):PxmlChar;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_CATALOG_ENABLED  }
{$endif}
{ __XML_CATALOG_H__  }

implementation

{ was #define dname def_expr }
function XML_CATALOGS_NAMESPACE : PxmlChar;
  begin
    XML_CATALOGS_NAMESPACE:=PxmlChar('urn:oasis:names:tc:entity:xmlns:xml:catalog');
  end;

{ was #define dname def_expr }
function XML_CATALOG_PI : PxmlChar;
  begin
    XML_CATALOG_PI:=PxmlChar('oasis-xml-catalog');
  end;


end.
