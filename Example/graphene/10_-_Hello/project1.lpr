program project1;

uses
  fp_graphene,
  ctypes;

  procedure printVec4(vec: Pgraphene_vec4_t);
  var
    x, y, z, w: single;
  begin
    x := graphene_vec4_get_x(vec);
    y := graphene_vec4_get_y(vec);
    z := graphene_vec4_get_z(vec);
    w := graphene_vec4_get_w(vec);

    WriteLn('x: ', x: 4: 2, '  y: ', y: 4: 2, '  z: ', z: 4: 2, '  w: ', w: 4: 2);
  end;

  function main(argc: cint; argv: PPChar): cint;
  var
    vec: Pgraphene_vec4_t;
  begin
    vec := graphene_vec4_alloc;

    graphene_vec4_init(vec, 1.0, 2.0, 3.0, 4.0);
    printVec4(vec);

    graphene_vec4_scale(vec, 0.5, vec);
    printVec4(vec);

    graphene_vec4_negate(vec, vec);
    printVec4(vec);

    graphene_vec4_free(vec);
    Result := 0;
  end;

begin
  main(argc, argv);
end.
