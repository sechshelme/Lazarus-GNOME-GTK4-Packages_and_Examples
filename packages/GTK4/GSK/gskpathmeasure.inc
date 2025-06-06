
{$IFDEF read_interface}

  // ausgelagert
  //type
  //  TGskPathMeasure = record
  //  end;
  //  PGskPathMeasure = ^TGskPathMeasure;

function gsk_path_measure_get_type: TGType; cdecl; external libgtk4;
function gsk_path_measure_new(path: PGskPath): PGskPathMeasure; cdecl; external libgtk4;
function gsk_path_measure_new_with_tolerance(path: PGskPath; tolerance: single): PGskPathMeasure; cdecl; external libgtk4;
function gsk_path_measure_ref(self: PGskPathMeasure): PGskPathMeasure; cdecl; external libgtk4;
procedure gsk_path_measure_unref(self: PGskPathMeasure); cdecl; external libgtk4;
function gsk_path_measure_get_path(self: PGskPathMeasure): PGskPath; cdecl; external libgtk4;
function gsk_path_measure_get_tolerance(self: PGskPathMeasure): single; cdecl; external libgtk4;
function gsk_path_measure_get_length(self: PGskPathMeasure): single; cdecl; external libgtk4;
function gsk_path_measure_get_point(self: PGskPathMeasure; distance: single; Result: PGskPathPoint): Tgboolean; cdecl; external libgtk4;

// === Konventiert am: 3-8-24 15:18:42 ===

function GSK_TYPE_PATH_MEASURE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSK_TYPE_PATH_MEASURE: TGType;
begin
  GSK_TYPE_PATH_MEASURE := gsk_path_measure_get_type;
end;



{$ENDIF read_implementation}
