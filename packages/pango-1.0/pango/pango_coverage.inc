
{$IFDEF read_interface}

type
  PPangoCoverageLevel = ^TPangoCoverageLevel;
  TPangoCoverageLevel = longint;

const
  PANGO_COVERAGE_NONE = 0;
  PANGO_COVERAGE_FALLBACK = 1;
  PANGO_COVERAGE_APPROXIMATE = 2;
  PANGO_COVERAGE_EXACT = 3;

type
  TPangoCoverage = record
  end;
  PPangoCoverage = ^TPangoCoverage;

function pango_coverage_get_type: TGType; cdecl; external libpango;
function pango_coverage_new: PPangoCoverage; cdecl; external libpango;
function pango_coverage_ref(coverage: PPangoCoverage): PPangoCoverage; cdecl; external libpango;
procedure pango_coverage_unref(coverage: PPangoCoverage); cdecl; external libpango;
function pango_coverage_copy(coverage: PPangoCoverage): PPangoCoverage; cdecl; external libpango;
function pango_coverage_get(coverage: PPangoCoverage; index_: longint): TPangoCoverageLevel; cdecl; external libpango;
procedure pango_coverage_set(coverage: PPangoCoverage; index_: longint; level: TPangoCoverageLevel); cdecl; external libpango;
procedure pango_coverage_max(coverage: PPangoCoverage; other: PPangoCoverage); cdecl; external libpango;
procedure pango_coverage_to_bytes(coverage: PPangoCoverage; bytes: PPguchar; n_bytes: Plongint); cdecl; external libpango;
function pango_coverage_from_bytes(bytes: Pguchar; n_bytes: longint): PPangoCoverage; cdecl; external libpango;

// === Konventiert am: 23-11-24 19:03:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
