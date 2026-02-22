program project1;

uses
  fp_qhull_r;

type
  TVector3f = array[0..2] of TcoordT;

  procedure main;
  const
    points: array of TVector3f = (
      (0, 0, 0), (10, 0, 0), (0, 10, 0), (10, 10, 0),
      (0, 0, 10), (10, 0, 10), (0, 10, 10), (10, 10, 10));
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

    exitcode := qh_new_qhull(qh, 3, Length(points), PcoordT(points), False, 'qhull Qc', fp_qhull_r.stdout, fp_qhull_r.stdout);

    WriteLn('ExitCode:', exitcode);

    if exitcode = 0 then begin
      WriteLn(#10'Convex Hull Facetten:');

      facet := qh^.facet_list;
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
