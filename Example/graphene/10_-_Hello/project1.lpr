program project1;

uses
  fp_graphene,
  ctypes;

  function main(argc: cint; argv: PPChar): cint;
  var
    vec: Pgraphene_vec4_t;
    x, y, z, w: single;
  begin
    vec := graphene_vec4_alloc;

    graphene_vec4_init(vec, 1, 2, 3, 4);
    graphene_vec4_scale(vec, 0.5, vec);

    x := graphene_vec4_get_x(vec);
    y := graphene_vec4_get_y(vec);
    z := graphene_vec4_get_z(vec);
    w := graphene_vec4_get_w(vec);

    WriteLn('x: ', x: 4: 2, '  y: ', y: 4: 2, '  z: ', z: 4: 2, '  w: ', w: 4: 2);

    graphene_vec4_free(vec);
    Result := 0;
  end;

begin
  main(argc, argv);
end.
