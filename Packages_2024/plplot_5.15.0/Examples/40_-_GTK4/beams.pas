unit Beams;

interface

uses
  fp_glib2,
  fp_plplot;

type
  PBeams = type Pointer;

function beams_new: PBeams; cdecl;
procedure beams_new_data(self: PBeams); cdecl;
function beams_n(self: PBeams): SizeInt; cdecl;
function beams_max_size(self: PBeams): TPLFLT; cdecl;
function beams_get_data(self: PBeams; n: SizeInt): TPLFLT; cdecl;
function beams_get_label(self: PBeams; n: SizeInt): Pgchar; cdecl;
procedure beams_unref(self: PBeams); cdecl;

implementation

type
  TBeamsPrivat = record
    beam: array of record
      Data: TPLFLT;
      lab: pchar;
      end;
    maxSize: TPLFLT;
  end;
  PBeamsPrivat = ^TBeamsPrivat;


function beams_new: PBeams; cdecl;
var
  self: PBeamsPrivat absolute Result;
begin
  self := g_malloc(SizeOf(TBeamsPrivat));
  self^.beam := nil;
  beams_new_data(self);
end;

procedure beams_new_data(self: PBeams); cdecl;
var
  beams: PBeamsPrivat absolute self;
  i: integer;
  h: TPLFLT;
const
  max_sFr = 10000;
begin
  with beams^ do begin
    for i := 0 to Length(beam) - 1 do begin
      g_free(beam[i].lab);
    end;

    maxSize := 0.0;
    SetLength(beam, Random(24) + 1);
    for i := 0 to Length(beam) - 1 do begin
      h := Random * max_sFr + max_sFr;
      beam[i].Data := h;
      if h > maxSize then begin
        maxSize := h;
      end;
      beam[i].lab := g_strdup_printf('%02d', i + 1);
    end;
  end;
end;

function beams_n(self: PBeams): SizeInt; cdecl;
var
  beams: PBeamsPrivat absolute self;
begin
  Result := Length(beams^.beam);
end;

function beams_max_size(self: PBeams): TPLFLT; cdecl;
var
  beams: PBeamsPrivat absolute self;
begin
  Result := beams^.maxSize;
end;

function beams_get_data(self: PBeams; n: SizeInt): TPLFLT; cdecl;
var
  beams: PBeamsPrivat absolute self;
begin
  Result := beams^.beam[n].Data;
end;

function beams_get_label(self: PBeams; n: SizeInt): Pgchar; cdecl;
var
  beams: PBeamsPrivat absolute self;
begin
  Result := beams^.beam[n].lab;
end;

procedure beams_unref(self: PBeams); cdecl;
var
  beams: PBeamsPrivat absolute self;
  i: integer;
begin
  with beams^ do begin
    for i := 0 to Length(beam) - 1 do begin
      g_free(beam[i].lab);
    end;
  end;
  g_free(self);
end;

end.
