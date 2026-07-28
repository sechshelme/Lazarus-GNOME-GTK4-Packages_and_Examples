unit ges_video_track;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_types, ges_enums, ges_track;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESVideoTrackClass = ^TGESVideoTrackClass;
  TGESVideoTrackClass = record
    parent_class: TGESTrackClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_video_track_get_type: TGType; cdecl; external libges;
function ges_video_track_new: PGESVideoTrack; cdecl; external libges;

// === Konventiert am: 28-7-26 13:21:41 ===

function GES_TYPE_VIDEO_TRACK: TGType;
function GES_VIDEO_TRACK(obj: Pointer): PGESVideoTrack;
function GES_IS_VIDEO_TRACK(obj: Pointer): Tgboolean;
function GES_VIDEO_TRACK_CLASS(klass: Pointer): PGESVideoTrackClass;
function GES_IS_VIDEO_TRACK_CLASS(klass: Pointer): Tgboolean;
function GES_VIDEO_TRACK_GET_CLASS(obj: Pointer): PGESVideoTrackClass;
{$ENDIF read_function}

implementation

function GES_TYPE_VIDEO_TRACK: TGType;
begin
  Result := ges_video_track_get_type;
end;

function GES_VIDEO_TRACK(obj: Pointer): PGESVideoTrack;
begin
  Result := PGESVideoTrack(g_type_check_instance_cast(obj, GES_TYPE_VIDEO_TRACK));
end;

function GES_IS_VIDEO_TRACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_VIDEO_TRACK);
end;

function GES_VIDEO_TRACK_CLASS(klass: Pointer): PGESVideoTrackClass;
begin
  Result := PGESVideoTrackClass(g_type_check_class_cast(klass, GES_TYPE_VIDEO_TRACK));
end;

function GES_IS_VIDEO_TRACK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_VIDEO_TRACK);
end;

function GES_VIDEO_TRACK_GET_CLASS(obj: Pointer): PGESVideoTrackClass;
begin
  Result := PGESVideoTrackClass(PGTypeInstance(obj)^.g_class);
end;

end.
