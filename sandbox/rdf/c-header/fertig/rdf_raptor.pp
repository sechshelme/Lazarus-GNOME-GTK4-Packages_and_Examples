
unit rdf_raptor;
interface

{
  Automatically converted by H2Pas 1.0.0 from rdf_raptor.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rdf_raptor.h
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
Plibrdf_world  = ^librdf_world;
Praptor_world  = ^raptor_world;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_raptor.h - librdf Raptor integration
 *
 * Copyright (C) 2008, David Beckett http://www.dajobe.org/
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
{$ifndef LIBRDF_RAPTOR_H}
{$define LIBRDF_RAPTOR_H}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_raptor_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }

procedure librdf_world_set_raptor(world:Plibrdf_world; raptor_world_ptr:Praptor_world);cdecl;external;
function librdf_world_get_raptor(world:Plibrdf_world):Praptor_world;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
