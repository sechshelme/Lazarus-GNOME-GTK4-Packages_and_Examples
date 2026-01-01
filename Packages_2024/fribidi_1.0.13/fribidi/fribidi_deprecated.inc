{$IFDEF read_interface}


function fribidi_mirroring_status: Tfribidi_boolean; cdecl; external libfribidi; deprecated;
function fribidi_set_mirroring(state: Tfribidi_boolean): Tfribidi_boolean; cdecl; external libfribidi; deprecated;
function fribidi_reorder_nsm_status: Tfribidi_boolean; cdecl; external libfribidi; deprecated;
function fribidi_set_reorder_nsm(state: Tfribidi_boolean): Tfribidi_boolean; cdecl; external libfribidi; deprecated;
function fribidi_log2vis_get_embedding_levels(bidi_types: PFriBidiCharType; len: TFriBidiStrIndex; pbase_dir: PFriBidiParType; embedding_levels: PFriBidiLevel): TFriBidiLevel; cdecl; external libfribidi; deprecated;
function fribidi_get_type(ch: TFriBidiChar): TFriBidiCharType; cdecl; external libfribidi; deprecated;
function fribidi_get_type_internal(ch: TFriBidiChar): TFriBidiCharType; cdecl; external libfribidi; deprecated;
function fribidi_get_par_embedding_levels(bidi_types: PFriBidiCharType; len: TFriBidiStrIndex; pbase_dir: PFriBidiParType; embedding_levels: PFriBidiLevel): TFriBidiLevel; cdecl; external libfribidi; deprecated;

const
  UNI_MAX_BIDI_LEVEL = FRIBIDI_BIDI_MAX_EXPLICIT_LEVEL;
  UNI_LRM = FRIBIDI_CHAR_LRM;
  UNI_RLM = FRIBIDI_CHAR_RLM;
  UNI_LRE = FRIBIDI_CHAR_LRE;
  UNI_RLE = FRIBIDI_CHAR_RLE;
  UNI_LRO = FRIBIDI_CHAR_LRO;
  UNI_RLO = FRIBIDI_CHAR_RLO;
  UNI_LS = FRIBIDI_CHAR_LS;
  UNI_PS = FRIBIDI_CHAR_PS;
  UNI_ZWNJ = FRIBIDI_CHAR_ZWNJ;
  UNI_ZWJ = FRIBIDI_CHAR_ZWJ;
  UNI_HEBREW_ALEF = FRIBIDI_CHAR_HEBREW_ALEF;
  UNI_ARABIC_ALEF = FRIBIDI_CHAR_ARABIC_ALEF;
  UNI_ARABIC_ZERO = FRIBIDI_CHAR_ARABIC_ZERO;
  UNI_FARSI_ZERO = FRIBIDI_CHAR_PERSIAN_ZERO;
  FRIBIDI_TYPE_WL = FRIBIDI_PAR_WLTR;
  FRIBIDI_TYPE_WR = FRIBIDI_PAR_WRTL;
  FRIBIDI_TYPE_L = FRIBIDI_PAR_LTR;
  FRIBIDI_TYPE_R = FRIBIDI_PAR_RTL;
  FRIBIDI_TYPE_N = FRIBIDI_PAR_ON;
  FRIBIDI_TYPE_B = FRIBIDI_TYPE_BS;
  FRIBIDI_TYPE_S = FRIBIDI_TYPE_SS;

  // === Konventiert am: 31-12-25 16:08:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
