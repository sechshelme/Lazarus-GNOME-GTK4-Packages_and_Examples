program project1;

uses
  user_r,
  qset_r,
  libqhull_r_,
  mem_r,
  stat_r,
  geom_r,
  io_r,
  merge_r,
  poly_r,
  qhull_ra,
  random_r,


  fp_qhull_r;

  // doppelt im C-Header
  // procedure qh_printsummary(qh:PqhT; fp:PFILE);cdecl;external libqhull_r;
  // procedure qh_freebuffers(qh: PqhT); cdecl; external libqhull_r;
  // procedure qh_initbuffers(qh: PqhT; points: PcoordT; numpoints: longint; dim: longint; ismalloc: TboolT); cdecl; external libqhull_r;



  procedure main;
  const
    points: array[0..8 * 3 - 1] of TcoordT = (
      0, 0, 0, 10, 0, 0, 0, 10, 0, 10, 10, 0,
      0, 0, 10, 10, 0, 10, 0, 10, 10, 10, 10, 10);
  var
    qh: PqhT;
    facet: PfacetT;
    curlong, totlong, num_vertices: longint;
    pos0: PtrUInt;
    i: integer;
    vertex: PvertexT;

  begin
    qh := qh_malloc(SizeOf(TqhT));

    WriteLn('size jmp_buf:  ', sizeof(Tjmp_buf));
    WriteLn('size facetT:   ', sizeof(TfacetT));
    WriteLn('size qhT:      ', sizeof(TqhT));
    WriteLn('size qhmemT:   ', sizeof(TqhmemT));
    WriteLn('size qhstatT:  ', sizeof(TqhstatT));
    WriteLn('size TqhT.qhull:  ', sizeof(TqhT.qhull));

    pos0 := PtrUInt(qh);
    WriteLn('offset qhT.qhmem:       ', PtrUInt(@qh^.qhmem) - pos0);
    WriteLn('offset qhT.qhstat:      ', PtrUInt(@qh^.qhstat) - pos0);
    WriteLn('Offset qhull :          ', PtrUInt(@qh^.qhull) - pos0);
    WriteLn('Offset errexit :        ', PtrUInt(@qh^.errexit) - pos0);
    WriteLn('Offset fin:             ', PtrUInt(@qh^.fin) - pos0);
    WriteLn('Offset qhmem:           ', PtrUInt(@qh^.qhmem) - pos0);
    WriteLn('Offset qhstat:          ', PtrUInt(@qh^.qhstat) - pos0);

    WriteLn('Offset facet_list:      ', PtrUInt(@qh^.facet_list) - pos0);


    exitcode := qh_new_qhull(qh, 3, 8, points, False, 'qhull Qc', fp_qhull_r.stdout, fp_qhull_r.stdout);

    WriteLn('ExitCode:', exitcode);

    if exitcode = 0 then begin
      WriteLn(#10'Convex Hull Facetten:');

      facet := qh^.facet_list;
      WriteLn('facet: ', PtrUInt(facet));

      while (facet <> nil) and (facet^.next <> nil) do begin
        Write('Facet ', facet^.id, ': Normal=(');
        Write(facet^.normal[0]: 2: 1, ', ');
        Write(facet^.normal[1]: 2: 1, ', ');
        Write(facet^.normal[2]: 2: 1, ')');
        WriteLn;

        if facet^.vertices <> nil then begin
          num_vertices := qh_setsize(qh, facet^.vertices);

          WriteLn('  Eckpunkte: ');
          for i := 0 to num_vertices - 1 do begin
            vertex := facet^.vertices^.e[i].p;

            if vertex <> nil then begin
              WriteLn('  ', vertex^.id: 3, '. ', vertex^.point[0]: 2: 1, ' ', vertex^.point[1]: 2: 1, ' ', vertex^.point[2]: 2: 1);
            end;
          end;
          WriteLn;
        end;

        facet := facet^.next;
      end;
    end;
    qh_freeqhull(qh, qh_ALL);
    qh_memfreeshort(qh, @curlong, @totlong);
    qh_free(qh);
  end;

begin
  main;
end.
