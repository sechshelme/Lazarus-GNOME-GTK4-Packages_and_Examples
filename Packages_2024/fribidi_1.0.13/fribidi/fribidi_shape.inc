{$IFDEF read_interface}


procedure fribidi_shape(flags: TFriBidiFlags; embedding_levels: PFriBidiLevel; len: TFriBidiStrIndex; ar_props: PFriBidiArabicProp; str: PFriBidiChar); cdecl; external libfribidi;

// === Konventiert am: 31-12-25 16:09:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
