{$IFDEF read_interface}


type
  Tuser_verifier_lookup_t = procedure(username: pchar; verifier_len: Psize_t; verifier: PPchar; salt_len: Psize_t; salt: PPchar;
    use_default_2048_bit_n_modulus: PBoolean; n_modulus_ascii: PPchar; generator_ascii: PPchar; user_data: pointer); cdecl;

  Plibrist_verifier_lookup_data_t = ^Tlibrist_verifier_lookup_data_t;
  Tlibrist_verifier_lookup_data_t = record
    verifier_len: Tsize_t;
    verifier: Puint8_t;
    salt_len: Tsize_t;
    salt: Puint8_t;
    default_ng: Boolean;
    n_modulus_ascii: pchar;
    generator_ascii: pchar;
  end;

  Tuser_verifier_lookup_2_t = procedure(username: pchar; lookup_data: Plibrist_verifier_lookup_data_t; hashversion: Plongint; generation: Puint64_t; user_data: pointer); cdecl;

function rist_enable_eap_srp(peer: Prist_peer; username: pchar; password: pchar; lookup_func: Tuser_verifier_lookup_t; userdata: pointer): longint; cdecl; external librist; deprecated;
function rist_enable_eap_srp_2(peer: Prist_peer; username: pchar; password: pchar; lookup_func: Tuser_verifier_lookup_2_t; userdata: pointer): longint; cdecl; external librist;

// === Konventiert am: 15-8-26 19:17:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
