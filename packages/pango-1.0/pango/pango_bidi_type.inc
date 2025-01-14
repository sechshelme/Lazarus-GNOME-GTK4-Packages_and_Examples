
{$IFDEF read_interface}

type
  PPangoBidiType = ^TPangoBidiType;
  TPangoBidiType = longint;

const
  PANGO_BIDI_TYPE_L = 0;
  PANGO_BIDI_TYPE_LRE = 1;
  PANGO_BIDI_TYPE_LRO = 2;
  PANGO_BIDI_TYPE_R = 3;
  PANGO_BIDI_TYPE_AL = 4;
  PANGO_BIDI_TYPE_RLE = 5;
  PANGO_BIDI_TYPE_RLO = 6;
  PANGO_BIDI_TYPE_PDF = 7;
  PANGO_BIDI_TYPE_EN = 8;
  PANGO_BIDI_TYPE_ES = 9;
  PANGO_BIDI_TYPE_ET = 10;
  PANGO_BIDI_TYPE_AN = 11;
  PANGO_BIDI_TYPE_CS = 12;
  PANGO_BIDI_TYPE_NSM = 13;
  PANGO_BIDI_TYPE_BN = 14;
  PANGO_BIDI_TYPE_B = 15;
  PANGO_BIDI_TYPE_S = 16;
  PANGO_BIDI_TYPE_WS = 17;
  PANGO_BIDI_TYPE_ON = 18;
  PANGO_BIDI_TYPE_LRI = 19;
  PANGO_BIDI_TYPE_RLI = 20;
  PANGO_BIDI_TYPE_FSI = 21;
  PANGO_BIDI_TYPE_PDI = 22;

function pango_bidi_type_for_unichar(ch: Tgunichar): TPangoBidiType; cdecl; external libpango; deprecated; // PANGO_DEPRECATED_IN_1_44
function pango_unichar_direction(ch: Tgunichar): TPangoDirection; cdecl; external libpango; deprecated; // PANGO_DEPRECATED_IN_1_44
function pango_find_base_dir(Text: Pgchar; length: Tgint): TPangoDirection; cdecl; external libpango; deprecated; // PANGO_DEPRECATED_IN_1_44
function pango_get_mirror_char(ch: Tgunichar; mirrored_ch: Pgunichar): Tgboolean; cdecl; external libpango; deprecated; // PANGO_DEPRECATED_IN_1_30_FOR(g_unichar_get_mirror_char)

// === Konventiert am: 26-11-24 15:44:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
