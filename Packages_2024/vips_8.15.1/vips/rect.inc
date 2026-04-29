
  {$IFDEF read_struct}
type
  TVipsRect = record
    left: longint;
    top: longint;
    width: longint;
    height: longint;
  end;
  PVipsRect = ^TVipsRect;
  {$ENDIF read_struct}

{$IFDEF read_function}
function VIPS_RECT_RIGHT(R: PVipsRect): longint;
function VIPS_RECT_BOTTOM(R: PVipsRect): longint;
function VIPS_RECT_HCENTRE(R: PVipsRect): longint;
function VIPS_RECT_VCENTRE(R: PVipsRect): longint;

function vips_rect_isempty(r: PVipsRect): Tgboolean; cdecl; external libvips;
function vips_rect_includespoint(r: PVipsRect; x: longint; y: longint): Tgboolean; cdecl; external libvips;
function vips_rect_includesrect(r1: PVipsRect; r2: PVipsRect): Tgboolean; cdecl; external libvips;
function vips_rect_equalsrect(r1: PVipsRect; r2: PVipsRect): Tgboolean; cdecl; external libvips;
function vips_rect_overlapsrect(r1: PVipsRect; r2: PVipsRect): Tgboolean; cdecl; external libvips;
procedure vips_rect_marginadjust(r: PVipsRect; n: longint); cdecl; external libvips;
procedure vips_rect_intersectrect(r1: PVipsRect; r2: PVipsRect; out_: PVipsRect); cdecl; external libvips;
procedure vips_rect_unionrect(r1: PVipsRect; r2: PVipsRect; out_: PVipsRect); cdecl; external libvips;
function vips_rect_dup(r: PVipsRect): PVipsRect; cdecl; external libvips;
procedure vips_rect_normalise(r: PVipsRect); cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:10:53 ===



{$IFDEF read_implementation}


function VIPS_RECT_RIGHT(R: PVipsRect): longint;
begin
  VIPS_RECT_RIGHT := (R^.left) + (R^.width);
end;

function VIPS_RECT_BOTTOM(R: PVipsRect): longint;
begin
  VIPS_RECT_BOTTOM := (R^.top) + (R^.height);
end;

function VIPS_RECT_HCENTRE(R: PVipsRect): longint;
begin
  VIPS_RECT_HCENTRE := (R^.left) + ((R^.width) div 2);
end;

function VIPS_RECT_VCENTRE(R: PVipsRect): longint;
begin
  VIPS_RECT_VCENTRE := (R^.top) + ((R^.height) div 2);
end;


{$ENDIF read_implementation}
