unit gegl_version;

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GEGL_MAJOR_VERSION = 0;
  GEGL_MINOR_VERSION = 4;
  GEGL_MICRO_VERSION = 48;

procedure gegl_get_version(major: Plongint; minor: Plongint; micro: Plongint); cdecl; external libgegl;

// === Konventiert am: 12-8-26 17:15:52 ===


implementation



end.
