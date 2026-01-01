{$IFDEF read_interface}


type
  PFriBidiCharSet = ^TFriBidiCharSet;
  TFriBidiCharSet = longint;

const
  _FRIBIDI_CHAR_SET_NOT_FOUND = 0;
  FRIBIDI_CHAR_SET_UTF8 = 1;
  FRIBIDI_CHAR_SET_CAP_RTL = 2;
  FRIBIDI_CHAR_SET_ISO8859_6 = 3;
  FRIBIDI_CHAR_SET_ISO8859_8 = 4;
  FRIBIDI_CHAR_SET_CP1255 = 5;
  FRIBIDI_CHAR_SET_CP1256 = 6;
  _FRIBIDI_CHAR_SETS_NUM_PLUS_ONE = 7;

  FRIBIDI_CHAR_SET_NOT_FOUND = _FRIBIDI_CHAR_SET_NOT_FOUND;
  FRIBIDI_CHAR_SETS_NUM = _FRIBIDI_CHAR_SETS_NUM_PLUS_ONE - 1;

function fribidi_charset_to_unicode(char_set: TFriBidiCharSet; s: pchar; len: TFriBidiStrIndex; us: PFriBidiChar): TFriBidiStrIndex; cdecl; external libfribidi;
function fribidi_unicode_to_charset(char_set: TFriBidiCharSet; us: PFriBidiChar; len: TFriBidiStrIndex; s: pchar): TFriBidiStrIndex; cdecl; external libfribidi;
function fribidi_parse_charset(s: pchar): TFriBidiCharSet; cdecl; external libfribidi;
function fribidi_char_set_name(char_set: TFriBidiCharSet): pchar; cdecl; external libfribidi;
function fribidi_char_set_title(char_set: TFriBidiCharSet): pchar; cdecl; external libfribidi;
function fribidi_char_set_desc(char_set: TFriBidiCharSet): pchar; cdecl; external libfribidi;

// === Konventiert am: 31-12-25 16:08:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
