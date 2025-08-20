unit gsl_bst;

interface

uses
  fp_gsl, gsl_bst_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_bst_type = record
    name: pchar;
    node_size: Tsize_t;
    init: function(allocator: Pgsl_bst_allocator; compare: Pgsl_bst_cmp_function; params: pointer; vtable: pointer): longint; cdecl;
    nodes: function(vtable: pointer): Tsize_t; cdecl;
    insert: function(item: pointer; vtable: pointer): pointer; cdecl;
    find: function(item: pointer; vtable: pointer): pointer; cdecl;
    remove: function(item: pointer; vtable: pointer): pointer; cdecl;
    empty: function(vtable: pointer): longint; cdecl;
    trav_init: function(vtrav: pointer; vtable: pointer): longint; cdecl;
    trav_first: function(vtrav: pointer; vtable: pointer): pointer; cdecl;
    trav_last: function(vtrav: pointer; vtable: pointer): pointer; cdecl;
    trav_find: function(item: pointer; vtrav: pointer; vtable: pointer): pointer; cdecl;
    trav_insert: function(item: pointer; vtrav: pointer; vtable: pointer): pointer; cdecl;
    trav_copy: function(vtrav: pointer; vsrc: pointer): pointer; cdecl;
    trav_next: function(vtrav: pointer): pointer; cdecl;
    trav_prev: function(vtrav: pointer): pointer; cdecl;
    trav_cur: function(vtrav: pointer): pointer; cdecl;
    trav_replace: function(vtrav: pointer; new_item: pointer): pointer; cdecl;
  end;
  Pgsl_bst_type = ^Tgsl_bst_type;

  Tgsl_bst_workspace = record
    _type: Pgsl_bst_type;
    table: record
      case longint of
        0: (avl_table: Tgsl_bst_avl_table);
        1: (rb_table: Tgsl_bst_rb_table);
      end;
  end;
  Pgsl_bst_workspace = ^Tgsl_bst_workspace;

  Tgsl_bst_trav = record
    _type: Pgsl_bst_type;
    trav_data: record
      case longint of
        0: (avl_trav: Tgsl_bst_avl_traverser);
        1: (rb_trav: Tgsl_bst_rb_traverser);
      end;
  end;
  Pgsl_bst_trav = ^Tgsl_bst_trav;

var
  gsl_bst_avl: Pgsl_bst_type; cvar;external libgsl;
  gsl_bst_rb: Pgsl_bst_type; cvar;external libgsl;

function gsl_bst_alloc(T: Pgsl_bst_type; allocator: Pgsl_bst_allocator; compare: Pgsl_bst_cmp_function; params: pointer): Pgsl_bst_workspace; cdecl; external libgsl;
procedure gsl_bst_free(w: Pgsl_bst_workspace); cdecl; external libgsl;
function gsl_bst_empty(w: Pgsl_bst_workspace): longint; cdecl; external libgsl;
function gsl_bst_insert(item: pointer; w: Pgsl_bst_workspace): pointer; cdecl; external libgsl;
function gsl_bst_find(item: pointer; w: Pgsl_bst_workspace): pointer; cdecl; external libgsl;
function gsl_bst_remove(item: pointer; w: Pgsl_bst_workspace): pointer; cdecl; external libgsl;
function gsl_bst_nodes(w: Pgsl_bst_workspace): Tsize_t; cdecl; external libgsl;
function gsl_bst_node_size(w: Pgsl_bst_workspace): Tsize_t; cdecl; external libgsl;
function gsl_bst_name(w: Pgsl_bst_workspace): pchar; cdecl; external libgsl;
function gsl_bst_trav_init(trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): longint; cdecl; external libgsl;
function gsl_bst_trav_first(trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): pointer; cdecl; external libgsl;
function gsl_bst_trav_last(trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): pointer; cdecl; external libgsl;
function gsl_bst_trav_find(item: pointer; trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): pointer; cdecl; external libgsl;
function gsl_bst_trav_insert(item: pointer; trav: Pgsl_bst_trav; w: Pgsl_bst_workspace): pointer; cdecl; external libgsl;
function gsl_bst_trav_copy(dest: Pgsl_bst_trav; src: Pgsl_bst_trav): pointer; cdecl; external libgsl;
function gsl_bst_trav_next(trav: Pgsl_bst_trav): pointer; cdecl; external libgsl;
function gsl_bst_trav_prev(trav: Pgsl_bst_trav): pointer; cdecl; external libgsl;
function gsl_bst_trav_cur(trav: Pgsl_bst_trav): pointer; cdecl; external libgsl;
function gsl_bst_trav_replace(trav: Pgsl_bst_trav; new_item: pointer): pointer; cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:40:20 ===


implementation



end.
