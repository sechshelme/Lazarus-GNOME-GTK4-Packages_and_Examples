{$IFDEF read_interface}



function sodium_runtime_has_neon: longint; cdecl; external libsodium;
function sodium_runtime_has_sse2: longint; cdecl; external libsodium;
function sodium_runtime_has_sse3: longint; cdecl; external libsodium;
function sodium_runtime_has_ssse3: longint; cdecl; external libsodium;
function sodium_runtime_has_sse41: longint; cdecl; external libsodium;
function sodium_runtime_has_avx: longint; cdecl; external libsodium;
function sodium_runtime_has_avx2: longint; cdecl; external libsodium;
function sodium_runtime_has_avx512f: longint; cdecl; external libsodium;
function sodium_runtime_has_pclmul: longint; cdecl; external libsodium;
function sodium_runtime_has_aesni: longint; cdecl; external libsodium;
function sodium_runtime_has_rdrand: longint; cdecl; external libsodium;

function _sodium_runtime_get_cpu_features: longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:33:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
