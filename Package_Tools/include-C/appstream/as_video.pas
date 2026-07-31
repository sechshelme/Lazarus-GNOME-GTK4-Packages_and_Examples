unit as_video;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_appstream;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PAsVideoCodecKind = ^TAsVideoCodecKind;
  TAsVideoCodecKind = longint;
const
  AS_VIDEO_CODEC_KIND_UNKNOWN = 0;
  AS_VIDEO_CODEC_KIND_VP9 = 1;
  AS_VIDEO_CODEC_KIND_AV1 = 2;
  AS_VIDEO_CODEC_KIND_LAST = 3;

type
  PAsVideoContainerKind = ^TAsVideoContainerKind;
  TAsVideoContainerKind = longint;
const
  AS_VIDEO_CONTAINER_KIND_UNKNOWN = 0;
  AS_VIDEO_CONTAINER_KIND_MKV = 1;
  AS_VIDEO_CONTAINER_KIND_WEBM = 2;
  AS_VIDEO_CONTAINER_KIND_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsVideo = record
    parent_instance: TGObject;
  end;
  PAsVideo = ^TAsVideo;

  PAsVideoClass = ^TAsVideoClass;
  TAsVideoClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_video_get_type: TGType; cdecl; external libappstream;
function as_video_codec_kind_from_string(str: Pgchar): TAsVideoCodecKind; cdecl; external libappstream;
function as_video_codec_kind_to_string(kind: TAsVideoCodecKind): Pgchar; cdecl; external libappstream;
function as_video_container_kind_from_string(str: Pgchar): TAsVideoContainerKind; cdecl; external libappstream;
function as_video_container_kind_to_string(kind: TAsVideoContainerKind): Pgchar; cdecl; external libappstream;
function as_video_new: PAsVideo; cdecl; external libappstream;
function as_video_get_codec_kind(video: PAsVideo): TAsVideoCodecKind; cdecl; external libappstream;
procedure as_video_set_codec_kind(video: PAsVideo; kind: TAsVideoCodecKind); cdecl; external libappstream;
function as_video_get_container_kind(video: PAsVideo): TAsVideoContainerKind; cdecl; external libappstream;
procedure as_video_set_container_kind(video: PAsVideo; kind: TAsVideoContainerKind); cdecl; external libappstream;
function as_video_get_url(video: PAsVideo): Pgchar; cdecl; external libappstream;
procedure as_video_set_url(video: PAsVideo; url: Pgchar); cdecl; external libappstream;
function as_video_get_width(video: PAsVideo): Tguint; cdecl; external libappstream;
procedure as_video_set_width(video: PAsVideo; width: Tguint); cdecl; external libappstream;
function as_video_get_height(video: PAsVideo): Tguint; cdecl; external libappstream;
procedure as_video_set_height(video: PAsVideo; height: Tguint); cdecl; external libappstream;
function as_video_get_locale(video: PAsVideo): Pgchar; cdecl; external libappstream;
procedure as_video_set_locale(video: PAsVideo; locale: Pgchar); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:34:05 ===

function AS_TYPE_VIDEO: TGType;
function AS_VIDEO(obj: Pointer): PAsVideo;
function AS_IS_VIDEO(obj: Pointer): Tgboolean;
function AS_VIDEO_CLASS(klass: Pointer): PAsVideoClass;
function AS_IS_VIDEO_CLASS(klass: Pointer): Tgboolean;
function AS_VIDEO_GET_CLASS(obj: Pointer): PAsVideoClass;
{$ENDIF read_function}

implementation

function AS_TYPE_VIDEO: TGType;
begin
  Result := as_video_get_type;
end;

function AS_VIDEO(obj: Pointer): PAsVideo;
begin
  Result := PAsVideo(g_type_check_instance_cast(obj, AS_TYPE_VIDEO));
end;

function AS_IS_VIDEO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_VIDEO);
end;

function AS_VIDEO_CLASS(klass: Pointer): PAsVideoClass;
begin
  Result := PAsVideoClass(g_type_check_class_cast(klass, AS_TYPE_VIDEO));
end;

function AS_IS_VIDEO_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_VIDEO);
end;

function AS_VIDEO_GET_CLASS(obj: Pointer): PAsVideoClass;
begin
  Result := PAsVideoClass(PGTypeInstance(obj)^.g_class);
end;

end.
