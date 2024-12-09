
{$IFDEF read_interface}


function g_slice_alloc(block_size:Tgsize):Tgpointer;cdecl;external libglib2;
function g_slice_alloc0(block_size:Tgsize):Tgpointer;cdecl;external libglib2;
function g_slice_copy(block_size:Tgsize; mem_block:Tgconstpointer):Tgpointer;cdecl;external libglib2;
procedure g_slice_free1(block_size:Tgsize; mem_block:Tgpointer);cdecl;external libglib2;
procedure g_slice_free_chain_with_offset(block_size:Tgsize; mem_chain:Tgpointer; next_offset:Tgsize);cdecl;external libglib2;

type
  PGSliceConfig = ^TGSliceConfig;
  TGSliceConfig =  Longint;
  Const
    G_SLICE_CONFIG_ALWAYS_MALLOC = 1;
    G_SLICE_CONFIG_BYPASS_MAGAZINES = 2;
    G_SLICE_CONFIG_WORKING_SET_MSECS = 3;
    G_SLICE_CONFIG_COLOR_INCREMENT = 4;
    G_SLICE_CONFIG_CHUNK_SIZES = 5;
    G_SLICE_CONFIG_CONTENTION_COUNTER = 6;

procedure g_slice_set_config(ckey:TGSliceConfig; value:Tgint64);cdecl;external libglib2;
function g_slice_get_config(ckey:TGSliceConfig):Tgint64;cdecl;external libglib2;
function g_slice_get_config_state(ckey:TGSliceConfig; address:Tgint64; n_values:Pguint):Pgint64;cdecl;external libglib2;

procedure g_slice_debug_tree_statistics;cdecl;external libglib2;

// === Konventiert am: 10-8-24 20:03:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
