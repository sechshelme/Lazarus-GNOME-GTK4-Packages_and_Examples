{$IFDEF read_interface}


type
  PAdapColorScheme = ^TAdapColorScheme;
  TAdapColorScheme = longint;

const
  ADAP_COLOR_SCHEME_DEFAULT = 0;
  ADAP_COLOR_SCHEME_FORCE_LIGHT = 1;
  ADAP_COLOR_SCHEME_PREFER_LIGHT = 2;
  ADAP_COLOR_SCHEME_PREFER_DARK = 3;
  ADAP_COLOR_SCHEME_FORCE_DARK = 4;

type
  TAdapStyleManager = record
  end;
  PAdapStyleManager = ^TAdapStyleManager;

  TAdapStyleManagerClass = record
    parent_class: TGObjectClass;
  end;
  PAdapStyleManagerClass = ^TAdapStyleManagerClass;

function adap_style_manager_get_type: TGType; cdecl; external libadapta;
function adap_style_manager_get_default: PAdapStyleManager; cdecl; external libadapta;
function adap_style_manager_get_for_display(display: PGdkDisplay): PAdapStyleManager; cdecl; external libadapta;
function adap_style_manager_get_display(self: PAdapStyleManager): PGdkDisplay; cdecl; external libadapta;
function adap_style_manager_get_color_scheme(self: PAdapStyleManager): TAdapColorScheme; cdecl; external libadapta;
procedure adap_style_manager_set_color_scheme(self: PAdapStyleManager; color_scheme: TAdapColorScheme); cdecl; external libadapta;
function adap_style_manager_get_system_supports_color_schemes(self: PAdapStyleManager): Tgboolean; cdecl; external libadapta;
function adap_style_manager_get_dark(self: PAdapStyleManager): Tgboolean; cdecl; external libadapta;
function adap_style_manager_get_high_contrast(self: PAdapStyleManager): Tgboolean; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:18:51 ===

function ADAP_TYPE_STYLE_MANAGER: TGType;
function ADAP_STYLE_MANAGER(obj: Pointer): PAdapStyleManager;
function ADAP_IS_STYLE_MANAGER(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADAP_TYPE_STYLE_MANAGER: TGType;
begin
  Result := adap_style_manager_get_type;
end;

function ADAP_STYLE_MANAGER(obj: Pointer): PAdapStyleManager;
begin
  Result := PAdapStyleManager(g_type_check_instance_cast(obj, ADAP_TYPE_STYLE_MANAGER));
end;

function ADAP_IS_STYLE_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADAP_TYPE_STYLE_MANAGER);
end;


{$ENDIF read_implementation}
