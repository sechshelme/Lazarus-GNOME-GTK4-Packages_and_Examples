{$IFDEF read_interface}



type
  TAdapSqueezerPage = record
  end;
  PAdapSqueezerPage = ^TAdapSqueezerPage;

  TAdapSqueezerPageClass = record
    parent_class: TGObjectClass;
  end;
  PAdapSqueezerPageClass = ^TAdapSqueezerPageClass;

function adap_squeezer_page_get_type: TGType; cdecl; external libadapta; deprecated;
function adap_squeezer_page_get_child(self: PAdapSqueezerPage): PGtkWidget; cdecl; external libadapta; deprecated;
function adap_squeezer_page_get_enabled(self: PAdapSqueezerPage): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_squeezer_page_set_enabled(self: PAdapSqueezerPage; enabled: Tgboolean); cdecl; external libadapta; deprecated;

type
  PAdapSqueezerTransitionType = ^TAdapSqueezerTransitionType;
  TAdapSqueezerTransitionType = longint;

const
  ADAP_SQUEEZER_TRANSITION_TYPE_NONE = 0;
  ADAP_SQUEEZER_TRANSITION_TYPE_CROSSFADE = 1;

type
  TAdapSqueezer = record
  end;
  PAdapSqueezer = ^TAdapSqueezer;

  TAdapSqueezerClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapSqueezerClass = ^TAdapSqueezerClass;

function adap_squeezer_get_type: TGType; cdecl; external libadapta; deprecated;
function adap_squeezer_new: PGtkWidget; cdecl; external libadapta; deprecated;
function adap_squeezer_add(self: PAdapSqueezer; child: PGtkWidget): PAdapSqueezerPage; cdecl; external libadapta; deprecated;
procedure adap_squeezer_remove(self: PAdapSqueezer; child: PGtkWidget); cdecl; external libadapta; deprecated;
function adap_squeezer_get_page(self: PAdapSqueezer; child: PGtkWidget): PAdapSqueezerPage; cdecl; external libadapta; deprecated;
function adap_squeezer_get_visible_child(self: PAdapSqueezer): PGtkWidget; cdecl; external libadapta; deprecated;
function adap_squeezer_get_homogeneous(self: PAdapSqueezer): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_squeezer_set_homogeneous(self: PAdapSqueezer; homogeneous: Tgboolean); cdecl; external libadapta; deprecated;
function adap_squeezer_get_switch_threshold_policy(self: PAdapSqueezer): TAdapFoldThresholdPolicy; cdecl; external libadapta; deprecated;
procedure adap_squeezer_set_switch_threshold_policy(self: PAdapSqueezer; policy: TAdapFoldThresholdPolicy); cdecl; external libadapta; deprecated;
function adap_squeezer_get_allow_none(self: PAdapSqueezer): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_squeezer_set_allow_none(self: PAdapSqueezer; allow_none: Tgboolean); cdecl; external libadapta; deprecated;
function adap_squeezer_get_transition_duration(self: PAdapSqueezer): Tguint; cdecl; external libadapta; deprecated;
procedure adap_squeezer_set_transition_duration(self: PAdapSqueezer; duration: Tguint); cdecl; external libadapta; deprecated;
function adap_squeezer_get_transition_type(self: PAdapSqueezer): TAdapSqueezerTransitionType; cdecl; external libadapta; deprecated;
procedure adap_squeezer_set_transition_type(self: PAdapSqueezer; transition: TAdapSqueezerTransitionType); cdecl; external libadapta; deprecated;
function adap_squeezer_get_transition_running(self: PAdapSqueezer): Tgboolean; cdecl; external libadapta; deprecated;
function adap_squeezer_get_interpolate_size(self: PAdapSqueezer): Tgboolean; cdecl; external libadapta; deprecated;
procedure adap_squeezer_set_interpolate_size(self: PAdapSqueezer; interpolate_size: Tgboolean); cdecl; external libadapta; deprecated;
function adap_squeezer_get_xalign(self: PAdapSqueezer): single; cdecl; external libadapta; deprecated;
procedure adap_squeezer_set_xalign(self: PAdapSqueezer; xalign: single); cdecl; external libadapta; deprecated;
function adap_squeezer_get_yalign(self: PAdapSqueezer): single; cdecl; external libadapta; deprecated;
procedure adap_squeezer_set_yalign(self: PAdapSqueezer; yalign: single); cdecl; external libadapta; deprecated;
function adap_squeezer_get_pages(self: PAdapSqueezer): PGtkSelectionModel; cdecl; external libadapta; deprecated;

// === Konventiert am: 4-12-25 17:18:47 ===

function ADAP_TYPE_SQUEEZER_PAGE: TGType;
function ADAP_SQUEEZER_PAGE(obj: Pointer): PAdapSqueezerPage;
function ADAP_IS_SQUEEZER_PAGE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_SQUEEZER_PAGE: TGType;
begin
  Result := adap_squeezer_page_get_type;
end;

function ADAP_SQUEEZER_PAGE(obj: Pointer): PAdapSqueezerPage;
begin
  Result := PAdapSqueezerPage(g_type_check_instance_cast(obj, ADAP_TYPE_SQUEEZER_PAGE));
end;

function ADAP_IS_SQUEEZER_PAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SQUEEZER_PAGE);
end;

// ====

function ADAP_TYPE_SQUEEZER: TGType;
begin
  Result := adap_squeezer_get_type;
end;

function ADAP_SQUEEZER(obj: Pointer): PAdapSqueezer;
begin
  Result := PAdapSqueezer(g_type_check_instance_cast(obj, ADAP_TYPE_SQUEEZER));
end;

function ADAP_IS_SQUEEZER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_SQUEEZER);
end;

{$ENDIF read_implementation}
