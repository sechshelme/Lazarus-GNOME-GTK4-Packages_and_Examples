{$IFDEF read_interface}


type
  TAVDES = record
    round_keys: array[0..2] of array[0..15] of Tuint64_t;
    triple_des: longint;
  end;
  PAVDES = ^TAVDES;

function av_des_alloc: PAVDES; cdecl; external libavutil;
function av_des_init(d: PAVDES; key: Puint8_t; key_bits: longint; decrypt: longint): longint; cdecl; external libavutil;
procedure av_des_crypt(d: PAVDES; dst: Puint8_t; src: Puint8_t; count: longint; iv: Puint8_t; decrypt: longint); cdecl; external libavutil;
procedure av_des_mac(d: PAVDES; dst: Puint8_t; src: Puint8_t; count: longint); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
