{$IFDEF read_interface}

type
  PChafaFeatures = ^TChafaFeatures;
  TChafaFeatures = longint;

const
  CHAFA_FEATURE_MMX = 1 shl 0;
  CHAFA_FEATURE_SSE41 = 1 shl 1;
  CHAFA_FEATURE_POPCNT = 1 shl 2;
  CHAFA_FEATURE_AVX2 = 1 shl 3;

function chafa_get_builtin_features: TChafaFeatures; cdecl; external libchafa;
function chafa_get_supported_features: TChafaFeatures; cdecl; external libchafa;
function chafa_describe_features(features: TChafaFeatures): Pgchar; cdecl; external libchafa;
function chafa_get_n_threads: Tgint; cdecl; external libchafa;
procedure chafa_set_n_threads(n: Tgint); cdecl; external libchafa;
function chafa_get_n_actual_threads: Tgint; cdecl; external libchafa;

// === Konventiert am: 29-1-25 19:32:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
