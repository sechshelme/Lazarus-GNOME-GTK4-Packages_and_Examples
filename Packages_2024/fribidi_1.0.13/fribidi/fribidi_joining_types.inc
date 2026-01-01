{$IFDEF read_interface}


const
  FRIBIDI_MASK_JOINS_RIGHT = $01;
  FRIBIDI_MASK_JOINS_LEFT = $02;
  FRIBIDI_MASK_ARAB_SHAPES = $04;
  FRIBIDI_MASK_TRANSPARENT = $08;
  FRIBIDI_MASK_IGNORED = $10;
  FRIBIDI_MASK_LIGATURED = $20;

  FRIBIDI_JOINING_TYPE_U_VAL = 0;
  FRIBIDI_JOINING_TYPE_R_VAL = FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_ARAB_SHAPES;
  FRIBIDI_JOINING_TYPE_D_VAL = (FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT) or FRIBIDI_MASK_ARAB_SHAPES;
  FRIBIDI_JOINING_TYPE_C_VAL = FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT;
  FRIBIDI_JOINING_TYPE_L_VAL = FRIBIDI_MASK_JOINS_LEFT or FRIBIDI_MASK_ARAB_SHAPES;
  FRIBIDI_JOINING_TYPE_T_VAL = FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_ARAB_SHAPES;
  FRIBIDI_JOINING_TYPE_G_VAL = FRIBIDI_MASK_IGNORED;

type
  TFriBidiJoiningTypeEnum = longint;

const
  _FRIBIDI_JOINING_TYPE_JUNK = 0;

type
  PFriBidiJoiningType = ^TFriBidiJoiningType;
  TFriBidiJoiningType = Tuint8_t;

  PFriBidiArabicProp = ^TFriBidiArabicProp;
  TFriBidiArabicProp = Tuint8_t;


function fribidi_get_joining_type(ch: TFriBidiChar): TFriBidiJoiningType; cdecl; external libfribidi;
procedure fribidi_get_joining_types(str: PFriBidiChar; len: TFriBidiStrIndex; jtypes: PFriBidiJoiningType); cdecl; external libfribidi;
function fribidi_get_joining_type_name(j: TFriBidiJoiningType): pchar; cdecl; external libfribidi;

function FRIBIDI_IS_JOINING_TYPE_U(p: byte): boolean; inline;
function FRIBIDI_IS_JOINING_TYPE_R(p: byte): boolean; inline;
function FRIBIDI_IS_JOINING_TYPE_D(p: byte): boolean; inline;
function FRIBIDI_IS_JOINING_TYPE_C(p: byte): boolean; inline;
function FRIBIDI_IS_JOINING_TYPE_L(p: byte): boolean; inline;
function FRIBIDI_IS_JOINING_TYPE_T(p: byte): boolean; inline;
function FRIBIDI_IS_JOINING_TYPE_G(p: byte): boolean; inline;

function FRIBIDI_IS_JOINING_TYPE_RC(p: byte): boolean; inline;
function FRIBIDI_IS_JOINING_TYPE_LC(p: byte): boolean; inline;
function FRIBIDI_JOINS_RIGHT(p: byte): boolean; inline;
function FRIBIDI_JOINS_LEFT(p: byte): boolean; inline;
function FRIBIDI_ARAB_SHAPES(p: byte): boolean; inline;
function FRIBIDI_IS_JOIN_SKIPPED(p: byte): boolean; inline;
function FRIBIDI_IS_JOIN_BASE_SHAPES(p: byte): boolean; inline;
function FRIBIDI_JOINS_PRECEDING_MASK(level: byte): byte; inline;
function FRIBIDI_JOINS_FOLLOWING_MASK(level: byte): byte; inline;
function FRIBIDI_JOIN_SHAPE(p: byte): byte; inline;

// === Konventiert am: 31-12-25 16:09:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function FRIBIDI_IS_JOINING_TYPE_U(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED or
    FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT)) = 0;
end;

function FRIBIDI_IS_JOINING_TYPE_R(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED or
    FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT))
    = FRIBIDI_MASK_JOINS_RIGHT;
end;

function FRIBIDI_IS_JOINING_TYPE_D(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED or
    FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT or
    FRIBIDI_MASK_ARAB_SHAPES))
    = (FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT or
    FRIBIDI_MASK_ARAB_SHAPES);
end;

function FRIBIDI_IS_JOINING_TYPE_C(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED or
    FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT or
    FRIBIDI_MASK_ARAB_SHAPES))
    = (FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT);
end;

function FRIBIDI_IS_JOINING_TYPE_L(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED or
    FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT))
    = FRIBIDI_MASK_JOINS_LEFT;
end;

function FRIBIDI_IS_JOINING_TYPE_T(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED))
    = FRIBIDI_MASK_TRANSPARENT;
end;

function FRIBIDI_IS_JOINING_TYPE_G(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED))
    = FRIBIDI_MASK_IGNORED;
end;

{ --- Derived Arabic Joining Classes --- }

function FRIBIDI_IS_JOINING_TYPE_RC(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED or
    FRIBIDI_MASK_JOINS_RIGHT)) = FRIBIDI_MASK_JOINS_RIGHT;
end;

function FRIBIDI_IS_JOINING_TYPE_LC(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED or
    FRIBIDI_MASK_JOINS_LEFT)) = FRIBIDI_MASK_JOINS_LEFT;
end;

{ --- Queries --- }

function FRIBIDI_JOINS_RIGHT(p: byte): boolean; inline;
begin
  Result := (p and FRIBIDI_MASK_JOINS_RIGHT) <> 0;
end;

function FRIBIDI_JOINS_LEFT(p: byte): boolean; inline;
begin
  Result := (p and FRIBIDI_MASK_JOINS_LEFT) <> 0;
end;

function FRIBIDI_ARAB_SHAPES(p: byte): boolean; inline;
begin
  Result := (p and FRIBIDI_MASK_ARAB_SHAPES) <> 0;
end;

function FRIBIDI_IS_JOIN_SKIPPED(p: byte): boolean; inline;
begin
  Result := (p and (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED)) <> 0;
end;

function FRIBIDI_IS_JOIN_BASE_SHAPES(p: byte): boolean; inline;
begin
  Result := ((p) and
    (FRIBIDI_MASK_TRANSPARENT or FRIBIDI_MASK_IGNORED or
    FRIBIDI_MASK_ARAB_SHAPES)) = FRIBIDI_MASK_ARAB_SHAPES;
end;

function FRIBIDI_JOINS_PRECEDING_MASK(level: byte): byte; inline;
begin
  if FRIBIDI_LEVEL_IS_RTL(level)<>0 then begin
    Result := FRIBIDI_MASK_JOINS_RIGHT;
  end else begin
    Result := FRIBIDI_MASK_JOINS_LEFT;
  end;
end;

function FRIBIDI_JOINS_FOLLOWING_MASK(level: byte): byte; inline;
begin
  if FRIBIDI_LEVEL_IS_RTL(level)<>0 then begin
    Result := FRIBIDI_MASK_JOINS_LEFT;
  end else begin
    Result := FRIBIDI_MASK_JOINS_RIGHT;
  end;
end;

function FRIBIDI_JOIN_SHAPE(p: byte): byte; inline;
begin
  Result := (p and (FRIBIDI_MASK_JOINS_RIGHT or FRIBIDI_MASK_JOINS_LEFT));
end;




{$ENDIF read_implementation}
