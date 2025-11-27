unit rdf_storage_module;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * librdf_storage_module.h - Interface for a Redland storage module
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
  }
{$ifndef LIBRDF_STORAGE_FACTORY_H}
{$define LIBRDF_STORAGE_FACTORY_H}
{ C++ extern C conditionnal removed }
{*
 * librdf_storage_instance:
 *
 * Opaque storage module instance handle.
 *
 * For use with a storage module and the librdf_storage_get_instance()
 * and librdf_storage_set_instance() functions.  The instance handle
 * should be set in the #librdf_storage_factory init factory method.
  }
type
  Plibrdf_storage_instance = ^Tlibrdf_storage_instance;
  Tlibrdf_storage_instance = pointer;
{*
 * LIBRDF_STORAGE_MIN_INTERFACE_VERSION:
 *
 * Oldest support librdf storage module interface version.
 *
  }

const
  LIBRDF_STORAGE_MIN_INTERFACE_VERSION = 1;  
{*
 * LIBRDF_STORAGE_MAX_INTERFACE_VERSION:
 *
 * Newest supported librdf storage module interface version.
 *
  }
  LIBRDF_STORAGE_MAX_INTERFACE_VERSION = 1;  
{*
 * LIBRDF_STORAGE_INTERFACE_VERSION:
 *
 * Default librdf storage module interface version.
 *
  }
  LIBRDF_STORAGE_INTERFACE_VERSION = LIBRDF_STORAGE_MAX_INTERFACE_VERSION;  
{*
 * librdf_storage_factory:
 * @version: Interface version.  Only version 1 is defined.
 * @name: Name (ID) of this storage, e.g. "megastore" 
 * @label: Label of this storage, e.g. "Megastore Storage"
 * @init: Create a new storage.
 *   This method should create the required instance data and store it with
 *   librdf_storage_set_instance() so it can be used in other methods.
 * @clone: Copy a storage.
 *   This is assumed to leave the new storage in the same state as an existing
 *   storage after an init() method - i.e ready to use but closed.
 * @terminate: Destroy a storage.
 *   This method is responsible for freeing all memory allocated in the init method.
 * @open: Make storage be associated with model
 * @close: Close storage/model context
 * @size: Return the number of statements in the storage for model
 * @add_statement: Add a statement to the storage from the given model. OPTIONAL
 * @add_statements: Add a statement to the storage from the given model. OPTIONAL
 * @remove_statement: Remove a statement from the storage. OPTIONAL
 * @contains_statement: Check if statement is in storage
 * @has_arc_in: Check for [node, property, ?]
 * @has_arc_out: Check for [?, property, node]
 * @serialise: Serialise the model in storage
 * @find_statements: Return a stream of triples matching a triple pattern
 * @find_statements_with_options: Return a stream of triples matching a triple pattern with some options.  OPTIONAL
 * @find_sources: Return a list of Nodes marching given arc, target
 * @find_arcs: Return a list of Nodes marching given source, target
 * @find_targets: Return a list of Nodes marching given source, target
 * @get_arcs_in:  Return list of properties to a node (i.e. with node as the object)
 * @get_arcs_out: Return list of properties from a node (i.e. with node as the subject)
 * @context_add_statement: Add a statement to the storage from the context.
 *    NOTE: If context is NULL, this MUST be equivalent to @add_statement. OPTIONAL.
 * @context_remove_statement: Remove a statement from a context.
 *    NOTE: if context is NULL, this MUST be equivalent to remove_statement. OPTIONAL.
 * @context_serialise: Serialise statements in a context. OPTIONAL
 * @sync: Synchronise to underlying storage. OPTIONAL
 * @context_add_statements: Add statements to a context. storage core will do this using context_add_statement if missing. 
 *    NOTE: If context is NULL, this MUST be equivalent to add_statements. OPTIONAL
 * @context_remove_statements: Remove statements from a context. storage core will do this using context_remove_statement if missing). OPTIONAL
 * @find_statements_in_context: Search for statement in a context. storage core will do this using find_statements if missing. OPTIONAL
 * @get_contexts: Return an iterator of context nodes. Returns NULL if contexts not supported. OPTIONAL
 * @get_feature: Get a feature. OPTIONAL
 * @set_feature: Set a feature. OPTIONAL
 * @transaction_start: Begin a transaction. OPTIONAL
 * @transaction_start_with_handle: Begin a transaction with opaque data handle. OPTIONAL
 * @transaction_commit: Commit a transaction. OPTIONAL
 * @transaction_rollback: Rollback a transaction. OPTIONAL
 * @transaction_get_handle: Get opaque data handle passed to transaction_start_with_handle. OPTIONAL
 * 
 * A Storage Factory
  }
{ Interface version  }
{ Name (ID) of this storage  }
{ Label of this storage  }
{ The rest of this structure is populated by the storage-specific
   * register function 
    }
{ Create a new storage.  }
{ Copy a storage.  }
{ Destroy a storage.  }
{ Make storage be associated with model  }
{ Close storage/model context  }
{ Return the number of statements in the storage for model  }
{ Add a statement to the storage from the given model  }
{ Add a statement to the storage from the given model  }
{ Remove a statement from the storage  }
{ Check if statement is in storage  }
{ Check for [node, property, ?]  }
{ Check for [?, property, node]  }
{ Serialise the model in storage  }
{ Return a stream of triples matching a triple pattern  }
{ Return a stream of triples matching a triple pattern with some options.  }
{ Return a list of Nodes marching given arc, target  }
{ Return a list of Nodes marching given source, target  }
{ Return a list of Nodes marching given source, target  }
{* Return list of properties to a node (i.e. with node as the object)  }
{ Return list of properties from a node (i.e. with node as the subject)  }
{ Add a statement to the storage from the context  }
{ Remove a statement from a context  }
{ Serialise statements in a context  }
{ Synchronise to underlying storage  }
{ Add statements to a context  }
{ Remove statements from a context  }
{ Search for statement in a context  }
{ Return an iterator of context nodes  }
{ Get a feature  }
{ Set a feature  }
{ Begin a transaction  }
{ Begin a transaction with opaque data handle  }
{ Commit a transaction  }
{ Rollback a transaction  }
{ Get opaque data handle passed to transaction_start_with_handle  }
{* Storage engine supports querying - OPTIONAL  }
{* Storage engine returns query results - OPTIONAL  }
type
  Plibrdf_storage_factory_s = ^Tlibrdf_storage_factory_s;
  Tlibrdf_storage_factory_s = record
      version : longint;
      name : Pchar;
      _label : Pchar;
      init : function (storage:Plibrdf_storage; name:Pchar; options:Plibrdf_hash):longint;cdecl;
      clone : function (new_storage:Plibrdf_storage; old_storage:Plibrdf_storage):longint;cdecl;
      terminate : procedure (storage:Plibrdf_storage);cdecl;
      open : function (storage:Plibrdf_storage; model:Plibrdf_model):longint;cdecl;
      close : function (storage:Plibrdf_storage):longint;cdecl;
      size : function (storage:Plibrdf_storage):longint;cdecl;
      add_statement : function (storage:Plibrdf_storage; statement:Plibrdf_statement):longint;cdecl;
      add_statements : function (storage:Plibrdf_storage; statement_stream:Plibrdf_stream):longint;cdecl;
      remove_statement : function (storage:Plibrdf_storage; statement:Plibrdf_statement):longint;cdecl;
      contains_statement : function (storage:Plibrdf_storage; statement:Plibrdf_statement):longint;cdecl;
      has_arc_in : function (storage:Plibrdf_storage; node:Plibrdf_node; _property:Plibrdf_node):longint;cdecl;
      has_arc_out : function (storage:Plibrdf_storage; node:Plibrdf_node; _property:Plibrdf_node):longint;cdecl;
      serialise : function (storage:Plibrdf_storage):Plibrdf_stream;cdecl;
      find_statements : function (storage:Plibrdf_storage; statement:Plibrdf_statement):Plibrdf_stream;cdecl;
      find_statements_with_options : function (storage:Plibrdf_storage; statement:Plibrdf_statement; context_node:Plibrdf_node; options:Plibrdf_hash):Plibrdf_stream;cdecl;
      find_sources : function (storage:Plibrdf_storage; arc:Plibrdf_node; target:Plibrdf_node):Plibrdf_iterator;cdecl;
      find_arcs : function (storage:Plibrdf_storage; src:Plibrdf_node; target:Plibrdf_node):Plibrdf_iterator;cdecl;
      find_targets : function (storage:Plibrdf_storage; src:Plibrdf_node; target:Plibrdf_node):Plibrdf_iterator;cdecl;
      get_arcs_in : function (storage:Plibrdf_storage; node:Plibrdf_node):Plibrdf_iterator;cdecl;
      get_arcs_out : function (storage:Plibrdf_storage; node:Plibrdf_node):Plibrdf_iterator;cdecl;
      context_add_statement : function (storage:Plibrdf_storage; context:Plibrdf_node; statement:Plibrdf_statement):longint;cdecl;
      context_remove_statement : function (storage:Plibrdf_storage; context:Plibrdf_node; statement:Plibrdf_statement):longint;cdecl;
      context_serialise : function (storage:Plibrdf_storage; context:Plibrdf_node):Plibrdf_stream;cdecl;
      sync : function (storage:Plibrdf_storage):longint;cdecl;
      context_add_statements : function (storage:Plibrdf_storage; context:Plibrdf_node; stream:Plibrdf_stream):longint;cdecl;
      context_remove_statements : function (storage:Plibrdf_storage; context:Plibrdf_node):longint;cdecl;
      find_statements_in_context : function (storage:Plibrdf_storage; statement:Plibrdf_statement; context_node:Plibrdf_node):Plibrdf_stream;cdecl;
      get_contexts : function (storage:Plibrdf_storage):Plibrdf_iterator;cdecl;
      get_feature : function (storaage:Plibrdf_storage; feature:Plibrdf_uri):Plibrdf_node;cdecl;
      set_feature : function (storage:Plibrdf_storage; feature:Plibrdf_uri; value:Plibrdf_node):longint;cdecl;
      transaction_start : function (storage:Plibrdf_storage):longint;cdecl;
      transaction_start_with_handle : function (storage:Plibrdf_storage; handle:pointer):longint;cdecl;
      transaction_commit : function (storage:Plibrdf_storage):longint;cdecl;
      transaction_rollback : function (storage:Plibrdf_storage):longint;cdecl;
      transaction_get_handle : function (storage:Plibrdf_storage):pointer;cdecl;
      supports_query : function (storage:Plibrdf_storage; query:Plibrdf_query):longint;cdecl;
      query_execute : function (storage:Plibrdf_storage; query:Plibrdf_query):Plibrdf_query_results;cdecl;
    end;

{*
 * librdf_storage_module_register_function:
 * @world: world object
 *
 * Registration function for storage
 *
 * A storage module must define and export a function named of this
 * type with function name "librdf_storage_module_register_factory".
 *
 * This function will be called by Redland and must call
 * librdf_storage_register_factory() to register whatever storage
 * backends are implemented in the module.
  }

  Tlibrdf_storage_module_register_function = procedure (world:Plibrdf_world);cdecl;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:07 ===


implementation



end.
