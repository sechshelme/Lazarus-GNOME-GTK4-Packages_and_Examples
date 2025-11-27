unit rdf_stream;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_stream.h - RDF Stream interface and definitions
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
{$ifndef LIBRDF_STREAM_H}
{$define LIBRDF_STREAM_H}
{ C++ extern C conditionnal removed }
{*
 * librdf_stream_map_handler: 
 * @stream: Stream that this map is operating over.
 * @map_context: Map data context pointer.
 * @item: Pointer to the current item in the iteration.
 *
 * Map function for a #librdf_stream map operation.
 *
 * See librdf_stream_add_map().
 *
 * Returns: item in keep the iteration or NULL to remove it
  }
type
  Plibrdf_stream_map_handler = ^Tlibrdf_stream_map_handler;
  Tlibrdf_stream_map_handler = function (stream:Plibrdf_stream; map_context:pointer; item:Plibrdf_statement):Plibrdf_statement;cdecl;
{*
 * librdf_stream_map_free_context_handler:
 * @map_context: Map data context pointer.
 *
 * Free handler function for a #librdf_stream map operation.
 *
 * See librdf_stream_add_map().
  }

  Tlibrdf_stream_map_free_context_handler = procedure (map_context:pointer);cdecl;
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_stream_internal.h>}
{$endif}
{*
 * librdf_stream_get_method_flags:
 * @LIBRDF_STREAM_GET_METHOD_GET_OBJECT: get object from iterator - implementing librdf_stream_get_object()
 * @LIBRDF_STREAM_GET_METHOD_GET_CONTEXT: get context from iterator - implementing librdf_stream_get_context()
 *
 * Flags for librdf_new_stream() get_method function pointer.
 }
type
  Plibrdf_stream_get_method_flags = ^Tlibrdf_stream_get_method_flags;
  Tlibrdf_stream_get_method_flags =  Longint;
  Const
    LIBRDF_STREAM_GET_METHOD_GET_OBJECT = LIBRDF_ITERATOR_GET_METHOD_GET_OBJECT;
    LIBRDF_STREAM_GET_METHOD_GET_CONTEXT = LIBRDF_ITERATOR_GET_METHOD_GET_CONTEXT;
;
{ constructor  }

function librdf_new_stream(world:Plibrdf_world; context:pointer; is_end_method:function (para1:pointer):longint; next_method:function (para1:pointer):longint; get_method:function (para1:pointer; para2:longint):pointer; 
           finished_method:procedure (para1:pointer)):Plibrdf_stream;cdecl;external librdf;
function librdf_new_stream_from_node_iterator(iterator:Plibrdf_iterator; statement:Plibrdf_statement; field:Tlibrdf_statement_part):Plibrdf_stream;cdecl;external librdf;
{ destructor  }
procedure librdf_free_stream(stream:Plibrdf_stream);cdecl;external librdf;
{ methods  }
function librdf_stream_end(stream:Plibrdf_stream):longint;cdecl;external librdf;
function librdf_stream_next(stream:Plibrdf_stream):longint;cdecl;external librdf;
function librdf_stream_get_object(stream:Plibrdf_stream):Plibrdf_statement;cdecl;external librdf;
function librdf_stream_get_context2(stream:Plibrdf_stream):Plibrdf_node;cdecl;external librdf;
{ REDLAND_DEPRECATED }
function librdf_stream_get_context(stream:Plibrdf_stream):pointer;cdecl;external librdf;
function librdf_stream_add_map(stream:Plibrdf_stream; map_function:Tlibrdf_stream_map_handler; free_context:Tlibrdf_stream_map_free_context_handler; map_context:pointer):longint;cdecl;external librdf;
{REDLAND_DEPRECATED }
procedure librdf_stream_print(stream:Plibrdf_stream; fh:PFILE);cdecl;external librdf;
function librdf_stream_write(stream:Plibrdf_stream; iostr:Praptor_iostream):longint;cdecl;external librdf;
function librdf_new_empty_stream(world:Plibrdf_world):Plibrdf_stream;cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:05 ===


implementation



end.
