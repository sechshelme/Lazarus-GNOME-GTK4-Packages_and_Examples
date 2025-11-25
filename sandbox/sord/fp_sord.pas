unit fp_sord;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright 2011-2016 David Robillard <d@drobilla.net> }
{ SPDX-License-Identifier: ISC }
{*
   @file sord.h API for Sord, a lightweight RDF model library.
 }
{$ifndef SORD_SORD_H}
{$define SORD_SORD_H}
{$include "serd/serd.h"}
{$include <stdbool.h>}
{$include <stddef.h>}
{$include <stdint.h>}
{*
   @defgroup sord Sord
   A lightweight RDF model library.

   Sord stores RDF (subject object predicate context) quads, where the context
   may be omitted (to represent triples in the default graph).
   @
 }
{*
   Sord World.
   The World represents all library state, including interned strings.
 }
type
  TSordWorldImpl = TSordWorld;
{*
   Sord Model.

   A model is an indexed set of Quads (i.e. it can contain several RDF
   graphs).  It may be searched using various patterns depending on which
   indices are enabled.
 }
  TSordModelImpl = TSordModel;
{*
   Model Inserter.

   An inserter is used for writing statements to a model using the Serd sink
   interface.  This makes it simple to write to a model directly using a
   SerdReader, or any other code that writes statements to a SerdStatementSink.
 }
  TSordInserterImpl = TSordInserter;
{*
   Model Iterator.
 }
  TSordIterImpl = TSordIter;
{*
   RDF Node.
   A Node is a component of a Quad.  Nodes may be URIs, blank nodes, or
   (in the case of quad objects only) string literals. Literal nodes may
   have an associate language or datatype (but not both).
 }
  TSordNodeImpl = TSordNode;
{*
   Quad of nodes (a statement), or a quad pattern.

   Nodes are ordered (S P O G).  The ID of the default graph is 0.
 }

  PSordQuad = ^TSordQuad;
  TSordQuad = array[0..3] of PSordNode;
{*
   Index into a SordQuad.
 }
{*< Subject  }
{*< Predicate ("key")  }
{*< Object    ("value")  }
{*< Graph     ("context")  }

  PSordQuadIndex = ^TSordQuadIndex;
  TSordQuadIndex =  Longint;
  Const
    SORD_SUBJECT = 0;
    SORD_PREDICATE = 1;
    SORD_OBJECT = 2;
    SORD_GRAPH = 3;
;
{*
   Type of a node.
 }
{*< URI  }
{*< Blank node identifier  }
{*< Literal (string with optional lang or datatype)  }
type
  PSordNodeType = ^TSordNodeType;
  TSordNodeType =  Longint;
  Const
    SORD_URI = 1;
    SORD_BLANK = 2;
    SORD_LITERAL = 3;
;
{*
   Indexing option.
 }
{*< Subject,   Predicate, Object  }
{*< Subject,   Object,    Predicate  }
{*< Object,    Predicate, Subject  }
{*< Object,    Subject,   Predicate  }
{*< Predicate, Subject,   Object  }
{*< Predicate, Object,    Subject  }
type
  PSordIndexOption = ^TSordIndexOption;
  TSordIndexOption =  Longint;
  Const
    SORD_SPO = 1;
    SORD_SOP = 1 shl 1;
    SORD_OPS = 1 shl 2;
    SORD_OSP = 1 shl 3;
    SORD_PSO = 1 shl 4;
    SORD_POS = 1 shl 5;
;
{*
   @name World
   @
 }
{*
   Create a new Sord World.
   It is safe to use multiple worlds in one process, though no data
   (e.g. nodes) can be shared between worlds, and this should be avoided if
   possible for performance reasons.
 }

function sord_world_new:PSordWorld;cdecl;external libsord0;
{*
   Free `world`.
 }
procedure sord_world_free(world:PSordWorld);cdecl;external libsord0;
{*
   Set a function to be called when errors occur.

   The `error_sink` will be called with `handle` as its first argument.  If
   no error function is set, errors are printed to stderr.
 }
procedure sord_world_set_error_sink(world:PSordWorld; error_sink:TSerdErrorSink; handle:pointer);cdecl;external libsord0;
{*
   @
   @name Node
   @
 }
{*
   Get a URI node from a string.

   Note this function measures `str`, which is a common bottleneck.
   Use sord_node_from_serd_node() instead if `str` is already measured.
 }
function sord_new_uri(world:PSordWorld; uri:Puint8_t):PSordNode;cdecl;external libsord0;
{*
   Get a URI node from a relative URI string.
 }
function sord_new_relative_uri(world:PSordWorld; uri:Puint8_t; base_uri:Puint8_t):PSordNode;cdecl;external libsord0;
{*
   Get a blank node from a string.

   Note this function measures `str`, which is a common bottleneck.
   Use sord_node_from_serd_node() instead if `str` is already measured.
 }
function sord_new_blank(world:PSordWorld; str:Puint8_t):PSordNode;cdecl;external libsord0;
{*
   Get a literal node from a string.

   Note this function measures `str`, which is a common bottleneck.
   Use sord_node_from_serd_node() instead if `str` is already measured.
 }
