unit gegl_math;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function gegl_fabsf(x: single): single; inline;
function gegl_fabs(x: double): double; inline;
function gegl_floorf(x: single): single; inline;
function gegl_ceilf(x: single): single; inline;
function gegl_floor(x: double): double; inline;
function gegl_ceil(x: double): double; inline;
function gegl_fmodf(x, y: single): single; inline;
function gegl_fmod(x, y: double): double; inline;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:11:51 ===

implementation

function gegl_fabsf(x: single): single; inline;
var
  u_f: single;
  u_i: DWord absolute u_f;
begin
  u_f := x;
  u_i := u_i and $7FFFFFFF;
  Result := u_f;
end;

function gegl_fabs(x: double): double; inline;
var
  u_d: double;
  u_i: QWord absolute u_d;
begin
  u_d := x;
  u_i := u_i and $7FFFFFFFFFFFFFFF;
  Result := u_d;
end;

function gegl_floorf(x: single): single; inline;
var
  i: longint;
begin
  i := Trunc(x);
  Result := i - Ord(i > x);
end;

function gegl_ceilf(x: single): single; inline;
begin
  Result := -gegl_floorf(-x);
end;

function gegl_floor(x: double): double; inline;
var
  i: int64;
begin
  i := Trunc(x);
  Result := i - Ord(i > x);
end;

function gegl_ceil(x: double): double; inline;
begin
  Result := -gegl_floor(-x);
end;

function gegl_fmodf(x, y: single): single; inline;
begin
  Result := x - y * gegl_floorf(x / y);
end;

function gegl_fmod(x, y: double): double; inline;
begin
  Result := x - y * gegl_floor(x / y);
end;

end.
