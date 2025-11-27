unit rdf_model;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_model.h - RDF Model definition
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
{$ifndef LIBRDF_MODEL_H}
{$define LIBRDF_MODEL_H}
{$ifndef LIBRDF_OBJC_FRAMEWORK}
{$include <rdf_uri.h>}
{$else}
{$include <Redland/rdf_uri.h>}
{$endif}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_model_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ class methods  }

function librdf_model_enumerate(world:Plibrdf_world; counter:dword; name:PPchar; _label:PPchar):longint;cdecl;external librdf;
{ constructors  }
{ Create a new Model  }
function librdf_new_model(world:Plibrdf_world; storage:Plibrdf_storage; options_string:Pchar):Plibrdf_model;cdecl;external librdf;
function librdf_new_model_with_options(world:Plibrdf_world; storage:Plibrdf_storage; options:Plibrdf_hash):Plibrdf_model;cdecl;external librdf;
{ Create a new Model from an existing Model - CLONE  }
function librdf_new_model_from_model(model:Plibrdf_model):Plibrdf_model;cdecl;external librdf;
{ destructor  }
procedure librdf_free_model(model:Plibrdf_model);cdecl;external librdf;
{ functions / methods  }
function librdf_model_size(model:Plibrdf_model):longint;cdecl;external librdf;
{ add statements  }
function librdf_model_add(model:Plibrdf_model; subject:Plibrdf_node; predicate:Plibrdf_node; object:Plibrdf_node):longint;cdecl;external librdf;
function librdf_model_add_string_literal_statement(model:Plibrdf_model; subject:Plibrdf_node; predicate:Plibrdf_node; literal:Pbyte; xml_language:Pchar; 
           is_wf_xml:longint):longint;cdecl;external librdf;
function librdf_model_add_typed_literal_statement(model:Plibrdf_model; subject:Plibrdf_node; predicate:Plibrdf_node; literal:Pbyte; xml_language:Pchar; 
           datatype_uri:Plibrdf_uri):longint;cdecl;external librdf;
function librdf_model_add_statement(model:Plibrdf_model; statement:Plibrdf_statement):longint;cdecl;external librdf;
function librdf_model_add_statements(model:Plibrdf_model; statement_stream:Plibrdf_stream):longint;cdecl;external librdf;
{ remove statements  }
function librdf_model_remove_statement(model:Plibrdf_model; statement:Plibrdf_statement):longint;cdecl;external librdf;
{ containment  }
{ check for exact statement match  }
function librdf_model_contains_statement(model:Plibrdf_model; statement:Plibrdf_statement):longint;cdecl;external librdf;
{ check for [node, property, ?]  }
function librdf_model_has_arc_in(model:Plibrdf_model; node:Plibrdf_node; _property:Plibrdf_node):longint;cdecl;external librdf;
{ check for [?, property, node]  }
function librdf_model_has_arc_out(model:Plibrdf_model; node:Plibrdf_node; _property:Plibrdf_node):longint;cdecl;external librdf;
{ list the entire model as a stream of statements  }
function librdf_model_as_stream(model:Plibrdf_model):Plibrdf_stream;cdecl;external librdf;
{ DEPRECATED serialise the entire model  }
{ REDLAND_DEPRECATED }
function librdf_model_serialise(model:Plibrdf_model):Plibrdf_stream;cdecl;external librdf;
{ queries  }
function librdf_model_find_statements(model:Plibrdf_model; statement:Plibrdf_statement):Plibrdf_stream;cdecl;external librdf;
{*
 * LIBRDF_MODEL_FIND_OPTION_MATCH_SUBSTRING_LITERAL:
 *
 * Model find statement option.
 *
 * If set, the find statement uses substring matching.
  }
const
  LIBRDF_MODEL_FIND_OPTION_MATCH_SUBSTRING_LITERAL = 'http://feature.librdf.org/model-find-match-substring-literal';  

