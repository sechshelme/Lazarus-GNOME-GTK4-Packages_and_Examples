
unit xmlmodule;
interface

{
  Automatically converted by H2Pas 1.0.0 from xmlmodule.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    xmlmodule.h
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
PxmlModule  = ^xmlModule;
PxmlModuleOption  = ^xmlModuleOption;
PxmlModulePtr  = ^xmlModulePtr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Summary: dynamic module loading
 * Description: basic API for dynamic module loading, used by
 *              libexslt added in 2.6.17
 *
 * Copy: See Copyright for the status of this software.
 *
 * Author: Joel W. Reed
  }
{$ifndef __XML_MODULE_H__}
{$define __XML_MODULE_H__}
{$include <libxml/xmlversion.h>}
{$ifdef LIBXML_MODULES_ENABLED}
{ C++ extern C conditionnal removed }
{*
 * xmlModulePtr:
 *
 * A handle to a dynamically loaded module
  }
type

  PxmlModulePtr = ^TxmlModulePtr;
  TxmlModulePtr = PxmlModule;
{*
 * xmlModuleOption:
 *
 * enumeration of options that can be passed down to xmlModuleOpen()
  }
{ lazy binding  }
{ local binding  }

  PxmlModuleOption = ^TxmlModuleOption;
  TxmlModuleOption =  Longint;
  Const
    XML_MODULE_LAZY = 1;
    XML_MODULE_LOCAL = 2;
;
(* Const before type ignored *)

function xmlModuleOpen(filename:Pchar; options:longint):TxmlModulePtr;cdecl;external;
(* Const before type ignored *)
function xmlModuleSymbol(module:TxmlModulePtr; name:Pchar; result:Ppointer):longint;cdecl;external;
function xmlModuleClose(module:TxmlModulePtr):longint;cdecl;external;
function xmlModuleFree(module:TxmlModulePtr):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ LIBXML_MODULES_ENABLED  }
{$endif}
{__XML_MODULE_H__  }

implementation


end.
