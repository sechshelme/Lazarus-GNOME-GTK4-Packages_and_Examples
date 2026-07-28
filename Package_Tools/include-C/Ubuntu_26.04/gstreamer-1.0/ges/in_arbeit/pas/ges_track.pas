unit ges_track;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESTrack = ^TGESTrack;

  TGESCreateElementForGapFunc = function(track: PGESTrack): PGstElement; cdecl;

  PGESTrackPrivate = type Pointer;

  TGESTrack = record
    parent: TGstBin;
    _type: TGESTrackType;
    priv: PGESTrackPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;

  PGESTrackClass = ^TGESTrackClass;
  TGESTrackClass = record
    parent_class: TGstBinClass;
    get_mixing_element: function(track: PGESTrack): PGstElement; cdecl;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_track_get_type: TGType; cdecl; external libges;
function ges_track_get_caps(track: PGESTrack): PGstCaps; cdecl; external libges;
function ges_track_get_elements(track: PGESTrack): PGList; cdecl; external libges;
function ges_track_get_timeline(track: PGESTrack): PGESTimeline; cdecl; external libges;
function ges_track_commit(track: PGESTrack): Tgboolean; cdecl; external libges;
procedure ges_track_set_timeline(track: PGESTrack; timeline: PGESTimeline); cdecl; external libges;
function ges_track_add_element(track: PGESTrack; obj: PGESTrackElement): Tgboolean; cdecl; external libges;
function ges_track_add_element_full(track: PGESTrack; obj: PGESTrackElement; error: PPGError): Tgboolean; cdecl; external libges;
function ges_track_remove_element(track: PGESTrack; obj: PGESTrackElement): Tgboolean; cdecl; external libges;
function ges_track_remove_element_full(track: PGESTrack; obj: PGESTrackElement; error: PPGError): Tgboolean; cdecl; external libges;
procedure ges_track_set_create_element_for_gap_func(track: PGESTrack; func: TGESCreateElementForGapFunc); cdecl; external libges;
procedure ges_track_set_mixing(track: PGESTrack; mixing: Tgboolean); cdecl; external libges;
function ges_track_get_mixing(track: PGESTrack): Tgboolean; cdecl; external libges;
procedure ges_track_set_restriction_caps(track: PGESTrack; caps: PGstCaps); cdecl; external libges;
procedure ges_track_update_restriction_caps(track: PGESTrack; caps: PGstCaps); cdecl; external libges;
function ges_track_get_restriction_caps(track: PGESTrack): PGstCaps; cdecl; external libges;
function ges_track_new(_type: TGESTrackType; caps: PGstCaps): PGESTrack; cdecl; external libges;

// === Konventiert am: 28-7-26 13:13:15 ===

function GES_TYPE_TRACK: TGType;
function GES_TRACK(obj: Pointer): PGESTrack;
function GES_IS_TRACK(obj: Pointer): Tgboolean;
function GES_TRACK_CLASS(klass: Pointer): PGESTrackClass;
function GES_IS_TRACK_CLASS(klass: Pointer): Tgboolean;
function GES_TRACK_GET_CLASS(obj: Pointer): PGESTrackClass;
{$ENDIF read_function}

implementation

function GES_TYPE_TRACK: TGType;
begin
  Result := ges_track_get_type;
end;

function GES_TRACK(obj: Pointer): PGESTrack;
begin
  Result := PGESTrack(g_type_check_instance_cast(obj, GES_TYPE_TRACK));
end;

function GES_IS_TRACK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TRACK);
end;

function GES_TRACK_CLASS(klass: Pointer): PGESTrackClass;
begin
  Result := PGESTrackClass(g_type_check_class_cast(klass, GES_TYPE_TRACK));
end;

function GES_IS_TRACK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TRACK);
end;

function GES_TRACK_GET_CLASS(obj: Pointer): PGESTrackClass;
begin
  Result := PGESTrackClass(PGTypeInstance(obj)^.g_class);
end;

end.
