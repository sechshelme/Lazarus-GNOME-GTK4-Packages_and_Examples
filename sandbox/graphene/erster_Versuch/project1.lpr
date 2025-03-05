program project1;

uses
  fp_graphene,
  ctypes;


  function main(argc: cint; argv: PPChar): cint;
  var
    v1, v2, res: Tgraphene_simd4f_t;
    x, y, z, w: single;
    vec: Pgraphene_vec4_t;
  begin
    //v1 := graphene_simd4f_init(1.0, 2.0, 3.0, 4.0);
    //v2 := graphene_simd4f_init(5.0, 6.0, 7.0, 8.0);
    //res := graphene_simd4f_add(v1, v2);

    res.x := 11.1;
    res.y := 22.2;
    res.z := 33.3;
    res.w := 44.4;

    x := graphene_simd4f_get_x(res);
    y := graphene_simd4f_get_y(res);
    z := graphene_simd4f_get_z(res);
    w := graphene_simd4f_get_w(res);

    WriteLn('x: ', x: 4: 2, '  y: ', y: 4: 2, '  z: ', z: 4: 2, '  w: ', w: 4: 2);


    vec := graphene_vec4_alloc;

    graphene_vec4_init(vec, 1, 2, 3, 4);

    graphene_vec4_scale(vec, 0.5, vec);

    x := graphene_vec4_get_x(vec);
    y := graphene_vec4_get_y(vec);
    z := graphene_vec4_get_z(vec);
    w := graphene_vec4_get_w(vec);

    WriteLn('x: ', x: 4: 2, '  y: ', y: 4: 2, '  z: ', z: 4: 2, '  w: ', w: 4: 2);

    graphene_vec4_free(vec);
  end;

begin
  WriteLn('size: ', SizeOf(Tgraphene_simd4f_t));

  main(argc, argv);
end.

