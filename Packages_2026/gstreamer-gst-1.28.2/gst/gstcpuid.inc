

{$IFDEF read_function}
function gst_cpuid_supports_x86_mmx: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_x86_mmxext: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_x86_3dnow: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_x86_sse2: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_x86_sse3: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_x86_ssse3: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_x86_sse4_1: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_x86_sse4_2: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_x86_avx: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_x86_avx2: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_arm_neon: Tgboolean; cdecl; external libgstreamer;
function gst_cpuid_supports_arm_neon64: Tgboolean; cdecl; external libgstreamer;
{$ENDIF read_function}

// === Konventiert am: 10-7-26 19:55:33 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
