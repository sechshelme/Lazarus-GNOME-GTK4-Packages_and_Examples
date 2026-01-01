{$IFDEF read_interface}


function fribidi_get_mirror_char(ch: TFriBidiChar; mirrored_ch: PFriBidiChar): Tfribidi_boolean; cdecl; external libfribidi;
procedure fribidi_shape_mirroring(embedding_levels: PFriBidiLevel; len: TFriBidiStrIndex; str: PFriBidiChar); cdecl; external libfribidi;

// === Konventiert am: 31-12-25 16:09:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
