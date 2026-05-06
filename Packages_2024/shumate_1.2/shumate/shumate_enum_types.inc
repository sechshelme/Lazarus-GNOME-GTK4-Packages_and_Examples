{$IFDEF read_interface}



function shumate_file_cache_error_get_type: TGType; cdecl; external libshumate;
function SHUMATE_TYPE_FILE_CACHE_ERROR: TGType;

function shumate_map_projection_get_type: TGType; cdecl; external libshumate;
function SHUMATE_TYPE_MAP_PROJECTION: TGType;

function shumate_unit_get_type: TGType; cdecl; external libshumate;
function SHUMATE_TYPE_UNIT: TGType;

function shumate_tile_downloader_error_get_type: TGType; cdecl; external libshumate;
function SHUMATE_TYPE_TILE_DOWNLOADER_ERROR: TGType;

function shumate_state_get_type: TGType; cdecl; external libshumate;
function SHUMATE_TYPE_STATE: TGType;

function shumate_geometry_type_get_type: TGType; cdecl; external libshumate;
function SHUMATE_TYPE_GEOMETRY_TYPE: TGType;

function shumate_style_error_get_type: TGType; cdecl; external libshumate;
function SHUMATE_TYPE_STYLE_ERROR: TGType;

// === Konventiert am: 6-5-26 15:49:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function SHUMATE_TYPE_FILE_CACHE_ERROR: TGType;
begin
  SHUMATE_TYPE_FILE_CACHE_ERROR := shumate_file_cache_error_get_type;
end;

function SHUMATE_TYPE_MAP_PROJECTION: TGType;
begin
  SHUMATE_TYPE_MAP_PROJECTION := shumate_map_projection_get_type;
end;

function SHUMATE_TYPE_UNIT: TGType;
begin
  SHUMATE_TYPE_UNIT := shumate_unit_get_type;
end;

function SHUMATE_TYPE_TILE_DOWNLOADER_ERROR: TGType;
begin
  SHUMATE_TYPE_TILE_DOWNLOADER_ERROR := shumate_tile_downloader_error_get_type;
end;

function SHUMATE_TYPE_STATE: TGType;
begin
  SHUMATE_TYPE_STATE := shumate_state_get_type;
end;

function SHUMATE_TYPE_GEOMETRY_TYPE: TGType;
begin
  SHUMATE_TYPE_GEOMETRY_TYPE := shumate_geometry_type_get_type;
end;

function SHUMATE_TYPE_STYLE_ERROR: TGType;
begin
  SHUMATE_TYPE_STYLE_ERROR := shumate_style_error_get_type;
end;


{$ENDIF read_implementation}
