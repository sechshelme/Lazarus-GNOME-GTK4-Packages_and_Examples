program project1;

uses
  fp_qhull_r;

type
  TVector2f = array[0..1] of TcoordT;

  procedure main;
  const
    points: array of TVector2f = (
      (0.0, 0.0),
      (1.0, 0.5),
      (0.5, 1.0),
      (0.2, 0.2),
      (0.8, 0.1));

  var
    qh: PqhT;
    facet: PfacetT;
    curlong, totlong, num_vertices: longint;
    i: integer;
    vertex: PvertexT;

  begin
    qh := qh_malloc(SizeOf(TqhT));

    exitcode := qh_new_qhull(qh, 2, Length(points), PcoordT(points), False, 'qhull Qc', fp_qhull_r.stdout, fp_qhull_r.stdout);

    WriteLn('ExitCode:', exitcode);

    if exitcode = 0 then begin
      WriteLn(#10'Convex Hull Facetten:');

      facet := qh^.facet_list;
      while (facet <> nil) and (facet^.next <> nil) do begin

        if facet^.vertices <> nil then begin
          num_vertices := qh_setsize(qh, facet^.vertices);

          WriteLn('  Eckpunkte: ');
          for i := 0 to num_vertices - 1 do begin
            vertex := facet^.vertices^.e[i].p;

            if vertex <> nil then begin
              WriteLn('  ', vertex^.id: 3, '. ', vertex^.point[0]: 2: 1, ' ', vertex^.point[1]: 2: 1);
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
