

{$IFDEF read_enum}
const
  GEGL_MAJOR_VERSION = 0;
  GEGL_MINOR_VERSION = 4;
  GEGL_MICRO_VERSION = 48;
  {$ENDIF read_enum}

{$IFDEF read_function}
procedure gegl_get_version(major: Plongint; minor: Plongint; micro: Plongint); cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 17:15:52 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
