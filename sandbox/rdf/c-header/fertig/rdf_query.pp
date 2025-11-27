
unit rdf_query;
interface

{
  Automatically converted by H2Pas 1.0.0 from rdf_query.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rdf_query.h
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
Pchar  = ^char;
PFILE  = ^FILE;
Plibrdf_model  = ^librdf_model;
Plibrdf_node  = ^librdf_node;
Plibrdf_query  = ^librdf_query;
Plibrdf_query_factory  = ^librdf_query_factory;
Plibrdf_query_results  = ^librdf_query_results;
Plibrdf_query_results_formatter  = ^librdf_query_results_formatter;
Plibrdf_stream  = ^librdf_stream;
Plibrdf_uri  = ^librdf_uri;
Plibrdf_world  = ^librdf_world;
Praptor_iostream  = ^raptor_iostream;
Praptor_syntax_description  = ^raptor_syntax_description;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_query.h - RDF Query Adaptor Factory and Query interfaces and definitions
 *
 * Copyright (C) 2002-2008, David Beckett http://www.dajobe.org/
 * Copyright (C) 2002-2005, University of Bristol, UK http://www.bristol.ac.uk/
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
{$ifndef LIBRDF_QUERY_H}
{$define LIBRDF_QUERY_H}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_query_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ class methods  }
(* Const before type ignored *)
(* Const before type ignored *)

procedure librdf_query_register_factory(world:Plibrdf_world; name:Pchar; uri_string:Pbyte; factory:procedure (para1:Plibrdf_query_factory));cdecl;external;
{ REDLAND_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_query_languages_enumerate(world:Plibrdf_world; counter:dword; name:PPchar; uri_string:PPbyte):longint;cdecl;external;
(* Const before type ignored *)
function librdf_query_language_get_description(world:Plibrdf_world; counter:dword):Praptor_syntax_description;cdecl;external;
{ constructor  }
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_new_query(world:Plibrdf_world; name:Pchar; uri:Plibrdf_uri; query_string:Pbyte; base_uri:Plibrdf_uri):Plibrdf_query;cdecl;external;
function librdf_new_query_from_query(old_query:Plibrdf_query):Plibrdf_query;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_new_query_from_factory(world:Plibrdf_world; factory:Plibrdf_query_factory; name:Pchar; uri:Plibrdf_uri; query_string:Pbyte; 
           base_uri:Plibrdf_uri):Plibrdf_query;cdecl;external;
{ destructor  }
procedure librdf_free_query(query:Plibrdf_query);cdecl;external;
{ methods  }
function librdf_query_execute(query:Plibrdf_query; model:Plibrdf_model):Plibrdf_query_results;cdecl;external;
function librdf_query_get_limit(query:Plibrdf_query):longint;cdecl;external;
function librdf_query_set_limit(query:Plibrdf_query; limit:longint):longint;cdecl;external;
function librdf_query_get_offset(query:Plibrdf_query):longint;cdecl;external;
function librdf_query_set_offset(query:Plibrdf_query; offset:longint):longint;cdecl;external;
function librdf_query_results_as_stream(query_results:Plibrdf_query_results):Plibrdf_stream;cdecl;external;
function librdf_query_results_get_count(query_results:Plibrdf_query_results):longint;cdecl;external;
function librdf_query_results_next(query_results:Plibrdf_query_results):longint;cdecl;external;
function librdf_query_results_finished(query_results:Plibrdf_query_results):longint;cdecl;external;
(* Const before type ignored *)
function librdf_query_results_get_bindings(query_results:Plibrdf_query_results; names:PPPchar; values:PPlibrdf_node):longint;cdecl;external;
function librdf_query_results_get_binding_value(query_results:Plibrdf_query_results; offset:longint):Plibrdf_node;cdecl;external;
(* Const before type ignored *)
function librdf_query_results_get_binding_name(query_results:Plibrdf_query_results; offset:longint):Pchar;cdecl;external;
(* Const before type ignored *)
function librdf_query_results_get_binding_value_by_name(query_results:Plibrdf_query_results; name:Pchar):Plibrdf_node;cdecl;external;
function librdf_query_results_get_bindings_count(query_results:Plibrdf_query_results):longint;cdecl;external;
{REDLAND_DEPRECATED }
function librdf_query_results_to_counted_string(query_results:Plibrdf_query_results; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri; length_p:Psize_t):Pbyte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_query_results_to_counted_string2(query_results:Plibrdf_query_results; name:Pchar; mime_type:Pchar; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri; 
           length_p:Psize_t):Pbyte;cdecl;external;
{REDLAND_DEPRECATED }
function librdf_query_results_to_string(query_results:Plibrdf_query_results; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):Pbyte;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_query_results_to_string2(query_results:Plibrdf_query_results; name:Pchar; mime_type:Pchar; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):Pbyte;cdecl;external;
{REDLAND_DEPRECATED }
function librdf_query_results_to_file_handle(query_results:Plibrdf_query_results; handle:PFILE; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_query_results_to_file_handle2(query_results:Plibrdf_query_results; handle:PFILE; name:Pchar; mime_type:Pchar; format_uri:Plibrdf_uri; 
           base_uri:Plibrdf_uri):longint;cdecl;external;
{REDLAND_DEPRECATED }
(* Const before type ignored *)
function librdf_query_results_to_file(query_results:Plibrdf_query_results; name:Pchar; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_query_results_to_file2(query_results:Plibrdf_query_results; name:Pchar; mime_type:Pchar; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):longint;cdecl;external;
procedure librdf_free_query_results(query_results:Plibrdf_query_results);cdecl;external;
function librdf_query_results_is_bindings(query_results:Plibrdf_query_results):longint;cdecl;external;
function librdf_query_results_is_boolean(query_results:Plibrdf_query_results):longint;cdecl;external;
function librdf_query_results_is_graph(query_results:Plibrdf_query_results):longint;cdecl;external;
function librdf_query_results_is_syntax(query_results:Plibrdf_query_results):longint;cdecl;external;
function librdf_query_results_get_boolean(query_results:Plibrdf_query_results):longint;cdecl;external;
{ query results formatter class  }
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_new_query_results_formatter2(query_results:Plibrdf_query_results; name:Pchar; mime_type:Pchar; uri:Plibrdf_uri):Plibrdf_query_results_formatter;cdecl;external;
{REDLAND_DEPRECATED }
(* Const before type ignored *)
function librdf_new_query_results_formatter(query_results:Plibrdf_query_results; name:Pchar; uri:Plibrdf_uri):Plibrdf_query_results_formatter;cdecl;external;
{REDLAND_DEPRECATED }
(* Const before type ignored *)
function librdf_new_query_results_formatter_by_mime_type(query_results:Plibrdf_query_results; mime_type:Pchar):Plibrdf_query_results_formatter;cdecl;external;
procedure librdf_free_query_results_formatter(formatter:Plibrdf_query_results_formatter);cdecl;external;
function librdf_query_results_formatter_write(iostr:Praptor_iostream; formatter:Plibrdf_query_results_formatter; query_results:Plibrdf_query_results; base_uri:Plibrdf_uri):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_query_results_formats_check(world:Plibrdf_world; name:Pchar; uri:Plibrdf_uri; mime_type:Pchar):longint;cdecl;external;
{REDLAND_DEPRECATED }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_query_results_formats_enumerate(world:Plibrdf_world; counter:dword; name:PPchar; _label:PPchar; uri_string:PPbyte; 
           mime_type:PPchar):longint;cdecl;external;
(* Const before type ignored *)
function librdf_query_results_formats_get_description(world:Plibrdf_world; counter:dword):Praptor_syntax_description;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
