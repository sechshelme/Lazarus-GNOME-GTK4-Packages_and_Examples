{$IFDEF read_interface}


type
  TShumateCompass = record
  end;
  PShumateCompass = ^TShumateCompass;

  TShumateCompassClass = record
    parent_class: TGtkWidgetClass;
  end;
  PShumateCompassClass = ^TShumateCompassClass;

function shumate_compass_get_type: TGType; cdecl; external libshumate;
function shumate_compass_new(viewport: PShumateViewport): PShumateCompass; cdecl; external libshumate;
function shumate_compass_get_viewport(compass: PShumateCompass): PShumateViewport; cdecl; external libshumate;
procedure shumate_compass_set_viewport(compass: PShumateCompass; viewport: PShumateViewport); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:50:11 ===

function SHUMATE_TYPE_COMPASS: TGType;
function SHUMATE_COMPASS(obj: Pointer): PShumateCompass;
function SHUMATE_IS_COMPASS(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_COMPASS: TGType;
begin
  Result := shumate_compass_get_type;
end;

function SHUMATE_COMPASS(obj: Pointer): PShumateCompass;
begin
  Result := PShumateCompass(g_type_check_instance_cast(obj, SHUMATE_TYPE_COMPASS));
end;

function SHUMATE_IS_COMPASS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_COMPASS);
end;


{$ENDIF read_implementation}
