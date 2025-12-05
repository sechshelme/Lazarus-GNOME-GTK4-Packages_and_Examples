{$IFDEF read_interface}


type
  PAdapCenteringPolicy = ^TAdapCenteringPolicy;
  TAdapCenteringPolicy = longint;

const
  ADAP_CENTERING_POLICY_LOOSE = 0;
  ADAP_CENTERING_POLICY_STRICT = 1;

type
  TAdapHeaderBar = record
  end;
  PAdapHeaderBar = ^TAdapHeaderBar;

  TAdapHeaderBarClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdapHeaderBarClass = ^TAdapHeaderBarClass;

function adap_header_bar_get_type: TGType; cdecl; external libadapta;
function adap_header_bar_new: PGtkWidget; cdecl; external libadapta;
procedure adap_header_bar_pack_start(self: PAdapHeaderBar; child: PGtkWidget); cdecl; external libadapta;
procedure adap_header_bar_pack_end(self: PAdapHeaderBar; child: PGtkWidget); cdecl; external libadapta;
procedure adap_header_bar_remove(self: PAdapHeaderBar; child: PGtkWidget); cdecl; external libadapta;
function adap_header_bar_get_title_widget(self: PAdapHeaderBar): PGtkWidget; cdecl; external libadapta;
procedure adap_header_bar_set_title_widget(self: PAdapHeaderBar; title_widget: PGtkWidget); cdecl; external libadapta;
function adap_header_bar_get_show_start_title_buttons(self: PAdapHeaderBar): Tgboolean; cdecl; external libadapta;
procedure adap_header_bar_set_show_start_title_buttons(self: PAdapHeaderBar; setting: Tgboolean); cdecl; external libadapta;
function adap_header_bar_get_show_end_title_buttons(self: PAdapHeaderBar): Tgboolean; cdecl; external libadapta;
procedure adap_header_bar_set_show_end_title_buttons(self: PAdapHeaderBar; setting: Tgboolean); cdecl; external libadapta;
function adap_header_bar_get_show_back_button(self: PAdapHeaderBar): Tgboolean; cdecl; external libadapta;
procedure adap_header_bar_set_show_back_button(self: PAdapHeaderBar; show_back_button: Tgboolean); cdecl; external libadapta;
function adap_header_bar_get_decoration_layout(self: PAdapHeaderBar): pchar; cdecl; external libadapta;
procedure adap_header_bar_set_decoration_layout(self: PAdapHeaderBar; layout: pchar); cdecl; external libadapta;
function adap_header_bar_get_centering_policy(self: PAdapHeaderBar): TAdapCenteringPolicy; cdecl; external libadapta;
procedure adap_header_bar_set_centering_policy(self: PAdapHeaderBar; centering_policy: TAdapCenteringPolicy); cdecl; external libadapta;
function adap_header_bar_get_show_title(self: PAdapHeaderBar): Tgboolean; cdecl; external libadapta;
procedure adap_header_bar_set_show_title(self: PAdapHeaderBar; show_title: Tgboolean); cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:08:48 ===

function ADAP_TYPE_HEADER_BAR: TGType;
function ADAP_HEADER_BAR(obj: Pointer): PAdapHeaderBar;
function ADAP_IS_HEADER_BAR(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_HEADER_BAR: TGType;
begin
  Result := adap_header_bar_get_type;
end;

function ADAP_HEADER_BAR(obj: Pointer): PAdapHeaderBar;
begin
  Result := PAdapHeaderBar(g_type_check_instance_cast(obj, ADAP_TYPE_HEADER_BAR));
end;

function ADAP_IS_HEADER_BAR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_HEADER_BAR);
end;


{$ENDIF read_implementation}
