{$IFDEF read_interface}



function adap_response_appearance_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_RESPONSE_APPEARANCE: TGType;

function adap_animation_state_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_ANIMATION_STATE: TGType;

function adap_breakpoint_condition_length_type_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_BREAKPOINT_CONDITION_LENGTH_TYPE: TGType;

function adap_breakpoint_condition_ratio_type_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_BREAKPOINT_CONDITION_RATIO_TYPE: TGType;

function adap_dialog_presentation_mode_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_DIALOG_PRESENTATION_MODE: TGType;

function adap_easing_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_EASING: TGType;

function adap_flap_fold_policy_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_FLAP_FOLD_POLICY: TGType;

function adap_flap_transition_type_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_FLAP_TRANSITION_TYPE: TGType;

function adap_fold_threshold_policy_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_FOLD_THRESHOLD_POLICY: TGType;

function adap_centering_policy_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_CENTERING_POLICY: TGType;

function adap_leaflet_transition_type_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_LEAFLET_TRANSITION_TYPE: TGType;

function adap_length_unit_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_LENGTH_UNIT: TGType;

function adap_navigation_direction_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_NAVIGATION_DIRECTION: TGType;

function adap_squeezer_transition_type_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_SQUEEZER_TRANSITION_TYPE: TGType;

function adap_color_scheme_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_COLOR_SCHEME: TGType;

function adap_tab_view_shortcuts_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_TAB_VIEW_SHORTCUTS: TGType;

function adap_toast_priority_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_TOAST_PRIORITY: TGType;

function adap_toolbar_style_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_TOOLBAR_STYLE: TGType;

function adap_view_switcher_policy_get_type: TGType; cdecl; external libadapta;
function ADAP_TYPE_VIEW_SWITCHER_POLICY: TGType;


// === Konventiert am: 4-12-25 17:09:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_RESPONSE_APPEARANCE: TGType;
begin
  ADAP_TYPE_RESPONSE_APPEARANCE := adap_response_appearance_get_type;
end;

function ADAP_TYPE_ANIMATION_STATE: TGType;
begin
  ADAP_TYPE_ANIMATION_STATE := adap_animation_state_get_type;
end;

function ADAP_TYPE_BREAKPOINT_CONDITION_LENGTH_TYPE: TGType;
begin
  ADAP_TYPE_BREAKPOINT_CONDITION_LENGTH_TYPE := adap_breakpoint_condition_length_type_get_type;
end;

function ADAP_TYPE_BREAKPOINT_CONDITION_RATIO_TYPE: TGType;
begin
  ADAP_TYPE_BREAKPOINT_CONDITION_RATIO_TYPE := adap_breakpoint_condition_ratio_type_get_type;
end;

function ADAP_TYPE_DIALOG_PRESENTATION_MODE: TGType;
begin
  ADAP_TYPE_DIALOG_PRESENTATION_MODE := adap_dialog_presentation_mode_get_type;
end;

function ADAP_TYPE_EASING: TGType;
begin
  ADAP_TYPE_EASING := adap_easing_get_type;
end;

function ADAP_TYPE_FLAP_FOLD_POLICY: TGType;
begin
  ADAP_TYPE_FLAP_FOLD_POLICY := adap_flap_fold_policy_get_type;
end;

function ADAP_TYPE_FLAP_TRANSITION_TYPE: TGType;
begin
  ADAP_TYPE_FLAP_TRANSITION_TYPE := adap_flap_transition_type_get_type;
end;

function ADAP_TYPE_FOLD_THRESHOLD_POLICY: TGType;
begin
  ADAP_TYPE_FOLD_THRESHOLD_POLICY := adap_fold_threshold_policy_get_type;
end;

function ADAP_TYPE_CENTERING_POLICY: TGType;
begin
  ADAP_TYPE_CENTERING_POLICY := adap_centering_policy_get_type;
end;

function ADAP_TYPE_LEAFLET_TRANSITION_TYPE: TGType;
begin
  ADAP_TYPE_LEAFLET_TRANSITION_TYPE := adap_leaflet_transition_type_get_type;
end;

function ADAP_TYPE_LENGTH_UNIT: TGType;
begin
  ADAP_TYPE_LENGTH_UNIT := adap_length_unit_get_type;
end;

function ADAP_TYPE_NAVIGATION_DIRECTION: TGType;
begin
  ADAP_TYPE_NAVIGATION_DIRECTION := adap_navigation_direction_get_type;
end;

function ADAP_TYPE_SQUEEZER_TRANSITION_TYPE: TGType;
begin
  ADAP_TYPE_SQUEEZER_TRANSITION_TYPE := adap_squeezer_transition_type_get_type;
end;

function ADAP_TYPE_COLOR_SCHEME: TGType;
begin
  ADAP_TYPE_COLOR_SCHEME := adap_color_scheme_get_type;
end;

function ADAP_TYPE_TAB_VIEW_SHORTCUTS: TGType;
begin
  ADAP_TYPE_TAB_VIEW_SHORTCUTS := adap_tab_view_shortcuts_get_type;
end;

function ADAP_TYPE_TOAST_PRIORITY: TGType;
begin
  ADAP_TYPE_TOAST_PRIORITY := adap_toast_priority_get_type;
end;

function ADAP_TYPE_TOOLBAR_STYLE: TGType;
begin
  ADAP_TYPE_TOOLBAR_STYLE := adap_toolbar_style_get_type;
end;

function ADAP_TYPE_VIEW_SWITCHER_POLICY: TGType;
begin
  ADAP_TYPE_VIEW_SWITCHER_POLICY := adap_view_switcher_policy_get_type;
end;


{$ENDIF read_implementation}
