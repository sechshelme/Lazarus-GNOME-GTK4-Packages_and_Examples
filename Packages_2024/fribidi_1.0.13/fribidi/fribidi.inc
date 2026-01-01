{$IFDEF read_interface}


function fribidi_remove_bidi_marks(str: PFriBidiChar; len: TFriBidiStrIndex; positions_to_this: PFriBidiStrIndex; position_from_this_list: PFriBidiStrIndex; embedding_levels: PFriBidiLevel): TFriBidiStrIndex; cdecl; external libfribidi;
function fribidi_log2vis(str: PFriBidiChar; len: TFriBidiStrIndex; pbase_dir: PFriBidiParType; visual_str: PFriBidiChar; positions_L_to_V: PFriBidiStrIndex;
  positions_V_to_L: PFriBidiStrIndex; embedding_levels: PFriBidiLevel): TFriBidiLevel; cdecl; external libfribidi;

var
  fribidi_version_info: pchar; cvar;external libfribidi;

  // === Konventiert am: 31-12-25 16:08:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
