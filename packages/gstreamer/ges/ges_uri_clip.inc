{$IFDEF read_interface}

  {GES_DECLARE_TYPE (UriClip, uri_clip, URI_CLIP); }
type
  TGESUriClipPrivate = record
  end;
  PGESUriClipPrivate = ^TGESUriClipPrivate;

  TGESUriClip = record
    parent: TGESSourceClip;
    priv: PGESUriClipPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESUriClip = ^TGESUriClip;

  TGESUriClipClass = record
    parent_class: TGESSourceClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESUriClipClass = ^TGESUriClipClass;

function ges_uri_clip_get_type: TGType; cdecl; external libges;
procedure ges_uri_clip_set_mute(self: PGESUriClip; mute: Tgboolean); cdecl; external libges;
procedure ges_uri_clip_set_is_image(self: PGESUriClip; is_image: Tgboolean); cdecl; external libges;
function ges_uri_clip_is_muted(self: PGESUriClip): Tgboolean; cdecl; external libges;
function ges_uri_clip_is_image(self: PGESUriClip): Tgboolean; cdecl; external libges;
function ges_uri_clip_get_uri(self: PGESUriClip): Pgchar; cdecl; external libges;
function ges_uri_clip_new(uri: Pgchar): PGESUriClip; cdecl; external libges;

// === Konventiert am: 13-12-24 17:08:34 ===

function GES_TYPE_URI_CLIP: TGType;
function GES_URI_CLIP(obj: Pointer): PGESUriClip;
function GES_IS_URI_CLIP(obj: Pointer): Tgboolean;
function GES_URI_CLIP_CLASS(klass: Pointer): PGESUriClipClass;
function GES_IS_URI_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_URI_CLIP_GET_CLASS(obj: Pointer): PGESUriClipClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_URI_CLIP: TGType;
begin
  Result := ges_uri_clip_get_type;
end;

function GES_URI_CLIP(obj: Pointer): PGESUriClip;
begin
  Result := PGESUriClip(g_type_check_instance_cast(obj, GES_TYPE_URI_CLIP));
end;

function GES_IS_URI_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_URI_CLIP);
end;

function GES_URI_CLIP_CLASS(klass: Pointer): PGESUriClipClass;
begin
  Result := PGESUriClipClass(g_type_check_class_cast(klass, GES_TYPE_URI_CLIP));
end;

function GES_IS_URI_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_URI_CLIP);
end;

function GES_URI_CLIP_GET_CLASS(obj: Pointer): PGESUriClipClass;
begin
  Result := PGESUriClipClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
