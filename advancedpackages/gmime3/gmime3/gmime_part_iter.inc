{$IFDEF read_interface}

type
  PGMimePartIter = type Pointer;

function g_mime_part_iter_get_type: TGType; cdecl; external libgmime3;
function g_mime_part_iter_new(toplevel: PGMimeObject): PGMimePartIter; cdecl; external libgmime3;
procedure g_mime_part_iter_free(iter: PGMimePartIter); cdecl; external libgmime3;
function g_mime_part_iter_clone(iter: PGMimePartIter): PGMimePartIter; cdecl; external libgmime3;
procedure g_mime_part_iter_reset(iter: PGMimePartIter); cdecl; external libgmime3;
function g_mime_part_iter_jump_to(iter: PGMimePartIter; path: pchar): Tgboolean; cdecl; external libgmime3;
function g_mime_part_iter_is_valid(iter: PGMimePartIter): Tgboolean; cdecl; external libgmime3;
function g_mime_part_iter_next(iter: PGMimePartIter): Tgboolean; cdecl; external libgmime3;
function g_mime_part_iter_prev(iter: PGMimePartIter): Tgboolean; cdecl; external libgmime3;
function g_mime_part_iter_get_toplevel(iter: PGMimePartIter): PGMimeObject; cdecl; external libgmime3;
function g_mime_part_iter_get_current(iter: PGMimePartIter): PGMimeObject; cdecl; external libgmime3;
function g_mime_part_iter_get_parent(iter: PGMimePartIter): PGMimeObject; cdecl; external libgmime3;
function g_mime_part_iter_get_path(iter: PGMimePartIter): pchar; cdecl; external libgmime3;
function g_mime_part_iter_replace(iter: PGMimePartIter; replacement: PGMimeObject): Tgboolean; cdecl; external libgmime3;
function g_mime_part_iter_remove(iter: PGMimePartIter): Tgboolean; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:33:04 ===

function GMIME_TYPE_PART_ITER: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_PART_ITER: TGType;
begin
  GMIME_TYPE_PART_ITER := g_mime_part_iter_get_type;
end;



{$ENDIF read_implementation}
