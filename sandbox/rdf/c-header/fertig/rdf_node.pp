
unit rdf_node;
interface

{
  Automatically converted by H2Pas 1.0.0 from rdf_node.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rdf_node.h
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
Plibrdf_iterator  = ^librdf_iterator;
Plibrdf_node  = ^librdf_node;
Plibrdf_node_type  = ^librdf_node_type;
Plibrdf_uri  = ^librdf_uri;
Plibrdf_world  = ^librdf_world;
Praptor_iostream  = ^raptor_iostream;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_node.h - RDF Node definition
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
{$ifndef LIBRDF_NODE_H}
{$define LIBRDF_NODE_H}
{$ifndef LIBRDF_OBJC_FRAMEWORK}
{$include <rdf_uri.h>}
{$else}
{$include <Redland/rdf_uri.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ Node types  }
{ DEPENDENCY: If this list is changed, the librdf_node_type_names
 * definition in rdf_node.c must be updated to match
 *
 * Node type 3 is unused and should not be renumbered to keep binary
 * ABI compatibility.
  }
{*
 * librdf_node_type:
 * @LIBRDF_NODE_TYPE_UNKNOWN: Internal
 * @LIBRDF_NODE_TYPE_RESOURCE: rdf:Resource (& rdf:Property) - has a URI
 * @LIBRDF_NODE_TYPE_LITERAL: rdf:Literal - has an XML string, language,
 *   XML space
 * @LIBRDF_NODE_TYPE_BLANK: blank node has an identifier string.
 * @LIBRDF_NODE_TYPE_LAST: Internal
 *
 * Type of a redland node.
 *
 * Better to check this with functions librdf_node_is_resource(),
 * librdf_node_is_literal() or librdf_node_is_blank().
 *
  }
type
  Plibrdf_node_type = ^Tlibrdf_node_type;
  Tlibrdf_node_type =  Longint;
  Const
    LIBRDF_NODE_TYPE_UNKNOWN = RAPTOR_TERM_TYPE_UNKNOWN;
    LIBRDF_NODE_TYPE_RESOURCE = RAPTOR_TERM_TYPE_URI;
    LIBRDF_NODE_TYPE_LITERAL = RAPTOR_TERM_TYPE_LITERAL;
    LIBRDF_NODE_TYPE_BLANK = RAPTOR_TERM_TYPE_BLANK;
    LIBRDF_NODE_TYPE_LAST = LIBRDF_NODE_TYPE_BLANK;
;
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_node_internal.h>}
{$endif}
{ Create a new Node.  }

