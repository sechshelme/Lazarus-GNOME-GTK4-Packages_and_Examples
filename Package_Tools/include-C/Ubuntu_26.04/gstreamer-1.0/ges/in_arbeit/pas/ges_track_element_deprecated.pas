unit ges_track_element_deprecated;

interface

uses
  fp_glib2, fp_gst, ges_enums;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(** unsupported pragma#pragma once*)
{GES_DEPRECATED_FORges_track_element_get_nleobject) }

function ges_track_element_get_gnlobject(object:PGESTrackElement):PGstElement;cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_list_children_properties) }
function ges_track_element_list_children_properties(object:PGESTrackElement; n_properties:Pguint):^PGParamSpec;cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_lookup_child) }
function ges_track_element_lookup_child(object:PGESTrackElement; prop_name:Pgchar; element:PPGstElement; pspec:PPGParamSpec):Tgboolean;cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_get_child_property_valist) }
procedure ges_track_element_get_child_property_valist(object:PGESTrackElement; first_property_name:Pgchar; var_args:Tva_list);cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_get_child_properties) }
procedure ges_track_element_get_child_properties(object:PGESTrackElement; first_property_name:Pgchar; args:array of const);cdecl;external libges;
procedure ges_track_element_get_child_properties(object:PGESTrackElement; first_property_name:Pgchar);cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_set_child_property_valist) }
procedure ges_track_element_set_child_property_valist(object:PGESTrackElement; first_property_name:Pgchar; var_args:Tva_list);cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_set_child_property_by_spec) }
procedure ges_track_element_set_child_property_by_pspec(object:PGESTrackElement; pspec:PGParamSpec; value:PGValue);cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_set_child_properties) }
procedure ges_track_element_set_child_properties(object:PGESTrackElement; first_property_name:Pgchar; args:array of const);cdecl;external libges;
procedure ges_track_element_set_child_properties(object:PGESTrackElement; first_property_name:Pgchar);cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_set_child_property) }
function ges_track_element_set_child_property(object:PGESTrackElement; property_name:Pgchar; value:PGValue):Tgboolean;cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_get_child_property) }
function ges_track_element_get_child_property(object:PGESTrackElement; property_name:Pgchar; value:PGValue):Tgboolean;cdecl;external libges;
{GES_DEPRECATED_FORges_timeline_element_edit) }
function ges_track_element_edit(object:PGESTrackElement; layers:PGList; mode:TGESEditMode; edge:TGESEdge; position:Tguint64):Tgboolean;cdecl;external libges;

// === Konventiert am: 28-7-26 13:18:14 ===


implementation



end.
