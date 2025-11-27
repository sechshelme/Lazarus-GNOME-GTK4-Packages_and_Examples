unit rdf_hash;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_hash.h - RDF Hash Factory and Hash interfaces and definitions
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
{$ifndef LIBRDF_HASH_H}
{$define LIBRDF_HASH_H}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_hash_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ public constructors  }

function librdf_new_hash(world:Plibrdf_world; name:Pchar):Plibrdf_hash;cdecl;external librdf;
function librdf_new_hash_from_string(world:Plibrdf_world; name:Pchar; _string:Pchar):Plibrdf_hash;cdecl;external librdf;
function librdf_new_hash_from_array_of_strings(world:Plibrdf_world; name:Pchar; array:PPchar):Plibrdf_hash;cdecl;external librdf;
{ public copy constructor  }
function librdf_new_hash_from_hash(old_hash:Plibrdf_hash):Plibrdf_hash;cdecl;external librdf;
{ public destructor  }
procedure librdf_free_hash(hash:Plibrdf_hash);cdecl;external librdf;
{ public methods  }
{ retrieve one value for a given hash key  }
function librdf_hash_get(hash:Plibrdf_hash; key:Pchar):Pchar;cdecl;external librdf;
{ lookup a hash key and decode value as a boolean  }
function librdf_hash_get_as_boolean(hash:Plibrdf_hash; key:Pchar):longint;cdecl;external librdf;
{ lookup a hash key and decode value as a long  }
function librdf_hash_get_as_long(hash:Plibrdf_hash; key:Pchar):longint;cdecl;external librdf;
{ retrieve one value for key and delete from hash all other values  }
function librdf_hash_get_del(hash:Plibrdf_hash; key:Pchar):Pchar;cdecl;external librdf;
{ insert a key/value pair  }
function librdf_hash_put_strings(hash:Plibrdf_hash; key:Pchar; value:Pchar):longint;cdecl;external librdf;
{ make a hash from a string  }
function librdf_hash_from_string(hash:Plibrdf_hash; _string:Pchar):longint;cdecl;external librdf;
{ make a string from a hash  }
function librdf_hash_to_string(hash:Plibrdf_hash; filter:PPchar):Pchar;cdecl;external librdf;
procedure librdf_hash_print(hash:Plibrdf_hash; fh:PFILE);cdecl;external librdf;
procedure librdf_hash_print_keys(hash:Plibrdf_hash; fh:PFILE);cdecl;external librdf;
procedure librdf_hash_print_values(hash:Plibrdf_hash; key_string:Pchar; fh:PFILE);cdecl;external librdf;
function librdf_hash_interpret_template(template_string:Pbyte; dictionary:Plibrdf_hash; prefix:Pbyte; suffix:Pbyte):Pbyte;cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:40 ===


implementation



end.
