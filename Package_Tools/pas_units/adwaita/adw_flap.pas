unit adw_flap;

interface

uses
  fp_glib2, fp_GTK4, adw_spring_params, adw_fold_threshold_policy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

function adw_flap_get_type: TGType; cdecl; external libadwaita;
function adw_flap_new: PGtkWidget; cdecl; external libadwaita;
function adw_flap_get_content(self: PAdwFlap): PGtkWidget; cdecl; external libadwaita;
procedure adw_flap_set_content(self: PAdwFlap; content: PGtkWidget); cdecl; external libadwaita;
function adw_flap_get_flap(self: PAdwFlap): PGtkWidget; cdecl; external libadwaita;
procedure adw_flap_set_flap(self: PAdwFlap; flap: PGtkWidget); cdecl; external libadwaita;
function adw_flap_get_separator(self: PAdwFlap): PGtkWidget; cdecl; external libadwaita;
procedure adw_flap_set_separator(self: PAdwFlap; separator: PGtkWidget); cdecl; external libadwaita;
function adw_flap_get_flap_position(self: PAdwFlap): TGtkPackType; cdecl; external libadwaita;
procedure adw_flap_set_flap_position(self: PAdwFlap; position: TGtkPackType); cdecl; external libadwaita;
function adw_flap_get_reveal_flap(self: PAdwFlap): Tgboolean; cdecl; external libadwaita;
procedure adw_flap_set_reveal_flap(self: PAdwFlap; reveal_flap: Tgboolean); cdecl; external libadwaita;
function adw_flap_get_reveal_params(self: PAdwFlap): PAdwSpringParams; cdecl; external libadwaita;
procedure adw_flap_set_reveal_params(self: PAdwFlap; params: PAdwSpringParams); cdecl; external libadwaita;
function adw_flap_get_reveal_progress(self: PAdwFlap): Tdouble; cdecl; external libadwaita;
function adw_flap_get_fold_policy(self: PAdwFlap): TAdwFlapFoldPolicy; cdecl; external libadwaita;
procedure adw_flap_set_fold_policy(self: PAdwFlap; policy: TAdwFlapFoldPolicy); cdecl; external libadwaita;
function adw_flap_get_fold_threshold_policy(self: PAdwFlap): TAdwFoldThresholdPolicy; cdecl; external libadwaita;
procedure adw_flap_set_fold_threshold_policy(self: PAdwFlap; policy: TAdwFoldThresholdPolicy); cdecl; external libadwaita;
function adw_flap_get_fold_duration(self: PAdwFlap): Tguint; cdecl; external libadwaita;
procedure adw_flap_set_fold_duration(self: PAdwFlap; duration: Tguint); cdecl; external libadwaita;
function adw_flap_get_folded(self: PAdwFlap): Tgboolean; cdecl; external libadwaita;
function adw_flap_get_locked(self: PAdwFlap): Tgboolean; cdecl; external libadwaita;
procedure adw_flap_set_locked(self: PAdwFlap; locked: Tgboolean); cdecl; external libadwaita;
function adw_flap_get_transition_type(self: PAdwFlap): TAdwFlapTransitionType; cdecl; external libadwaita;
procedure adw_flap_set_transition_type(self: PAdwFlap; transition_type: TAdwFlapTransitionType); cdecl; external libadwaita;
function adw_flap_get_modal(self: PAdwFlap): Tgboolean; cdecl; external libadwaita;
procedure adw_flap_set_modal(self: PAdwFlap; modal: Tgboolean); cdecl; external libadwaita;
function adw_flap_get_swipe_to_open(self: PAdwFlap): Tgboolean; cdecl; external libadwaita;
procedure adw_flap_set_swipe_to_open(self: PAdwFlap; swipe_to_open: Tgboolean); cdecl; external libadwaita;
function adw_flap_get_swipe_to_close(self: PAdwFlap): Tgboolean; cdecl; external libadwaita;
procedure adw_flap_set_swipe_to_close(self: PAdwFlap; swipe_to_close: Tgboolean); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:34:26 ===

function ADW_TYPE_FLAP: TGType;
function ADW_FLAP(obj: Pointer): PAdwFlap;
function ADW_IS_FLAP(obj: Pointer): Tgboolean;

implementation

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


end.
