{$IFDEF read_interface}


function emile_base64_encode(in_: PEina_Binbuf): PEina_Strbuf; cdecl; external libemile;
function emile_base64url_encode(in_: PEina_Binbuf): PEina_Strbuf; cdecl; external libemile;
function emile_base64_decode(in_: PEina_Strbuf): PEina_Binbuf; cdecl; external libemile;
function emile_base64url_decode(in_: PEina_Strbuf): PEina_Binbuf; cdecl; external libemile;

// === Konventiert am: 20-5-25 15:35:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
