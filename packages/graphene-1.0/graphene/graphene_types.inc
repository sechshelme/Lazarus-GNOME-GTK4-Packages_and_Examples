{$IFDEF read_interface}


const
  GRAPHENE_VEC2_LEN = 2;
  GRAPHENE_VEC3_LEN = 3;
  GRAPHENE_VEC4_LEN = 4;

type
  Tgraphene_simd4f_t = record
    x, y, z, w: single;
  end;

  Tgraphene_simd4x4f_t = record
    x, y, z, w: Tgraphene_simd4f_t;
  end;

type
  Tgraphene_vec2_t = record
    Value: Tgraphene_simd4f_t;
  end;
  Pgraphene_vec2_t = ^Tgraphene_vec2_t;

  Tgraphene_vec3_t = record
    Value: Tgraphene_simd4f_t;
  end;
  Pgraphene_vec3_t = ^Tgraphene_vec3_t;

  Tgraphene_vec4_t = record
    Value: Tgraphene_simd4f_t;
  end;
  Pgraphene_vec4_t = ^Tgraphene_vec4_t;

  Tgraphene_matrix_t = record
    Value: Tgraphene_simd4x4f_t;
  end;
  Pgraphene_matrix_t = ^Tgraphene_matrix_t;

  Tgraphene_sphere_t = record
    center: Tgraphene_vec3_t;
    radius: single;
  end;
  Pgraphene_sphere_t = ^Tgraphene_sphere_t;

  Tgraphene_box_t = record
    min: Tgraphene_vec3_t;
    max: Tgraphene_vec3_t;
  end;
  Pgraphene_box_t = ^Tgraphene_box_t;

  Tgraphene_quaternion_t = record
    x: single;
    y: single;
    z: single;
    w: single;
  end;
  Pgraphene_quaternion_t = ^Tgraphene_quaternion_t;


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
