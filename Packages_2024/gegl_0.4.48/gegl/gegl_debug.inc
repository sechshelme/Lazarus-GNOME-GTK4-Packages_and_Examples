

  {$IFDEF read_enum}
type
  PGeglDebugFlag = ^TGeglDebugFlag;
  TGeglDebugFlag = longint;
const
  GEGL_DEBUG_PROCESS = 1 shl 0;
  GEGL_DEBUG_BUFFER_LOAD = 1 shl 1;
  GEGL_DEBUG_BUFFER_SAVE = 1 shl 2;
  GEGL_DEBUG_TILE_BACKEND = 1 shl 3;
  GEGL_DEBUG_PROCESSOR = 1 shl 4;
  GEGL_DEBUG_CACHE = 1 shl 5;
  GEGL_DEBUG_MISC = 1 shl 6;
  GEGL_DEBUG_INVALIDATION = 1 shl 7;
  GEGL_DEBUG_OPENCL = 1 shl 8;
  GEGL_DEBUG_BUFFER_ALLOC = 1 shl 9;
  GEGL_DEBUG_LICENSE = 1 shl 10;
  {$ENDIF read_enum}

  {$IFDEF read_function}
var
  gegl_debug_flags: Tguint; cvar;external libgegl;
  gegl_debug_keys: PGDebugKey; cvar;external libgegl;
  {$ENDIF read_function}

  // === Konventiert am: 12-8-26 14:47:22 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
