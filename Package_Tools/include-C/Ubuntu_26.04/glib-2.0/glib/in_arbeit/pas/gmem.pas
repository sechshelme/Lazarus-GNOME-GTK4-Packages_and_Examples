unit gmem;

interface

uses
  common_GLIB, gtypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  {$IFDEF CPU64}
  G_MEM_ALIGN = 8;
  {$ELSE}
  G_MEM_ALIGN = 4;
  {$ENDIF}

type
  PGMemVTable = ^TGMemVTable;
  TGMemVTable = record
    malloc: function(n_bytes: Tgsize): Tgpointer; cdecl;
    realloc: function(mem: Tgpointer; n_bytes: Tgsize): Tgpointer; cdecl;
    free: procedure(mem: Tgpointer); cdecl;
    calloc: function(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl;
    try_malloc: function(n_bytes: Tgsize): Tgpointer; cdecl;
    try_realloc: function(mem: Tgpointer; n_bytes: Tgsize): Tgpointer; cdecl;
  end;

procedure g_free(mem: Tgpointer); cdecl; external libglib2;
procedure g_free_sized(mem: Tgpointer; size: Tsize_t); cdecl; external libglib2;
procedure g_clear_pointer(pp: Pgpointer; destroy: TGDestroyNotify); cdecl; external libglib2;
function g_malloc(n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_malloc0(n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_realloc(mem: Tgpointer; n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_malloc(n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_malloc0(n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_realloc(mem: Tgpointer; n_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_malloc_n(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_malloc0_n(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_realloc_n(mem: Tgpointer; n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_malloc_n(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_malloc0_n(n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_try_realloc_n(mem: Tgpointer; n_blocks: Tgsize; n_block_bytes: Tgsize): Tgpointer; cdecl; external libglib2;
function g_aligned_alloc(n_blocks: Tgsize; n_block_bytes: Tgsize; alignment: Tgsize): Tgpointer; cdecl; external libglib2;
function g_aligned_alloc0(n_blocks: Tgsize; n_block_bytes: Tgsize; alignment: Tgsize): Tgpointer; cdecl; external libglib2;
procedure g_aligned_free(mem: Tgpointer); cdecl; external libglib2;
procedure g_aligned_free_sized(mem: Tgpointer; alignment: Tsize_t; size: Tsize_t); cdecl; external libglib2;

procedure g_mem_set_vtable(vtable: PGMemVTable); cdecl; external libglib2; deprecated;
function g_mem_is_system_malloc: Tgboolean; cdecl; external libglib2; deprecated;

var
  g_mem_gc_friendly: Tgboolean; cvar;external libglib2;
  glib_mem_profiler_table: PGMemVTable; cvar;external libglib2;

procedure g_mem_profile; cdecl; external libglib2; deprecated;

function g_new(bytes_per_struct, n_structs: Tgsize): Tgpointer;
function g_new0(bytes_per_struct, n_structs: Tgsize): Tgpointer;
function g_renew(struct_size: Tgsize; OldMem: Tgpointer; n_structs: Tgsize): Tgpointer;

function g_steal_pointer(pp: Tgpointer): Tgpointer; inline;

// === Konventiert am: 22-6-26 17:11:10 ===


implementation

function g_new(bytes_per_struct, n_structs: Tgsize): Tgpointer;
begin
  g_new := g_malloc(n_structs * bytes_per_struct);
end;

function g_new0(bytes_per_struct, n_structs: Tgsize): Tgpointer;
begin
  g_new0 := g_malloc0(n_structs * bytes_per_struct);
end;

function g_renew(struct_size: Tgsize; OldMem: Tgpointer; n_structs: Tgsize): Tgpointer;
begin
  g_renew := g_realloc(OldMem, struct_size * n_structs);
end;


function g_steal_pointer(pp: Tgpointer): Tgpointer;
var
  ptr: PPointer;
  ref: Pointer;
begin
  ptr := Pgpointer(pp);
  ref := ptr^;
  ptr^ := nil;
  Result := ref;
end;


end.
