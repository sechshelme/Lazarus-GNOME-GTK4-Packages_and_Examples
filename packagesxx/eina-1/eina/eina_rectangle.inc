{$IFDEF read_interface}

const
  EINA_RECTANGLE_FORMAT = 'dx%d - %dx%d';

type
  TEina_Position2D = record
    x: longint;
    y: longint;
  end;
  PEina_Position2D = ^TEina_Position2D;

  TEina_Size2D = record
    w: longint;
    h: longint;
  end;
  PEina_Size2D = ^TEina_Size2D;

type
  TEina_Rectangle = record
    x: longint;
    y: longint;
    w: longint;
    h: longint;
  end;
  PEina_Rectangle = ^TEina_Rectangle;

type
  TEina_Rect = record
    case longint of
      0: (rect: TEina_Rectangle);
      1: (r1: record
          pos: TEina_Position2D;
          size: TEina_Size2D;
          end);
      2: (r2: record
          x: longint;
          y: longint;
          w: longint;
          h: longint;
          end);
  end;
  PEina_Rect = ^TEina_Rect;

  TEina_Rectangle_Pool = record
  end;
  PEina_Rectangle_Pool = ^TEina_Rectangle_Pool;

  PEina_Rectangle_Packing = ^TEina_Rectangle_Packing;
  TEina_Rectangle_Packing = longint;

const
  Eina_Packing_Descending = 0;
  Eina_Packing_Ascending = 1;
  Eina_Packing_Bottom_Left = 2;
  Eina_Packing_Bottom_Left_Skyline = 3;
  Eina_Packing_Bottom_Left_Skyline_Improved = 4;

type
  PEina_Rectangle_Outside = ^TEina_Rectangle_Outside;
  TEina_Rectangle_Outside = longint;

const
  EINA_RECTANGLE_OUTSIDE_TOP = 1;
  EINA_RECTANGLE_OUTSIDE_LEFT = 2;
  EINA_RECTANGLE_OUTSIDE_BOTTOM = 4;
  EINA_RECTANGLE_OUTSIDE_RIGHT = 8;

function eina_rectangle_pool_new(w: longint; h: longint): PEina_Rectangle_Pool; cdecl; external libeina;
function eina_rectangle_pool_get(rect: PEina_Rectangle): PEina_Rectangle_Pool; cdecl; external libeina;
function eina_rectangle_pool_geometry_get(pool: PEina_Rectangle_Pool; w: Plongint; h: Plongint): TEina_Bool; cdecl; external libeina;
function eina_rectangle_pool_data_get(pool: PEina_Rectangle_Pool): pointer; cdecl; external libeina;
procedure eina_rectangle_pool_data_set(pool: PEina_Rectangle_Pool; data: pointer); cdecl; external libeina;
procedure eina_rectangle_pool_free(pool: PEina_Rectangle_Pool); cdecl; external libeina;
function eina_rectangle_pool_count(pool: PEina_Rectangle_Pool): longint; cdecl; external libeina;
function eina_rectangle_pool_request(pool: PEina_Rectangle_Pool; w: longint; h: longint): PEina_Rectangle; cdecl; external libeina;
procedure eina_rectangle_pool_release(rect: PEina_Rectangle); cdecl; external libeina;
function eina_rectangle_new(x: longint; y: longint; w: longint; h: longint): PEina_Rectangle; cdecl; external libeina;
procedure eina_rectangle_free(rect: PEina_Rectangle); cdecl; external libeina;
procedure eina_rectangle_pool_packing_set(pool: PEina_Rectangle_Pool; _type: TEina_Rectangle_Packing); cdecl; external libeina;
function eina_rectangle_outside_position(rect1: PEina_Rectangle; rect2: PEina_Rectangle): TEina_Rectangle_Outside; cdecl; external libeina;

// === Konventiert am: 14-5-25 19:53:51 ===

function EINA_RECT_EMPTY: TEina_Rect;
function EINA_SIZE2D_EQ(a, b: TEina_Size2D): boolean;
function EINA_POSITION2D_EQ(a, b: TEina_Position2D): boolean;
function EINA_POSITION2D_DISTANCE(a, b: TEina_Position2D): double;


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EINA_RECT_EMPTY: TEina_Rect;
begin
  FillChar(Result, SizeOf(Result), $00);
end;

function EINA_SIZE2D_EQ(a, b: TEina_Size2D): boolean;
begin
  EINA_SIZE2D_EQ := ((a.w) = (b.w)) and ((a.h) = (b.h));
end;

function EINA_POSITION2D_EQ(a, b: TEina_Position2D): boolean;
begin
  EINA_POSITION2D_EQ := ((a.x) = (b.x)) and ((a.y) = (b.y));
end;

function EINA_POSITION2D_DISTANCE(a, b: TEina_Position2D): double;
begin
  EINA_POSITION2D_DISTANCE := sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y));
end;


{$ENDIF read_implementation}
