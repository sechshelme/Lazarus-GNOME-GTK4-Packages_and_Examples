
unit lsmdomimplementation;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmdomimplementation.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmdomimplementation.h
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
PLsmDomDocument  = ^LsmDomDocument;
PLsmDomDocumentCreateFunction  = ^LsmDomDocumentCreateFunction;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2009 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_DOM_IMPLEMENTATION_H}
{$define LSM_DOM_IMPLEMENTATION_H}
{$include <lsmdomtypes.h>}
{$include <lsmdomdocument.h>}
type
  PLsmDomDocumentCreateFunction = ^TLsmDomDocumentCreateFunction;
  TLsmDomDocumentCreateFunction = function :PLsmDomDocument;cdecl;
(* Const before type ignored *)
(* Const before type ignored *)

function lsm_dom_implementation_create_document(namespace_uri:Pchar; qualified_name:Pchar):PLsmDomDocument;cdecl;external;
procedure lsm_dom_implementation_cleanup;cdecl;external;
{$endif}

implementation


end.
