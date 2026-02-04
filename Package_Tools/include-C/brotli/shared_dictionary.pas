unit shared_dictionary;

interface

uses
  fp_brotli, types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  SHARED_BROTLI_MIN_DICTIONARY_WORD_LENGTH = 4;
  SHARED_BROTLI_MAX_DICTIONARY_WORD_LENGTH = 31;
  SHARED_BROTLI_NUM_DICTIONARY_CONTEXTS = 64;
  SHARED_BROTLI_MAX_COMPOUND_DICTS = 15;

type
  PBrotliSharedDictionary = type Pointer;

type
  PBrotliSharedDictionaryType = ^TBrotliSharedDictionaryType;
  TBrotliSharedDictionaryType = longint;

const
  BROTLI_SHARED_DICTIONARY_RAW = 0;
  BROTLI_SHARED_DICTIONARY_SERIALIZED = 1;

function BrotliSharedDictionaryCreateInstance(alloc_func: Tbrotli_alloc_func; free_func: Tbrotli_free_func; opaque: pointer): PBrotliSharedDictionary; cdecl; external libbrotlicommon;
procedure BrotliSharedDictionaryDestroyInstance(dict: PBrotliSharedDictionary); cdecl; external libbrotlicommon;
function BrotliSharedDictionaryAttach(dict: PBrotliSharedDictionary; _type: TBrotliSharedDictionaryType; data_size: Tsize_t; data: Puint8_t): TBROTLI_BOOL; cdecl; external libbrotlicommon;

// === Konventiert am: 4-2-26 19:48:45 ===


implementation



end.
