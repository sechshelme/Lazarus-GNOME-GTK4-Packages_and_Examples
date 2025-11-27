unit rdf_init;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_init.h - Overall library initialisation / termination and memory
 *              management prototypes
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
{$ifndef LIBRDF_INIT_H}
{$define LIBRDF_INIT_H}
type

  Tlibrdf_raptor_init_handler = procedure (user_data:pointer; raptor_world_ptr:Praptor_world);cdecl;

  Tlibrdf_rasqal_init_handler = procedure (user_data:pointer; rasqal_world_ptr:Prasqal_world);cdecl;
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_init_internal.h>}
{$endif}
{$ifndef LIBRDF_OBJC_FRAMEWORK}
{$include <rasqal.h>}
{$else}
{$include <Redland/rasqal.h>}
{$endif}
{ C++ extern C conditionnal removed }

function librdf_new_world:Plibrdf_world;cdecl;external librdf;
procedure librdf_free_world(world:Plibrdf_world);cdecl;external librdf;
procedure librdf_world_open(world:Plibrdf_world);cdecl;external librdf;
procedure librdf_world_init_mutex(world:Plibrdf_world);cdecl;external librdf;
procedure librdf_world_set_rasqal(world:Plibrdf_world; rasqal_world_ptr:Prasqal_world);cdecl;external librdf;
procedure librdf_world_set_raptor_init_handler(world:Plibrdf_world; user_data:pointer; handler:Tlibrdf_raptor_init_handler);cdecl;external librdf;
procedure librdf_world_set_rasqal_init_handler(world:Plibrdf_world; user_data:pointer; handler:Tlibrdf_rasqal_init_handler);cdecl;external librdf;
function librdf_world_get_rasqal(world:Plibrdf_world):Prasqal_world;cdecl;external librdf;
procedure librdf_world_set_error(world:Plibrdf_world; user_data:pointer; error_handler:Tlibrdf_log_level_func);cdecl;external librdf;
procedure librdf_world_set_warning(world:Plibrdf_world; user_data:pointer; warning_handler:Tlibrdf_log_level_func);cdecl;external librdf;
procedure librdf_world_set_logger(world:Plibrdf_world; user_data:pointer; log_handler:Tlibrdf_log_func);cdecl;external librdf;
procedure librdf_world_set_digest(world:Plibrdf_world; name:Pchar);cdecl;external librdf;
procedure librdf_free_memory(ptr:pointer);cdecl;external librdf;
function librdf_alloc_memory(size:Tsize_t):pointer;cdecl;external librdf;
function librdf_calloc_memory(nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external librdf;
{*
 * LIBRDF_WORLD_FEATURE_GENID_BASE:
 *
 * World feature to set the generated ID base.
 *
 * Must be set before the world is opened with librdf_world_open().
  }
const
  LIBRDF_WORLD_FEATURE_GENID_BASE = 'http://feature.librdf.org/genid-base';  
{*
 * LIBRDF_WORLD_FEATURE_GENID_COUNTER:
 *
 * World feature to set the generated ID counter.
 *
 * Must be set before the world is opened with librdf_world_open().
  }
  LIBRDF_WORLD_FEATURE_GENID_COUNTER = 'http://feature.librdf.org/genid-counter';  

function librdf_world_get_feature(world:Plibrdf_world; feature:Plibrdf_uri):Plibrdf_node;cdecl;external librdf;
function librdf_world_set_feature(world:Plibrdf_world; feature:Plibrdf_uri; value:Plibrdf_node):longint;cdecl;external librdf;
{ OLD INTERFACES  }
{  REDLAND_DEPRECATED }
procedure librdf_init_world(digest_factory_name:Pchar; not_used2:pointer);cdecl;external librdf;
{ REDLAND_DEPRECATED }
procedure librdf_destroy_world;cdecl;external librdf;
{$ifdef LIBRDF_INTERNAL}
function librdf_basename(name:Pchar):Pchar;cdecl;external librdf;
{$endif}
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:37 ===


implementation



end.
