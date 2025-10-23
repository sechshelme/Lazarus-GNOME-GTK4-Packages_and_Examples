{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GESMarker, ges_marker, GES, MARKER, GObject) }
type
  TGESMarker = record
  end;
  PGESMarker = ^TGESMarker;

  TGESMarkerClass = record
    parent_class: TGObjectClass;
  end;
  PGESMarkerClass = ^TGESMarkerClass;

function ges_marker_get_type: TGType; cdecl; external libges;

{G_DECLARE_FINAL_TYPE (GESMarkerList, ges_marker_list, GES, MARKER_LIST, GObject) }
type
  TGESMarkerList = record
  end;
  PGESMarkerList = ^TGESMarkerList;

  TGESMarkerListClass = record
    parent_class: TGObjectClass;
  end;
  PGESMarkerListClass = ^TGESMarkerListClass;

function ges_marker_list_get_type: TGType; cdecl; external libges;
function ges_marker_list_new: PGESMarkerList; cdecl; external libges;
function ges_marker_list_add(list: PGESMarkerList; position: TGstClockTime): PGESMarker; cdecl; external libges;
function ges_marker_list_remove(list: PGESMarkerList; marker: PGESMarker): Tgboolean; cdecl; external libges;
function ges_marker_list_size(list: PGESMarkerList): Tguint; cdecl; external libges;
function ges_marker_list_get_markers(list: PGESMarkerList): PGList; cdecl; external libges;
function ges_marker_list_move(list: PGESMarkerList; marker: PGESMarker; position: TGstClockTime): Tgboolean; cdecl; external libges;

// === Konventiert am: 13-12-24 13:56:24 ===

function GES_TYPE_MARKER: TGType;
function GES_MARKER(obj: Pointer): PGESMarker;
function GES_IS_MARKER(obj: Pointer): Tgboolean;

function GES_TYPE_MARKER_LIST: TGType;
function GES_MARKER_LIST(obj: Pointer): PGESMarkerList;
function GES_IS_MARKER_LIST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


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

// ====

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
