unit gegl_rectangle;

interface

uses
  fp_glib2, fp_gegl, gegl_buffer, gegl_buffer_enums;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gegl_rectangle_get_type: TGType; cdecl; external libgegl;
function gegl_rectangle_new(x: Tgint; y: Tgint; width: Tguint; height: Tguint): PGeglRectangle; cdecl; external libgegl;
procedure gegl_rectangle_set(rectangle: PGeglRectangle; x: Tgint; y: Tgint; width: Tguint; height: Tguint); cdecl; external libgegl;
function gegl_rectangle_equal(rectangle1: PGeglRectangle; rectangle2: PGeglRectangle): Tgboolean; cdecl; external libgegl;
function gegl_rectangle_equal_coords(rectangle: PGeglRectangle; x: Tgint; y: Tgint; width: Tgint; height: Tgint): Tgboolean; cdecl; external libgegl;
function gegl_rectangle_is_empty(rectangle: PGeglRectangle): Tgboolean; cdecl; external libgegl;
function gegl_rectangle_dup(rectangle: PGeglRectangle): PGeglRectangle; cdecl; external libgegl;
procedure gegl_rectangle_copy(destination: PGeglRectangle; source: PGeglRectangle); cdecl; external libgegl;
function gegl_rectangle_align(destination: PGeglRectangle; rectangle: PGeglRectangle; tile: PGeglRectangle; alignment: TGeglRectangleAlignment): Tgboolean; cdecl; external libgegl;
function gegl_rectangle_align_to_buffer(destination: PGeglRectangle; rectangle: PGeglRectangle; buffer: PGeglBuffer; alignment: TGeglRectangleAlignment): Tgboolean; cdecl; external libgegl;
procedure gegl_rectangle_bounding_box(destination: PGeglRectangle; source1: PGeglRectangle; source2: PGeglRectangle); cdecl; external libgegl;
function gegl_rectangle_intersect(dest: PGeglRectangle; src1: PGeglRectangle; src2: PGeglRectangle): Tgboolean; cdecl; external libgegl;
function gegl_rectangle_subtract(destination: PGeglRectangle; minuend: PGeglRectangle; subtrahend: PGeglRectangle): Tgint; cdecl; external libgegl;
function gegl_rectangle_subtract_bounding_box(destination: PGeglRectangle; minuend: PGeglRectangle; subtrahend: PGeglRectangle): Tgboolean; cdecl; external libgegl;
function gegl_rectangle_xor(destination: PGeglRectangle; source1: PGeglRectangle; source2: PGeglRectangle): Tgint; cdecl; external libgegl;
function gegl_rectangle_contains(parent: PGeglRectangle; child: PGeglRectangle): Tgboolean; cdecl; external libgegl;
function gegl_rectangle_infinite_plane: TGeglRectangle; cdecl; external libgegl;
function gegl_rectangle_is_infinite_plane(rectangle: PGeglRectangle): Tgboolean; cdecl; external libgegl;
procedure gegl_rectangle_dump(rectangle: PGeglRectangle); cdecl; external libgegl;

const
  GEGL_FLOAT_EPSILON = 1e-5;

function _gegl_float_epsilon_zero(value: single): Tgint; cdecl; external libgegl;
function _gegl_float_epsilon_equal(v1: single; v2: single): Tgint; cdecl; external libgegl;

function GEGL_FLOAT_IS_ZERO(value: single): Tgint;
function GEGL_FLOAT_EQUAL(v1, v2: single): Tgint;


// === Konventiert am: 12-8-26 15:23:46 ===

function GEGL_TYPE_RECTANGLE: TGType;

implementation

function GEGL_TYPE_RECTANGLE: TGType;
begin
  GEGL_TYPE_RECTANGLE := gegl_rectangle_get_type;
end;


function GEGL_FLOAT_IS_ZERO(value: single): Tgint;
begin
  GEGL_FLOAT_IS_ZERO := _gegl_float_epsilon_zero(value);
end;

function GEGL_FLOAT_EQUAL(v1, v2: single): Tgint;
begin
  GEGL_FLOAT_EQUAL := _gegl_float_epsilon_equal(v1, v2);
end;


end.
