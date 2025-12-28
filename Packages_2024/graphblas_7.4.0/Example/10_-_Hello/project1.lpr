program project1;

uses
  fp_graphblas;

  procedure print_matrix(M: TGrB_Matrix; n: TGrB_Index; title: pchar);
  var
    i, j: integer;
    info: TGrB_Info;
    val: double;
  begin
    WriteLn(title, ': ');
    for i := 0 to n - 1 do begin
      for  j := 0 to n - 1 do begin
        info := GrB_Matrix_extractElement_FP64(@val, M, i, j);
        if info = GrB_SUCCESS then begin
          Write(val: 6: 1, '  ');
        end else begin
          Write('   0.0 ');
        end;
      end;
      WriteLn;
    end;
    WriteLn;

    GxB_Matrix_fprint(M, nil, GxB_COMPLETE, nil);
  end;

  procedure main;
  var
    A: TGrB_Matrix = nil;
    C: TGrB_Matrix = nil;
    n: TGrB_Index = 4;
    desc: TGrB_Descriptor = nil;
  begin
    GrB_init(GrB_BLOCKING);

    GrB_Matrix_new(@A, GrB_FP64, n, n);

    GrB_Matrix_setElement_FP64(A, 1.0, 0, 1);
    GrB_Matrix_setElement_FP64(A, 4.0, 1, 2);

    GrB_Matrix_new(@C, GrB_FP64, n, n);

    GrB_Descriptor_new(@desc);
    GrB_Descriptor_set(desc, GrB_INP0, GrB_TRAN);

    // C = A^T * A
    GrB_mxm(C, GrB_NULL, GrB_NULL, GxB_PLUS_TIMES_FP64, A, A, desc);

    print_matrix(A, n, 'Matrix A');
    print_matrix(C, n, 'Ergebnis C');

    GrB_Descriptor_free(@desc);
    GrB_Matrix_free(@A);
    GrB_Matrix_free(@C);
    GrB_finalize();
  end;

begin
  main;
end.
