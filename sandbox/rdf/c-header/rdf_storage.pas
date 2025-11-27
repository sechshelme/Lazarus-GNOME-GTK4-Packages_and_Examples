unit rdf_storage;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_storage.h - RDF Storage Factory and Storage interfaces and definitions
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
{$ifndef LIBRDF_STORAGE_H}
{$define LIBRDF_STORAGE_H}
{$include <rdf_storage_module.h>}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_storage_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ class methods  }

function librdf_storage_register_factory(world:Plibrdf_world; name:Pchar; _label:Pchar; factory:procedure (para1:Plibrdf_storage_factory)):longint;cdecl;external librdf;
function librdf_storage_enumerate(world:Plibrdf_world; counter:dword; name:PPchar; _label:PPchar):longint;cdecl;external librdf;
{ constructor  }
function librdf_new_storage(world:Plibrdf_world; storage_name:Pchar; name:Pchar; options_string:Pchar):Plibrdf_storage;cdecl;external librdf;
function librdf_new_storage_with_options(world:Plibrdf_world; storage_name:Pchar; name:Pchar; options:Plibrdf_hash):Plibrdf_storage;cdecl;external librdf;
function librdf_new_storage_from_storage(old_storage:Plibrdf_storage):Plibrdf_storage;cdecl;external librdf;
function librdf_new_storage_from_factory(world:Plibrdf_world; factory:Plibrdf_storage_factory; name:Pchar; options:Plibrdf_hash):Plibrdf_storage;cdecl;external librdf;
{ destructor  }
procedure librdf_free_storage(storage:Plibrdf_storage);cdecl;external librdf;
{ methods  }
procedure librdf_storage_add_reference(storage:Plibrdf_storage);cdecl;external librdf;
procedure librdf_storage_remove_reference(storage:Plibrdf_storage);cdecl;external librdf;
procedure librdf_storage_set_instance(storage:Plibrdf_storage; instance:Tlibrdf_storage_instance);cdecl;external librdf;
function librdf_storage_get_instance(storage:Plibrdf_storage):Tlibrdf_storage_instance;cdecl;external librdf;
function librdf_storage_get_world(storage:Plibrdf_storage):Plibrdf_world;cdecl;external librdf;
function librdf_storage_open(storage:Plibrdf_storage; model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_storage_close(storage:Plibrdf_storage):longint;cdecl;external librdf;
function librdf_storage_size(storage:Plibrdf_storage):longint;cdecl;external librdf;
function librdf_storage_add_statement(storage:Plibrdf_storage; statement:Plibrdf_statement):longint;cdecl;external librdf;
function librdf_storage_add_statements(storage:Plibrdf_storage; statement_stream:Plibrdf_stream):longint;cdecl;external librdf;
function librdf_storage_remove_statement(storage:Plibrdf_storage; statement:Plibrdf_statement):longint;cdecl;external librdf;
function librdf_storage_contains_statement(storage:Plibrdf_storage; statement:Plibrdf_statement):longint;cdecl;external librdf;
function librdf_storage_serialise(storage:Plibrdf_storage):Plibrdf_stream;cdecl;external librdf;
function librdf_storage_find_statements(storage:Plibrdf_storage; statement:Plibrdf_statement):Plibrdf_stream;cdecl;external librdf;
function librdf_storage_find_statements_with_options(storage:Plibrdf_storage; statement:Plibrdf_statement; context_node:Plibrdf_node; options:Plibrdf_hash):Plibrdf_stream;cdecl;external librdf;
function librdf_storage_get_sources(storage:Plibrdf_storage; arc:Plibrdf_node; target:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
function librdf_storage_get_arcs(storage:Plibrdf_storage; source:Plibrdf_node; target:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
function librdf_storage_get_targets(storage:Plibrdf_storage; source:Plibrdf_node; arc:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
{ return list of properties to/from a node  }
function librdf_storage_get_arcs_in(storage:Plibrdf_storage; node:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
function librdf_storage_get_arcs_out(storage:Plibrdf_storage; node:Plibrdf_node):Plibrdf_iterator;cdecl;external librdf;
{ check for [node, property, ?]  }
function librdf_storage_has_arc_in(storage:Plibrdf_storage; node:Plibrdf_node; _property:Plibrdf_node):longint;cdecl;external librdf;
{ check for [?, property, node]  }
function librdf_storage_has_arc_out(storage:Plibrdf_storage; node:Plibrdf_node; _property:Plibrdf_node):longint;cdecl;external librdf;
{ context methods  }
function librdf_storage_context_add_statement(storage:Plibrdf_storage; context:Plibrdf_node; statement:Plibrdf_statement):longint;cdecl;external librdf;
function librdf_storage_context_add_statements(storage:Plibrdf_storage; context:Plibrdf_node; stream:Plibrdf_stream):longint;cdecl;external librdf;
function librdf_storage_context_remove_statement(storage:Plibrdf_storage; context:Plibrdf_node; statement:Plibrdf_statement):longint;cdecl;external librdf;
function librdf_storage_context_remove_statements(storage:Plibrdf_storage; context:Plibrdf_node):longint;cdecl;external librdf;
function librdf_storage_context_as_stream(storage:Plibrdf_storage; context:Plibrdf_node):Plibrdf_stream;cdecl;external librdf;
{ REDLAND_DEPRECATED }
function librdf_storage_context_serialise(storage:Plibrdf_storage; context:Plibrdf_node):Plibrdf_stream;cdecl;external librdf;
{ querying methods  }
function librdf_storage_supports_query(storage:Plibrdf_storage; query:Plibrdf_query):longint;cdecl;external librdf;
function librdf_storage_query_execute(storage:Plibrdf_storage; query:Plibrdf_query):Plibrdf_query_results;cdecl;external librdf;
{ synchronise a storage to the backing store  }
function librdf_storage_sync(storage:Plibrdf_storage):longint;cdecl;external librdf;
{ find statements in a given context  }
function librdf_storage_find_statements_in_context(storage:Plibrdf_storage; statement:Plibrdf_statement; context_node:Plibrdf_node):Plibrdf_stream;cdecl;external librdf;
function librdf_storage_get_contexts(storage:Plibrdf_storage):Plibrdf_iterator;cdecl;external librdf;
{ features  }
function librdf_storage_get_feature(storage:Plibrdf_storage; feature:Plibrdf_uri):Plibrdf_node;cdecl;external librdf;
function librdf_storage_set_feature(storage:Plibrdf_storage; feature:Plibrdf_uri; value:Plibrdf_node):longint;cdecl;external librdf;
function librdf_storage_transaction_start(storage:Plibrdf_storage):longint;cdecl;external librdf;
function librdf_storage_transaction_start_with_handle(storage:Plibrdf_storage; handle:pointer):longint;cdecl;external librdf;
function librdf_storage_transaction_commit(storage:Plibrdf_storage):longint;cdecl;external librdf;
function librdf_storage_transaction_rollback(storage:Plibrdf_storage):longint;cdecl;external librdf;
function librdf_storage_transaction_get_handle(storage:Plibrdf_storage):pointer;cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:09 ===


implementation



end.
