unit ges_timeline;

interface

uses
  fp_glib2, fp_gst, ges_types, ges_group, ges_timeline_element, ges_project_, ges_extractable_;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (Timeline, timeline, TIMELINE); }
type
  TGESTimelineClass = record
    parent_class: TGstBinClass;
    track_added: procedure(timeline: PGESTimeline; track: PGESTrack); cdecl;
    track_removed: procedure(timeline: PGESTimeline; track: PGESTrack); cdecl;
    layer_added: procedure(timeline: PGESTimeline; layer: PGESLayer); cdecl;
    layer_removed: procedure(timeline: PGESTimeline; layer: PGESLayer); cdecl;
    group_added: procedure(timeline: PGESTimeline; group: PGESGroup); cdecl;
    group_removed: procedure(timeline: PGESTimeline; group: PGESGroup; children: PGPtrArray); cdecl;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTimelineClass = ^TGESTimelineClass;

function ges_timeline_get_type: TGType; cdecl; external libges;
function ges_timeline_new: PGESTimeline; cdecl; external libges;
function ges_timeline_new_from_uri(uri: Pgchar; error: PPGError): PGESTimeline; cdecl; external libges;
function ges_timeline_load_from_uri(timeline: PGESTimeline; uri: Pgchar; error: PPGError): Tgboolean; cdecl; external libges;
function ges_timeline_save_to_uri(timeline: PGESTimeline; uri: Pgchar; formatter_asset: PGESAsset; overwrite: Tgboolean; error: PPGError): Tgboolean; cdecl; external libges;
function ges_timeline_add_layer(timeline: PGESTimeline; layer: PGESLayer): Tgboolean; cdecl; external libges;
function ges_timeline_append_layer(timeline: PGESTimeline): PGESLayer; cdecl; external libges;
function ges_timeline_remove_layer(timeline: PGESTimeline; layer: PGESLayer): Tgboolean; cdecl; external libges;
function ges_timeline_get_layers(timeline: PGESTimeline): PGList; cdecl; external libges;
function ges_timeline_get_layer(timeline: PGESTimeline; priority: Tguint): PGESLayer; cdecl; external libges;
function ges_timeline_add_track(timeline: PGESTimeline; track: PGESTrack): Tgboolean; cdecl; external libges;
function ges_timeline_remove_track(timeline: PGESTimeline; track: PGESTrack): Tgboolean; cdecl; external libges;
function ges_timeline_get_track_for_pad(timeline: PGESTimeline; pad: PGstPad): PGESTrack; cdecl; external libges;
function ges_timeline_get_pad_for_track(timeline: PGESTimeline; track: PGESTrack): PGstPad; cdecl; external libges;
function ges_timeline_get_tracks(timeline: PGESTimeline): PGList; cdecl; external libges;
function ges_timeline_get_groups(timeline: PGESTimeline): PGList; cdecl; external libges;
function ges_timeline_commit(timeline: PGESTimeline): Tgboolean; cdecl; external libges;
function ges_timeline_commit_sync(timeline: PGESTimeline): Tgboolean; cdecl; external libges;
procedure ges_timeline_freeze_commit(timeline: PGESTimeline); cdecl; external libges;
procedure ges_timeline_thaw_commit(timeline: PGESTimeline); cdecl; external libges;
function ges_timeline_get_duration(timeline: PGESTimeline): TGstClockTime; cdecl; external libges;
function ges_timeline_get_auto_transition(timeline: PGESTimeline): Tgboolean; cdecl; external libges;
procedure ges_timeline_set_auto_transition(timeline: PGESTimeline; auto_transition: Tgboolean); cdecl; external libges;
function ges_timeline_get_snapping_distance(timeline: PGESTimeline): TGstClockTime; cdecl; external libges;
procedure ges_timeline_set_snapping_distance(timeline: PGESTimeline; snapping_distance: TGstClockTime); cdecl; external libges;
function ges_timeline_get_element(timeline: PGESTimeline; Name: Pgchar): PGESTimelineElement; cdecl; external libges;
function ges_timeline_is_empty(timeline: PGESTimeline): Tgboolean; cdecl; external libges;
function ges_timeline_paste_element(timeline: PGESTimeline; element: PGESTimelineElement; position: TGstClockTime; layer_priority: Tgint): PGESTimelineElement; cdecl; external libges;
function ges_timeline_move_layer(timeline: PGESTimeline; layer: PGESLayer; new_layer_priority: Tguint): Tgboolean; cdecl; external libges;
function ges_timeline_get_frame_time(self: PGESTimeline; frame_number: TGESFrameNumber): TGstClockTime; cdecl; external libges;
function ges_timeline_get_frame_at(self: PGESTimeline; timestamp: TGstClockTime): TGESFrameNumber; cdecl; external libges;
procedure ges_timeline_disable_edit_apis(self: PGESTimeline; disable_edit_apis: Tgboolean); cdecl; external libges;
function ges_timeline_get_edit_apis_disabled(self: PGESTimeline): Tgboolean; cdecl; external libges;

function ges_timeline_get_project(obj: Pointer): PGESProject;

// === Konventiert am: 12-12-24 16:19:48 ===

function GES_TYPE_TIMELINE: TGType;
function GES_TIMELINE(obj: Pointer): PGESTimeline;
function GES_IS_TIMELINE(obj: Pointer): Tgboolean;
function GES_TIMELINE_CLASS(klass: Pointer): PGESTimelineClass;
function GES_IS_TIMELINE_CLASS(klass: Pointer): Tgboolean;
function GES_TIMELINE_GET_CLASS(obj: Pointer): PGESTimelineClass;


implementation

function GES_TYPE_TIMELINE: TGType;
begin
  Result := ges_timeline_get_type;
end;

function GES_TIMELINE(obj: Pointer): PGESTimeline;
begin
  Result := PGESTimeline(g_type_check_instance_cast(obj, GES_TYPE_TIMELINE));
end;

function GES_IS_TIMELINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TIMELINE);
end;

function GES_TIMELINE_CLASS(klass: Pointer): PGESTimelineClass;
begin
  Result := PGESTimelineClass(g_type_check_class_cast(klass, GES_TYPE_TIMELINE));
end;

function GES_IS_TIMELINE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TIMELINE);
end;

function GES_TIMELINE_GET_CLASS(obj: Pointer): PGESTimelineClass;
begin
  Result := PGESTimelineClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function ges_timeline_get_project(obj: Pointer): PGESProject;
begin
  ges_timeline_get_project := GES_PROJECT(ges_extractable_get_asset(GES_EXTRACTABLE(obj)));
end;


end.
