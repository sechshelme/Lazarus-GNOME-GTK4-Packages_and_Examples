unit rdf_list;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: c; c-basic-offset: 2 -*-
 *
 * rdf_list.h - RDF List Interface definition
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
{$ifndef LIBRDF_LIST_H}
{$define LIBRDF_LIST_H}
{$ifndef LIBRDF_OBJC_FRAMEWORK}
{$include <rdf_iterator.h>}
{$else}
{$include <Redland/rdf_iterator.h>}
{$endif}
{ C++ extern C conditionnal removed }

function librdf_new_list(world:Plibrdf_world):Plibrdf_list;cdecl;external librdf;
procedure librdf_free_list(list:Plibrdf_list);cdecl;external librdf;
procedure librdf_list_clear(list:Plibrdf_list);cdecl;external librdf;
{ add to end of list (push)  }
function librdf_list_add(list:Plibrdf_list; data:pointer):longint;cdecl;external librdf;
{ add to start of list  }
function librdf_list_unshift(list:Plibrdf_list; data:pointer):longint;cdecl;external librdf;
{ remove from start of list  }
function librdf_list_shift(list:Plibrdf_list):pointer;cdecl;external librdf;
{ remove from end of list (pop)  }
function librdf_list_pop(list:Plibrdf_list):pointer;cdecl;external librdf;
function librdf_list_remove(list:Plibrdf_list; data:pointer):pointer;cdecl;external librdf;
function librdf_list_contains(list:Plibrdf_list; data:pointer):longint;cdecl;external librdf;
function librdf_list_size(list:Plibrdf_list):longint;cdecl;external librdf;
procedure librdf_list_set_equals(list:Plibrdf_list; equals:function (data1:pointer; data2:pointer):longint);cdecl;external librdf;
function librdf_list_get_iterator(list:Plibrdf_list):Plibrdf_iterator;cdecl;external librdf;
procedure librdf_list_foreach(list:Plibrdf_list; fn:procedure (para1:pointer; para2:pointer); user_data:pointer);cdecl;external librdf;
{ C++ end of extern C conditionnal removed }
{$endif}

// === Konventiert am: 27-11-25 17:39:32 ===


implementation



end.
