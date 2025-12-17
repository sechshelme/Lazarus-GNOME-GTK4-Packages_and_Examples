{$IFDEF read_interface}


const
  AV_CPU_FLAG_FORCE = $80000000;
  AV_CPU_FLAG_MMX = $0001;
  AV_CPU_FLAG_MMXEXT = $0002;
  AV_CPU_FLAG_MMX2 = $0002;
  AV_CPU_FLAG_3DNOW = $0004;
  AV_CPU_FLAG_SSE = $0008;
  AV_CPU_FLAG_SSE2 = $0010;
  AV_CPU_FLAG_SSE2SLOW = $40000000;
  AV_CPU_FLAG_3DNOWEXT = $0020;
  AV_CPU_FLAG_SSE3 = $0040;
  AV_CPU_FLAG_SSE3SLOW = $20000000;
  AV_CPU_FLAG_SSSE3 = $0080;
  AV_CPU_FLAG_SSSE3SLOW = $4000000;
  AV_CPU_FLAG_ATOM = $10000000;
  AV_CPU_FLAG_SSE4 = $0100;
  AV_CPU_FLAG_SSE42 = $0200;
  AV_CPU_FLAG_AESNI = $80000;
  AV_CPU_FLAG_AVX = $4000;
  AV_CPU_FLAG_AVXSLOW = $8000000;
  AV_CPU_FLAG_XOP = $0400;
  AV_CPU_FLAG_FMA4 = $0800;
  AV_CPU_FLAG_CMOV = $1000;
  AV_CPU_FLAG_AVX2 = $8000;
  AV_CPU_FLAG_FMA3 = $10000;
  AV_CPU_FLAG_BMI1 = $20000;
  AV_CPU_FLAG_BMI2 = $40000;
  AV_CPU_FLAG_AVX512 = $100000;
  AV_CPU_FLAG_AVX512ICL = $200000;
  AV_CPU_FLAG_SLOW_GATHER = $2000000;
  AV_CPU_FLAG_ALTIVEC = $0001;
  AV_CPU_FLAG_VSX = $0002;
  AV_CPU_FLAG_POWER8 = $0004;
  AV_CPU_FLAG_ARMV5TE = 1 shl 0;
  AV_CPU_FLAG_ARMV6 = 1 shl 1;
  AV_CPU_FLAG_ARMV6T2 = 1 shl 2;
  AV_CPU_FLAG_VFP = 1 shl 3;
  AV_CPU_FLAG_VFPV3 = 1 shl 4;
  AV_CPU_FLAG_NEON = 1 shl 5;
  AV_CPU_FLAG_ARMV8 = 1 shl 6;
  AV_CPU_FLAG_VFP_VM = 1 shl 7;
  AV_CPU_FLAG_DOTPROD = 1 shl 8;
  AV_CPU_FLAG_I8MM = 1 shl 9;
  AV_CPU_FLAG_SETEND = 1 shl 16;
  AV_CPU_FLAG_MMI = 1 shl 0;
  AV_CPU_FLAG_MSA = 1 shl 1;
  AV_CPU_FLAG_LSX = 1 shl 0;
  AV_CPU_FLAG_LASX = 1 shl 1;
  AV_CPU_FLAG_RVI = 1 shl 0;
  AV_CPU_FLAG_RVF = 1 shl 1;
  AV_CPU_FLAG_RVD = 1 shl 2;
  AV_CPU_FLAG_RVV_I32 = 1 shl 3;
  AV_CPU_FLAG_RVV_F32 = 1 shl 4;
  AV_CPU_FLAG_RVV_I64 = 1 shl 5;
  AV_CPU_FLAG_RVV_F64 = 1 shl 6;
  AV_CPU_FLAG_RVB_BASIC = 1 shl 7;
  AV_CPU_FLAG_RVB_ADDR = 1 shl 8;

function av_get_cpu_flags: longint; cdecl; external libavutil;
procedure av_force_cpu_flags(flags: longint); cdecl; external libavutil;
function av_parse_cpu_caps(flags: Pdword; s: pchar): longint; cdecl; external libavutil;
function av_cpu_count: longint; cdecl; external libavutil;
procedure av_cpu_force_count(count: longint); cdecl; external libavutil;
function av_cpu_max_align: Tsize_t; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
