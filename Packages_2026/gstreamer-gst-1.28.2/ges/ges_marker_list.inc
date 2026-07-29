
  {$IFDEF read_struct}
type
  TGESMarkerClass = record
    parent_class: TGObjectClass;
  end;
  PGESMarkerClass = ^TGESMarkerClass;

  TGESMarkerListClass = record
    parent_class: TGObjectClass;
  end;
  PGESMarkerListClass = ^TGESMarkerListClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_marker_list_get_type: TGType; cdecl; external libges;
function ges_marker_get_type: TGType; cdecl; external libges;
function ges_marker_list_new: PGESMarkerList; cdecl; external libges;
function ges_marker_list_add(list: PGESMarkerList; position: TGstClockTime): PGESMarker; cdecl; external libges;
function ges_marker_list_remove(list: PGESMarkerList; marker: PGESMarker): Tgboolean; cdecl; external libges;
function ges_marker_list_size(list: PGESMarkerList): Tguint; cdecl; external libges;
function ges_marker_list_get_markers(list: PGESMarkerList): PGList; cdecl; external libges;
function ges_marker_list_move(list: PGESMarkerList; marker: PGESMarker; position: TGstClockTime): Tgboolean; cdecl; external libges;

// === Konventiert am: 27-7-26 20:01:01 ===

function GES_TYPE_MARKER: TGType;
function GES_MARKER(obj: Pointer): PGESMarker;
function GES_IS_MARKER(obj: Pointer): Tgboolean;

function GES_TYPE_MARKER_LIST: TGType;
function GES_MARKER_LIST(obj: Pointer): PGESMarkerList;
function GES_IS_MARKER_LIST(obj: Pointer): Tgboolean;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GES_TYPE_MARKER: TGType;
begin
  Result := ges_marker_get_type;
end;

function GES_MARKER(obj: Pointer): PGESMarker;
begin
  Result := PGESMarker(g_type_check_instance_cast(obj, GES_TYPE_MARKER));
end;

function GES_IS_MARKER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_MARKER);
end;


function GES_TYPE_MARKER_LIST: TGType;
begin
  Result := ges_marker_list_get_type;
end;

function GES_MARKER_LIST(obj: Pointer): PGESMarkerList;
begin
  Result := PGESMarkerList(g_type_check_instance_cast(obj, GES_TYPE_MARKER_LIST));
end;

function GES_IS_MARKER_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_MARKER_LIST);
end;

{$ENDIF read_implementation}
