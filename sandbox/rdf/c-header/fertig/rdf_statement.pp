
unit rdf_statement;
interface

{
  Automatically converted by H2Pas 1.0.0 from rdf_statement.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rdf_statement.h
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
PFILE  = ^FILE;
Plibrdf_node  = ^librdf_node;
Plibrdf_statement  = ^librdf_statement;
Plibrdf_statement_part  = ^librdf_statement_part;
Plibrdf_world  = ^librdf_world;
Praptor_iostream  = ^raptor_iostream;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_statement.h - RDF Statement definition
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
{$ifndef LIBRDF_STATEMENT_H}
{$define LIBRDF_STATEMENT_H}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_statement_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{*
 * librdf_statement_part:
 * @LIBRDF_STATEMENT_SUBJECT: Subject of a statement.
 * @LIBRDF_STATEMENT_PREDICATE: Predicate of a statement.
 * @LIBRDF_STATEMENT_OBJECT: Object of a statement.
 * @LIBRDF_STATEMENT_ALL: All parts of a statement.
 *
 * Flags that are or-ed to indicate statement parts.
 *
 * Used in fields arguments to methods such as the public
 * librdf_statement_encode_parts() librdf_statement_decode_parts()
 * librdf_new_stream_from_node_iterator().
  }
{ must be a combination of all of the above  }
type
  Plibrdf_statement_part = ^Tlibrdf_statement_part;
  Tlibrdf_statement_part =  Longint;
  Const
    LIBRDF_STATEMENT_SUBJECT = 1 shl 0;
    LIBRDF_STATEMENT_PREDICATE = 1 shl 1;
    LIBRDF_STATEMENT_OBJECT = 1 shl 2;
    LIBRDF_STATEMENT_ALL = (LIBRDF_STATEMENT_SUBJECT or LIBRDF_STATEMENT_PREDICATE) or LIBRDF_STATEMENT_OBJECT;
;
{ initialising functions / constructors  }
{ Create a new Statement.  }

function librdf_new_statement(world:Plibrdf_world):Plibrdf_statement;cdecl;external;
{ Create a new Statement from an existing Statement - DEEP CLONE  }
function librdf_new_statement_from_statement(statement:Plibrdf_statement):Plibrdf_statement;cdecl;external;
{ Create a new Statement from an existing Statement - SHALLOW CLONE  }
function librdf_new_statement_from_statement2(statement:Plibrdf_statement):Plibrdf_statement;cdecl;external;
{ Create a new Statement from existing Nodes  }
function librdf_new_statement_from_nodes(world:Plibrdf_world; subject:Plibrdf_node; predicate:Plibrdf_node; object:Plibrdf_node):Plibrdf_statement;cdecl;external;
{ Init a statically allocated statement  }
procedure librdf_statement_init(world:Plibrdf_world; statement:Plibrdf_statement);cdecl;external;
{ Clear a statically allocated statement  }
procedure librdf_statement_clear(statement:Plibrdf_statement);cdecl;external;
{ destructor  }
procedure librdf_free_statement(statement:Plibrdf_statement);cdecl;external;
{ functions / methods  }
function librdf_statement_get_subject(statement:Plibrdf_statement):Plibrdf_node;cdecl;external;
procedure librdf_statement_set_subject(statement:Plibrdf_statement; node:Plibrdf_node);cdecl;external;
function librdf_statement_get_predicate(statement:Plibrdf_statement):Plibrdf_node;cdecl;external;
procedure librdf_statement_set_predicate(statement:Plibrdf_statement; node:Plibrdf_node);cdecl;external;
function librdf_statement_get_object(statement:Plibrdf_statement):Plibrdf_node;cdecl;external;
procedure librdf_statement_set_object(statement:Plibrdf_statement; node:Plibrdf_node);cdecl;external;
{ if statement has all fields  }
function librdf_statement_is_complete(statement:Plibrdf_statement):longint;cdecl;external;
{ convert to a string  }
{ REDLAND_DEPRECATED }
function librdf_statement_to_string(statement:Plibrdf_statement):Pbyte;cdecl;external;
{ print it prettily  }
function librdf_statement_write(statement:Plibrdf_statement; iostr:Praptor_iostream):longint;cdecl;external;
procedure librdf_statement_print(statement:Plibrdf_statement; fh:PFILE);cdecl;external;
{ compare two statements  }
function librdf_statement_equals(statement1:Plibrdf_statement; statement2:Plibrdf_statement):longint;cdecl;external;
{ match statement against one with partial content  }
function librdf_statement_match(statement:Plibrdf_statement; partial_statement:Plibrdf_statement):longint;cdecl;external;
{ serialising/deserialising  }
{REDLAND_DEPRECATED }
function librdf_statement_encode(statement:Plibrdf_statement; buffer:Pbyte; length:Tsize_t):Tsize_t;cdecl;external;
function librdf_statement_encode2(world:Plibrdf_world; statement:Plibrdf_statement; buffer:Pbyte; length:Tsize_t):Tsize_t;cdecl;external;
{REDLAND_DEPRECATED }
function librdf_statement_encode_parts(statement:Plibrdf_statement; context_node:Plibrdf_node; buffer:Pbyte; length:Tsize_t; fields:Tlibrdf_statement_part):Tsize_t;cdecl;external;
function librdf_statement_encode_parts2(world:Plibrdf_world; statement:Plibrdf_statement; context_node:Plibrdf_node; buffer:Pbyte; length:Tsize_t; 
           fields:Tlibrdf_statement_part):Tsize_t;cdecl;external;
{REDLAND_DEPRECATED }
function librdf_statement_decode(statement:Plibrdf_statement; buffer:Pbyte; length:Tsize_t):Tsize_t;cdecl;external;
function librdf_statement_decode2(world:Plibrdf_world; statement:Plibrdf_statement; context_node:PPlibrdf_node; buffer:Pbyte; length:Tsize_t):Tsize_t;cdecl;external;
{REDLAND_DEPRECATED }
function librdf_statement_decode_parts(statement:Plibrdf_statement; context_node:PPlibrdf_node; buffer:Pbyte; length:Tsize_t):Tsize_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
