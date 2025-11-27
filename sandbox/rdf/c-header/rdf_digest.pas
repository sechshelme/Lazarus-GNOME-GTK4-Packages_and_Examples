unit rdf_digest;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_digest.h - RDF Digest Factory / Digest interfaces and definition
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
{$ifndef LIBRDF_DIGEST_H}
{$define LIBRDF_DIGEST_H}
{$ifdef LIBRDF_INTERNAL}
{$include <rdf_digest_internal.h>}
{$endif}
{ C++ extern C conditionnal removed }
{ public constructor  }

function librdf_new_digest(world:Plibrdf_world; name:Pchar):Plibrdf_digest;cdecl;external librdf;
{ destructor  }
procedure librdf_free_digest(digest:Plibrdf_digest);cdecl;external librdf;
{ methods  }
procedure librdf_digest_init(digest:Plibrdf_digest);cdecl;external librdf;
procedure librdf_digest_update(digest:Plibrdf_digest; buf:Pbyte; length:Tsize_t);cdecl;external librdf;
procedure librdf_digest_update_string(digest:Plibrdf_digest; _string:Pbyte);cdecl;external librdf;
procedure librdf_digest_final(digest:Plibrdf_digest);cdecl;external librdf;
function librdf_digest_get_digest(digest:Plibrdf_digest):pointer;cdecl;external librdf;
function librdf_digest_get_digest_length(digest:Plibrdf_digest):Tsize_t;cdecl;external librdf;
function librdf_digest_to_string(digest:Plibrdf_digest):Pchar;cdecl;external librdf;
procedure librdf_digest_print(digest:Plibrdf_digest; fh:PFILE);cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:43 ===


implementation



end.
