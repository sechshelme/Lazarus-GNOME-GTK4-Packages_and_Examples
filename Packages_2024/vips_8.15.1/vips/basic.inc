
  {$IFDEF read_struct}
type
  PVipsPel = ^TVipsPel;
  TVipsPel = byte;

  TVipsCallbackFn = function(a: pointer; b: pointer): longint; cdecl;
  TVipsSListMap2Fn = function(item: pointer; a: pointer; b: pointer): pointer; cdecl;
  TVipsSListMap4Fn = function(item: pointer; a: pointer; b: pointer; c: pointer; d: pointer): pointer; cdecl;
  TVipsSListFold2Fn = function(item: pointer; a: pointer; b: pointer; c: pointer): pointer; cdecl;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  PVipsPrecision = ^TVipsPrecision;
  TVipsPrecision = longint;

const
  VIPS_PRECISION_INTEGER = 0;
  VIPS_PRECISION_FLOAT = 1;
  VIPS_PRECISION_APPROXIMATE = 2;
  VIPS_PRECISION_LAST = 3;
  {$ENDIF read_enum}

{$IFDEF read_function}
function vips_path_filename7(path: pchar): pchar; cdecl; external libvips;
function vips_path_mode7(path: pchar): pchar; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:15:27 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
