{$IFDEF read_interface}


function librdf_new_list(world: Plibrdf_world): Plibrdf_list; cdecl; external librdf;
procedure librdf_free_list(list: Plibrdf_list); cdecl; external librdf;
procedure librdf_list_clear(list: Plibrdf_list); cdecl; external librdf;
function librdf_list_add(list: Plibrdf_list; data: pointer): longint; cdecl; external librdf;
function librdf_list_unshift(list: Plibrdf_list; data: pointer): longint; cdecl; external librdf;
function librdf_list_shift(list: Plibrdf_list): pointer; cdecl; external librdf;
function librdf_list_pop(list: Plibrdf_list): pointer; cdecl; external librdf;
function librdf_list_remove(list: Plibrdf_list; data: pointer): pointer; cdecl; external librdf;
function librdf_list_contains(list: Plibrdf_list; data: pointer): longint; cdecl; external librdf;
function librdf_list_size(list: Plibrdf_list): longint; cdecl; external librdf;

type
  Tlist_set = function(data1: pointer; data2: pointer): longint; cdecl;

procedure librdf_list_set_equals(list: Plibrdf_list; equals: Tlist_set); cdecl; external librdf;
function librdf_list_get_iterator(list: Plibrdf_list): Plibrdf_iterator; cdecl; external librdf;

type
  Tlist_foreach_proc = procedure(para1: pointer; para2: pointer); cdecl;

procedure librdf_list_foreach(list: Plibrdf_list; fn: Tlist_foreach_proc; user_data: pointer); cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
