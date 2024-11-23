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

// =====



type
  PPangoGlyph = ^TPangoGlyph;
  TPangoGlyph = Tguint32;

const
  PANGO_SCALE = 1024;  

function pango_units_from_double(d:Tdouble):longint;cdecl;external libpango;
function pango_units_to_double(i:longint):Tdouble;cdecl;external libpango;
type
  TPangoRectangle = record
      x : longint;
      y : longint;
      width : longint;
      height : longint;
    end;
  PPangoRectangle = ^TPangoRectangle;

procedure pango_extents_to_pixels(inclusive:PPangoRectangle; nearest:PPangoRectangle);cdecl;external libpango;

function PANGO_PIXELS(d : longint) : longint;
function PANGO_PIXELS_FLOOR(d : longint) : longint;
function PANGO_PIXELS_CEIL(d : longint) : longint;
function PANGO_UNITS_FLOOR(d : longint) : LongInt;
function PANGO_UNITS_CEIL(d : longint) : longint;
function PANGO_UNITS_ROUND(d : longint) : longint;

function PANGO_ASCENT(rect : TPangoRectangle) : longint;
function PANGO_DESCENT(rect : TPangoRectangle) : longint;
function PANGO_LBEARING(rect : TPangoRectangle) : longint;
function PANGO_RBEARING(rect : TPangoRectangle) : longint;

// === Konventiert am: 23-11-24 17:22:35 ===


implementation

function PANGO_PIXELS(d : longint) : longint;
begin
  PANGO_PIXELS:=(cint(d)+512) shr 10;
end;

function PANGO_PIXELS_FLOOR(d : longint) : longint;
begin
  PANGO_PIXELS_FLOOR:=(cint(d)) shr 10;
end;

function PANGO_PIXELS_CEIL(d : longint) : longint;
begin
  PANGO_PIXELS_CEIL:=(cint(d) +1023) shr 10;
end;

function PANGO_UNITS_FLOOR(d: longint): LongInt;
begin
  PANGO_UNITS_FLOOR:=d and not (PANGO_SCALE-1);
end;

function PANGO_UNITS_CEIL(d : longint) : longint;
begin
  PANGO_UNITS_CEIL:=d +(PANGO_SCALE-1) and  not (PANGO_SCALE-1);
end;

function PANGO_UNITS_ROUND(d : longint) : longint;
begin
  PANGO_UNITS_ROUND:=d+(PANGO_SCALE shr 1) and  not (PANGO_SCALE-1);
end;

function PANGO_ASCENT(rect: TPangoRectangle): longint;
begin
  PANGO_ASCENT:=-(rect.y);
end;

function PANGO_DESCENT(rect: TPangoRectangle): longint;
begin
  PANGO_DESCENT:=(rect.y)+(rect.height);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_LBEARING(rect: TPangoRectangle): longint;
begin
  PANGO_LBEARING:=rect.x;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_RBEARING(rect: TPangoRectangle): longint;
begin
  PANGO_RBEARING:=(rect.x)+(rect.width);
end;


end.
