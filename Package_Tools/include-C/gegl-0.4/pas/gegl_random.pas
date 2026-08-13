unit gegl_random;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl, gegl_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


{$IFDEF read_function}
function gegl_random_new_with_seed(seed: Tguint32): PGeglRandom; cdecl; external libgegl;
function gegl_random_new: PGeglRandom; cdecl; external libgegl;
function gegl_random_duplicate(rand: PGeglRandom): PGeglRandom; cdecl; external libgegl;
procedure gegl_random_free(rand: PGeglRandom); cdecl; external libgegl;
procedure gegl_random_set_seed(rand: PGeglRandom; seed: Tguint32); cdecl; external libgegl;
function gegl_random_float_range(rand: PGeglRandom; x: Tgint; y: Tgint; z: Tgint; n: Tgint;
  min: Tgfloat; max: Tgfloat): Tgfloat; cdecl; external libgegl;
function gegl_random_int_range(rand: PGeglRandom; x: Tgint; y: Tgint; z: Tgint; n: Tgint;
  min: Tgint; max: Tgint): Tgint32; cdecl; external libgegl;
function gegl_random_int(rand: PGeglRandom; x: Tgint; y: Tgint; z: Tgint; n: Tgint): Tguint32; cdecl; external libgegl;
function gegl_random_float(rand: PGeglRandom; x: Tgint; y: Tgint; z: Tgint; n: Tgint): Tgfloat; cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:23:52 ===


implementation



end.
