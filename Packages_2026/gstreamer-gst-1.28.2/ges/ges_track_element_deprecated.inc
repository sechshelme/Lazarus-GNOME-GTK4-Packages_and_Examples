

{$IFDEF read_function}
function ges_track_element_get_gnlobject(obj: PGESTrackElement): PGstElement; cdecl; external libges; deprecated;
function ges_track_element_list_children_properties(obj: PGESTrackElement; n_properties: Pguint): PPGParamSpec; cdecl; external libges; deprecated;
function ges_track_element_lookup_child(obj: PGESTrackElement; prop_name: Pgchar; element: PPGstElement; pspec: PPGParamSpec): Tgboolean; cdecl; external libges; deprecated;
procedure ges_track_element_get_child_property_valist(obj: PGESTrackElement; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libges; deprecated;
procedure ges_track_element_get_child_properties(obj: PGESTrackElement; first_property_name: Pgchar); cdecl; varargs; external libges; deprecated;
procedure ges_track_element_set_child_property_valist(obj: PGESTrackElement; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libges; deprecated;
procedure ges_track_element_set_child_property_by_pspec(obj: PGESTrackElement; pspec: PGParamSpec; value: PGValue); cdecl; external libges; deprecated;
procedure ges_track_element_set_child_properties(obj: PGESTrackElement; first_property_name: Pgchar); cdecl; varargs; external libges; deprecated;
function ges_track_element_set_child_property(obj: PGESTrackElement; property_name: Pgchar; value: PGValue): Tgboolean; cdecl; external libges; deprecated;
function ges_track_element_get_child_property(obj: PGESTrackElement; property_name: Pgchar; value: PGValue): Tgboolean; cdecl; external libges; deprecated;
function ges_track_element_edit(obj: PGESTrackElement; layers: PGList; mode: TGESEditMode; edge: TGESEdge; position: Tguint64): Tgboolean; cdecl; external libges; deprecated;
{$ENDIF read_function}

// === Konventiert am: 28-7-26 13:18:14 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
