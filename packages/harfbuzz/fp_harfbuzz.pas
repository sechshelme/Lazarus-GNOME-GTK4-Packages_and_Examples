unit fp_harfbuzz;

interface

uses
  ctypes, fp_FreeType2, fp_cairo, fp_glib2;

const
  {$IFDEF Linux}
  libharfbuzz = 'libharfbuzz';
  libharfbuzzsubset = 'libharfbuzz-subset';
  libharfbuzzcairo = 'libharfbuzz-cairo';
  libharfbuzzicu = 'libharfbuzz-icu';
  libharfbuzzgobject = 'libharfbuzz-gobject';
  {$ENDIF}

  {$IFDEF Windows}
  libharfbuzz = 'libharfbuzz-0.dll';
  libharfbuzzcairo = 'libharfbuzz-cairo-0.dll';
  libharfbuzzicu = 'libharfbuzz-icu-0.dll';
  libharfbuzzsubset = 'libharfbuzz-subset-0.dll';
  libharfbuzzgobject = 'libharfbuzz-gobject-0.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_harfbuzz_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_harfbuzz_includes.inc}
{$UNDEF read_implementation}

end.
