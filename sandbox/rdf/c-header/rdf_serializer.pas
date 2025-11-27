unit rdf_serializer;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_serializer.h - RDF Serializer Factory / Serializer interfaces and definition
 *
 * Copyright (C) 2002-2009, David Beckett http://www.dajobe.org/
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
{$ifndef LIBRDF_SERIALIZER_H}
{$define LIBRDF_SERIALIZER_H}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_serializer_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{$include <raptor2.h>}
{ class methods  }

procedure librdf_serializer_register_factory(world:Plibrdf_world; name:Pchar; _label:Pchar; mime_type:Pchar; uri_string:Pbyte; 
            factory:procedure (para1:Plibrdf_serializer_factory));cdecl;external librdf;
{REDLAND_DEPRECATED }
function librdf_serializer_enumerate(world:Plibrdf_world; counter:dword; name:PPchar; _label:PPchar):longint;cdecl;external librdf;
function librdf_serializer_get_description(world:Plibrdf_world; counter:dword):Praptor_syntax_description;cdecl;external librdf;
function librdf_serializer_check_name(world:Plibrdf_world; name:Pchar):longint;cdecl;external librdf;
{ constructor  }
function librdf_new_serializer(world:Plibrdf_world; name:Pchar; mime_type:Pchar; type_uri:Plibrdf_uri):Plibrdf_serializer;cdecl;external librdf;
function librdf_new_serializer_from_factory(world:Plibrdf_world; factory:Plibrdf_serializer_factory):Plibrdf_serializer;cdecl;external librdf;
{ destructor  }
procedure librdf_free_serializer(serializer:Plibrdf_serializer);cdecl;external librdf;
{ methods  }
{ REDLAND_DEPRECATED }
function librdf_serializer_serialize_model(serializer:Plibrdf_serializer; handle:PFILE; base_uri:Plibrdf_uri; model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_serializer_serialize_stream_to_file_handle(serializer:Plibrdf_serializer; handle:PFILE; base_uri:Plibrdf_uri; stream:Plibrdf_stream):longint;cdecl;external librdf;
function librdf_serializer_serialize_model_to_file_handle(serializer:Plibrdf_serializer; handle:PFILE; base_uri:Plibrdf_uri; model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_serializer_serialize_stream_to_file(serializer:Plibrdf_serializer; name:Pchar; base_uri:Plibrdf_uri; stream:Plibrdf_stream):longint;cdecl;external librdf;
function librdf_serializer_serialize_model_to_file(serializer:Plibrdf_serializer; name:Pchar; base_uri:Plibrdf_uri; model:Plibrdf_model):longint;cdecl;external librdf;
function librdf_serializer_serialize_stream_to_string(serializer:Plibrdf_serializer; base_uri:Plibrdf_uri; stream:Plibrdf_stream):Pbyte;cdecl;external librdf;
function librdf_serializer_serialize_model_to_string(serializer:Plibrdf_serializer; base_uri:Plibrdf_uri; model:Plibrdf_model):Pbyte;cdecl;external librdf;
function librdf_serializer_serialize_stream_to_counted_string(serializer:Plibrdf_serializer; base_uri:Plibrdf_uri; stream:Plibrdf_stream; length_p:Psize_t):Pbyte;cdecl;external librdf;
function librdf_serializer_serialize_model_to_counted_string(serializer:Plibrdf_serializer; base_uri:Plibrdf_uri; model:Plibrdf_model; length_p:Psize_t):Pbyte;cdecl;external librdf;
function librdf_serializer_serialize_stream_to_iostream(serializer:Plibrdf_serializer; base_uri:Plibrdf_uri; stream:Plibrdf_stream; iostr:Praptor_iostream):longint;cdecl;external librdf;
function librdf_serializer_serialize_model_to_iostream(serializer:Plibrdf_serializer; base_uri:Plibrdf_uri; model:Plibrdf_model; iostr:Praptor_iostream):longint;cdecl;external librdf;
procedure librdf_serializer_set_error(serializer:Plibrdf_serializer; user_data:pointer; error_fn:procedure (user_data:pointer; msg:Pchar; args:array of const));cdecl;external librdf;
procedure librdf_serializer_set_error(serializer:Plibrdf_serializer; user_data:pointer; error_fn:procedure (user_data:pointer; msg:Pchar));cdecl;external librdf;
procedure librdf_serializer_set_warning(serializer:Plibrdf_serializer; user_data:pointer; warning_fn:procedure (user_data:pointer; msg:Pchar; args:array of const));cdecl;external librdf;
procedure librdf_serializer_set_warning(serializer:Plibrdf_serializer; user_data:pointer; warning_fn:procedure (user_data:pointer; msg:Pchar));cdecl;external librdf;
function librdf_serializer_get_feature(serializer:Plibrdf_serializer; feature:Plibrdf_uri):Plibrdf_node;cdecl;external librdf;
function librdf_serializer_set_feature(serializer:Plibrdf_serializer; feature:Plibrdf_uri; value:Plibrdf_node):longint;cdecl;external librdf;
function librdf_serializer_set_namespace(serializer:Plibrdf_serializer; uri:Plibrdf_uri; prefix:Pchar):longint;cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:14 ===


implementation



end.
