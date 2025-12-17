{$IFDEF read_interface}


const
  AV_DICT_MATCH_CASE = 1;
  AV_DICT_IGNORE_SUFFIX = 2;
  AV_DICT_DONT_STRDUP_KEY = 4;
  AV_DICT_DONT_STRDUP_VAL = 8;
  AV_DICT_DONT_OVERWRITE = 16;
  AV_DICT_APPEND = 32;
  AV_DICT_MULTIKEY = 64;

type
  TAVDictionaryEntry = record
    key: pchar;
    value: pchar;
  end;
  PAVDictionaryEntry = ^TAVDictionaryEntry;

  PAVDictionary = type Pointer;
  PPAVDictionary = ^PAVDictionary;

function av_dict_get(m: PAVDictionary; key: pchar; prev: PAVDictionaryEntry; flags: longint): PAVDictionaryEntry; cdecl; external libavutil;
function av_dict_iterate(m: PAVDictionary; prev: PAVDictionaryEntry): PAVDictionaryEntry; cdecl; external libavutil;
function av_dict_count(m: PAVDictionary): longint; cdecl; external libavutil;
function av_dict_set(pm: PPAVDictionary; key: pchar; value: pchar; flags: longint): longint; cdecl; external libavutil;
function av_dict_set_int(pm: PPAVDictionary; key: pchar; value: Tint64_t; flags: longint): longint; cdecl; external libavutil;
function av_dict_parse_string(pm: PPAVDictionary; str: pchar; key_val_sep: pchar; pairs_sep: pchar; flags: longint): longint; cdecl; external libavutil;
function av_dict_copy(dst: PPAVDictionary; src: PAVDictionary; flags: longint): longint; cdecl; external libavutil;
procedure av_dict_free(m: PPAVDictionary); cdecl; external libavutil;
function av_dict_get_string(m: PAVDictionary; buffer: PPchar; key_val_sep: char; pairs_sep: char): longint; cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:00:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
