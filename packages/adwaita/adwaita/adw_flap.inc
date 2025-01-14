{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwFlap, adw_flap, ADW, FLAP, GtkWidget) }
type
  PAdwFlapFoldPolicy = ^TAdwFlapFoldPolicy;
  TAdwFlapFoldPolicy = longint;

const
  ADW_FLAP_FOLD_POLICY_NEVER = 0;
  ADW_FLAP_FOLD_POLICY_ALWAYS = 1;
  ADW_FLAP_FOLD_POLICY_AUTO = 2;

type
  PAdwFlapTransitionType = ^TAdwFlapTransitionType;
  TAdwFlapTransitionType = longint;

const
  ADW_FLAP_TRANSITION_TYPE_OVER = 0;
  ADW_FLAP_TRANSITION_TYPE_UNDER = 1;
  ADW_FLAP_TRANSITION_TYPE_SLIDE = 2;

type
  TAdwFlap = record
  end;
  PAdwFlap = ^TAdwFlap;

  TAdwFlapClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwFlapClass = ^TAdwFlapClass;

function adw_flap_get_type: TGType; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_new: PGtkWidget; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_content(self: PAdwFlap): PGtkWidget; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_content(self: PAdwFlap; content: PGtkWidget); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_flap(self: PAdwFlap): PGtkWidget; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_flap(self: PAdwFlap; flap: PGtkWidget); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_separator(self: PAdwFlap): PGtkWidget; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_separator(self: PAdwFlap; separator: PGtkWidget); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_flap_position(self: PAdwFlap): TGtkPackType; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_flap_position(self: PAdwFlap; position: TGtkPackType); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_reveal_flap(self: PAdwFlap): Tgboolean; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_reveal_flap(self: PAdwFlap; reveal_flap: Tgboolean); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_reveal_params(self: PAdwFlap): PAdwSpringParams; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_reveal_params(self: PAdwFlap; params: PAdwSpringParams); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_reveal_progress(self: PAdwFlap): Tdouble; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_fold_policy(self: PAdwFlap): TAdwFlapFoldPolicy; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_fold_policy(self: PAdwFlap; policy: TAdwFlapFoldPolicy); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_fold_threshold_policy(self: PAdwFlap): TAdwFoldThresholdPolicy; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_fold_threshold_policy(self: PAdwFlap; policy: TAdwFoldThresholdPolicy); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_fold_duration(self: PAdwFlap): Tguint; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_fold_duration(self: PAdwFlap; duration: Tguint); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_folded(self: PAdwFlap): Tgboolean; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_locked(self: PAdwFlap): Tgboolean; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_locked(self: PAdwFlap; locked: Tgboolean); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_transition_type(self: PAdwFlap): TAdwFlapTransitionType; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_transition_type(self: PAdwFlap; transition_type: TAdwFlapTransitionType); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_modal(self: PAdwFlap): Tgboolean; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_modal(self: PAdwFlap; modal: Tgboolean); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_swipe_to_open(self: PAdwFlap): Tgboolean; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_swipe_to_open(self: PAdwFlap; swipe_to_open: Tgboolean); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
function adw_flap_get_swipe_to_close(self: PAdwFlap): Tgboolean; cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4
procedure adw_flap_set_swipe_to_close(self: PAdwFlap; swipe_to_close: Tgboolean); cdecl; external libadwaita; deprecated; // ADW_DEPRECATED_IN_1_4

// === Konventiert am: 9-1-25 19:34:26 ===

function ADW_TYPE_FLAP: TGType; deprecated; // ADW_DEPRECATED_IN_1_4
function ADW_FLAP(obj: Pointer): PAdwFlap; deprecated; // ADW_DEPRECATED_IN_1_4
function ADW_IS_FLAP(obj: Pointer): Tgboolean; deprecated; // ADW_DEPRECATED_IN_1_4

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_FLAP: TGType;
begin
  Result := adw_flap_get_type;
end;

function ADW_FLAP(obj: Pointer): PAdwFlap;
begin
  Result := PAdwFlap(g_type_check_instance_cast(obj, ADW_TYPE_FLAP));
end;

function ADW_IS_FLAP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_FLAP);
end;


{$ENDIF read_implementation}