function sord_new_literal(world:PSordWorld; datatype:PSordNode; str:Puint8_t; lang:Pchar):PSordNode;cdecl;external libsord0;
{*
   Copy a node (obtain a reference).

   Node that since nodes are interned and reference counted, this does not
   actually create a deep copy of `node`.
 }
function sord_node_copy(node:PSordNode):PSordNode;cdecl;external libsord0;
{*
   Free a node (drop a reference).
 }
procedure sord_node_free(world:PSordWorld; node:PSordNode);cdecl;external libsord0;
{*
   Return the type of a node (SORD_URI, SORD_BLANK, or SORD_LITERAL).
 }
function sord_node_get_type(node:PSordNode):TSordNodeType;cdecl;external libsord0;
{*
   Return the string value of a node.
 }
function sord_node_get_string(node:PSordNode):Puint8_t;cdecl;external libsord0;
{*
   Return the string value of a node, and set `bytes` to its length in bytes.
 }
function sord_node_get_string_counted(node:PSordNode; bytes:Psize_t):Puint8_t;cdecl;external libsord0;
{*
   Return the string value of a node, and set `bytes` to its length in bytes,
   and `count` to its length in characters.
 }
function sord_node_get_string_measured(node:PSordNode; bytes:Psize_t; chars:Psize_t):Puint8_t;cdecl;external libsord0;
{*
   Return the language of a literal node (or NULL).
 }
function sord_node_get_language(node:PSordNode):Pchar;cdecl;external libsord0;
{*
   Return the datatype URI of a literal node (or NULL).
 }
function sord_node_get_datatype(node:PSordNode):PSordNode;cdecl;external libsord0;
{*
   Return the flags (string attributes) of a node.
 }
function sord_node_get_flags(node:PSordNode):TSerdNodeFlags;cdecl;external libsord0;
{*
   Return true iff node can be serialised as an inline object.

   More specifically, this returns true iff the node is the object field
   of exactly one statement, and therefore can be inlined since it needn't
   be referred to by name.
 }
function sord_node_is_inline_object(node:PSordNode):Tbool;cdecl;external libsord0;
{*
   Return true iff `a` is equal to `b`.

   Note this is much faster than comparing the node's strings.
 }
function sord_node_equals(a:PSordNode; b:PSordNode):Tbool;cdecl;external libsord0;
{*
   Return a SordNode as a SerdNode.

   The returned node is shared and must not be freed or modified.
 }
function sord_node_to_serd_node(node:PSordNode):PSerdNode;cdecl;external libsord0;
{*
   Create a new SordNode from a SerdNode.

   The returned node must be freed using sord_node_free().
 }
function sord_node_from_serd_node(world:PSordWorld; env:PSerdEnv; node:PSerdNode; datatype:PSerdNode; lang:PSerdNode):PSordNode;cdecl;external libsord0;
{*
   @
   @name Model
   @
 }
{*
   Create a new model.

   @param world The world in which to make this model.

   @param indices SordIndexOption flags (e.g. SORD_SPO|SORD_OPS).  Be sure to
   enable an index where the most significant node(s) are not variables in your
   queries (e.g. to make (? P O) queries, enable either SORD_OPS or SORD_POS).

   @param graphs If true, store (and index) graph contexts.
 }
function sord_new(world:PSordWorld; indices:dword; graphs:Tbool):PSordModel;cdecl;external libsord0;
{*
   Close and free `model`.
 }
procedure sord_free(model:PSordModel);cdecl;external libsord0;
{*
   Get the world associated with `model`.
 }
function sord_get_world(model:PSordModel):PSordWorld;cdecl;external libsord0;
{*
   Return the number of nodes stored in `world`.

   Nodes are included in this count iff they are a part of a quad in `world`.
 }
function sord_num_nodes(world:PSordWorld):Tsize_t;cdecl;external libsord0;
{*
   Return the number of quads stored in `model`.
 }
function sord_num_quads(model:PSordModel):Tsize_t;cdecl;external libsord0;
{*
   Return an iterator to the start of `model`.
 }
function sord_begin(model:PSordModel):PSordIter;cdecl;external libsord0;
{*
   Search for statements by a quad pattern.
   @return an iterator to the first match, or NULL if no matches found.
 }
function sord_find(model:PSordModel; pat:TSordQuad):PSordIter;cdecl;external libsord0;
{*
   Search for statements by nodes.
   @return an iterator to the first match, or NULL if no matches found.
 }
function sord_search(model:PSordModel; s:PSordNode; p:PSordNode; o:PSordNode; g:PSordNode):PSordIter;cdecl;external libsord0;
{*
   Search for a single node that matches a pattern.
   Exactly one of `s`, `p`, `o` must be NULL.
   This function is mainly useful for predicates that only have one value.
   The returned node must be freed using sord_node_free().
   @return the first matching node, or NULL if no matches are found.
 }
