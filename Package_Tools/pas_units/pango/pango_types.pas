unit pango_types;

interface

uses
  ctypes, fp_cairo, fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== Ausgelagerts

type
  TPangoLanguage = record
  end;
  PPangoLanguage = ^TPangoLanguage;
  PPPangoLanguage = ^PPangoLanguage;

  TPangoFontMap = record
    parent_instance: TGObject;
  end;
  PPangoFontMap = ^TPangoFontMap;

  TPangoFontFamily = record
    parent_instance: TGObject;
  end;
  PPangoFontFamily = ^TPangoFontFamily;
  PPPangoFontFamily = ^PPangoFontFamily;
  PPPPangoFontFamily = ^PPPangoFontFamily;

  TPangoFontDescription = record
  end;
  PPangoFontDescription = ^TPangoFontDescription;
  PPPangoFontDescription = ^PPangoFontDescription;

  TPangoFont = record
    parent_instance: TGObject;
  end;
  PPangoFont = ^TPangoFont;

type
  TPangoFontMetrics = record
    ref_count: Tguint;
    ascent: longint;
    descent: longint;
    Height: longint;
    approximate_char_width: longint;
    approximate_digit_width: longint;
    underline_position: longint;
    underline_thickness: longint;
    strikethrough_position: longint;
    strikethrough_thickness: longint;
  end;
  PPangoFontMetrics = ^TPangoFontMetrics;

  TPangoFontset = record
    parent_instance: TGObject;
  end;
  PPangoFontset = ^TPangoFontset;

  TPangoFontFace = record
    parent_instance: TGObject;
  end;
  PPangoFontFace = ^TPangoFontFace;
  PPPangoFontFace = ^PPangoFontFace;
  PPPPangoFontFace = ^PPPangoFontFace;

  TPangoEngine = record
    parent_instance: TGObject;
  end;
  PPangoEngine = ^TPangoEngine;

  TPangoEngineShape = record
    parent_instance: TPangoEngine;
  end;
  PPangoEngineShape = ^TPangoEngineShape;

  TPangoEngineLang = record
    parent_instance: TPangoEngine;
  end;
  PPangoEngineLang = ^TPangoEngineLang;

  TPangoAttrIterator = record
  end;
  PPangoAttrIterator = ^TPangoAttrIterator;

  TPangoAttrList = record
  end;
  PPangoAttrList = ^TPangoAttrList;


  // =====

type
  PPangoGlyph = ^TPangoGlyph;
  TPangoGlyph = Tguint32;

const
  PANGO_SCALE = 1024;

function pango_units_from_double(d: Tdouble): longint; cdecl; external libpango;
function pango_units_to_double(i: longint): Tdouble; cdecl; external libpango;

type
  TPangoRectangle = record
    x: longint;
    y: longint;
    Width: longint;
    Height: longint;
  end;
  PPangoRectangle = ^TPangoRectangle;

procedure pango_extents_to_pixels(inclusive: PPangoRectangle; nearest: PPangoRectangle); cdecl; external libpango;

function PANGO_PIXELS(d: longint): longint;
function PANGO_PIXELS_FLOOR(d: longint): longint;
function PANGO_PIXELS_CEIL(d: longint): longint;
function PANGO_UNITS_FLOOR(d: longint): longint;
function PANGO_UNITS_CEIL(d: longint): longint;
function PANGO_UNITS_ROUND(d: longint): longint;

function PANGO_ASCENT(rect: TPangoRectangle): longint;
function PANGO_DESCENT(rect: TPangoRectangle): longint;
function PANGO_LBEARING(rect: TPangoRectangle): longint;
function PANGO_RBEARING(rect: TPangoRectangle): longint;

// === Konventiert am: 23-11-24 17:22:35 ===


implementation

function PANGO_PIXELS(d: longint): longint;
begin
  PANGO_PIXELS := (cint(d) + 512) shr 10;
end;

function PANGO_PIXELS_FLOOR(d: longint): longint;
begin
  PANGO_PIXELS_FLOOR := (cint(d)) shr 10;
end;

function PANGO_PIXELS_CEIL(d: longint): longint;
begin
  PANGO_PIXELS_CEIL := (cint(d) + 1023) shr 10;
end;

function PANGO_UNITS_FLOOR(d: longint): longint;
begin
  PANGO_UNITS_FLOOR := d and not (PANGO_SCALE - 1);
end;

function PANGO_UNITS_CEIL(d: longint): longint;
begin
  PANGO_UNITS_CEIL := d + (PANGO_SCALE - 1) and not (PANGO_SCALE - 1);
end;

function PANGO_UNITS_ROUND(d: longint): longint;
begin
  PANGO_UNITS_ROUND := d + (PANGO_SCALE shr 1) and not (PANGO_SCALE - 1);
end;

function PANGO_ASCENT(rect: TPangoRectangle): longint;
begin
  PANGO_ASCENT := -(rect.y);
end;

function PANGO_DESCENT(rect: TPangoRectangle): longint;
begin
  PANGO_DESCENT := (rect.y) + (rect.Height);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function PANGO_LBEARING(rect: TPangoRectangle): longint;
begin
  PANGO_LBEARING := rect.x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }
function PANGO_RBEARING(rect: TPangoRectangle): longint;
begin
  PANGO_RBEARING := (rect.x) + (rect.Width);
end;


end.
