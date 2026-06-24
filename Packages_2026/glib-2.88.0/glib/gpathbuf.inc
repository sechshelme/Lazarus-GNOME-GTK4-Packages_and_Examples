{$IFDEF read_interface}


type
  PGPathBuf = ^TGPathBuf;
  TGPathBuf = record
    dummy: array[0..7] of Tgpointer;
  end;

const
  G_PATH_BUF_INIT_: TGPathBuf = (dummy: (nil, nil, nil, nil, nil, nil, nil, nil));

function g_path_buf_new: PGPathBuf; cdecl; external libglib2;
function g_path_buf_new_from_path(path: pchar): PGPathBuf; cdecl; external libglib2;
function g_path_buf_init(buf: PGPathBuf): PGPathBuf; cdecl; external libglib2;
function g_path_buf_init_from_path(buf: PGPathBuf; path: pchar): PGPathBuf; cdecl; external libglib2;
procedure g_path_buf_clear(buf: PGPathBuf); cdecl; external libglib2;
function g_path_buf_clear_to_path(buf: PGPathBuf): pchar; cdecl; external libglib2;
procedure g_path_buf_free(buf: PGPathBuf); cdecl; external libglib2;
function g_path_buf_free_to_path(buf: PGPathBuf): pchar; cdecl; external libglib2;
function g_path_buf_copy(buf: PGPathBuf): PGPathBuf; cdecl; external libglib2;
function g_path_buf_push(buf: PGPathBuf; path: pchar): PGPathBuf; cdecl; external libglib2;
function g_path_buf_pop(buf: PGPathBuf): Tgboolean; cdecl; external libglib2;
function g_path_buf_set_filename(buf: PGPathBuf; file_name: pchar): Tgboolean; cdecl; external libglib2;
function g_path_buf_set_extension(buf: PGPathBuf; extension: pchar): Tgboolean; cdecl; external libglib2;
function g_path_buf_to_path(buf: PGPathBuf): pchar; cdecl; external libglib2;
function g_path_buf_equal(v1: Tgconstpointer; v2: Tgconstpointer): Tgboolean; cdecl; external libglib2;

// === Konventiert am: 22-6-26 17:11:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
