
unit rdf_iterator;
interface

{
  Automatically converted by H2Pas 1.0.0 from rdf_iterator.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rdf_iterator.h
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
Plibrdf_iterator  = ^librdf_iterator;
Plibrdf_iterator_get_method_flags  = ^librdf_iterator_get_method_flags;
Plibrdf_iterator_map_handler  = ^librdf_iterator_map_handler;
Plibrdf_world  = ^librdf_world;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_iterator.h - RDF Iterator definition
 *
 * Copyright (C) 2000-2008, David Beckett http://www.dajobe.org/
 * Copyright (C) 2000-2005, University of Bristol, UK http://www.bristol.ac.uk/
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
{$ifndef LIBRDF_ITERATOR_H}
{$define LIBRDF_ITERATOR_H}
{ C++ extern C conditionnal removed }
{*
 * librdf_iterator_map_handler: 
 * @iterator: Iterator that this map is operating over.
 * @map_context: Map data context pointer.
 * @item: Pointer to the current item in the iteration.
 *
 * Map function for a #librdf_iterator map operation.
 *
 * See librdf_iterator_add_map().
 *
 * Returns: item in keep the iteration or NULL to remove it
  }
type
  Plibrdf_iterator_map_handler = ^Tlibrdf_iterator_map_handler;
  Tlibrdf_iterator_map_handler = function (iterator:Plibrdf_iterator; map_context:pointer; item:pointer):pointer;cdecl;
{*
 * librdf_iterator_map_free_context_handler:
 * @map_context: Map data context pointer.
 *
 * Free handler function for a #librdf_iterator map operation.
 *
 * See librdf_iterator_add_map().
  }

  Tlibrdf_iterator_map_free_context_handler = procedure (map_context:pointer);cdecl;
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_iterator_internal.h>}
{$endif}
{*
 * librdf_iterator_get_method_flags:
 * @LIBRDF_ITERATOR_GET_METHOD_GET_CONTEXT: get context from iterator - implementing librdf_iterator_get_object()
 * @LIBRDF_ITERATOR_GET_METHOD_GET_OBJECT: get object from iterator - implementing librdf_iterator_get_context()
 * @LIBRDF_ITERATOR_GET_METHOD_GET_KEY: get iterator key object from iterator - implementing librdf_iterator_get_key()
 * @LIBRDF_ITERATOR_GET_METHOD_GET_VALUE: get iterator value from iterator - implementing librdf_iterator_get_value()
 *
 * Flags for librdf_new_iterator() get_method function pointer.
 }
{ iterator get_method flags  }
type
  Plibrdf_iterator_get_method_flags = ^Tlibrdf_iterator_get_method_flags;
  Tlibrdf_iterator_get_method_flags =  Longint;
  Const
    LIBRDF_ITERATOR_GET_METHOD_GET_OBJECT = 0;
    LIBRDF_ITERATOR_GET_METHOD_GET_CONTEXT = 1;
    LIBRDF_ITERATOR_GET_METHOD_GET_KEY = 2;
    LIBRDF_ITERATOR_GET_METHOD_GET_VALUE = 3;
;

function librdf_new_iterator(world:Plibrdf_world; context:pointer; is_end_method:function (para1:pointer):longint; next_method:function (para1:pointer):longint; get_method:function (para1:pointer; para2:longint):pointer; 
           finished_method:procedure (para1:pointer)):Plibrdf_iterator;cdecl;external;
procedure librdf_free_iterator(iterator:Plibrdf_iterator);cdecl;external;
function librdf_iterator_end(iterator:Plibrdf_iterator):longint;cdecl;external;
{ REDLAND_DEPRECATED }
function librdf_iterator_have_elements(iterator:Plibrdf_iterator):longint;cdecl;external;
function librdf_iterator_next(iterator:Plibrdf_iterator):longint;cdecl;external;
function librdf_iterator_get_object(iterator:Plibrdf_iterator):pointer;cdecl;external;
function librdf_iterator_get_context(iterator:Plibrdf_iterator):pointer;cdecl;external;
function librdf_iterator_get_key(iterator:Plibrdf_iterator):pointer;cdecl;external;
function librdf_iterator_get_value(iterator:Plibrdf_iterator):pointer;cdecl;external;
function librdf_iterator_add_map(iterator:Plibrdf_iterator; map_function:Tlibrdf_iterator_map_handler; free_context:Tlibrdf_iterator_map_free_context_handler; map_context:pointer):longint;cdecl;external;
function librdf_new_empty_iterator(world:Plibrdf_world):Plibrdf_iterator;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
