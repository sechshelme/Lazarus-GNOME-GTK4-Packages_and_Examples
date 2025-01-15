{$IFDEF read_interface}

// === All GES_DEPRECATED !!!

function ges_track_element_get_gnlobj(obj: PGESTrackElement): PGstElement; cdecl; external libges; deprecated 'GES_DEPRECATED';
function ges_track_element_list_children_properties(obj: PGESTrackElement; n_properties: Pguint): PPGParamSpec; cdecl; external libges; deprecated 'GES_DEPRECATED';
function ges_track_element_lookup_child(obj: PGESTrackElement; prop_name: Pgchar; element: PPGstElement; pspec: PPGParamSpec): Tgboolean; cdecl; external libges; deprecated 'GES_DEPRECATED';
procedure ges_track_element_get_child_property_valist(obj: PGESTrackElement; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libges; deprecated 'GES_DEPRECATED';
procedure ges_track_element_get_child_properties(obj: PGESTrackElement; first_property_name: Pgchar); varargs; cdecl; external libges; deprecated 'GES_DEPRECATED';
procedure ges_track_element_set_child_property_valist(obj: PGESTrackElement; first_property_name: Pgchar; var_args: Tva_list); cdecl; external libges; deprecated 'GES_DEPRECATED';
procedure ges_track_element_set_child_property_by_pspec(obj: PGESTrackElement; pspec: PGParamSpec; Value: PGValue); cdecl; external libges; deprecated 'GES_DEPRECATED';
procedure ges_track_element_set_child_properties(obj: PGESTrackElement; first_property_name: Pgchar); varargs; cdecl; external libges; deprecated 'GES_DEPRECATED';
function ges_track_element_set_child_property(obj: PGESTrackElement; property_name: Pgchar; Value: PGValue): Tgboolean; cdecl; external libges; deprecated 'GES_DEPRECATED';
function ges_track_element_get_child_property(obj: PGESTrackElement; property_name: Pgchar; Value: PGValue): Tgboolean; cdecl; external libges; deprecated 'GES_DEPRECATED';
function ges_track_element_edit(obj: PGESTrackElement; layers: PGList; mode: TGESEditMode; edge: TGESEdge; position: Tguint64): Tgboolean; cdecl; external libges; deprecated 'GES_DEPRECATED';

// === Konventiert am: 12-12-24 17:15:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
