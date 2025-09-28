program project1;

  //uses
  //  fp_graphene;

const
  {$IFDEF Linux}
  libgraphene = 'libgraphene-1.0';
  {$ENDIF}


type
  //  Tgraphene_simd4f_t=array [0..3]of Single;
  //  Pgraphene_simd4f_t=^Tgraphene_simd4f_t;
  Tgraphene_simd4f_t =  record
    pad:array[0..15] of byte;
//    x, y, z, w: single;
  end ;
var

  res: Tgraphene_simd4f_t;
  x, y, z, w: single;

  function graphene_simd4f_init(x: single; y: single; z: single; w: single): Tgraphene_simd4f_t; cdecl; external libgraphene;
  function graphene_simd4f_get_x(s: Tgraphene_simd4f_t): single; cdecl; external libgraphene;
  function graphene_simd4f_get_y(s: Tgraphene_simd4f_t): single; cdecl; external libgraphene;
  function graphene_simd4f_get_z(s: Tgraphene_simd4f_t): single; cdecl; external libgraphene;
  function graphene_simd4f_get_w(s: Tgraphene_simd4f_t): single; cdecl; external libgraphene;
  function graphene_simd4f_get(s: Tgraphene_simd4f_t; i: dword): single; cdecl; external libgraphene;



begin
  res := graphene_simd4f_init(1.1, 5.5, 3.3, 4.4);

  //res.x:=5.5;
  //res.y:=6.6;
  //res.z:=7.7;
  //res.w:=8.8;


  WriteLn('size: ', SizeOf(res));

  x := graphene_simd4f_get_x(res);
  y := graphene_simd4f_get_y(res);
  z := graphene_simd4f_get_z(res);
  w := graphene_simd4f_get_w(res);

  //x:=graphene_simd4f_get(res, 0);
  //y:=graphene_simd4f_get(res, 1);
  //z:=graphene_simd4f_get(res, 2);
  //w:=graphene_simd4f_get(res, 3);

  WriteLn('x: ', x: 4: 2, '  y: ', y: 4: 2, '  z: ', z: 4: 2, '  w: ', w: 4: 2);
end.
