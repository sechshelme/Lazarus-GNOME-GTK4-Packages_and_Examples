program project1;

uses
  gsl_version_,       // underline

  gsl_const_cgs,
  gsl_const_cgsm,
  gsl_const_mks,
  gsl_const_mksa,
  gsl_const_num,

  gsl_cblas,
  gsl_blas_types,
  gsl_complex,

  gsl_block_char,
  gsl_block_int,
  gsl_block_long,
  gsl_block_short,
  gsl_block_uchar,
  gsl_block_uint,
  gsl_block_ulong,
  gsl_block_ushort,


  gsl_block_double,
  gsl_block_float,
  gsl_block_long_double,

  gsl_block_complex_double,
  gsl_block_complex_float,
  gsl_block_complex_long_double,

  gsl_vector_double,
  gsl_vector_float,
  gsl_vector_long_double,

  gsl_vector_complex,
  gsl_vector_complex_double,
  gsl_vector_complex_float,
  gsl_vector_complex_long_double,

  gsl_matrix_double,
  gsl_matrix_float,
  gsl_matrix_long_double,

  gsl_matrix_complex_double,
  gsl_matrix_complex_float,
  gsl_matrix_complex_long_double,

  gsl_complex_math,


  gsl_blas,


  fp_gsl;

  procedure PrintGslMat(m: Pgsl_matrix);
  var
    i, j: integer;
  begin
    for i := 0 to m^.size1 - 1 do begin
      for j := 0 to m^.size2 - 1 do begin
        Write(gsl_matrix_get(m, i, j): 2: 1, '   ');
      end;
      WriteLn();
    end;
  end;

  procedure main;
  var
    mat: Pgsl_matrix;
    i, j: integer;
    col: Tgsl_vector_view;
    norm: double;
  begin
    WriteLn('Version: ', gsl_version);
    WriteLn();

    mat := gsl_matrix_alloc(3, 4);

    for i := 0 to mat^.size1 - 1 do begin
      for j := 0 to mat^.size2 - 1 do begin
        gsl_matrix_set(mat, i, j, Random * 4);
      end;
    end;

    WriteLn('Original matrix');
    PrintGslMat(mat);

    // Normalisiere jede Spalte der Matrix
    for j := 0 to mat^.size2 - 1 do begin
      col := gsl_matrix_column(mat, j);
      norm := gsl_blas_dasum(@col.vector); // L1-Norm (Summe)
      gsl_blas_dscal(1 / norm, @col.vector);     // Skaliere Spalte
    end;

    WriteLn();
    WriteLn('Normalized matrix');
    PrintGslMat(mat);

    gsl_matrix_free(mat);
  end;

begin
  main;
  gsl_complex_rect(0,0);
end.
(*
// gcc -o main main.c -lgsl -lgslcblas

/* Zum Kompilieren: gcc test.c -lgsl -lgslcblas -o test */

#include <stdio.h>
#include <stdlib.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_blas.h>

/* Funktion zum Ausgeben einer gsl_matrix */
void print_gslmat(const gsl_matrix *m) {
    for (size_t i = 0; i < m->size1; ++i) {
        for (size_t j = 0; j < m->size2; ++j)
            printf("%g ", gsl_matrix_get(m, i, j));
        printf("\n");
    }
}

int main() {
    // Erzeuge eine 3x4 Matrix
    gsl_matrix *mat = gsl_matrix_alloc(3, 4);

    // Fülle die Matrix mit Zufallswerten zwischen 0 und 1
    for (size_t i = 0; i < mat->size1; ++i) {
        for (size_t j = 0; j < mat->size2; ++j) {
            gsl_matrix_set(mat, i, j, (double)rand() / RAND_MAX);
        }
    }

    printf("Original matrix\n");
    print_gslmat(mat);

    // Normalisiere jede Spalte der Matrix
    for (size_t j = 0; j < mat->size2; ++j) {
        gsl_vector_view col = gsl_matrix_column(mat, j);
        double norm = gsl_blas_dasum(&col.vector); // L1-Norm (Summe)
        gsl_blas_dscal(1 / norm, &col.vector);     // Skaliere Spalte
    }

    printf("Normalized matrix\n");
    print_gslmat(mat);

    gsl_matrix_free(mat);
    return 0;
}
*)
