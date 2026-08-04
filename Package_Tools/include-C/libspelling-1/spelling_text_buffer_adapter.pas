unit spelling_text_buffer_adapter;

interface

uses
  fp_glib2, fp_gtksourceview, fp_GTK4, fp_spelling, spelling_checker;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PSpellingTextBufferAdapter = type Pointer;

  TSpellingTextBufferAdapterClass = record
    parent_class: TGObjectClass;
  end;
  PSpellingTextBufferAdapterClass = ^TSpellingTextBufferAdapterClass;

function spelling_text_buffer_adapter_get_type: TGType; cdecl; external libspelling;
function spelling_text_buffer_adapter_new(buffer: PGtkSourceBuffer; checker: PSpellingChecker): PSpellingTextBufferAdapter; cdecl; external libspelling;
function spelling_text_buffer_adapter_get_buffer(self: PSpellingTextBufferAdapter): PGtkSourceBuffer; cdecl; external libspelling;
function spelling_text_buffer_adapter_get_enabled(self: PSpellingTextBufferAdapter): Tgboolean; cdecl; external libspelling;
procedure spelling_text_buffer_adapter_set_enabled(self: PSpellingTextBufferAdapter; enabled: Tgboolean); cdecl; external libspelling;
function spelling_text_buffer_adapter_get_checker(self: PSpellingTextBufferAdapter): PSpellingChecker; cdecl; external libspelling;
procedure spelling_text_buffer_adapter_set_checker(self: PSpellingTextBufferAdapter; checker: PSpellingChecker); cdecl; external libspelling;
function spelling_text_buffer_adapter_get_language(self: PSpellingTextBufferAdapter): pchar; cdecl; external libspelling;
procedure spelling_text_buffer_adapter_set_language(self: PSpellingTextBufferAdapter; language: pchar); cdecl; external libspelling;
procedure spelling_text_buffer_adapter_invalidate_all(self: PSpellingTextBufferAdapter); cdecl; external libspelling;
function spelling_text_buffer_adapter_get_tag(self: PSpellingTextBufferAdapter): PGtkTextTag; cdecl; external libspelling;
function spelling_text_buffer_adapter_get_menu_model(self: PSpellingTextBufferAdapter): PGMenuModel; cdecl; external libspelling;

// === Konventiert am: 4-8-26 17:16:07 ===

function SPELLING_TYPE_TEXT_BUFFER_ADAPTER: TGType;
function SPELLING_TEXT_BUFFER_ADAPTER(obj: Pointer): PSpellingTextBufferAdapter;
function SPELLING_IS_TEXT_BUFFER_ADAPTER(obj: Pointer): Tgboolean;

implementation

function SPELLING_TYPE_TEXT_BUFFER_ADAPTER: TGType;
begin
  Result := spelling_text_buffer_adapter_get_type;
end;

function SPELLING_TEXT_BUFFER_ADAPTER(obj: Pointer): PSpellingTextBufferAdapter;
begin
  Result := PSpellingTextBufferAdapter(g_type_check_instance_cast(obj, SPELLING_TYPE_TEXT_BUFFER_ADAPTER));
end;

function SPELLING_IS_TEXT_BUFFER_ADAPTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SPELLING_TYPE_TEXT_BUFFER_ADAPTER);
end;

end.