function librdf_new_node(world:Plibrdf_world):Plibrdf_node;cdecl;external;
{ Create a new resource Node from URI string.  }
(* Const before type ignored *)
function librdf_new_node_from_uri_string(world:Plibrdf_world; uri_string:Pbyte):Plibrdf_node;cdecl;external;
(* Const before type ignored *)
function librdf_new_node_from_counted_uri_string(world:Plibrdf_world; uri_string:Pbyte; len:Tsize_t):Plibrdf_node;cdecl;external;
{ Create a new resource Node from URI object.  }
function librdf_new_node_from_uri(world:Plibrdf_world; uri:Plibrdf_uri):Plibrdf_node;cdecl;external;
{ Create a new resource Node from URI object with a local_name  }
(* Const before type ignored *)
function librdf_new_node_from_uri_local_name(world:Plibrdf_world; uri:Plibrdf_uri; local_name:Pbyte):Plibrdf_node;cdecl;external;
{ Create a new resource Node from URI string renormalised to a new base  }
(* Const before type ignored *)
function librdf_new_node_from_normalised_uri_string(world:Plibrdf_world; uri_string:Pbyte; source_uri:Plibrdf_uri; base_uri:Plibrdf_uri):Plibrdf_node;cdecl;external;
{ Create a new Node from literal string / language.  }
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_new_node_from_literal(world:Plibrdf_world; _string:Pbyte; xml_language:Pchar; is_wf_xml:longint):Plibrdf_node;cdecl;external;
{ Create a new Node from a typed literal string / language.  }
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_new_node_from_typed_literal(world:Plibrdf_world; value:Pbyte; xml_language:Pchar; datatype_uri:Plibrdf_uri):Plibrdf_node;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function librdf_new_node_from_typed_counted_literal(world:Plibrdf_world; value:Pbyte; value_len:Tsize_t; xml_language:Pchar; xml_language_len:Tsize_t; 
           datatype_uri:Plibrdf_uri):Plibrdf_node;cdecl;external;
{ Create a new Node from blank node identifier.  }
(* Const before type ignored *)
function librdf_new_node_from_blank_identifier(world:Plibrdf_world; identifier:Pbyte):Plibrdf_node;cdecl;external;
(* Const before type ignored *)
function librdf_new_node_from_counted_blank_identifier(world:Plibrdf_world; identifier:Pbyte; identifier_len:Tsize_t):Plibrdf_node;cdecl;external;
{ Create a new Node from an existing Node - CLONE  }
function librdf_new_node_from_node(node:Plibrdf_node):Plibrdf_node;cdecl;external;
{ destructor  }
procedure librdf_free_node(node:Plibrdf_node);cdecl;external;
{ functions / methods  }
function librdf_node_get_uri(node:Plibrdf_node):Plibrdf_uri;cdecl;external;
function librdf_node_get_type(node:Plibrdf_node):Tlibrdf_node_type;cdecl;external;
function librdf_node_get_literal_value(node:Plibrdf_node):Pbyte;cdecl;external;
function librdf_node_get_literal_value_as_counted_string(node:Plibrdf_node; len_p:Psize_t):Pbyte;cdecl;external;
function librdf_node_get_literal_value_as_latin1(node:Plibrdf_node):Pchar;cdecl;external;
function librdf_node_get_literal_value_language(node:Plibrdf_node):Pchar;cdecl;external;
function librdf_node_get_literal_value_is_wf_xml(node:Plibrdf_node):longint;cdecl;external;
function librdf_node_get_literal_value_datatype_uri(node:Plibrdf_node):Plibrdf_uri;cdecl;external;
function librdf_node_get_li_ordinal(node:Plibrdf_node):longint;cdecl;external;
function librdf_node_get_blank_identifier(node:Plibrdf_node):Pbyte;cdecl;external;
function librdf_node_get_counted_blank_identifier(node:Plibrdf_node; len_p:Psize_t):Pbyte;cdecl;external;
function librdf_node_is_resource(node:Plibrdf_node):longint;cdecl;external;
function librdf_node_is_literal(node:Plibrdf_node):longint;cdecl;external;
function librdf_node_is_blank(node:Plibrdf_node):longint;cdecl;external;
{ serialise / deserialise  }
function librdf_node_encode(node:Plibrdf_node; buffer:Pbyte; length:Tsize_t):Tsize_t;cdecl;external;
function librdf_node_decode(world:Plibrdf_world; size_p:Psize_t; buffer:Pbyte; length:Tsize_t):Plibrdf_node;cdecl;external;
{ convert to a string  }
{REDLAND_DEPRECATED }
function librdf_node_to_string(node:Plibrdf_node):Pbyte;cdecl;external;
{REDLAND_DEPRECATED }
function librdf_node_to_counted_string(node:Plibrdf_node; len_p:Psize_t):Pbyte;cdecl;external;
{ pretty print it  }
function librdf_node_write(node:Plibrdf_node; iostr:Praptor_iostream):longint;cdecl;external;
procedure librdf_node_print(node:Plibrdf_node; fh:PFILE);cdecl;external;
{ utility functions  }
function librdf_node_equals(first_node:Plibrdf_node; second_node:Plibrdf_node):longint;cdecl;external;
{ create an iterator for a static array of nodes  }
{REDLAND_DEPRECATED }
function librdf_node_static_iterator_create(nodes:PPlibrdf_node; size:longint):Plibrdf_iterator;cdecl;external;
function librdf_node_new_static_node_iterator(world:Plibrdf_world; nodes:PPlibrdf_node; size:longint):Plibrdf_iterator;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