function librdf_model_find_statements_with_options(model:Plibrdf_model; statement:Plibrdf_statement; context_node:Plibrdf_node; options:Plibrdf_hash):Plibrdf_stream;cdecl;external librdf;
function librdf_model_get_sources(model:Plibrdf_model; arc:Plibrdf_node; target:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
function librdf_model_get_arcs(model:Plibrdf_model; source:Plibrdf_node; target:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
function librdf_model_get_targets(model:Plibrdf_model; source:Plibrdf_node; arc:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
function librdf_model_get_source(model:Plibrdf_model; arc:Plibrdf_node; target:Plibrdf_node):Plibrdf_node;cdecl;external librdf;
function librdf_model_get_arc(model:Plibrdf_model; source:Plibrdf_node; target:Plibrdf_node):Plibrdf_node;cdecl;external librdf;
function librdf_model_get_target(model:Plibrdf_model; source:Plibrdf_node; arc:Plibrdf_node):Plibrdf_node;cdecl;external librdf;
{ return list of properties to/from a node  }
function librdf_model_get_arcs_in(model:Plibrdf_model; node:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
function librdf_model_get_arcs_out(model:Plibrdf_model; node:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
{ submodels  }
function librdf_model_add_submodel(model:Plibrdf_model; sub_model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_model_remove_submodel(model:Plibrdf_model; sub_model:Plibrdf_model):longint;cdecl;external librdf;
{ REDLAND_DEPRECATED }
procedure librdf_model_print(model:Plibrdf_model; fh:PFILE);cdecl;external librdf;
function librdf_model_write(model:Plibrdf_model; iostr:Praptor_iostream):longint;cdecl;external librdf;
{ statement contexts  }
function librdf_model_context_add_statement(model:Plibrdf_model; context:Plibrdf_node; statement:Plibrdf_statement):longint;cdecl;external librdf;
function librdf_model_context_add_statements(model:Plibrdf_model; context:Plibrdf_node; stream:Plibrdf_stream):longint;cdecl;external librdf;
function librdf_model_context_remove_statement(model:Plibrdf_model; context:Plibrdf_node; statement:Plibrdf_statement):longint;cdecl;external librdf;
function librdf_model_context_remove_statements(model:Plibrdf_model; context:Plibrdf_node):longint;cdecl;external librdf;
function librdf_model_context_as_stream(model:Plibrdf_model; context:Plibrdf_node):Plibrdf_stream;cdecl;external librdf;
{ REDLAND_DEPRECATED }
function librdf_model_context_serialize(model:Plibrdf_model; context:Plibrdf_node):Plibrdf_stream;cdecl;external librdf;
function librdf_model_contains_context(model:Plibrdf_model; context:Plibrdf_node):longint;cdecl;external librdf;
function librdf_model_supports_contexts(model:Plibrdf_model):longint;cdecl;external librdf;
{ query language  }
function librdf_model_query_execute(model:Plibrdf_model; query:Plibrdf_query):Plibrdf_query_results;cdecl;external librdf;
function librdf_model_sync(model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_model_get_storage(model:Plibrdf_model):Plibrdf_storage;cdecl;external librdf;
function librdf_model_load(model:Plibrdf_model; uri:Plibrdf_uri; name:Pchar; mime_type:Pchar; type_uri:Plibrdf_uri):longint;cdecl;external librdf;
function librdf_model_to_counted_string(model:Plibrdf_model; uri:Plibrdf_uri; name:Pchar; mime_type:Pchar; type_uri:Plibrdf_uri; 
           string_length_p:Psize_t):Pbyte;cdecl;external librdf;
function librdf_model_to_string(model:Plibrdf_model; uri:Plibrdf_uri; name:Pchar; mime_type:Pchar; type_uri:Plibrdf_uri):Pbyte;cdecl;external librdf;
{ find statements in a given context  }
function librdf_model_find_statements_in_context(model:Plibrdf_model; statement:Plibrdf_statement; context_node:Plibrdf_node):Plibrdf_stream;cdecl;external librdf;
function librdf_model_get_contexts(model:Plibrdf_model):Plibrdf_iterator;cdecl;external librdf;
function librdf_model_transaction_start(model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_model_transaction_start_with_handle(model:Plibrdf_model; handle:pointer):longint;cdecl;external librdf;
function librdf_model_transaction_commit(model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_model_transaction_rollback(model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_model_transaction_get_handle(model:Plibrdf_model):pointer;cdecl;external librdf;
{*
 * LIBRDF_MODEL_FEATURE_CONTEXTS:
 *
 * Model feature contexts.
 *
 * If set, the model has redland contexts.
  }
const
  LIBRDF_MODEL_FEATURE_CONTEXTS = 'http://feature.librdf.org/model-contexts';  
{ features  }

function librdf_model_get_feature(model:Plibrdf_model; feature:Plibrdf_uri):Plibrdf_node;cdecl;external librdf;
function librdf_model_set_feature(model:Plibrdf_model; feature:Plibrdf_uri; value:Plibrdf_node):longint;cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:27 ===


implementation



end.
