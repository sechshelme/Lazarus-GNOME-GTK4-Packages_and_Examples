
unit rdf_utf8;
interface

{
  Automatically converted by H2Pas 1.0.0 from rdf_utf8.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rdf_utf8.h
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
PFILE  = ^FILE;
Plibrdf_unichar  = ^librdf_unichar;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_utf8.h - RDF UTF8 / Unicode chars helper routines Definition
 *
 * Copyright (C) 2000-2008, David Beckett http://www.dajobe.org/
 * Copyright (C) 2000-2004, University of Bristol, UK http://www.bristol.ac.uk/
 * 
 * This package is Free Software and part of Redland http://librdf.org/
 * 
 * It is licensed under the following three licenses as alternatives:
 *   1. GNU Lesser General Public License (LGPL) V2.1 or any newer version
 *   2. GNU General Public License (GPL) V2 or any newer version
 *   3. Apache License, V2.0 or any newer version
 * 
 * You may not use this file except in compliance with at least one of
 * the above three licenses.
 * 
 * See LICENSE.html or LICENSE.txt at the top of this package for the
 * complete terms and further detail along with the license texts for
 * the licenses in COPYING.LIB, COPYING and LICENSE-2.0.txt respectively.
 * 
 * 
  }
{$ifndef LIBRDF_UTF8_H}
{$define LIBRDF_UTF8_H}
{ C++ extern C conditionnal removed }
{$include <raptor2.h>}
{*
 * librdf_unichar:
 *
 * Unicode codepoint.
 *
  }
type
  Plibrdf_unichar = ^Tlibrdf_unichar;
  Tlibrdf_unichar = Traptor_unichar;
{REDLAND_DEPRECATED }

function librdf_unicode_char_to_utf8(c:Tlibrdf_unichar; output:Pbyte; length:longint):longint;cdecl;external;
{REDLAND_DEPRECATED }
(* Const before type ignored *)
function librdf_utf8_to_unicode_char(output:Plibrdf_unichar; input:Pbyte; length:longint):longint;cdecl;external;
(* Const before type ignored *)
function librdf_latin1_to_utf8_2(input:Pbyte; length:Tsize_t; output_length:Psize_t):Pbyte;cdecl;external;
(* Const before type ignored *)
function librdf_utf8_to_latin1_2(input:Pbyte; length:Tsize_t; discard:byte; output_length:Psize_t):Pbyte;cdecl;external;
{REDLAND_DEPRECATED }
(* Const before type ignored *)
function librdf_utf8_to_latin1(input:Pbyte; length:longint; output_length:Plongint):Pbyte;cdecl;external;
{REDLAND_DEPRECATED }
(* Const before type ignored *)
function librdf_latin1_to_utf8(input:Pbyte; length:longint; output_length:Plongint):Pbyte;cdecl;external;
(* Const before type ignored *)
procedure librdf_utf8_print(input:Pbyte; length:longint; stream:PFILE);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
