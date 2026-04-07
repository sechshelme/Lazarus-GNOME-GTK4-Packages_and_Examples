unit Beams;

interface

uses
  fp_glib2,
  fp_plplot;

type
  PBars = type Pointer;

function bars_new: PBars; cdecl;
procedure bars_new_data(self: PBars); cdecl;
function bars_n(self: PBars): SizeInt; cdecl;
function bars_max_size(self: PBars): TPLFLT; cdecl;
function bars_get_data(self: PBars; n: SizeInt): TPLFLT; cdecl;
function bars_get_label(self: PBars; n: SizeInt): Pgchar; cdecl;
procedure bars_unref(self: PBars); cdecl;

implementation

type
  TBeam = record
    Data: TPLFLT;
    lab: pchar;
  end;
  PBeam = ^TBeam;

type
  TBarsPrivat = record
    beam: PBeam;
    beam_len: SizeInt;
    maxSize: TPLFLT;
  end;
  PBarsPrivat = ^TBarsPrivat;

function bars_new: PBars; cdecl;
var
  bars: PBarsPrivat absolute Result;
begin
  bars := g_malloc(SizeOf(TBarsPrivat));
  bars^.beam := nil;
  bars^.beam_len := 0;
  bars_new_data(bars);
end;

procedure bars_new_data(self: PBars); cdecl;
var
  bars: PBarsPrivat absolute self;
  i: integer;
  h: TPLFLT;
const
  max_sFr = 10000;
begin
  with bars^ do begin
    if bars <> nil then begin
      for i := 0 to beam_len - 1 do begin
        g_free(beam[i].lab);
      end;
      g_free(beam);
    end;

    maxSize := 0.0;
    beam_len := Random(24) + 1;
    beam := g_malloc(SizeOf(TBeam) * beam_len);
    for i := 0 to beam_len - 1 do begin
      h := Random * max_sFr + max_sFr;
      beam[i].Data := h;
      if h > maxSize then begin
        maxSize := h;
      end;
      beam[i].lab := g_strdup_printf('%02d', i + 1);
    end;
  end;
end;

function bars_n(self: PBars): SizeInt; cdecl;
var
  beams: PBarsPrivat absolute self;
begin
  Result := beams^.beam_len;
end;

function bars_max_size(self: PBars): TPLFLT; cdecl;
var
  beams: PBarsPrivat absolute self;
begin
  Result := beams^.maxSize;
end;

function bars_get_data(self: PBars; n: SizeInt): TPLFLT; cdecl;
var
  beams: PBarsPrivat absolute self;
begin
  Result := beams^.beam[n].Data;
end;

function bars_get_label(self: PBars; n: SizeInt): Pgchar; cdecl;
var
  beams: PBarsPrivat absolute self;
begin
  Result := beams^.beam[n].lab;
end;

procedure bars_unref(self: PBars); cdecl;
var
  beams: PBarsPrivat absolute self;
  i: integer;
begin
  with beams^ do begin
    if beam <> nil then begin
      for i := 0 to beam_len - 1 do begin
        g_free(beam[i].lab);
      end;
      g_free(beam);
      beam := nil;
    end;
  end;
  g_free(self);
end;

end.
