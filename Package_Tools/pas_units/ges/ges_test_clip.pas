unit ges_test_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_source_clip;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (TestClip, test_clip, TEST_CLIP); }
type
  TGESTestClipPrivate = record
  end;
  PGESTestClipPrivate = ^TGESTestClipPrivate;

  TGESTestClip = record
    parent: TGESSourceClip;
    priv: PGESTestClipPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTestClip = ^TGESTestClip;

  TGESTestClipClass = record
    parent_class: TGESSourceClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTestClipClass = ^TGESTestClipClass;

function ges_test_clip_get_type: TGType; cdecl; external libges;
procedure ges_test_clip_set_mute(self: PGESTestClip; mute: Tgboolean); cdecl; external libges;
procedure ges_test_clip_set_vpattern(self: PGESTestClip; vpattern: TGESVideoTestPattern); cdecl; external libges;
procedure ges_test_clip_set_frequency(self: PGESTestClip; freq: Tgdouble); cdecl; external libges;
procedure ges_test_clip_set_volume(self: PGESTestClip; volume: Tgdouble); cdecl; external libges;
function ges_test_clip_get_vpattern(self: PGESTestClip): TGESVideoTestPattern; cdecl; external libges;
function ges_test_clip_is_muted(self: PGESTestClip): Tgboolean; cdecl; external libges;
function ges_test_clip_get_frequency(self: PGESTestClip): Tgdouble; cdecl; external libges;
function ges_test_clip_get_volume(self: PGESTestClip): Tgdouble; cdecl; external libges;
function ges_test_clip_new: PGESTestClip; cdecl; external libges;
function ges_test_clip_new_for_nick(nick: Pgchar): PGESTestClip; cdecl; external libges;

// === Konventiert am: 13-12-24 17:01:50 ===

function GES_TYPE_TEST_CLIP: TGType;
function GES_TEST_CLIP(obj: Pointer): PGESTestClip;
function GES_IS_TEST_CLIP(obj: Pointer): Tgboolean;
function GES_TEST_CLIP_CLASS(klass: Pointer): PGESTestClipClass;
function GES_IS_TEST_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_TEST_CLIP_GET_CLASS(obj: Pointer): PGESTestClipClass;

implementation

function GES_TYPE_TEST_CLIP: TGType;
begin
  Result := ges_test_clip_get_type;
end;

function GES_TEST_CLIP(obj: Pointer): PGESTestClip;
begin
  Result := PGESTestClip(g_type_check_instance_cast(obj, GES_TYPE_TEST_CLIP));
end;

function GES_IS_TEST_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TEST_CLIP);
end;

function GES_TEST_CLIP_CLASS(klass: Pointer): PGESTestClipClass;
begin
  Result := PGESTestClipClass(g_type_check_class_cast(klass, GES_TYPE_TEST_CLIP));
end;

function GES_IS_TEST_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TEST_CLIP);
end;

function GES_TEST_CLIP_GET_CLASS(obj: Pointer): PGESTestClipClass;
begin
  Result := PGESTestClipClass(PGTypeInstance(obj)^.g_class);
end;




end.
