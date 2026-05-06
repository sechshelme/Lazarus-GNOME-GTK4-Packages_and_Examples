{$IFDEF read_interface}


type
  PShumateState = ^TShumateState;
  TShumateState = longint;

const
  SHUMATE_STATE_NONE = 0;
  SHUMATE_STATE_LOADING = 1;
  SHUMATE_STATE_LOADED = 2;
  SHUMATE_STATE_DONE = 3;

type
  TShumateTile = record
  end;
  PShumateTile = ^TShumateTile;

  TShumateTileClass = record
    parent_class: TGObjectClass;
  end;
  PShumateTileClass = ^TShumateTileClass;

function shumate_tile_get_type: TGType; cdecl; external libshumate;
function shumate_tile_new: PShumateTile; cdecl; external libshumate;
function shumate_tile_new_full(x: Tguint; y: Tguint; size: Tguint; zoom_level: Tguint): PShumateTile; cdecl; external libshumate;
function shumate_tile_get_x(self: PShumateTile): Tguint; cdecl; external libshumate;
procedure shumate_tile_set_x(self: PShumateTile; x: Tguint); cdecl; external libshumate;
function shumate_tile_get_y(self: PShumateTile): Tguint; cdecl; external libshumate;
procedure shumate_tile_set_y(self: PShumateTile; y: Tguint); cdecl; external libshumate;
function shumate_tile_get_zoom_level(self: PShumateTile): Tguint; cdecl; external libshumate;
procedure shumate_tile_set_zoom_level(self: PShumateTile; zoom_level: Tguint); cdecl; external libshumate;
function shumate_tile_get_size(self: PShumateTile): Tguint; cdecl; external libshumate;
procedure shumate_tile_set_size(self: PShumateTile; size: Tguint); cdecl; external libshumate;
function shumate_tile_get_state(self: PShumateTile): TShumateState; cdecl; external libshumate;
procedure shumate_tile_set_state(self: PShumateTile; state: TShumateState); cdecl; external libshumate;
function shumate_tile_get_modified_time(self: PShumateTile): PGDateTime; cdecl; external libshumate;
procedure shumate_tile_set_modified_time(self: PShumateTile; modified_time: PGDateTime); cdecl; external libshumate;
function shumate_tile_get_etag(self: PShumateTile): pchar; cdecl; external libshumate;
procedure shumate_tile_set_etag(self: PShumateTile; etag: pchar); cdecl; external libshumate;
function shumate_tile_get_fade_in(self: PShumateTile): Tgboolean; cdecl; external libshumate;
procedure shumate_tile_set_fade_in(self: PShumateTile; fade_in: Tgboolean); cdecl; external libshumate;
function shumate_tile_get_paintable(self: PShumateTile): PGdkPaintable; cdecl; external libshumate;
procedure shumate_tile_set_paintable(self: PShumateTile; paintable: PGdkPaintable); cdecl; external libshumate;
function shumate_tile_get_scale_factor(self: PShumateTile): double; cdecl; external libshumate;
procedure shumate_tile_set_scale_factor(self: PShumateTile; scale_factor: double); cdecl; external libshumate;

// === Konventiert am: 6-5-26 15:48:29 ===

function SHUMATE_TYPE_TILE: TGType;
function SHUMATE_TILE(obj: Pointer): PShumateTile;
function SHUMATE_IS_TILE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SHUMATE_TYPE_TILE: TGType;
begin
  Result := shumate_tile_get_type;
end;

function SHUMATE_TILE(obj: Pointer): PShumateTile;
begin
  Result := PShumateTile(g_type_check_instance_cast(obj, SHUMATE_TYPE_TILE));
end;

function SHUMATE_IS_TILE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SHUMATE_TYPE_TILE);
end;


{$ENDIF read_implementation}
