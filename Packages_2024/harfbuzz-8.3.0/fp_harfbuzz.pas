unit fp_harfbuzz;

interface

uses
  ctypes, fp_cairo, fp_glib2;

const
  {$IFDEF Linux}
  libharfbuzz = 'harfbuzz';
  libharfbuzzsubset = 'harfbuzz-subset';
  libharfbuzzcairo = 'harfbuzz-cairo';
  libharfbuzzicu = 'harfbuzz-icu';
  libharfbuzzgobject = 'harfbuzz-gobject';
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

  // ==== FreeType2
type
  TFT_Face = type Pointer;

  // ==== graphite2
type
  // /usr/include/graphite2/Font.h
  Pgr_face = type Pointer;
  Pgr_font = type Pointer;

  // ==== unicode
type
  // /usr/include/unicode/uscript.h
  TUScriptCode = longint;

  {$DEFINE read_interface}
  {$include fp_harfbuzz_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_harfbuzz_includes.inc}
{$UNDEF read_implementation}

end.
