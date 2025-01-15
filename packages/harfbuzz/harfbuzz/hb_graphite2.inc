{$IFDEF read_interface}


const
  HB_GRAPHITE2_TAG_SILF = (Ord('S') shl 24) or (Ord('i') shl 16) or (Ord('l') shl 8) or Ord('f');

function hb_graphite2_face_get_gr_face(face: Phb_face_t): Pgr_face; cdecl; external libharfbuzz;
function hb_graphite2_font_get_gr_font(font: Phb_font_t): Pgr_font; cdecl; external libharfbuzz; deprecated 'HB_DEPRECATED_FOR (hb_graphite2_face_get_gr_face)';

// === Konventiert am: 27-12-24 15:28:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
