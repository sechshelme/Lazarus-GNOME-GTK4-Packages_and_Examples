

  {$IFDEF read_struct}
type
  PGESAudioTestSourceClass = ^TGESAudioTestSourceClass;
  TGESAudioTestSourceClass = record
    parent_class: TGESAudioSourceClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_audio_test_source_get_type: TGType; cdecl; external libges;
procedure ges_audio_test_source_set_freq(self: PGESAudioTestSource; freq: Tgdouble); cdecl; external libges;
procedure ges_audio_test_source_set_volume(self: PGESAudioTestSource; volume: Tgdouble); cdecl; external libges;
function ges_audio_test_source_get_freq(self: PGESAudioTestSource): double; cdecl; external libges;
function ges_audio_test_source_get_volume(self: PGESAudioTestSource): double; cdecl; external libges;

// === Konventiert am: 27-7-26 19:48:36 ===

function GES_TYPE_AUDIO_TEST_SOURCE: TGType;
function GES_AUDIO_TEST_SOURCE(obj: Pointer): PGESAudioTestSource;
function GES_IS_AUDIO_TEST_SOURCE(obj: Pointer): Tgboolean;
function GES_AUDIO_TEST_SOURCE_CLASS(klass: Pointer): PGESAudioTestSourceClass;
function GES_IS_AUDIO_TEST_SOURCE_CLASS(klass: Pointer): Tgboolean;
function GES_AUDIO_TEST_SOURCE_GET_CLASS(obj: Pointer): PGESAudioTestSourceClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GES_TYPE_AUDIO_TEST_SOURCE: TGType;
begin
  Result := ges_audio_test_source_get_type;
end;

function GES_AUDIO_TEST_SOURCE(obj: Pointer): PGESAudioTestSource;
begin
  Result := PGESAudioTestSource(g_type_check_instance_cast(obj, GES_TYPE_AUDIO_TEST_SOURCE));
end;

function GES_IS_AUDIO_TEST_SOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_AUDIO_TEST_SOURCE);
end;

function GES_AUDIO_TEST_SOURCE_CLASS(klass: Pointer): PGESAudioTestSourceClass;
begin
  Result := PGESAudioTestSourceClass(g_type_check_class_cast(klass, GES_TYPE_AUDIO_TEST_SOURCE));
end;

function GES_IS_AUDIO_TEST_SOURCE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_AUDIO_TEST_SOURCE);
end;

function GES_AUDIO_TEST_SOURCE_GET_CLASS(obj: Pointer): PGESAudioTestSourceClass;
begin
  Result := PGESAudioTestSourceClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
