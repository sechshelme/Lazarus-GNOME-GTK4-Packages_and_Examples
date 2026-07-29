unit ges_uri_clip;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst,ges_types, ges_enums,ges_source_clip;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESUriClipClass = ^TGESUriClipClass;
  TGESUriClipClass = record
    parent_class: TGESSourceClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_uri_clip_get_type: TGType; cdecl; external libges;
procedure ges_uri_clip_set_mute(self: PGESUriClip; mute: Tgboolean); cdecl; external libges;
procedure ges_uri_clip_set_is_image(self: PGESUriClip; is_image: Tgboolean); cdecl; external libges;
function ges_uri_clip_is_muted(self: PGESUriClip): Tgboolean; cdecl; external libges;
function ges_uri_clip_is_image(self: PGESUriClip): Tgboolean; cdecl; external libges;
function ges_uri_clip_get_uri(self: PGESUriClip): Pgchar; cdecl; external libges;
function ges_uri_clip_new(uri: Pgchar): PGESUriClip; cdecl; external libges;

// === Konventiert am: 28-7-26 13:17:50 ===

function GES_TYPE_URI_CLIP: TGType;
function GES_URI_CLIP(obj: Pointer): PGESUriClip;
function GES_IS_URI_CLIP(obj: Pointer): Tgboolean;
function GES_URI_CLIP_CLASS(klass: Pointer): PGESUriClipClass;
function GES_IS_URI_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_URI_CLIP_GET_CLASS(obj: Pointer): PGESUriClipClass;
{$ENDIF read_function}

implementation

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

end.
