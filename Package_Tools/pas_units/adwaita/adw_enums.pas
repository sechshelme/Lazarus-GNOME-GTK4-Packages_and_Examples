unit adw_enums;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function adw_response_appearance_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_RESPONSE_APPEARANCE: TGType;

function adw_animation_state_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_ANIMATION_STATE: TGType;

function adw_breakpoint_condition_length_type_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_BREAKPOINT_CONDITION_LENGTH_TYPE: TGType;

function adw_breakpoint_condition_ratio_type_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_BREAKPOINT_CONDITION_RATIO_TYPE: TGType;

function adw_dialog_presentation_mode_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_DIALOG_PRESENTATION_MODE: TGType;

function adw_easing_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_EASING: TGType;

function adw_flap_fold_policy_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_FLAP_FOLD_POLICY: TGType;

function adw_flap_transition_type_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_FLAP_TRANSITION_TYPE: TGType;

function adw_fold_threshold_policy_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_FOLD_THRESHOLD_POLICY: TGType;

function adw_centering_policy_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_CENTERING_POLICY: TGType;

function adw_leaflet_transition_type_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_LEAFLET_TRANSITION_TYPE: TGType;

function adw_length_unit_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_LENGTH_UNIT: TGType;

function adw_navigation_direction_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_NAVIGATION_DIRECTION: TGType;

function adw_squeezer_transition_type_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_SQUEEZER_TRANSITION_TYPE: TGType;

function adw_color_scheme_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_COLOR_SCHEME: TGType;

function adw_tab_view_shortcuts_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_TAB_VIEW_SHORTCUTS: TGType;

function adw_toast_priority_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_TOAST_PRIORITY: TGType;

function adw_toolbar_style_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_TOOLBAR_STYLE: TGType;

function adw_view_switcher_policy_get_type: TGType; cdecl; external libadwaita;
function ADW_TYPE_VIEW_SWITCHER_POLICY: TGType;

// === Konventiert am: 9-1-25 19:46:25 ===


implementation


function ADW_TYPE_RESPONSE_APPEARANCE: TGType;
begin
  ADW_TYPE_RESPONSE_APPEARANCE := adw_response_appearance_get_type;
end;

function ADW_TYPE_ANIMATION_STATE: TGType;
begin
  ADW_TYPE_ANIMATION_STATE := adw_animation_state_get_type;
end;

function ADW_TYPE_BREAKPOINT_CONDITION_LENGTH_TYPE: TGType;
begin
  ADW_TYPE_BREAKPOINT_CONDITION_LENGTH_TYPE := adw_breakpoint_condition_length_type_get_type;
end;

function ADW_TYPE_BREAKPOINT_CONDITION_RATIO_TYPE: TGType;
begin
  ADW_TYPE_BREAKPOINT_CONDITION_RATIO_TYPE := adw_breakpoint_condition_ratio_type_get_type;
end;

function ADW_TYPE_DIALOG_PRESENTATION_MODE: TGType;
begin
  ADW_TYPE_DIALOG_PRESENTATION_MODE := adw_dialog_presentation_mode_get_type;
end;

function ADW_TYPE_EASING: TGType;
begin
  ADW_TYPE_EASING := adw_easing_get_type;
end;

function ADW_TYPE_FLAP_FOLD_POLICY: TGType;
begin
  ADW_TYPE_FLAP_FOLD_POLICY := adw_flap_fold_policy_get_type;
end;

function ADW_TYPE_FLAP_TRANSITION_TYPE: TGType;
begin
  ADW_TYPE_FLAP_TRANSITION_TYPE := adw_flap_transition_type_get_type;
end;

function ADW_TYPE_FOLD_THRESHOLD_POLICY: TGType;
begin
  ADW_TYPE_FOLD_THRESHOLD_POLICY := adw_fold_threshold_policy_get_type;
end;

function ADW_TYPE_CENTERING_POLICY: TGType;
begin
  ADW_TYPE_CENTERING_POLICY := adw_centering_policy_get_type;
end;

function ADW_TYPE_LEAFLET_TRANSITION_TYPE: TGType;
begin
  ADW_TYPE_LEAFLET_TRANSITION_TYPE := adw_leaflet_transition_type_get_type;
end;

function ADW_TYPE_LENGTH_UNIT: TGType;
begin
  ADW_TYPE_LENGTH_UNIT := adw_length_unit_get_type;
end;

function ADW_TYPE_NAVIGATION_DIRECTION: TGType;
begin
  ADW_TYPE_NAVIGATION_DIRECTION := adw_navigation_direction_get_type;
end;

function ADW_TYPE_SQUEEZER_TRANSITION_TYPE: TGType;
begin
  ADW_TYPE_SQUEEZER_TRANSITION_TYPE := adw_squeezer_transition_type_get_type;
end;

function ADW_TYPE_COLOR_SCHEME: TGType;
begin
  ADW_TYPE_COLOR_SCHEME := adw_color_scheme_get_type;
end;

function ADW_TYPE_TAB_VIEW_SHORTCUTS: TGType;
begin
  ADW_TYPE_TAB_VIEW_SHORTCUTS := adw_tab_view_shortcuts_get_type;
end;

function ADW_TYPE_TOAST_PRIORITY: TGType;
begin
  ADW_TYPE_TOAST_PRIORITY := adw_toast_priority_get_type;
end;

function ADW_TYPE_TOOLBAR_STYLE: TGType;
begin
  ADW_TYPE_TOOLBAR_STYLE := adw_toolbar_style_get_type;
end;

function ADW_TYPE_VIEW_SWITCHER_POLICY: TGType;
begin
  ADW_TYPE_VIEW_SWITCHER_POLICY := adw_view_switcher_policy_get_type;
end;


end.
