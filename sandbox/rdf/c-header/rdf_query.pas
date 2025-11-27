unit rdf_query;

interface

uses
  ctypes;

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

procedure librdf_query_register_factory(world:Plibrdf_world; name:Pchar; uri_string:Pbyte; factory:procedure (para1:Plibrdf_query_factory));cdecl;external librdf;
{ REDLAND_DEPRECATED }
function librdf_query_languages_enumerate(world:Plibrdf_world; counter:dword; name:PPchar; uri_string:PPbyte):longint;cdecl;external librdf;
function librdf_query_language_get_description(world:Plibrdf_world; counter:dword):Praptor_syntax_description;cdecl;external librdf;
{ constructor  }
function librdf_new_query(world:Plibrdf_world; name:Pchar; uri:Plibrdf_uri; query_string:Pbyte; base_uri:Plibrdf_uri):Plibrdf_query;cdecl;external librdf;
function librdf_new_query_from_query(old_query:Plibrdf_query):Plibrdf_query;cdecl;external librdf;
function librdf_new_query_from_factory(world:Plibrdf_world; factory:Plibrdf_query_factory; name:Pchar; uri:Plibrdf_uri; query_string:Pbyte; 
           base_uri:Plibrdf_uri):Plibrdf_query;cdecl;external librdf;
{ destructor  }
procedure librdf_free_query(query:Plibrdf_query);cdecl;external librdf;
{ methods  }
function librdf_query_execute(query:Plibrdf_query; model:Plibrdf_model):Plibrdf_query_results;cdecl;external librdf;
function librdf_query_get_limit(query:Plibrdf_query):longint;cdecl;external librdf;
function librdf_query_set_limit(query:Plibrdf_query; limit:longint):longint;cdecl;external librdf;
function librdf_query_get_offset(query:Plibrdf_query):longint;cdecl;external librdf;
function librdf_query_set_offset(query:Plibrdf_query; offset:longint):longint;cdecl;external librdf;
function librdf_query_results_as_stream(query_results:Plibrdf_query_results):Plibrdf_stream;cdecl;external librdf;
function librdf_query_results_get_count(query_results:Plibrdf_query_results):longint;cdecl;external librdf;
function librdf_query_results_next(query_results:Plibrdf_query_results):longint;cdecl;external librdf;
function librdf_query_results_finished(query_results:Plibrdf_query_results):longint;cdecl;external librdf;
function librdf_query_results_get_bindings(query_results:Plibrdf_query_results; names:PPPchar; values:PPlibrdf_node):longint;cdecl;external librdf;
function librdf_query_results_get_binding_value(query_results:Plibrdf_query_results; offset:longint):Plibrdf_node;cdecl;external librdf;
function librdf_query_results_get_binding_name(query_results:Plibrdf_query_results; offset:longint):Pchar;cdecl;external librdf;
function librdf_query_results_get_binding_value_by_name(query_results:Plibrdf_query_results; name:Pchar):Plibrdf_node;cdecl;external librdf;
function librdf_query_results_get_bindings_count(query_results:Plibrdf_query_results):longint;cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_query_results_to_counted_string(query_results:Plibrdf_query_results; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri; length_p:Psize_t):Pbyte;cdecl;external librdf;
function librdf_query_results_to_counted_string2(query_results:Plibrdf_query_results; name:Pchar; mime_type:Pchar; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri; 
           length_p:Psize_t):Pbyte;cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_query_results_to_string(query_results:Plibrdf_query_results; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):Pbyte;cdecl;external librdf;
function librdf_query_results_to_string2(query_results:Plibrdf_query_results; name:Pchar; mime_type:Pchar; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):Pbyte;cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_query_results_to_file_handle(query_results:Plibrdf_query_results; handle:PFILE; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):longint;cdecl;external librdf;
function librdf_query_results_to_file_handle2(query_results:Plibrdf_query_results; handle:PFILE; name:Pchar; mime_type:Pchar; format_uri:Plibrdf_uri; 
           base_uri:Plibrdf_uri):longint;cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_query_results_to_file(query_results:Plibrdf_query_results; name:Pchar; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):longint;cdecl;external librdf;
function librdf_query_results_to_file2(query_results:Plibrdf_query_results; name:Pchar; mime_type:Pchar; format_uri:Plibrdf_uri; base_uri:Plibrdf_uri):longint;cdecl;external librdf;
procedure librdf_free_query_results(query_results:Plibrdf_query_results);cdecl;external librdf;
function librdf_query_results_is_bindings(query_results:Plibrdf_query_results):longint;cdecl;external librdf;
function librdf_query_results_is_boolean(query_results:Plibrdf_query_results):longint;cdecl;external librdf;
function librdf_query_results_is_graph(query_results:Plibrdf_query_results):longint;cdecl;external librdf;
function librdf_query_results_is_syntax(query_results:Plibrdf_query_results):longint;cdecl;external librdf;
function librdf_query_results_get_boolean(query_results:Plibrdf_query_results):longint;cdecl;external librdf;
{ query results formatter class  }
function librdf_new_query_results_formatter2(query_results:Plibrdf_query_results; name:Pchar; mime_type:Pchar; uri:Plibrdf_uri):Plibrdf_query_results_formatter;cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_new_query_results_formatter(query_results:Plibrdf_query_results; name:Pchar; uri:Plibrdf_uri):Plibrdf_query_results_formatter;cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_new_query_results_formatter_by_mime_type(query_results:Plibrdf_query_results; mime_type:Pchar):Plibrdf_query_results_formatter;cdecl;external librdf;
procedure librdf_free_query_results_formatter(formatter:Plibrdf_query_results_formatter);cdecl;external librdf;
function librdf_query_results_formatter_write(iostr:Praptor_iostream; formatter:Plibrdf_query_results_formatter; query_results:Plibrdf_query_results; base_uri:Plibrdf_uri):longint;cdecl;external librdf;
function librdf_query_results_formats_check(world:Plibrdf_world; name:Pchar; uri:Plibrdf_uri; mime_type:Pchar):longint;cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_query_results_formats_enumerate(world:Plibrdf_world; counter:dword; name:PPchar; _label:PPchar; uri_string:PPbyte; 
           mime_type:PPchar):longint;cdecl;external librdf;
function librdf_query_results_formats_get_description(world:Plibrdf_world; counter:dword):Praptor_syntax_description;cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:20 ===


implementation



end.
