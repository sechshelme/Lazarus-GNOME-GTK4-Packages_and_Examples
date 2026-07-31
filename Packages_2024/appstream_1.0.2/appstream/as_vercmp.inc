

  {$IFDEF read_enum}
type
  PAsVercmpFlags = ^TAsVercmpFlags;
  TAsVercmpFlags = longint;
const
  AS_VERCMP_FLAG_NONE = 0;
  AS_VERCMP_FLAG_IGNORE_EPOCH = 1 shl 0;
  AS_VERCMP_FLAG_LAST = (1 shl 0) + 1;
  {$ENDIF read_enum}

{$IFDEF read_function}
function as_vercmp(a: Pgchar; b: Pgchar; flags: TAsVercmpFlags): Tgint; cdecl; external libappstream;
function as_vercmp_simple(a: Pgchar; b: Pgchar): Tgint; cdecl; external libappstream;
function as_vercmp_test_match(ver1: Pgchar; compare: TAsRelationCompare; ver2: Pgchar; flags: TAsVercmpFlags): Tgboolean; cdecl; external libappstream;
{$ENDIF read_function}

// === Konventiert am: 30-7-26 19:34:14 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
