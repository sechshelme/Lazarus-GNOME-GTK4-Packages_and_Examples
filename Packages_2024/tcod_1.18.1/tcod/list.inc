{$IFDEF read_interface}


type
  PTCOD_List = type Pointer;

  PTCOD_list_t = ^TTCOD_list_t;
  TTCOD_list_t = PTCOD_List;

  {TCOD_DEPRECATED("TCOD_List is not a suitable container.  Use a custom array or a C++ container instead.") }

function TCOD_list_new: TTCOD_list_t; cdecl; external libtcod; deprecated;
function TCOD_list_allocate(nb_elements: longint): TTCOD_list_t; cdecl; external libtcod; deprecated;
function TCOD_list_duplicate(l: TTCOD_list_t): TTCOD_list_t; cdecl; external libtcod; deprecated;
procedure TCOD_list_delete(l: TTCOD_list_t); cdecl; external libtcod; deprecated;
procedure TCOD_list_push(l: TTCOD_list_t; elt: pointer); cdecl; external libtcod; deprecated;
function TCOD_list_pop(l: TTCOD_list_t): pointer; cdecl; external libtcod; deprecated;
function TCOD_list_peek(l: TTCOD_list_t): pointer; cdecl; external libtcod; deprecated;
procedure TCOD_list_add_all(l: TTCOD_list_t; l2: TTCOD_list_t); cdecl; external libtcod; deprecated;
function TCOD_list_get(l: TTCOD_list_t; idx: longint): pointer; cdecl; external libtcod; deprecated;
procedure TCOD_list_set(l: TTCOD_list_t; elt: pointer; idx: longint); cdecl; external libtcod; deprecated;
function TCOD_list_begin(l: TTCOD_list_t): Ppointer; cdecl; external libtcod; deprecated;
function TCOD_list_end(l: TTCOD_list_t): Ppointer; cdecl; external libtcod; deprecated;
procedure TCOD_list_reverse(l: TTCOD_list_t); cdecl; external libtcod; deprecated;
function TCOD_list_remove_iterator(l: TTCOD_list_t; elt: Ppointer): Ppointer; cdecl; external libtcod; deprecated;
procedure TCOD_list_remove(l: TTCOD_list_t; elt: pointer); cdecl; external libtcod; deprecated;
function TCOD_list_remove_iterator_fast(l: TTCOD_list_t; elt: Ppointer): Ppointer; cdecl; external libtcod; deprecated;
procedure TCOD_list_remove_fast(l: TTCOD_list_t; elt: pointer); cdecl; external libtcod; deprecated;
function TCOD_list_contains(l: TTCOD_list_t; elt: pointer): Tbool; cdecl; external libtcod; deprecated;
procedure TCOD_list_clear(l: TTCOD_list_t); cdecl; external libtcod; deprecated;
procedure TCOD_list_clear_and_delete(l: TTCOD_list_t); cdecl; external libtcod; deprecated;
function TCOD_list_size(l: TTCOD_list_t): longint; cdecl; external libtcod; deprecated;
function TCOD_list_insert_before(l: TTCOD_list_t; elt: pointer; before: longint): Ppointer; cdecl; external libtcod; deprecated;
function TCOD_list_is_empty(l: TTCOD_list_t): Tbool; cdecl; external libtcod; deprecated;

// === Konventiert am: 10-9-25 13:30:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
