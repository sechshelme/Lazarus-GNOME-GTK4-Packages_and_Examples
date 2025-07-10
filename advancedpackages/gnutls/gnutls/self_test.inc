{$IFDEF read_interface}


const
  GNUTLS_SELF_TEST_FLAG_ALL = 1;
  GNUTLS_SELF_TEST_FLAG_NO_COMPAT = 1 shl 1;

function gnutls_cipher_self_test(flags: dword; cipher: Tgnutls_cipher_algorithm_t): longint; cdecl; external libgnutls;
function gnutls_mac_self_test(flags: dword; mac: Tgnutls_mac_algorithm_t): longint; cdecl; external libgnutls;
function gnutls_digest_self_test(flags: dword; digest: Tgnutls_digest_algorithm_t): longint; cdecl; external libgnutls;
function gnutls_pk_self_test(flags: dword; pk: Tgnutls_pk_algorithm_t): longint; cdecl; external libgnutls;
function gnutls_hkdf_self_test(flags: dword; mac: Tgnutls_mac_algorithm_t): longint; cdecl; external libgnutls;
function gnutls_pbkdf2_self_test(flags: dword; mac: Tgnutls_mac_algorithm_t): longint; cdecl; external libgnutls;
function gnutls_tlsprf_self_test(flags: dword; mac: Tgnutls_mac_algorithm_t): longint; cdecl; external libgnutls;

// === Konventiert am: 9-7-25 13:39:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
