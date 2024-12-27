program project1;

{$ALIGN 16}

const
  libgraphene = 'libgraphene-1.0';

type
  Tgraphene_simd4f_t = record
    x, y, z, w: single;
  end;

  function graphene_simd4f_init(x: single; y: single; z: single; w: single): Tgraphene_simd4f_t; cdecl; external libgraphene;

  function graphene_simd4f_get_x(s: Tgraphene_simd4f_t): single; cdecl; external libgraphene;
  function graphene_simd4f_get_y(s: Tgraphene_simd4f_t): single; cdecl; external libgraphene;
  function graphene_simd4f_get_z(s: Tgraphene_simd4f_t): single; cdecl; external libgraphene;
  function graphene_simd4f_get_w(s: Tgraphene_simd4f_t): single; cdecl; external libgraphene;

var
  res: Tgraphene_simd4f_t;
  x, y, z, w: single;

begin
  res := graphene_simd4f_init(1.1, 2.2, 3.3, 4.4);

  WriteLn('size: ', SizeOf(res));

  x := graphene_simd4f_get_x(res);
  y := graphene_simd4f_get_y(res);
  z := graphene_simd4f_get_z(res);
  w := graphene_simd4f_get_w(res);

  WriteLn('x: ', x: 4: 2, '  y: ', y: 4: 2, '  z: ', z: 4: 2, '  w: ', w: 4: 2);
end.
