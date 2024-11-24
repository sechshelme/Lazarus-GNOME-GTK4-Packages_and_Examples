unit pango_gravity;

interface

uses
  fp_glib2, pango_matrix, pango_script;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PPangoGravity = ^TPangoGravity;
  TPangoGravity = longint;

const
  PANGO_GRAVITY_SOUTH = 0;
  PANGO_GRAVITY_EAST = 1;
  PANGO_GRAVITY_NORTH = 2;
  PANGO_GRAVITY_WEST = 3;
  PANGO_GRAVITY_AUTO = 4;

type
  PPangoGravityHint = ^TPangoGravityHint;
  TPangoGravityHint = longint;

const
  PANGO_GRAVITY_HINT_NATURAL = 0;
  PANGO_GRAVITY_HINT_STRONG = 1;
  PANGO_GRAVITY_HINT_LINE = 2;

function pango_gravity_to_rotation(gravity: TPangoGravity): Tdouble; cdecl; external libpango;
function pango_gravity_get_for_matrix(matrix: PPangoMatrix): TPangoGravity; cdecl; external libpango;
function pango_gravity_get_for_script(script: TPangoScript; base_gravity: TPangoGravity; hint: TPangoGravityHint): TPangoGravity; cdecl; external libpango;
function pango_gravity_get_for_script_and_width(script: TPangoScript; wide: Tgboolean; base_gravity: TPangoGravity; hint: TPangoGravityHint): TPangoGravity; cdecl; external libpango;

function PANGO_GRAVITY_IS_VERTICAL(gravity: longint): Tgboolean;
function PANGO_GRAVITY_IS_IMPROPER(gravity: longint): Tgboolean;

// === Konventiert am: 23-11-24 17:54:23 ===


implementation


function PANGO_GRAVITY_IS_VERTICAL(gravity: longint): Tgboolean;
begin
  PANGO_GRAVITY_IS_VERTICAL := (gravity = PANGO_GRAVITY_EAST) or (gravity = PANGO_GRAVITY_WEST);
end;

function PANGO_GRAVITY_IS_IMPROPER(gravity: longint): Tgboolean;
begin
  PANGO_GRAVITY_IS_IMPROPER := (gravity = PANGO_GRAVITY_WEST) or (gravity = PANGO_GRAVITY_NORTH);
end;


end.
