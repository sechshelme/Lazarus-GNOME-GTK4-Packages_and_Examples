unit rdf_uri;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_uri.h - RDF URI Definition
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
{$ifndef LIBRDF_URI_H}
{$define LIBRDF_URI_H}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_uri_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{*
 * librdf_uri_filter_func:
 * @user_data: user data
 * @uri: #librdf_uri URI to check
 *
 * Callback function for librdf_parser_set_uri_filter()
 *
 * Return value: non-0 to filter the URI
 }
type

  Tlibrdf_uri_filter_func = function (user_data:pointer; uri:Plibrdf_uri):longint;cdecl;
{ constructors  }

function librdf_new_uri(world:Plibrdf_world; uri_string:Pbyte):Plibrdf_uri;cdecl;external librdf;
function librdf_new_uri2(world:Plibrdf_world; uri_string:Pbyte; length:Tsize_t):Plibrdf_uri;cdecl;external librdf;
{ Create a new URI from an existing URI - CLONE  }
function librdf_new_uri_from_uri(old_uri:Plibrdf_uri):Plibrdf_uri;cdecl;external librdf;
{ Create a new URI from an existing URI and local name  }
function librdf_new_uri_from_uri_local_name(old_uri:Plibrdf_uri; local_name:Pbyte):Plibrdf_uri;cdecl;external librdf;
{ destructor  }
procedure librdf_free_uri(uri:Plibrdf_uri);cdecl;external librdf;
{ methods  }
function librdf_uri_as_string(uri:Plibrdf_uri):Pbyte;cdecl;external librdf;
function librdf_uri_as_counted_string(uri:Plibrdf_uri; len_p:Psize_t):Pbyte;cdecl;external librdf;
procedure librdf_uri_print(uri:Plibrdf_uri; fh:PFILE);cdecl;external librdf;
function librdf_uri_to_string(uri:Plibrdf_uri):Pbyte;cdecl;external librdf;
function librdf_uri_to_counted_string(uri:Plibrdf_uri; len_p:Psize_t):Pbyte;cdecl;external librdf;
function librdf_uri_equals(first_uri:Plibrdf_uri; second_uri:Plibrdf_uri):longint;cdecl;external librdf;
function librdf_uri_compare(uri1:Plibrdf_uri; uri2:Plibrdf_uri):longint;cdecl;external librdf;
function librdf_uri_is_file_uri(uri:Plibrdf_uri):longint;cdecl;external librdf;
function librdf_uri_to_filename(uri:Plibrdf_uri):Pchar;cdecl;external librdf;
function librdf_new_uri_normalised_to_base(uri_string:Pbyte; source_uri:Plibrdf_uri; base_uri:Plibrdf_uri):Plibrdf_uri;cdecl;external librdf;
function librdf_new_uri_relative_to_base(base_uri:Plibrdf_uri; uri_string:Pbyte):Plibrdf_uri;cdecl;external librdf;
function librdf_new_uri_from_filename(world:Plibrdf_world; filename:Pchar):Plibrdf_uri;cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:02 ===


implementation



end.
