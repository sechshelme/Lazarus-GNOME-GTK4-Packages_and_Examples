unit ges_track_element;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_timeline_element;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {GES_DECLARE_TYPE (TrackElement, track_element, TRACK_ELEMENT) }
type
  TGESTrackElementPrivate = record
  end;
  PGESTrackElementPrivate = ^TGESTrackElementPrivate;

  TGESTrackElement = record
    parent: TGESTimelineElement;
    active: Tgboolean;
    priv: PGESTrackElementPrivate;
    asset: PGESAsset;
    _ges_reserved: array[0..(GES_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGESTrackElement = ^TGESTrackElement;

  TGESTrackElementClass = record
    parent_class: TGESTimelineElementClass;
    nleobj_factorytype: Pgchar;
    create_gnl_obj: function(obj: PGESTrackElement): PGstElement; cdecl;
    create_element: function(obj: PGESTrackElement): PGstElement; cdecl;
    active_changed: procedure(obj: PGESTrackElement; active: Tgboolean); cdecl;
    changed: procedure(obj: PGESTrackElement); cdecl;
    list_children_properties: function(obj: PGESTrackElement; n_properties: Pguint): PPGParamSpec; cdecl;
    lookup_child: function(obj: PGESTrackElement; prop_name: Pgchar; element: PPGstElement; pspec: PPGParamSpec): Tgboolean; cdecl;
    ABI: record
      case longint of
        0: (_ges_reserved: array[0..(GES_PADDING_LARGE) - 1] of Tgpointer);
        1: (abi: record
            default_has_internal_source: Tgboolean;
            default_track_type: TGESTrackType;
            end);
      end;
  end;
  PGESTrackElementClass = ^TGESTrackElementClass;


function gestrack_element_get_type: TGType; cdecl; external libges;
function ges_track_element_get_track(obj: PGESTrackElement): PGESTrack; cdecl; external libges;
function ges_track_element_get_track_type(obj: PGESTrackElement): TGESTrackType; cdecl; external libges;
procedure ges_track_element_set_track_type(obj: PGESTrackElement; _type: TGESTrackType); cdecl; external libges;
function ges_track_element_get_nleobj(obj: PGESTrackElement): PGstElement; cdecl; external libges;
function ges_track_element_get_element(obj: PGESTrackElement): PGstElement; cdecl; external libges;
function ges_track_element_is_core(obj: PGESTrackElement): Tgboolean; cdecl; external libges;
function ges_track_element_set_active(obj: PGESTrackElement; active: Tgboolean): Tgboolean; cdecl; external libges;
function ges_track_element_is_active(obj: PGESTrackElement): Tgboolean; cdecl; external libges;
function ges_track_element_set_has_internal_source(obj: PGESTrackElement; has_internal_source: Tgboolean): Tgboolean; cdecl; external libges;
function ges_track_element_has_internal_source(obj: PGESTrackElement): Tgboolean; cdecl; external libges;
procedure ges_track_element_get_child_property_by_pspec(obj: PGESTrackElement; pspec: PGParamSpec; Value: PGValue); cdecl; external libges;
function ges_track_element_set_control_source(obj: PGESTrackElement; Source: PGstControlSource; property_name: Pgchar; binding_type: Pgchar): Tgboolean; cdecl; external libges;
procedure ges_track_element_clamp_control_source(obj: PGESTrackElement; property_name: Pgchar); cdecl; external libges;
procedure ges_track_element_set_auto_clamp_control_sources(obj: PGESTrackElement; auto_clamp: Tgboolean); cdecl; external libges;
function ges_track_element_get_auto_clamp_control_sources(obj: PGESTrackElement): Tgboolean; cdecl; external libges;
function ges_track_element_get_control_binding(obj: PGESTrackElement; property_name: Pgchar): PGstControlBinding; cdecl; external libges;
procedure ges_track_element_add_children_props(self: PGESTrackElement; element: PGstElement; wanted_categories: PPgchar; blacklist: PPgchar; whitelist: PPgchar); cdecl; external libges;
function ges_track_element_get_all_control_bindings(trackelement: PGESTrackElement): PGHashTable; cdecl; external libges;
function ges_track_element_remove_control_binding(obj: PGESTrackElement; property_name: Pgchar): Tgboolean; cdecl; external libges;

function GES_TRACK_ELEMENT_CLASS_DEFAULT_HAS_INTERNAL_SOURCE(klass: Pointer): Tgboolean;

// === Konventiert am: 12-12-24 17:14:30 ===

function GES_TYPE_TRACK_ELEMENT: TGType;
function GES_TRACK_ELEMENT(obj: Pointer): PGESTrackElement;
function GES_IS_TRACK_ELEMENT(obj: Pointer): Tgboolean;
function GES_TRACK_ELEMENT_CLASS(klass: Pointer): PGESTrackElementClass;
function GES_IS_TRACK_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function GES_TRACK_ELEMENT_GET_CLASS(obj: Pointer): PGESTrackElementClass;

implementation

function GES_TYPE_TRACK_ELEMENT: TGType;
begin
  Result := gestrack_element_get_type;
end;

function GES_TRACK_ELEMENT(obj: Pointer): PGESTrackElement;
begin
  Result := PGESTrackElement(g_type_check_instance_cast(obj, GES_TYPE_TRACK_ELEMENT));
end;

function GES_IS_TRACK_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TRACK_ELEMENT);
end;

function GES_TRACK_ELEMENT_CLASS(klass: Pointer): PGESTrackElementClass;
begin
  Result := PGESTrackElementClass(g_type_check_class_cast(klass, GES_TYPE_TRACK_ELEMENT));
end;

function GES_IS_TRACK_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TRACK_ELEMENT);
end;

function GES_TRACK_ELEMENT_GET_CLASS(obj: Pointer): PGESTrackElementClass;
begin
  Result := PGESTrackElementClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GES_TRACK_ELEMENT_CLASS_DEFAULT_HAS_INTERNAL_SOURCE(klass: Pointer): Tgboolean;
begin
  GES_TRACK_ELEMENT_CLASS_DEFAULT_HAS_INTERNAL_SOURCE := (GES_TRACK_ELEMENT_CLASS(klass))^.ABI.abi.default_has_internal_source;
end;


end.
