unit spelling_provider;

interface

uses
  fp_glib2, fp_spelling, spelling_language;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSpellingProvider = type Pointer;
  PSpellingProviderClass = type Pointer;

function spelling_provider_get_type: TGType; cdecl; external libspelling;
function spelling_provider_get_default: PSpellingProvider; cdecl; external libspelling;
function spelling_provider_get_default_code(self: PSpellingProvider): pchar; cdecl; external libspelling;
function spelling_provider_get_display_name(self: PSpellingProvider): pchar; cdecl; external libspelling;
function spelling_provider_supports_language(self: PSpellingProvider; language: pchar): Tgboolean; cdecl; external libspelling;
function spelling_provider_list_languages(self: PSpellingProvider): PGPtrArray; cdecl; external libspelling;
function spelling_provider_get_language(self: PSpellingProvider; language: pchar): PSpellingLanguage; cdecl; external libspelling;

// === Konventiert am: 4-8-26 17:15:59 ===

function SPELLING_TYPE_PROVIDER: TGType;
function SPELLING_PROVIDER(obj: Pointer): PSpellingProvider;
function SPELLING_PROVIDER_CLASS(klass: Pointer): PSpellingProviderClass;
function SPELLING_IS_PROVIDER(obj: Pointer): Tgboolean;

implementation

function SPELLING_TYPE_PROVIDER: TGType;
begin
  SPELLING_TYPE_PROVIDER := spelling_provider_get_type;
end;

function SPELLING_PROVIDER(obj: Pointer): PSpellingProvider;
begin
  Result := PSpellingProvider(g_type_check_instance_cast(obj, SPELLING_TYPE_PROVIDER));
end;

function SPELLING_PROVIDER_CLASS(klass: Pointer): PSpellingProviderClass;
begin
  Result := PSpellingProviderClass(g_type_check_class_cast(klass, SPELLING_TYPE_PROVIDER));
end;

function SPELLING_IS_PROVIDER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SPELLING_TYPE_PROVIDER);
end;



end.
