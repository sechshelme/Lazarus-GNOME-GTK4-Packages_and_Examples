program project1;
uses
 fp_stdio;

// /usr/lib/gcc/x86_64-linux-gnu/13/include/xmmintrin.h


//extern __inline void __attribute__((__gnu_inline__, __always_inline__, __artificial__)) _mm_storeu_ps (float *__P, __m128 __A)
//{
//  *(__m128_u *)__P = __A;
//}
//
//extern __inline __m128 __attribute__((__gnu_inline__, __always_inline__, __artificial__))_mm_set_ps1 (float __F)
//{
//  return _mm_set1_ps (__F);
//}


type
  Tvec3=array[0..2]of single;

   procedure glm_vec3_normalize(v:Tvec3) ;
   var
   norm:Single;;

  norm = glm_vec3_norm(v);

  if (norm == 0.0f) {
    v[0] = v[1] = v[2] = 0.0f;
    return;
  }

  glm_vec3_scale(v, 1.0f / norm, v);
}

procedure main;
var
  v:Tvec3_v=(1,2,4);
begin
  printf('Original Vektor: %f %f %f'#10, v[0], v[1], v[2]);

  glm_vec3_normalize(v);

  printf("Normalisierter Vektor: %f %f %f\n", v[0], v[1], v[2]);

  // Matrizen erstellen und multiplizieren
  mat4 matA, matB, result;
  glm_mat4_identity(matA);
  glm_mat4_identity(matB);

  // Beispiel-Transformation: matB eine Verschiebung zuweisen
  glm_translate(matB, (vec3){1.0f, 2.0f, 3.0f});

  // Matrixmultiplikation: result = matA * matB
  glm_mat4_mul(matA, matB, result);

  printf("Resultierende Matrix:\n");
  for (int i = 0; i < 4; i++) {
      printf("%f %f %f %f\n", result[i][0], result[i][1], result[i][2], result[i][3]);
  }end;



begin
   main;
end.

