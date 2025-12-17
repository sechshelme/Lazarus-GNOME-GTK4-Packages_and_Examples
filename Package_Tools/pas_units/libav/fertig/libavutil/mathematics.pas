unit mathematics;

interface

uses
  fp_ffmpeg, rational;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  M_E = 2.7182818284590452354;
  M_Ef = 2.7182818284590452354;
  M_LN2 = 0.69314718055994530942;
  M_LN2f = 0.69314718055994530942;
  M_LN10 = 2.30258509299404568402;
  M_LN10f = 2.30258509299404568402;
  M_LOG2_10 = 3.32192809488736234787;
  M_LOG2_10f = 3.32192809488736234787;
  M_PHI = 1.61803398874989484820;
  M_PHIf = 1.61803398874989484820;
  M_PI = 3.14159265358979323846;
  M_PIf = 3.14159265358979323846;
  M_PI_2 = 1.57079632679489661923;
  M_PI_2f = 1.57079632679489661923;
  M_PI_4 = 0.78539816339744830962;
  M_PI_4f = 0.78539816339744830962;
  M_1_PI = 0.31830988618379067154;
  M_1_PIf = 0.31830988618379067154;
  M_2_PI = 0.63661977236758134308;
  M_2_PIf = 0.63661977236758134308;
  M_2_SQRTPI = 1.12837916709551257390;
  M_2_SQRTPIf = 1.12837916709551257390;
  M_SQRT1_2 = 0.70710678118654752440;
  M_SQRT1_2f = 0.70710678118654752440;
  M_SQRT2 = 1.41421356237309504880;
  M_SQRT2f = 1.41421356237309504880;

type
  TAVRounding = longint;

const
  AV_ROUND_ZERO = 0;
  AV_ROUND_INF = 1;
  AV_ROUND_DOWN = 2;
  AV_ROUND_UP = 3;
  AV_ROUND_NEAR_INF = 5;
  AV_ROUND_PASS_MINMAX = 8192;

function av_gcd(a: Tint64_t; b: Tint64_t): Tint64_t; cdecl; external libavutil;
function av_rescale(a: Tint64_t; b: Tint64_t; c: Tint64_t): Tint64_t; cdecl; external libavutil;
function av_rescale_rnd(a: Tint64_t; b: Tint64_t; c: Tint64_t; rnd: TAVRounding): Tint64_t; cdecl; external libavutil;
function av_rescale_q(a: Tint64_t; bq: TAVRational; cq: TAVRational): Tint64_t; cdecl; external libavutil;
function av_rescale_q_rnd(a: Tint64_t; bq: TAVRational; cq: TAVRational; rnd: TAVRounding): Tint64_t; cdecl; external libavutil;
function av_compare_ts(ts_a: Tint64_t; tb_a: TAVRational; ts_b: Tint64_t; tb_b: TAVRational): longint; cdecl; external libavutil;
function av_compare_mod(a: Tuint64_t; b: Tuint64_t; mod_: Tuint64_t): Tint64_t; cdecl; external libavutil;
function av_rescale_delta(in_tb: TAVRational; in_ts: Tint64_t; fs_tb: TAVRational; duration: longint; last: Pint64_t; out_tb: TAVRational): Tint64_t; cdecl; external libavutil;
function av_add_stable(ts_tb: TAVRational; ts: Tint64_t; inc_tb: TAVRational; inc: Tint64_t): Tint64_t; cdecl; external libavutil;
function av_bessel_i0(x: double): double; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:13 ===


implementation


end.