function sord_get(model:PSordModel; s:PSordNode; p:PSordNode; o:PSordNode; g:PSordNode):PSordNode;cdecl;external libsord0;
{*
   Return true iff a statement exists.
 }
function sord_ask(model:PSordModel; s:PSordNode; p:PSordNode; o:PSordNode; g:PSordNode):Tbool;cdecl;external libsord0;
{*
   Return the number of matching statements.
 }
function sord_count(model:PSordModel; s:PSordNode; p:PSordNode; o:PSordNode; g:PSordNode):Tuint64_t;cdecl;external libsord0;
{*
   Check if `model` contains a triple pattern.

   @return true if `model` contains a match for `pat`, otherwise false.
 }
function sord_contains(model:PSordModel; pat:TSordQuad):Tbool;cdecl;external libsord0;
{*
   Add a quad to a model.

   Calling this function invalidates all iterators on `model`.

   @return true on success, false, on error.
 }
function sord_add(model:PSordModel; tup:TSordQuad):Tbool;cdecl;external libsord0;
{*
   Remove a quad from a model.

   Calling this function invalidates all iterators on `model`.  To remove quads
   while iterating, use sord_erase() instead.
 }
procedure sord_remove(model:PSordModel; tup:TSordQuad);cdecl;external libsord0;
{*
   Remove a quad from a model via an iterator.

   Calling this function invalidates all iterators on `model` except `iter`.

   @param model The model which `iter` points to.
   @param iter Iterator to the element to erase, which is incremented to the
   next value on return.
 }
function sord_erase(model:PSordModel; iter:PSordIter):TSerdStatus;cdecl;external libsord0;
{*
   @
   @name Inserter
   @
 }
{*
   Create an inserter for writing statements to a model.
 }
function sord_inserter_new(model:PSordModel; env:PSerdEnv):PSordInserter;cdecl;external libsord0;
{*
   Free an inserter.
 }
procedure sord_inserter_free(inserter:PSordInserter);cdecl;external libsord0;
{*
   Set the current base URI for writing to the model.

   Note this function can be safely casted to SerdBaseSink.
 }
function sord_inserter_set_base_uri(inserter:PSordInserter; uri:PSerdNode):TSerdStatus;cdecl;external libsord0;
{*
   Set a namespace prefix for writing to the model.

   Note this function can be safely casted to SerdPrefixSink.
 }
function sord_inserter_set_prefix(inserter:PSordInserter; name:PSerdNode; uri:PSerdNode):TSerdStatus;cdecl;external libsord0;
{*
   Write a statement to the model.

   Note this function can be safely casted to SerdStatementSink.
 }
function sord_inserter_write_statement(inserter:PSordInserter; flags:TSerdStatementFlags; graph:PSerdNode; subject:PSerdNode; predicate:PSerdNode; 
           object:PSerdNode; object_datatype:PSerdNode; object_lang:PSerdNode):TSerdStatus;cdecl;external libsord0;
{*
   @
   @name Iteration
   @
 }
{*
   Set `quad` to the quad pointed to by `iter`.
 }
procedure sord_iter_get(iter:PSordIter; tup:TSordQuad);cdecl;external libsord0;
{*
   Return a field of the quad pointed to by `iter`.

   Returns NULL if `iter` is NULL or is at the end.
 }
function sord_iter_get_node(iter:PSordIter; index:TSordQuadIndex):PSordNode;cdecl;external libsord0;
{*
   Return the store pointed to by `iter`.
 }
function sord_iter_get_model(iter:PSordIter):PSordModel;cdecl;external libsord0;
{*
   Increment `iter` to point to the next statement.
 }
function sord_iter_next(iter:PSordIter):Tbool;cdecl;external libsord0;
{*
   Return true iff `iter` is at the end of its range.
 }
function sord_iter_end(iter:PSordIter):Tbool;cdecl;external libsord0;
{*
   Free `iter`.
 }
procedure sord_iter_free(iter:PSordIter);cdecl;external libsord0;
{*
   @
   @name Utilities
   @
 }
{*
   Match two quads (using ID comparison only).

   This function is a straightforward and fast equivalence match with wildcard
   support (ID 0 is a wildcard). It does not actually read node data.
   @return true iff `x` and `y` match.
 }
function sord_quad_match(x:TSordQuad; y:TSordQuad):Tbool;cdecl;external libsord0;
{*
   @
   @name Serialisation
   @
 }
{*
   Return a reader that will read into `model`.
 }
function sord_new_reader(model:PSordModel; env:PSerdEnv; syntax:TSerdSyntax; graph:PSordNode):PSerdReader;cdecl;external libsord0;
{*
   Write a model to a writer.
 }
function sord_write(model:PSordModel; writer:PSerdWriter; graph:PSordNode):Tbool;cdecl;external libsord0;
{*
   Write a range to a writer.

   This increments `iter` to its end, then frees it.
 }
function sord_write_iter(iter:PSordIter; writer:PSerdWriter):Tbool;cdecl;external libsord0;
{*
   @
   @
 }
{$endif}
{ SORD_SORD_H  }

// === Konventiert am: 25-11-25 17:36:45 ===


implementation



end.
