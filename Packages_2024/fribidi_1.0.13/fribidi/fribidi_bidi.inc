{$IFDEF read_interface}


function fribidi_get_par_direction(bidi_types: PFriBidiCharType; len: TFriBidiStrIndex): TFriBidiParType; cdecl; external libfribidi;
function fribidi_get_par_embedding_levels_ex(bidi_types: PFriBidiCharType; bracket_types: PFriBidiBracketType; len: TFriBidiStrIndex; pbase_dir: PFriBidiParType; embedding_levels: PFriBidiLevel): TFriBidiLevel; cdecl; external libfribidi;
function fribidi_reorder_line(flags: TFriBidiFlags; bidi_types: PFriBidiCharType; len: TFriBidiStrIndex; off: TFriBidiStrIndex; base_dir: TFriBidiParType;
  embedding_levels: PFriBidiLevel; visual_str: PFriBidiChar; map: PFriBidiStrIndex): TFriBidiLevel; cdecl; external libfribidi;

// === Konventiert am: 31-12-25 16:08:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
