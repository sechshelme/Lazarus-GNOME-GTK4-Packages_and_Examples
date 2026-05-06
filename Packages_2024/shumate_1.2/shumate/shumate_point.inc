{$IFDEF read_interface}


type
  TShumatePoint = record
  end;
  PShumatePoint = ^TShumatePoint;

  TShumatePointClass = record
    parent_class: TShumateMarkerClass;
  end;
  PShumatePointClass = ^TShumatePointClass;

function shumate_point_get_type: TGType; cdecl; external libshumate;
function shumate_point_new: PShumateMarker; cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:50 ===

function SHUMATE_TYPE_POINT: TGType;
function SHUMATE_POINT(obj: Pointer): PShumatePoint;
function SHUMATE_IS_POINT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_POINT: TGType;
begin
  Result := shumate_point_get_type;
end;

function SHUMATE_POINT(obj: Pointer): PShumatePoint;
begin
  Result := PShumatePoint(g_type_check_instance_cast(obj, SHUMATE_TYPE_POINT));
end;

function SHUMATE_IS_POINT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_POINT);
end;


{$ENDIF read_implementation}
