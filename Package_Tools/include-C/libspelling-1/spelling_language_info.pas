unit spelling_language_info;

interface

uses
  fp_glib2, fp_spelling;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSpellingLanguageInfo = type Pointer;

  TSpellingLanguageInfoClass = record
    parent_class: TGObjectClass;
  end;
  PSpellingLanguageInfoClass = ^TSpellingLanguageInfoClass;

function spelling_language_info_get_type: TGType; cdecl; external libspelling;
function spelling_language_info_get_group(self: PSpellingLanguageInfo): pchar; cdecl; external libspelling;
function spelling_language_info_get_name(self: PSpellingLanguageInfo): pchar; cdecl; external libspelling;
function spelling_language_info_get_code(self: PSpellingLanguageInfo): pchar; cdecl; external libspelling;

// === Konventiert am: 4-8-26 17:16:15 ===

function SPELLING_TYPE_LANGUAGE_INFO: TGType;
function SPELLING_LANGUAGE_INFO(obj: Pointer): PSpellingLanguageInfo;
function SPELLING_IS_LANGUAGE_INFO(obj: Pointer): Tgboolean;

implementation

function SPELLING_TYPE_LANGUAGE_INFO: TGType;
begin
  Result := spelling_language_info_get_type;
end;

function SPELLING_LANGUAGE_INFO(obj: Pointer): PSpellingLanguageInfo;
begin
  Result := PSpellingLanguageInfo(g_type_check_instance_cast(obj, SPELLING_TYPE_LANGUAGE_INFO));
end;

function SPELLING_IS_LANGUAGE_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SPELLING_TYPE_LANGUAGE_INFO);
end;

end.
