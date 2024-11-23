unit pango_color;

interface

uses
  fp_cairo, fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TPangoColor = record
    red: Tguint16;
    green: Tguint16;
    blue: Tguint16;
  end;
  PPangoColor = ^TPangoColor;

function pango_color_get_type: TGType; cdecl; external libpango;
function pango_color_copy(src: PPangoColor): PPangoColor; cdecl; external libpango;
procedure pango_color_free(color: PPangoColor); cdecl; external libpango;
function pango_color_parse(color: PPangoColor; spec: pchar): Tgboolean; cdecl; external libpango;
function pango_color_parse_with_alpha(color: PPangoColor; alpha: Pguint16; spec: pchar): Tgboolean; cdecl; external libpango;
function pango_color_to_string(color: PPangoColor): pchar; cdecl; external libpango;

// === Konventiert am: 23-11-24 17:35:23 ===

function PANGO_TYPE_COLOR: TGType;

implementation

function PANGO_TYPE_COLOR: TGType;
begin
  PANGO_TYPE_COLOR := pango_color_get_type;
end;



end.
