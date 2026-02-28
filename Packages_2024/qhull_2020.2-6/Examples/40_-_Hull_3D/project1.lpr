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
    i: integer;
    vertex: PvertexT;

  begin
    qh := qh_malloc(SizeOf(TqhT));

    exitcode := qh_new_qhull(qh, 3, Length(points), PcoordT(points), False, 'qhull FA Fv Fn Fx s', stdout, stdout);
    WriteLn('----------------------------------'#10);

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
