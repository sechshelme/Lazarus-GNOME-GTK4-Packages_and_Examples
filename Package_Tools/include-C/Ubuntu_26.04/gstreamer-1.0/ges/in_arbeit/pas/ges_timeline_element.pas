unit ges_timeline_element;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GES_TIMELINE_ELEMENT_NO_LAYER_PRIORITY = Tguint32(-(1));
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGESTimelineElementClass = ^TGESTimelineElementClass;
  TGESTimelineElementClass = record
    parent_class: TGInitiallyUnownedClass;
    set_parent: function(self: PGESTimelineElement; parent: PGESTimelineElement): Tgboolean; cdecl;
    set_start: function(self: PGESTimelineElement; start: TGstClockTime): Tgboolean; cdecl;
    set_inpoint: function(self: PGESTimelineElement; inpoint: TGstClockTime): Tgboolean; cdecl;
    set_duration: function(self: PGESTimelineElement; duration: TGstClockTime): Tgboolean; cdecl;
    set_max_duration: function(self: PGESTimelineElement; maxduration: TGstClockTime): Tgboolean; cdecl;
    set_priority: function(self: PGESTimelineElement; priority: Tguint32): Tgboolean; cdecl;
    ripple: function(self: PGESTimelineElement; start: Tguint64): Tgboolean; cdecl;
    ripple_end: function(self: PGESTimelineElement; end_: Tguint64): Tgboolean; cdecl;
    roll_start: function(self: PGESTimelineElement; start: Tguint64): Tgboolean; cdecl;
    roll_end: function(self: PGESTimelineElement; end_: Tguint64): Tgboolean; cdecl;
    trim: function(self: PGESTimelineElement; start: Tguint64): Tgboolean; cdecl;
    deep_copy: procedure(self: PGESTimelineElement; copy: PGESTimelineElement); cdecl;
    paste: function(self: PGESTimelineElement; ref_element: PGESTimelineElement; paste_position: TGstClockTime): PGESTimelineElement; cdecl;
    list_children_properties: function(self: PGESTimelineElement; n_properties: Pguint): PPGParamSpec; cdecl;
    lookup_child: function(self: PGESTimelineElement; prop_name: Pgchar; child: PPGObject; pspec: PPGParamSpec): Tgboolean; cdecl;
    get_track_types: function(self: PGESTimelineElement): TGESTrackType; cdecl;
    set_child_property: procedure(self: PGESTimelineElement; child: PGObject; pspec: PGParamSpec; value: PGValue); cdecl;
    get_layer_priority: function(self: PGESTimelineElement): Tguint32; cdecl;
    get_natural_framerate: function(self: PGESTimelineElement; framerate_n: Pgint; framerate_d: Pgint): Tgboolean; cdecl;
    set_child_property_full: function(self: PGESTimelineElement; child: PGObject; pspec: PGParamSpec; value: PGValue; error: PPGError): Tgboolean; cdecl;
    _ges_reserved: array[0..(GES_PADDING_LARGE - 6) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_timeline_element_get_type: TGType; cdecl; external libges;
function ges_timeline_element_get_toplevel_parent(self: PGESTimelineElement): PGESTimelineElement; cdecl; external libges;
function ges_timeline_element_get_parent(self: PGESTimelineElement): PGESTimelineElement; cdecl; external libges;
function ges_timeline_element_set_parent(self: PGESTimelineElement; parent: PGESTimelineElement): Tgboolean; cdecl; external libges;
function ges_timeline_element_set_timeline(self: PGESTimelineElement; timeline: PGESTimeline): Tgboolean; cdecl; external libges;
function ges_timeline_element_set_start(self: PGESTimelineElement; start: TGstClockTime): Tgboolean; cdecl; external libges;
function ges_timeline_element_set_inpoint(self: PGESTimelineElement; inpoint: TGstClockTime): Tgboolean; cdecl; external libges;
function ges_timeline_element_set_duration(self: PGESTimelineElement; duration: TGstClockTime): Tgboolean; cdecl; external libges;
function ges_timeline_element_set_max_duration(self: PGESTimelineElement; maxduration: TGstClockTime): Tgboolean; cdecl; external libges;
function ges_timeline_element_set_priority(self: PGESTimelineElement; priority: Tguint32): Tgboolean; cdecl; external libges; deprecated;
function ges_timeline_element_get_start(self: PGESTimelineElement): TGstClockTime; cdecl; external libges;
function ges_timeline_element_get_inpoint(self: PGESTimelineElement): TGstClockTime; cdecl; external libges;
function ges_timeline_element_get_duration(self: PGESTimelineElement): TGstClockTime; cdecl; external libges;
function ges_timeline_element_get_max_duration(self: PGESTimelineElement): TGstClockTime; cdecl; external libges;
function ges_timeline_element_get_timeline(self: PGESTimelineElement): PGESTimeline; cdecl; external libges;
function ges_timeline_element_get_priority(self: PGESTimelineElement): Tguint32; cdecl; external libges;
function ges_timeline_element_ripple(self: PGESTimelineElement; start: TGstClockTime): Tgboolean; cdecl; external libges;
function ges_timeline_element_ripple_end(self: PGESTimelineElement; end_: TGstClockTime): Tgboolean; cdecl; external libges;
function ges_timeline_element_roll_start(self: PGESTimelineElement; start: TGstClockTime): Tgboolean; cdecl; external libges;
function ges_timeline_element_roll_end(self: PGESTimelineElement; end_: TGstClockTime): Tgboolean; cdecl; external libges;
function ges_timeline_element_trim(self: PGESTimelineElement; start: TGstClockTime): Tgboolean; cdecl; external libges;
function ges_timeline_element_copy(self: PGESTimelineElement; deep: Tgboolean): PGESTimelineElement; cdecl; external libges;
function ges_timeline_element_get_name(self: PGESTimelineElement): Pgchar; cdecl; external libges;
function ges_timeline_element_set_name(self: PGESTimelineElement; name: Pgchar): Tgboolean; cdecl; external libges;
function ges_timeline_element_list_children_properties(self: PGESTimelineElement; n_properties: Pguint): PPGParamSpec; cdecl; external libges;
function ges_timeline_element_lookup_child(self: PGESTimelineElement; prop_name: Pgchar; child: PPGObject; pspec: PPGParamSpec): Tgboolean; cdecl; external libges;
procedure ges_timeline_element_get_child_property_by_pspec(self: PGESTimelineElement; pspec: PGParamSpec; value: PGValue); cdecl; external libges;
procedure ges_timeline_element_get_child_property_valist(self: PGESTimelineElement; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libges;
procedure ges_timeline_element_get_child_properties(self: PGESTimelineElement; first_property_name: Pgchar; args: array of const); cdecl; external libges;
procedure ges_timeline_element_get_child_properties(self: PGESTimelineElement; first_property_name: Pgchar); cdecl; external libges;
procedure ges_timeline_element_set_child_property_valist(self: PGESTimelineElement; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libges;
procedure ges_timeline_element_set_child_property_by_pspec(self: PGESTimelineElement; pspec: PGParamSpec; value: PGValue); cdecl; external libges;
procedure ges_timeline_element_set_child_properties(self: PGESTimelineElement; first_property_name: Pgchar; args: array of const); cdecl; external libges;
procedure ges_timeline_element_set_child_properties(self: PGESTimelineElement; first_property_name: Pgchar); cdecl; external libges;
function ges_timeline_element_set_child_property(self: PGESTimelineElement; property_name: Pgchar; value: PGValue): Tgboolean; cdecl; external libges;
function ges_timeline_element_set_child_property_full(self: PGESTimelineElement; property_name: Pgchar; value: PGValue; error: PPGError): Tgboolean; cdecl; external libges;
function ges_timeline_element_get_child_property(self: PGESTimelineElement; property_name: Pgchar; value: PGValue): Tgboolean; cdecl; external libges;
function ges_timeline_element_add_child_property(self: PGESTimelineElement; pspec: PGParamSpec; child: PGObject): Tgboolean; cdecl; external libges;
function ges_timeline_element_remove_child_property(self: PGESTimelineElement; pspec: PGParamSpec): Tgboolean; cdecl; external libges;
function ges_timeline_element_paste(self: PGESTimelineElement; paste_position: TGstClockTime): PGESTimelineElement; cdecl; external libges;
function ges_timeline_element_get_track_types(self: PGESTimelineElement): TGESTrackType; cdecl; external libges;
function ges_timeline_element_get_natural_framerate(self: PGESTimelineElement; framerate_n: Pgint; framerate_d: Pgint): Tgboolean; cdecl; external libges;
function ges_timeline_element_get_layer_priority(self: PGESTimelineElement): Tguint32; cdecl; external libges;
function ges_timeline_element_edit(self: PGESTimelineElement; layers: PGList; new_layer_priority: Tgint64; mode: TGESEditMode; edge: TGESEdge;
  position: Tguint64): Tgboolean; cdecl; external libges;
function ges_timeline_element_edit_full(self: PGESTimelineElement; new_layer_priority: Tgint64; mode: TGESEditMode; edge: TGESEdge; position: Tguint64;
  error: PPGError): Tgboolean; cdecl; external libges;

// === Konventiert am: 28-7-26 13:13:42 ===

function GES_TYPE_TIMELINE_ELEMENT: TGType;
function GES_TIMELINE_ELEMENT(obj: Pointer): PGESTimelineElement;
function GES_IS_TIMELINE_ELEMENT(obj: Pointer): Tgboolean;
function GES_TIMELINE_ELEMENT_CLASS(klass: Pointer): PGESTimelineElementClass;
function GES_IS_TIMELINE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
function GES_TIMELINE_ELEMENT_GET_CLASS(obj: Pointer): PGESTimelineElementClass;
{$ENDIF read_function}

implementation

function GES_TYPE_TIMELINE_ELEMENT: TGType;
begin
  Result := ges_timeline_element_get_type;
end;

function GES_TIMELINE_ELEMENT(obj: Pointer): PGESTimelineElement;
begin
  Result := PGESTimelineElement(g_type_check_instance_cast(obj, GES_TYPE_TIMELINE_ELEMENT));
end;

function GES_IS_TIMELINE_ELEMENT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TIMELINE_ELEMENT);
end;

function GES_TIMELINE_ELEMENT_CLASS(klass: Pointer): PGESTimelineElementClass;
begin
  Result := PGESTimelineElementClass(g_type_check_class_cast(klass, GES_TYPE_TIMELINE_ELEMENT));
end;

function GES_IS_TIMELINE_ELEMENT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TIMELINE_ELEMENT);
end;

function GES_TIMELINE_ELEMENT_GET_CLASS(obj: Pointer): PGESTimelineElementClass;
begin
  Result := PGESTimelineElementClass(PGTypeInstance(obj)^.g_class);
end;

end.
