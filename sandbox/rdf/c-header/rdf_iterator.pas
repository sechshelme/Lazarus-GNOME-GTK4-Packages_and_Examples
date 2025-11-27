unit rdf_iterator;

interface

uses
  fp_rdf, rdf;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tlibrdf_iterator_map_handler = function(iterator: Plibrdf_iterator; map_context: pointer; item: pointer): pointer; cdecl;
  Tlibrdf_iterator_map_free_context_handler = procedure(map_context: pointer); cdecl;

type
  Plibrdf_iterator_get_method_flags = ^Tlibrdf_iterator_get_method_flags;
  Tlibrdf_iterator_get_method_flags = longint;

const
  LIBRDF_ITERATOR_GET_METHOD_GET_OBJECT = 0;
  LIBRDF_ITERATOR_GET_METHOD_GET_CONTEXT = 1;
  LIBRDF_ITERATOR_GET_METHOD_GET_KEY = 2;
  LIBRDF_ITERATOR_GET_METHOD_GET_VALUE = 3;

type
  Titerator_new_func1 = function(para1: pointer): longint; cdecl;
  Titerator_new_func2 = function(para1: pointer; para2: longint): pointer; cdecl;
  Titerator_new_func3 = procedure(para1: pointer); cdecl;

function librdf_new_iterator(world: Plibrdf_world; context: pointer; is_end_method: Titerator_new_func1; next_method: Titerator_new_func1; get_method: Titerator_new_func2; finished_method: Titerator_new_func3): Plibrdf_iterator; cdecl; external librdf;
procedure librdf_free_iterator(iterator: Plibrdf_iterator); cdecl; external librdf;
function librdf_iterator_end(iterator: Plibrdf_iterator): longint; cdecl; external librdf;
function librdf_iterator_have_elements(iterator: Plibrdf_iterator): longint; cdecl; external librdf; deprecated;
function librdf_iterator_next(iterator: Plibrdf_iterator): longint; cdecl; external librdf;
function librdf_iterator_get_object(iterator: Plibrdf_iterator): pointer; cdecl; external librdf;
function librdf_iterator_get_context(iterator: Plibrdf_iterator): pointer; cdecl; external librdf;
function librdf_iterator_get_key(iterator: Plibrdf_iterator): pointer; cdecl; external librdf;
function librdf_iterator_get_value(iterator: Plibrdf_iterator): pointer; cdecl; external librdf;
function librdf_iterator_add_map(iterator: Plibrdf_iterator; map_function: Tlibrdf_iterator_map_handler; free_context: Tlibrdf_iterator_map_free_context_handler; map_context: pointer): longint; cdecl; external librdf;
function librdf_new_empty_iterator(world: Plibrdf_world): Plibrdf_iterator; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:35 ===


implementation



end.
