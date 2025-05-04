{$IFDEF read_interface}


function vte_get_user_shell: pchar; cdecl; external libvte_2_91_gtk4;
function vte_get_features: pchar; cdecl; external libvte_2_91_gtk4;
function vte_get_feature_flags: TVteFeatureFlags; cdecl; external libvte_2_91_gtk4;

procedure vte_set_test_flags(flags: Tguint64); cdecl; external libvte_2_91_gtk4;

const
  VTE_TEST_FLAGS_NONE = Tguint64(0);
  VTE_TEST_FLAGS_ALL = not Tguint64(0);

  // === Konventiert am: 3-5-25 17:04:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}




{$ENDIF read_implementation}
