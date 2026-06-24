{$IFDEF read_interface}

type
  PGMappedFile = type Pointer;

function g_mapped_file_new(filename: Pgchar; writable: Tgboolean; error: PPGError): PGMappedFile; cdecl; external libglib2;
function g_mapped_file_new_from_fd(fd: Tgint; writable: Tgboolean; error: PPGError): PGMappedFile; cdecl; external libglib2;
function g_mapped_file_get_length(file_: PGMappedFile): Tgsize; cdecl; external libglib2;
function g_mapped_file_get_contents(file_: PGMappedFile): Pgchar; cdecl; external libglib2;
function g_mapped_file_get_bytes(file_: PGMappedFile): PGBytes; cdecl; external libglib2;
function g_mapped_file_ref(file_: PGMappedFile): PGMappedFile; cdecl; external libglib2;
procedure g_mapped_file_unref(file_: PGMappedFile); cdecl; external libglib2;
procedure g_mapped_file_free(file_: PGMappedFile); cdecl; external libglib2; deprecated;

// === Konventiert am: 22-6-26 17:10:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
