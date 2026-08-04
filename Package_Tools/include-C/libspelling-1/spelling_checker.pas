unit spelling_checker;

interface

uses
  fp_glib2, fp_spelling, spelling_provider;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSpellingChecker = type Pointer;

  TSpellingCheckerClass = record
    parent_class: TGObjectClass;
  end;
  PSpellingCheckerClass = ^TSpellingCheckerClass;

function spelling_checker_get_type: TGType; cdecl; external libspelling;
function spelling_checker_get_default: PSpellingChecker; cdecl; external libspelling;
function spelling_checker_new(provider: PSpellingProvider; language: pchar): PSpellingChecker; cdecl; external libspelling;
function spelling_checker_get_provider(self: PSpellingChecker): PSpellingProvider; cdecl; external libspelling;
function spelling_checker_get_language(self: PSpellingChecker): pchar; cdecl; external libspelling;
procedure spelling_checker_set_language(self: PSpellingChecker; language: pchar); cdecl; external libspelling;
function spelling_checker_check_word(self: PSpellingChecker; word: pchar; word_len: Tgssize): Tgboolean; cdecl; external libspelling;
function spelling_checker_list_corrections(self: PSpellingChecker; word: pchar): Ppchar; cdecl; external libspelling;
procedure spelling_checker_add_word(self: PSpellingChecker; word: pchar); cdecl; external libspelling;
procedure spelling_checker_ignore_word(self: PSpellingChecker; word: pchar); cdecl; external libspelling;
function spelling_checker_get_extra_word_chars(self: PSpellingChecker): pchar; cdecl; external libspelling;

// === Konventiert am: 4-8-26 17:16:33 ===

function SPELLING_TYPE_CHECKER: TGType;
function SPELLING_CHECKER(obj: Pointer): PSpellingChecker;
function SPELLING_IS_CHECKER(obj: Pointer): Tgboolean;

implementation

function SPELLING_TYPE_CHECKER: TGType;
begin
  Result := spelling_checker_get_type;
end;

function SPELLING_CHECKER(obj: Pointer): PSpellingChecker;
begin
  Result := PSpellingChecker(g_type_check_instance_cast(obj, SPELLING_TYPE_CHECKER));
end;

function SPELLING_IS_CHECKER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SPELLING_TYPE_CHECKER);
end;

end.
