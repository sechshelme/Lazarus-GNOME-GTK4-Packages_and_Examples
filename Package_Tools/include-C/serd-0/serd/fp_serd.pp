
unit fp_serd;
interface

{
  Automatically converted by H2Pas 1.0.0 from serd.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    serd.h
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
Pchar  = ^char;
PFILE  = ^FILE;
PSerdChunk  = ^SerdChunk;
PSerdEnv  = ^SerdEnv;
PSerdError  = ^SerdError;
PSerdNode  = ^SerdNode;
PSerdNodeFlag  = ^SerdNodeFlag;
PSerdNodeFlags  = ^SerdNodeFlags;
PSerdReader  = ^SerdReader;
PSerdStatementFlag  = ^SerdStatementFlag;
PSerdStatementFlags  = ^SerdStatementFlags;
PSerdStatus  = ^SerdStatus;
PSerdStyle  = ^SerdStyle;
PSerdSyntax  = ^SerdSyntax;
PSerdType  = ^SerdType;
PSerdURI  = ^SerdURI;
PSerdWriter  = ^SerdWriter;
Psize_t  = ^size_t;
Puint8_t  = ^uint8_t;
Pva_list  = ^va_list;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright 2011-2023 David Robillard <d@drobilla.net> }
{ SPDX-License-Identifier: ISC }
{/ @file serd.h API for Serd, a lightweight RDF syntax library }
{$ifndef SERD_SERD_H}
{$define SERD_SERD_H}
{$include <stdarg.h>}
{$include <stdbool.h>}
{$include <stddef.h>}
{$include <stdint.h>}
{$include <stdio.h>}
{ extern must be used to decorate things in the public API }
{*
   @defgroup serd Serd C API
   @
 }
{/ RDF syntax type }
{/< Terse triples http://www.w3.org/TR/turtle }
{/< Line-based triples http://www.w3.org/TR/n-triples/ }
{/< Line-based quads http://www.w3.org/TR/n-quads/ }
{/< Terse quads http://www.w3.org/TR/trig/ }
type
  PSerdSyntax = ^TSerdSyntax;
  TSerdSyntax =  Longint;
  Const
    SERD_TURTLE = 1;
    SERD_NTRIPLES = 2;
    SERD_NQUADS = 3;
    SERD_TRIG = 4;
;
{/ Flags indicating certain string properties relevant to serialisation }
{/< Contains line breaks ('\\n' or '\\r') }
{/< Contains quotes ('"') }
type
  PSerdNodeFlag = ^TSerdNodeFlag;
  TSerdNodeFlag =  Longint;
  Const
    SERD_HAS_NEWLINE = 1 shl 0;
    SERD_HAS_QUOTE = 1 shl 1;
;
{/ Bitwise OR of SerdNodeFlag values }
type
  PSerdNodeFlags = ^TSerdNodeFlags;
  TSerdNodeFlags = Tuint32_t;
{/ An unterminated string fragment }
(* Const before type ignored *)
{/< Start of chunk }
{/< Length of chunk in bytes }

  PSerdChunk = ^TSerdChunk;
  TSerdChunk = record
      buf : Puint8_t;
      len : Tsize_t;
    end;
{*
   Free memory allocated by Serd.

   This function exists because some systems require memory allocated by a
   library to be freed by code in the same library.  It is otherwise equivalent
   to the standard C free() function.
 }

procedure serd_free(ptr:pointer);cdecl;external;
{*
   @defgroup serd_status Status Codes
   @
 }
{/ Return status code }
{/< No error }
{/< Non-fatal failure }
{/< Unknown error }
{/< Invalid syntax }
{/< Invalid argument }
{/< Not found }
{/< Encountered clashing blank node IDs }
{/< Invalid CURIE (e.g. prefix does not exist) }
{/< Unexpected internal error (should not happen) }
{/< Error writing to file/stream }
{/< Invalid text encoding }
type
  PSerdStatus = ^TSerdStatus;
  TSerdStatus =  Longint;
  Const
    SERD_SUCCESS = 0;
    SERD_FAILURE = 1;
    SERD_ERR_UNKNOWN = 2;
    SERD_ERR_BAD_SYNTAX = 3;
    SERD_ERR_BAD_ARG = 4;
    SERD_ERR_NOT_FOUND = 5;
    SERD_ERR_ID_CLASH = 6;
    SERD_ERR_BAD_CURIE = 7;
    SERD_ERR_INTERNAL = 8;
    SERD_ERR_BAD_WRITE = 9;
    SERD_ERR_BAD_TEXT = 10;
;
{/ Return a string describing a status code }
(* Const before type ignored *)

function serd_strerror(status:TSerdStatus):Puint8_t;cdecl;external;
{*
   @
   @defgroup serd_string String Utilities
   @
 }
{*
   Measure a UTF-8 string.

   @return Length of `str` in characters (except NULL).
   @param str A null-terminated UTF-8 string.
   @param n_bytes (Output) Set to the size of `str` in bytes (except NULL).
   @param flags (Output) Set to the applicable flags.
 }
(* Const before type ignored *)
function serd_strlen(str:Puint8_t; n_bytes:Psize_t; flags:PSerdNodeFlags):Tsize_t;cdecl;external;
{*
   Parse a string to a double.

   The API of this function is identical to the standard C strtod function,
   except this function is locale-independent and always matches the lexical
   format used in the Turtle grammar (the decimal point is always ".").
 }
(* Const before type ignored *)
function serd_strtod(str:Pchar; endptr:PPchar):Tdouble;cdecl;external;
{*
   Decode a base64 string.

   This function can be used to deserialise a blob node created with
   serd_node_new_blob().

   @param str Base64 string to decode.
   @param len The length of `str`.
   @param size Set to the size of the returned blob in bytes.
   @return A newly allocated blob which must be freed with serd_free().
 }
(* Const before type ignored *)
function serd_base64_decode(str:Puint8_t; len:Tsize_t; size:Psize_t):pointer;cdecl;external;
{*
   @
   @defgroup serd_streams Byte Streams
   @
 }
{*
   Function to detect I/O stream errors.

   Identical semantics to `ferror`.

   @return Non-zero if `stream` has encountered an error.
 }
type

  TSerdStreamErrorFunc = function (stream:pointer):longint;cdecl;
{*
   Source function for raw string input.

   Identical semantics to `fread`, but may set errno for more informative error
   reporting than supported by SerdStreamErrorFunc.

   @param buf Output buffer.
   @param size Size of a single element of data in bytes (always 1).
   @param nmemb Number of elements to read.
   @param stream Stream to read from (FILE* for fread).
   @return Number of elements (bytes) read.
 }

  TSerdSource = function (buf:pointer; size:Tsize_t; nmemb:Tsize_t; stream:pointer):Tsize_t;cdecl;
{/ Sink function for raw string output }
(* Const before type ignored *)

  TSerdSink = function (buf:pointer; len:Tsize_t; stream:pointer):Tsize_t;cdecl;
{*
   @
   @defgroup serd_uri URI
   @
 }
{*
   A parsed URI.

   This struct directly refers to chunks in other strings, it does not own any
   memory itself.  Thus, URIs can be parsed and/or resolved against a base URI
   in-place without allocating memory.
 }
{/< Scheme }
{/< Authority }
{/< Path prefix if relative }
{/< Path suffix }
{/< Query }
{/< Fragment }

  PSerdURI = ^TSerdURI;
  TSerdURI = record
      scheme : TSerdChunk;
      authority : TSerdChunk;
      path_base : TSerdChunk;
      path : TSerdChunk;
      query : TSerdChunk;
      fragment : TSerdChunk;
    end;
{ xxxxxxxxxx static const SerdURI SERD_URI_NULL = NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0, NULL, 0; }
{$ifndef SERD_DISABLE_DEPRECATED}
{*
   Return the local path for `uri`, or NULL if `uri` is not a file URI.
   Note this (inappropriately named) function only removes the file scheme if
   necessary, and returns `uri` unmodified if it is an absolute path.  Percent
   encoding and other issues are not handled, to properly convert a file URI to
   a path, use serd_file_uri_parse().
 }
{xxxxxSERD_DEPRECATED_BY("serd_file_uri_parse") }
(* Const before type ignored *)
(* Const before type ignored *)

function serd_uri_to_path(uri:Puint8_t):Puint8_t;cdecl;external;
{$endif}
{*
   Get the unescaped path and hostname from a file URI.

   The returned path and `*hostname` must be freed with serd_free().

   @param uri A file URI.
   @param hostname If non-NULL, set to the hostname, if present.
   @return The path component of the URI.
 }
(* Const before type ignored *)

function serd_file_uri_parse(uri:Puint8_t; hostname:PPuint8_t):Puint8_t;cdecl;external;
{/ Return true iff `utf8` starts with a valid URI scheme }
(* Const before type ignored *)
function serd_uri_string_has_scheme(utf8:Puint8_t):Tbool;cdecl;external;
{/ Parse `utf8`, writing result to `out` }
(* Const before type ignored *)
function serd_uri_parse(utf8:Puint8_t; out:PSerdURI):TSerdStatus;cdecl;external;
{*
   Set target `t` to reference `r` resolved against `base`.

   @see [RFC3986 5.2.2](http://tools.ietf.org/html/rfc3986#section-5.2.2)
 }
(* Const before type ignored *)
(* Const before type ignored *)
procedure serd_uri_resolve(r:PSerdURI; base:PSerdURI; t:PSerdURI);cdecl;external;
{/ Serialise `uri` with a series of calls to `sink` }
(* Const before type ignored *)
function serd_uri_serialise(uri:PSerdURI; sink:TSerdSink; stream:pointer):Tsize_t;cdecl;external;
{*
   Serialise `uri` relative to `base` with a series of calls to `sink`

   The `uri` is written as a relative URI iff if it a child of `base` and
   `root`.  The optional `root` parameter must be a prefix of `base` and can be
   used keep up-references ("../") within a certain namespace.
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function serd_uri_serialise_relative(uri:PSerdURI; base:PSerdURI; root:PSerdURI; sink:TSerdSink; stream:pointer):Tsize_t;cdecl;external;
{*
   @
   @defgroup serd_node Node
   @
 }
{*
   Type of a node.

   An RDF node, in the abstract sense, can be either a resource, literal, or a
   blank.  This type is more precise, because syntactically there are two ways
   to refer to a resource (by URI or CURIE).

   There are also two ways to refer to a blank node in syntax (by ID or
   anonymously), but this is handled by statement flags rather than distinct
   node types.
 }
{*
     The type of a nonexistent node.

     This type is useful as a sentinel, but is never emitted by the reader.
   }
{*
     Literal value.

     A literal optionally has either a language, or a datatype (not both).
   }
{*
     URI (absolute or relative).

     Value is an unquoted URI string, which is either a relative reference
     with respect to the current base URI (e.g. "foo/bar"), or an absolute
     URI (e.g. "http://example.org/foo").
     @see [RFC3986](http://tools.ietf.org/html/rfc3986)
   }
{*
     CURIE, a shortened URI.

     Value is an unquoted CURIE string relative to the current environment,
     e.g. "rdf:type".  @see [CURIE Syntax 1.0](http://www.w3.org/TR/curie)
   }
{*
     A blank node.

     Value is a blank node ID without any syntactic prefix, like "id3", which
     is meaningful only within this serialisation.  @see [RDF 1.1
     Turtle](http://www.w3.org/TR/turtle/#grammar-production-BLANK_NODE_LABEL)
   }
type
  PSerdType = ^TSerdType;
  TSerdType =  Longint;
  Const
    SERD_NOTHING = 0;
    SERD_LITERAL = 1;
    SERD_URI = 2;
    SERD_CURIE = 3;
    SERD_BLANK = 4;
;
{/ A syntactic RDF node }
(* Const before type ignored *)
{/< Value string }
{/< Size in bytes (excluding null) }
{/< String length (excluding null) }
{/< Node flags (string properties) }
{/< Node type }
type
  PSerdNode = ^TSerdNode;
  TSerdNode = record
      buf : Puint8_t;
      n_bytes : Tsize_t;
      n_chars : Tsize_t;
      flags : TSerdNodeFlags;
      _type : TSerdType;
    end;
{xxxxxxxxxx static const SerdNode SERD_NODE_NULL = NULL, 0, 0, 0, SERD_NOTHING; }
{*
   Make a (shallow) node from `str`.

   This measures, but does not copy, `str`.  No memory is allocated.
 }
(* Const before type ignored *)

function serd_node_from_string(_type:TSerdType; str:Puint8_t):TSerdNode;cdecl;external;
{*
   Make a (shallow) node from a prefix of `str`.

   This measures, but does not copy, `str`.  No memory is allocated.
   Note that the returned node may not be null terminated.
 }
(* Const before type ignored *)
function serd_node_from_substring(_type:TSerdType; str:Puint8_t; len:Tsize_t):TSerdNode;cdecl;external;
{/ Simple wrapper for serd_node_new_uri() to resolve a URI node }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_node_new_uri_from_node(uri_node:PSerdNode; base:PSerdURI; out:PSerdURI):TSerdNode;cdecl;external;
{/ Simple wrapper for serd_node_new_uri() to resolve a URI string }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_node_new_uri_from_string(str:Puint8_t; base:PSerdURI; out:PSerdURI):TSerdNode;cdecl;external;
{*
   Create a new file URI node from a file system path and optional hostname.

   Backslashes in Windows paths will be converted and '%' will always be
   percent encoded.  If `escape` is true, all other invalid characters will be
   percent encoded as well.

   If `path` is relative, `hostname` is ignored.
   If `out` is not NULL, it will be set to the parsed URI.
 }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_node_new_file_uri(path:Puint8_t; hostname:Puint8_t; out:PSerdURI; escape:Tbool):TSerdNode;cdecl;external;
{*
   Create a new node by serialising `uri` into a new string.

   @param uri The URI to serialise.

   @param base Base URI to resolve `uri` against (or NULL for no resolution).

   @param out Set to the parsing of the new URI (i.e. points only to
   memory owned by the new returned node).
 }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_node_new_uri(uri:PSerdURI; base:PSerdURI; out:PSerdURI):TSerdNode;cdecl;external;
{*
   Create a new node by serialising `uri` into a new relative URI.

   @param uri The URI to serialise.

   @param base Base URI to make `uri` relative to, if possible.

   @param root Root URI for resolution (see serd_uri_serialise_relative()).

   @param out Set to the parsing of the new URI (i.e. points only to
   memory owned by the new returned node).
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function serd_node_new_relative_uri(uri:PSerdURI; base:PSerdURI; root:PSerdURI; out:PSerdURI):TSerdNode;cdecl;external;
{*
   Create a new node by serialising `d` into an xsd:decimal string.

   The resulting node will always contain a '.', start with a digit, and end
   with a digit (i.e. will have a leading and/or trailing '0' if necessary).
   It will never be in scientific notation.  A maximum of `frac_digits` digits
   will be written after the decimal point, but trailing zeros will
   automatically be omitted (except one if `d` is a round integer).

   Note that about 16 and 8 fractional digits are required to precisely
   represent a double and float, respectively.

   @param d The value for the new node.
   @param frac_digits The maximum number of digits after the decimal place.
 }
function serd_node_new_decimal(d:Tdouble; frac_digits:dword):TSerdNode;cdecl;external;
{/ Create a new node by serialising `i` into an xsd:integer string }
function serd_node_new_integer(i:Tint64_t):TSerdNode;cdecl;external;
{*
   Create a node by serialising `buf` into an xsd:base64Binary string.

   This function can be used to make a serialisable node out of arbitrary
   binary data, which can be decoded using serd_base64_decode().

   @param buf Raw binary input data.
   @param size Size of `buf`.
   @param wrap_lines Wrap lines at 76 characters to conform to RFC 2045.
 }
(* Const before type ignored *)
function serd_node_new_blob(buf:pointer; size:Tsize_t; wrap_lines:Tbool):TSerdNode;cdecl;external;
{*
   Make a deep copy of `node`.

   @return a node that the caller must free with serd_node_free().
 }
(* Const before type ignored *)
function serd_node_copy(node:PSerdNode):TSerdNode;cdecl;external;
{/ Return true iff `a` is equal to `b` }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_node_equals(a:PSerdNode; b:PSerdNode):Tbool;cdecl;external;
{*
   Free any data owned by `node`.

   Note that if `node` is itself dynamically allocated (which is not the case
   for nodes created internally by serd), it will not be freed.
 }
procedure serd_node_free(node:PSerdNode);cdecl;external;
{*
   @
   @defgroup serd_event Event Handlers
   @
 }
{/ Flags indicating inline abbreviation information for a statement }
{/< Empty blank node subject }
{/< Empty blank node object }
{/< Start of anonymous subject }
{/< Start of anonymous object }
{/< Continuation of anonymous node }
{/< Start of list subject }
{/< Start of list object }
{/< Continuation of list }
type
  PSerdStatementFlag = ^TSerdStatementFlag;
  TSerdStatementFlag =  Longint;
  Const
    SERD_EMPTY_S = 1 shl 1;
    SERD_EMPTY_O = 1 shl 2;
    SERD_ANON_S_BEGIN = 1 shl 3;
    SERD_ANON_O_BEGIN = 1 shl 4;
    SERD_ANON_CONT = 1 shl 5;
    SERD_LIST_S_BEGIN = 1 shl 6;
    SERD_LIST_O_BEGIN = 1 shl 7;
    SERD_LIST_CONT = 1 shl 8;
;
{/ Bitwise OR of SerdStatementFlag values }
type
  PSerdStatementFlags = ^TSerdStatementFlags;
  TSerdStatementFlags = Tuint32_t;
{/ An error description }
{/< Error code }
(* Const before type ignored *)
{/< File with error }
{/< Line in file with error or 0 }
{/< Column in file with error }
(* Const before type ignored *)
{/< Printf-style format string }
{/< Arguments for fmt }

  PSerdError = ^TSerdError;
  TSerdError = record
      status : TSerdStatus;
      filename : Puint8_t;
      line : dword;
      col : dword;
      fmt : Pchar;
      args : Pva_list;
    end;
{*
   Sink (callback) for errors.

   @param handle Handle for user data.
   @param error Error description.
 }
(* Const before type ignored *)

  TSerdErrorSink = function (handle:pointer; error:PSerdError):TSerdStatus;cdecl;
{*
   Sink (callback) for base URI changes.

   Called whenever the base URI of the serialisation changes.
 }
(* Const before type ignored *)

  TSerdBaseSink = function (handle:pointer; uri:PSerdNode):TSerdStatus;cdecl;
{*
   Sink (callback) for namespace definitions.

   Called whenever a prefix is defined in the serialisation.
 }
(* Const before type ignored *)
(* Const before type ignored *)

  TSerdPrefixSink = function (handle:pointer; name:PSerdNode; uri:PSerdNode):TSerdStatus;cdecl;
{*
   Sink (callback) for statements.

   Called for every RDF statement in the serialisation.
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

  TSerdStatementSink = function (handle:pointer; flags:TSerdStatementFlags; graph:PSerdNode; subject:PSerdNode; predicate:PSerdNode; 
               object:PSerdNode; object_datatype:PSerdNode; object_lang:PSerdNode):TSerdStatus;cdecl;
{*
   Sink (callback) for anonymous node end markers.

   This is called to indicate that the anonymous node with the given
   `value` will no longer be referred to by any future statements
   (i.e. the anonymous serialisation of the node is finished).
 }
(* Const before type ignored *)

  TSerdEndSink = function (handle:pointer; node:PSerdNode):TSerdStatus;cdecl;
{*
   @
   @defgroup serd_env Environment
   @
 }
{/ Lexical environment for relative URIs or CURIEs (base URI and namespaces) }
  TSerdEnvImpl = TSerdEnv;
{/ Create a new environment }
(* Const before type ignored *)

function serd_env_new(base_uri:PSerdNode):PSerdEnv;cdecl;external;
{/ Free `env` }
procedure serd_env_free(env:PSerdEnv);cdecl;external;
{/ Get the current base URI }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_env_get_base_uri(env:PSerdEnv; out:PSerdURI):PSerdNode;cdecl;external;
{/ Set the current base URI }
(* Const before type ignored *)
function serd_env_set_base_uri(env:PSerdEnv; uri:PSerdNode):TSerdStatus;cdecl;external;
{*
   Set a namespace prefix.

   A namespace prefix is used to expand CURIE nodes, for example, with the
   prefix "xsd" set to "http://www.w3.org/2001/XMLSchema#", "xsd:decimal" will
   expand to "http://www.w3.org/2001/XMLSchema#decimal".
 }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_env_set_prefix(env:PSerdEnv; name:PSerdNode; uri:PSerdNode):TSerdStatus;cdecl;external;
{/ Set a namespace prefix }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_env_set_prefix_from_strings(env:PSerdEnv; name:Puint8_t; uri:Puint8_t):TSerdStatus;cdecl;external;
{/ Qualify `uri` into a CURIE if possible }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_env_qualify(env:PSerdEnv; uri:PSerdNode; prefix:PSerdNode; suffix:PSerdChunk):Tbool;cdecl;external;
{*
   Expand `curie`.

   Errors: SERD_ERR_BAD_ARG if `curie` is not valid, or SERD_ERR_BAD_CURIE if
   prefix is not defined in `env`.
 }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_env_expand(env:PSerdEnv; curie:PSerdNode; uri_prefix:PSerdChunk; uri_suffix:PSerdChunk):TSerdStatus;cdecl;external;
{*
   Expand `node`, which must be a CURIE or URI, to a full URI.

   Returns null if `node` can not be expanded.
 }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_env_expand_node(env:PSerdEnv; node:PSerdNode):TSerdNode;cdecl;external;
{/ Call `func` for each prefix defined in `env` }
(* Const before type ignored *)
procedure serd_env_foreach(env:PSerdEnv; func:TSerdPrefixSink; handle:pointer);cdecl;external;
{*
   @
   @defgroup serd_reader Reader
   @
 }
{/ Streaming parser that reads a text stream and writes to a statement sink }
type
  TSerdReaderImpl = TSerdReader;
{/ Create a new RDF reader }

function serd_reader_new(syntax:TSerdSyntax; handle:pointer; free_handle:procedure (para1:pointer); base_sink:TSerdBaseSink; prefix_sink:TSerdPrefixSink; 
           statement_sink:TSerdStatementSink; end_sink:TSerdEndSink):PSerdReader;cdecl;external;
{*
   Enable or disable strict parsing.

   The reader is non-strict (lax) by default, which will tolerate URIs with
   invalid characters.  Setting strict will fail when parsing such files.  An
   error is printed for invalid input in either case.
 }
procedure serd_reader_set_strict(reader:PSerdReader; strict:Tbool);cdecl;external;
{*
   Set a function to be called when errors occur during reading.

   The `error_sink` will be called with `handle` as its first argument.  If
   no error function is set, errors are printed to stderr in GCC style.
 }
procedure serd_reader_set_error_sink(reader:PSerdReader; error_sink:TSerdErrorSink; error_handle:pointer);cdecl;external;
{/ Return the `handle` passed to serd_reader_new() }
(* Const before type ignored *)
function serd_reader_get_handle(reader:PSerdReader):pointer;cdecl;external;
{*
   Set a prefix to be added to all blank node identifiers.

   This is useful when multiple files are to be parsed into the same output (a
   model or a file).  Since Serd preserves blank node IDs, this could cause
   conflicts where two non-equivalent blank nodes are merged, resulting in
   corrupt data.  By setting a unique blank node prefix for each parsed file,
   this can be avoided, while preserving blank node names.
 }
(* Const before type ignored *)
procedure serd_reader_add_blank_prefix(reader:PSerdReader; prefix:Puint8_t);cdecl;external;
{*
   Set the URI of the default graph.

   If this is set, the reader will emit quads with the graph set to the given
   node for any statements that are not in a named graph (which is currently
   all of them since Serd currently does not support any graph syntaxes).
 }
(* Const before type ignored *)
procedure serd_reader_set_default_graph(reader:PSerdReader; graph:PSerdNode);cdecl;external;
{/ Read a file at a given `uri` }
(* Const before type ignored *)
function serd_reader_read_file(reader:PSerdReader; uri:Puint8_t):TSerdStatus;cdecl;external;
{*
   Start an incremental read from a file handle.

   Iff `bulk` is true, `file` will be read a page at a time.  This is more
   efficient, but uses a page of memory and means that an entire page of input
   must be ready before any callbacks will fire.  To react as soon as input
   arrives, set `bulk` to false.
 }
(* Const before type ignored *)
function serd_reader_start_stream(reader:PSerdReader; file:PFILE; name:Puint8_t; bulk:Tbool):TSerdStatus;cdecl;external;
{*
   Start an incremental read from a user-specified source.

   The `read_func` is guaranteed to only be called for `page_size` elements
   with size 1 (i.e. `page_size` bytes).
 }
(* Const before type ignored *)
function serd_reader_start_source_stream(reader:PSerdReader; read_func:TSerdSource; error_func:TSerdStreamErrorFunc; stream:pointer; name:Puint8_t; 
           page_size:Tsize_t):TSerdStatus;cdecl;external;
{*
   Read a single "chunk" of data during an incremental read.

   This function will read a single top level description, and return.  This
   may be a directive, statement, or several statements; essentially it reads
   until a '.' is encountered.  This is particularly useful for reading
   directly from a pipe or socket.
 }
function serd_reader_read_chunk(reader:PSerdReader):TSerdStatus;cdecl;external;
{/ Finish an incremental read from a file handle }
function serd_reader_end_stream(reader:PSerdReader):TSerdStatus;cdecl;external;
{/ Read `file` }
(* Const before type ignored *)
function serd_reader_read_file_handle(reader:PSerdReader; file:PFILE; name:Puint8_t):TSerdStatus;cdecl;external;
{/ Read a user-specified byte source }
(* Const before type ignored *)
function serd_reader_read_source(reader:PSerdReader; source:TSerdSource; error:TSerdStreamErrorFunc; stream:pointer; name:Puint8_t; 
           page_size:Tsize_t):TSerdStatus;cdecl;external;
{/ Read `utf8` }
(* Const before type ignored *)
function serd_reader_read_string(reader:PSerdReader; utf8:Puint8_t):TSerdStatus;cdecl;external;
{*
   Skip over bytes in the input until a specific byte is encountered.

   Typically used for recording from errors in a line-based syntax by skipping
   ahead to the next newline.

   @return #SERD_SUCCESS if the given byte was reached, or #SERD_FAILURE if the
   end of input is reached.
 }
function serd_reader_skip_until_byte(reader:PSerdReader; byte:Tuint8_t):TSerdStatus;cdecl;external;
{/ Free `reader` }
procedure serd_reader_free(reader:PSerdReader);cdecl;external;
{*
   @
   @defgroup serd_writer Writer
   @
 }
{/ Streaming serialiser that writes a text stream as statements are pushed }
type
  TSerdWriterImpl = TSerdWriter;
{*
   Syntax style options.

   These flags allow more precise control of writer output style.  Note that
   some options are only supported for some syntaxes, for example, NTriples
   does not support abbreviation and is always ASCII.
 }
{/< Abbreviate triples when possible. }
{/< Escape all non-ASCII characters. }
{/< Resolve URIs against base URI. }
{/< Shorten URIs into CURIEs. }
{/< Write output in pages. }
{/< Abort with error on lossy output }

  PSerdStyle = ^TSerdStyle;
  TSerdStyle =  Longint;
  Const
    SERD_STYLE_ABBREVIATED = 1 shl 0;
    SERD_STYLE_ASCII = 1 shl 1;
    SERD_STYLE_RESOLVED = 1 shl 2;
    SERD_STYLE_CURIED = 1 shl 3;
    SERD_STYLE_BULK = 1 shl 4;
    SERD_STYLE_STRICT = 1 shl 5;
;
{/ Create a new RDF writer }
(* Const before type ignored *)

function serd_writer_new(syntax:TSerdSyntax; style:TSerdStyle; env:PSerdEnv; base_uri:PSerdURI; ssink:TSerdSink; 
           stream:pointer):PSerdWriter;cdecl;external;
{/ Free `writer` }
procedure serd_writer_free(writer:PSerdWriter);cdecl;external;
{/ Return the env used by `writer` }
function serd_writer_get_env(writer:PSerdWriter):PSerdEnv;cdecl;external;
{*
   A convenience sink function for writing to a FILE*.

   This function can be used as a SerdSink when writing to a FILE*.  The
   `stream` parameter must be a FILE* opened for writing.
 }
(* Const before type ignored *)
function serd_file_sink(buf:pointer; len:Tsize_t; stream:pointer):Tsize_t;cdecl;external;
{*
   A convenience sink function for writing to a string.

   This function can be used as a SerdSink to write to a SerdChunk which is
   resized as necessary with realloc().  The `stream` parameter must point to
   an initialized SerdChunk.  When the write is finished, the string should be
   retrieved with serd_chunk_sink_finish().
 }
(* Const before type ignored *)
function serd_chunk_sink(buf:pointer; len:Tsize_t; stream:pointer):Tsize_t;cdecl;external;
{*
   Finish a serialisation to a chunk with serd_chunk_sink().

   The returned string is the result of the serialisation, which is null
   terminated (by this function) and owned by the caller.
 }
function serd_chunk_sink_finish(stream:PSerdChunk):Puint8_t;cdecl;external;
{*
   Set a function to be called when errors occur during writing.

   The `error_sink` will be called with `handle` as its first argument.  If
   no error function is set, errors are printed to stderr.
 }
procedure serd_writer_set_error_sink(writer:PSerdWriter; error_sink:TSerdErrorSink; error_handle:pointer);cdecl;external;
{*
   Set a prefix to be removed from matching blank node identifiers.

   This is the counterpart to serd_reader_add_blank_prefix() which can be used
   to "undo" added prefixes.
 }
(* Const before type ignored *)
procedure serd_writer_chop_blank_prefix(writer:PSerdWriter; prefix:Puint8_t);cdecl;external;
{*
   Set the current output base URI, and emit a directive if applicable.

   Note this function can be safely casted to SerdBaseSink.
 }
(* Const before type ignored *)
function serd_writer_set_base_uri(writer:PSerdWriter; uri:PSerdNode):TSerdStatus;cdecl;external;
{*
   Set the current root URI.

   The root URI should be a prefix of the base URI.  The path of the root URI
   is the highest path any relative up-reference can refer to.  For example,
   with root <file:///foo/root> and base <file:///foo/root/base>,
   <file:///foo/root> will be written as <../>, but <file:///foo> will be
   written non-relatively as <file:///foo>.  If the root is not explicitly set,
   it defaults to the base URI, so no up-references will be created at all.
 }
(* Const before type ignored *)
function serd_writer_set_root_uri(writer:PSerdWriter; uri:PSerdNode):TSerdStatus;cdecl;external;
{*
   Set a namespace prefix (and emit directive if applicable).

   Note this function can be safely casted to SerdPrefixSink.
 }
(* Const before type ignored *)
(* Const before type ignored *)
function serd_writer_set_prefix(writer:PSerdWriter; name:PSerdNode; uri:PSerdNode):TSerdStatus;cdecl;external;
{*
   Write a statement.

   Note this function can be safely casted to SerdStatementSink.
 }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function serd_writer_write_statement(writer:PSerdWriter; flags:TSerdStatementFlags; graph:PSerdNode; subject:PSerdNode; predicate:PSerdNode; 
           object:PSerdNode; datatype:PSerdNode; lang:PSerdNode):TSerdStatus;cdecl;external;
{*
   Mark the end of an anonymous node's description.

   Note this function can be safely casted to SerdEndSink.
 }
(* Const before type ignored *)
function serd_writer_end_anon(writer:PSerdWriter; node:PSerdNode):TSerdStatus;cdecl;external;
{*
   Finish a write.

   This flushes any pending output, for example terminating punctuation, so
   that the output is a complete document.
 }
function serd_writer_finish(writer:PSerdWriter):TSerdStatus;cdecl;external;
{*
   @
   @
 }
(** unsupported pragma#pragma GCC diagnostic pop*)
{$endif}
{ SERD_SERD_H  }

implementation


end.
