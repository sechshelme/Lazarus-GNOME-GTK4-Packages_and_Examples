unit spelling_language;

interface

uses
  fp_glib2, fp_spelling;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSpellingLanguage = type Pointer;
  PSpellingLanguageClass = type Pointer;

function spelling_language_get_type: TGType; cdecl; external libspelling;
function spelling_language_get_code(self: PSpellingLanguage): pchar; cdecl; external libspelling;
function spelling_language_contains_word(self: PSpellingLanguage; word: pchar; word_len: Tgssize): Tgboolean; cdecl; external libspelling;
function spelling_language_list_corrections(self: PSpellingLanguage; word: pchar; word_len: Tgssize): Ppchar; cdecl; external libspelling;
procedure spelling_language_add_word(self: PSpellingLanguage; word: pchar); cdecl; external libspelling;
procedure spelling_language_ignore_word(self: PSpellingLanguage; word: pchar); cdecl; external libspelling;
function spelling_language_get_extra_word_chars(self: PSpellingLanguage): pchar; cdecl; external libspelling;

// === Konventiert am: 4-8-26 17:16:22 ===

function SPELLING_TYPE_LANGUAGE: TGType;
function SPELLING_LANGUAGE(obj: Pointer): PSpellingLanguage;
function SPELLING_LANGUAGE_CLASS(klass: Pointer): PSpellingLanguageClass;
function SPELLING_IS_LANGUAGE(obj: Pointer): Tgboolean;

implementation

function SPELLING_TYPE_LANGUAGE: TGType;
begin
  SPELLING_TYPE_LANGUAGE := spelling_language_get_type;
end;

function SPELLING_LANGUAGE(obj: Pointer): PSpellingLanguage;
begin
  Result := PSpellingLanguage(g_type_check_instance_cast(obj, SPELLING_TYPE_LANGUAGE));
end;

function SPELLING_LANGUAGE_CLASS(klass: Pointer): PSpellingLanguageClass;
begin
  Result := PSpellingLanguageClass(g_type_check_class_cast(klass, SPELLING_TYPE_LANGUAGE));
end;

function SPELLING_IS_LANGUAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SPELLING_TYPE_LANGUAGE);
end;



end.
