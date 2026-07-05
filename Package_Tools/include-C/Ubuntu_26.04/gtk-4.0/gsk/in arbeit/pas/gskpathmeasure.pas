unit gskpathmeasure;

interface

uses
  fp_glib2, fp_gtk4, gsktypes, gskpathpoint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gsk_path_measure_get_type: TGType; cdecl; external libgtk4;
function gsk_path_measure_new(path: PGskPath): PGskPathMeasure; cdecl; external libgtk4;
function gsk_path_measure_new_with_tolerance(path: PGskPath; tolerance: single): PGskPathMeasure; cdecl; external libgtk4;
function gsk_path_measure_ref(self: PGskPathMeasure): PGskPathMeasure; cdecl; external libgtk4;
procedure gsk_path_measure_unref(self: PGskPathMeasure); cdecl; external libgtk4;
function gsk_path_measure_get_path(self: PGskPathMeasure): PGskPath; cdecl; external libgtk4;
function gsk_path_measure_get_tolerance(self: PGskPathMeasure): single; cdecl; external libgtk4;
function gsk_path_measure_get_length(self: PGskPathMeasure): single; cdecl; external libgtk4;
function gsk_path_measure_get_point(self: PGskPathMeasure; distance: single; result: PGskPathPoint): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 5-7-26 13:31:18 ===

function GSK_TYPE_PATH_MEASURE: TGType;

implementation

function GSK_TYPE_PATH_MEASURE: TGType;
begin
  GSK_TYPE_PATH_MEASURE := gsk_path_measure_get_type;
end;



end.
