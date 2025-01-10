{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwSqueezerPage, adw_squeezer_page, ADW, SQUEEZER_PAGE, GObject) }
type
  TAdwSqueezerPage = record
  end;
  PAdwSqueezerPage = ^TAdwSqueezerPage;

  TAdwSqueezerPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdwSqueezerPageClass = ^TAdwSqueezerPageClass;

function adw_squeezer_page_get_type: TGType; cdecl; external libadwaita;
function adw_squeezer_page_get_child(self: PAdwSqueezerPage): PGtkWidget; cdecl; external libadwaita;
function adw_squeezer_page_get_enabled(self: PAdwSqueezerPage): Tgboolean; cdecl; external libadwaita;
procedure adw_squeezer_page_set_enabled(self: PAdwSqueezerPage; Enabled: Tgboolean); cdecl; external libadwaita;

{G_DECLARE_FINAL_TYPE (AdwSqueezer, adw_squeezer, ADW, SQUEEZER, GtkWidget) }
type
  PAdwSqueezerTransitionType = ^TAdwSqueezerTransitionType;
  TAdwSqueezerTransitionType = longint;

const
  ADW_SQUEEZER_TRANSITION_TYPE_NONE = 0;
  ADW_SQUEEZER_TRANSITION_TYPE_CROSSFADE = 1;

type
  TAdwSqueezer = record
  end;
  PAdwSqueezer = ^TAdwSqueezer;

  TAdwSqueezerClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwSqueezerClass = ^TAdwSqueezerClass;

function adw_squeezer_get_type: TGType; cdecl; external libadwaita;
function adw_squeezer_new: PGtkWidget; cdecl; external libadwaita;
function adw_squeezer_add(self: PAdwSqueezer; child: PGtkWidget): PAdwSqueezerPage; cdecl; external libadwaita;
procedure adw_squeezer_remove(self: PAdwSqueezer; child: PGtkWidget); cdecl; external libadwaita;
function adw_squeezer_get_page(self: PAdwSqueezer; child: PGtkWidget): PAdwSqueezerPage; cdecl; external libadwaita;
function adw_squeezer_get_visible_child(self: PAdwSqueezer): PGtkWidget; cdecl; external libadwaita;
function adw_squeezer_get_homogeneous(self: PAdwSqueezer): Tgboolean; cdecl; external libadwaita;
procedure adw_squeezer_set_homogeneous(self: PAdwSqueezer; homogeneous: Tgboolean); cdecl; external libadwaita;
function adw_squeezer_get_switch_threshold_policy(self: PAdwSqueezer): TAdwFoldThresholdPolicy; cdecl; external libadwaita;
procedure adw_squeezer_set_switch_threshold_policy(self: PAdwSqueezer; policy: TAdwFoldThresholdPolicy); cdecl; external libadwaita;
function adw_squeezer_get_allow_none(self: PAdwSqueezer): Tgboolean; cdecl; external libadwaita;
procedure adw_squeezer_set_allow_none(self: PAdwSqueezer; allow_none: Tgboolean); cdecl; external libadwaita;
function adw_squeezer_get_transition_duration(self: PAdwSqueezer): Tguint; cdecl; external libadwaita;
procedure adw_squeezer_set_transition_duration(self: PAdwSqueezer; duration: Tguint); cdecl; external libadwaita;
function adw_squeezer_get_transition_type(self: PAdwSqueezer): TAdwSqueezerTransitionType; cdecl; external libadwaita;
procedure adw_squeezer_set_transition_type(self: PAdwSqueezer; transition: TAdwSqueezerTransitionType); cdecl; external libadwaita;
function adw_squeezer_get_transition_running(self: PAdwSqueezer): Tgboolean; cdecl; external libadwaita;
function adw_squeezer_get_interpolate_size(self: PAdwSqueezer): Tgboolean; cdecl; external libadwaita;
procedure adw_squeezer_set_interpolate_size(self: PAdwSqueezer; interpolate_size: Tgboolean); cdecl; external libadwaita;
function adw_squeezer_get_xalign(self: PAdwSqueezer): single; cdecl; external libadwaita;
procedure adw_squeezer_set_xalign(self: PAdwSqueezer; xalign: single); cdecl; external libadwaita;
function adw_squeezer_get_yalign(self: PAdwSqueezer): single; cdecl; external libadwaita;
procedure adw_squeezer_set_yalign(self: PAdwSqueezer; yalign: single); cdecl; external libadwaita;
function adw_squeezer_get_pages(self: PAdwSqueezer): PGtkSelectionModel; cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:34:32 ===

function ADW_TYPE_SQUEEZER_PAGE: TGType;
function ADW_SQUEEZER_PAGE(obj: Pointer): PAdwSqueezerPage;
function ADW_IS_SQUEEZER_PAGE(obj: Pointer): Tgboolean;

function ADW_TYPE_SQUEEZER: TGType;
function ADW_SQUEEZER(obj: Pointer): PAdwSqueezer;
function ADW_IS_SQUEEZER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_SQUEEZER_PAGE: TGType;
begin
  Result := adw_squeezer_page_get_type;
end;

function ADW_SQUEEZER_PAGE(obj: Pointer): PAdwSqueezerPage;
begin
  Result := PAdwSqueezerPage(g_type_check_instance_cast(obj, ADW_TYPE_SQUEEZER_PAGE));
end;

function ADW_IS_SQUEEZER_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_SQUEEZER_PAGE);
end;

// ====

function ADW_TYPE_SQUEEZER: TGType;
begin
  Result := adw_squeezer_get_type;
end;

function ADW_SQUEEZER(obj: Pointer): PAdwSqueezer;
begin
  Result := PAdwSqueezer(g_type_check_instance_cast(obj, ADW_TYPE_SQUEEZER));
end;

function ADW_IS_SQUEEZER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_SQUEEZER);
end;


{$ENDIF read_implementation}
